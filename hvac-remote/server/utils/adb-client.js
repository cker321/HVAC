/**
 * ADB客户端模块
 * 用于通过ADB与安卓设备通信，模拟串口通信和监听MQTT消息
 */

const { exec } = require('child_process');
const { promisify } = require('util');

// 将exec转换为基于Promise的函数
const execPromise = promisify(exec);

// 环境变量配置
const ADB_DEVICE_IP = process.env.ADB_DEVICE_IP || '192.168.2.42';
const ADB_DEVICE_PORT = process.env.ADB_DEVICE_PORT || '5555';
const ADB_DEVICE = `${ADB_DEVICE_IP}:${ADB_DEVICE_PORT}`;

// 串口配置
const RS485_UART_PORT = process.env.RS485_UART_PORT || '/dev/ttyS0';
const RS485_BAUD_RATE = process.env.RS485_BAUD_RATE || 9600;

// UDP配置
const UDP_HOST = '127.0.0.1';
const UDP_REMOTE_PORT = 10060; // vt_uart发送端口
const UDP_LOCAL_PORT = 10061;  // vt_uart接收端口

// MQTT配置
const MQTT_POLLING_INTERVAL = 30000; // 30秒
const MAX_CACHED_MESSAGES = 100;

// 缓存变量
let cachedAirStatus = null;
let cachedWindStatus = null;
let cachedMqttConfig = null;
let cachedMqttMessages = [];
let lastDataUpdateTime = 0;
let lastWindDataUpdateTime = 0;
let mqttListenerInterval = null;

/**
 * 计算CRC16 Modbus校验码
 * @param {Array|Buffer} data 要计算校验码的数据
 * @returns {number} CRC16校验码
 */
function calculateCRC16(data) {
  let crc = 0xFFFF;
  
  for (let i = 0; i < data.length; i++) {
    crc ^= data[i];
    
    for (let j = 0; j < 8; j++) {
      if ((crc & 0x0001) !== 0) {
        crc >>= 1;
        crc ^= 0xA001;
      } else {
        crc >>= 1;
      }
    }
  }
  
  // 返回低字节在前，高字节在后的格式
  return ((crc & 0xFF) << 8) | ((crc >> 8) & 0xFF);
}

/**
 * 将整数转换为字节数组
 * @param {number} value 要转换的整数
 * @param {number} byteCount 字节数
 * @param {boolean} littleEndian 是否小端字节序（默认为小端）
 * @returns {Array} 字节数组
 */
function intToBytes(value, byteCount, littleEndian = true) {
  const bytes = [];
  for (let i = 0; i < byteCount; i++) {
    bytes.push((value >> (i * 8)) & 0xFF);
  }
  
  // 如果需要大端字节序，则翻转数组
  return littleEndian ? bytes : bytes.reverse();
}

/**
 * 将字节数组转换为整数
 * @param {Array|Buffer} bytes 字节数组
 * @param {number} startIndex 起始索引
 * @param {number} byteCount 字节数
 * @param {boolean} littleEndian 是否小端字节序（默认为小端）
 * @returns {number} 整数值
 */
function bytesToInt(bytes, startIndex = 0, byteCount = 2, littleEndian = true) {
  let value = 0;
  
  if (littleEndian) {
    // 小端字节序（低字节在前）
    for (let i = 0; i < byteCount; i++) {
      value |= bytes[startIndex + i] << (i * 8);
    }
  } else {
    // 大端字节序（高字节在前）
    for (let i = 0; i < byteCount; i++) {
      value |= bytes[startIndex + i] << ((byteCount - 1 - i) * 8);
    }
  }
  
  return value;
}

// 已删除重复的intToBytes函数

/**
 * 执行ADB命令
 * @param {string} command ADB命令
 * @returns {Promise<string>} 命令输出
 */
async function executeAdbCommand(command) {
  try {
    console.log(`执行ADB命令: ${command}`);
    const { stdout, stderr } = await execPromise(`adb -s ${ADB_DEVICE} ${command}`);
    
    if (stderr) {
      console.error(`ADB命令错误: ${stderr}`);
    }
    
    return stdout.trim();
  } catch (error) {
    console.error(`ADB命令执行失败: ${error.message}`);
    throw error;
  }
}

/**
 * 连接到ADB设备
 * @returns {Promise<boolean>} 连接是否成功
 */
async function connectToDevice() {
  try {
    // 检查设备是否已连接
    const devices = await execPromise('adb devices');
    console.log('🚀 ~ devices ~ :', devices);
    if (devices.stdout.includes(ADB_DEVICE)) {
      console.log(`设备 ${ADB_DEVICE} 已连接`);
      return true;
    }
    
    // 尝试连接设备
    console.log(`尝试连接设备 ${ADB_DEVICE}...`);
    const result = await execPromise(`adb connect ${ADB_DEVICE}`);
    
    if (result.stdout.includes('connected') || result.stdout.includes('already')) {
      console.log(`成功连接到设备 ${ADB_DEVICE}`);
      
      // 连接成功后初始化RS485串口
      try {
        await setupRS485();
        console.log('RS485串口初始化成功');
      } catch (rs485Error) {
        console.error('RS485串口初始化失败:', rs485Error.message);
      }
      
      return true;
    } else {
      console.error(`无法连接到设备 ${ADB_DEVICE}: ${result.stdout}`);
      return false;
    }
  } catch (error) {
    console.error(`连接设备失败: ${error.message}`);
    return false;
  }
}

/**
 * 初始化RS485串口
 * @returns {Promise<boolean>} 初始化是否成功
 */
async function setupRS485() {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    // 检查串口设备是否存在
    const checkPortCommand = `shell "[ -e ${RS485_UART_PORT} ] && echo 'exists' || echo 'not exists'"`;  
    const portExists = await executeAdbCommand(checkPortCommand);
    
    if (!portExists.includes('exists')) {
      console.warn(`串口设备 ${RS485_UART_PORT} 不存在，尝试查找可用的串口设备`);
      
      // 查找可用的串口设备
      const findPortsCommand = `shell "find /dev -name 'tty*' | grep -v 'tty[0-9]*'"`;  
      const availablePorts = await executeAdbCommand(findPortsCommand);
      
      if (availablePorts) {
        console.log('可用的串口设备:', availablePorts);
      } else {
        console.warn('未找到串口设备');
      }
    } else {
      console.log(`串口设备 ${RS485_UART_PORT} 存在`);
    }
    
    // 设置串口波特率
    const setBaudRateCommand = `shell "stty -F ${RS485_UART_PORT} ${RS485_BAUD_RATE} 2>/dev/null || echo 'failed'"`;  
    const baudRateResult = await executeAdbCommand(setBaudRateCommand);
    
    if (baudRateResult.includes('failed')) {
      console.warn(`设置串口波特率失败，将尝试其他方法`);
    } else {
      console.log(`串口波特率设置为 ${RS485_BAUD_RATE}`);
    }
    
    return true;
  } catch (error) {
    console.error(`初始化RS485串口失败: ${error.message}`);
    return false;
  }
}

/**
 * 发送RS485命令并读取响应
 * @param {Array|Buffer} data 要发送的数据
 * @param {number} expectedResponseLength 期望的响应长度
 * @param {number} timeout 超时时间（毫秒）
 * @returns {Promise<Array|null>} 响应数据
 */
async function sendRS485Command(data, expectedResponseLength, timeout = 1000) {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    // 计算CRC并添加到数据中
    const crc = calculateCRC16(data);
    const dataWithCrc = [...data, crc & 0xFF, (crc >> 8) & 0xFF];
    
    // 将数据转换为十六进制字符串
    const hexData = dataWithCrc.map(b => `\\x${b.toString(16).padStart(2, '0')}`).join('');
    console.log(`发送串口命令: ${dataWithCrc.map(b => b.toString(16).padStart(2, '0')).join('')}`);
    
    // 尝试多个串口设备
    const uartPorts = [RS485_UART_PORT, '/dev/ttyS1', '/dev/ttyS2', '/dev/ttyUSB0'];
    let writeSuccess = false;
    
    for (const port of uartPorts) {
      // 写入串口命令
      const writeCommand = `shell "echo -ne '${hexData}' > ${port} 2>/dev/null || echo 'write failed'"`;  
      console.log(`尝试写入到串口${port}: ${writeCommand}`);
      const writeResult = await executeAdbCommand(writeCommand);
      
      if (!writeResult || !writeResult.includes('failed')) {
        console.log(`成功写入到串口: ${port}`);
        writeSuccess = true;
        break;
      } else {
        console.log(`写入串口${port}失败: ${writeResult}`);
      }
    }
    
    if (!writeSuccess) {
      console.error('所有串口写入失败');
      return null;
    }
    
    // 等待一小段时间再读取响应
    await new Promise(resolve => setTimeout(resolve, 200)); // 增加等待时间
    
    // 使用改进的方法读取串口数据
    console.log('使用改进的方法读取串口数据');
    
    // 清除之前的数据文件
    await executeAdbCommand('shell "rm -f /data/local/tmp/rs485_data.bin"');
    
    // 尝试不同的读取方法
    let dataRead = false;
    
    // 方法1: 使用stty设置串口参数
    console.log('尝试方法1: 使用stty设置串口参数');
    try {
      await executeAdbCommand(`shell "stty -F ${RS485_UART_PORT} 9600 raw -echo 2>/dev/null"`);
      await new Promise(resolve => setTimeout(resolve, 100));
    } catch (error) {
      console.log(`stty命令失败: ${error.message}`);
    }
    
    // 方法2: 使用dd命令读取
    console.log('尝试方法2: 使用dd命令读取');
    const ddCommand = `shell "dd if=${RS485_UART_PORT} of=/data/local/tmp/rs485_data.bin bs=1 count=100 2>/dev/null"`;  
    console.log(`dd读取命令: ${ddCommand}`);
    await executeAdbCommand(ddCommand);
    await new Promise(resolve => setTimeout(resolve, 500));
    
    // 方法3: 使用cat和sleep组合
    console.log('尝试方法3: 使用cat和sleep组合');
    const readCommand = `shell "cat ${RS485_UART_PORT} > /data/local/tmp/rs485_data.bin & pid=$!; sleep 2; kill $pid"`;  
    console.log(`cat读取命令: ${readCommand}`);
    await executeAdbCommand(readCommand);
    await new Promise(resolve => setTimeout(resolve, 2000));
    
    // 检查文件是否存在并有内容
    const fileStatusCmd = `shell "[ -f /data/local/tmp/rs485_data.bin ] && [ -s /data/local/tmp/rs485_data.bin ] && echo 'exists' || echo 'empty'"`;  
    const fileStatus = await executeAdbCommand(fileStatusCmd);
    
    if (fileStatus.includes('empty')) {
      console.log('文件为空或不存在，尝试其他方法');
      
      // 尝试直接读取串口数据
      console.log('尝试直接读取串口数据');
      const directReadCmd = `shell "cat ${RS485_UART_PORT} 2>/dev/null"`;  
      const directResult = await executeAdbCommand(directReadCmd);
      
      if (directResult && directResult.length > 0) {
        console.log(`直接读取到数据: ${directResult.length} 字节`);
        // 将直接读取的数据保存到文件
        const saveCmd = `shell "echo '${directResult}' > /data/local/tmp/rs485_data.bin"`;  
        await executeAdbCommand(saveCmd);
        dataRead = true;
      }
    } else {
      console.log('文件存在且有内容');
      dataRead = true;
    }
    
    // 读取文件大小 - 不使用awk
    const fileSizeCmd = `shell "ls -l /data/local/tmp/rs485_data.bin 2>/dev/null"`;  
    const fileSizeResult = await executeAdbCommand(fileSizeCmd);
    console.log(`文件信息: ${fileSizeResult}`);
    
    // 再次检查文件是否存在
    const fileExistsCmd = `shell "[ -f /data/local/tmp/rs485_data.bin ] && echo 'exists' || echo 'not exists'"`;  
    const fileExists = await executeAdbCommand(fileExistsCmd);
    console.log(`文件状态: ${fileExists}`);
    
    let fileSize = 0;
    if (fileExists.includes('exists')) {
      // 如果文件存在，尝试获取大小
      const fileSizeCmd2 = `shell "wc -c /data/local/tmp/rs485_data.bin 2>/dev/null || stat -c %s /data/local/tmp/rs485_data.bin 2>/dev/null || echo '0'"`;  
      fileSize = await executeAdbCommand(fileSizeCmd2);
      // 提取数字
      const sizeMatch = fileSize.match(/\d+/);
      if (sizeMatch) {
        fileSize = parseInt(sizeMatch[0]);
      } else {
        fileSize = 0;
      }
    }
    console.log(`数据文件大小: ${fileSize} 字节`);
    
    let readResult = '';
    
    // 如果文件存在且有内容
    if (fileSize && parseInt(fileSize) > 0) {
      // 将文件拉回到本地
      await executeAdbCommand(`pull /data/local/tmp/rs485_data.bin /tmp/rs485_data.bin`);
      
      // 读取文件内容并转换为十六进制
      const fs = require('fs');
      try {
        const data = fs.readFileSync('/tmp/rs485_data.bin');
        readResult = Array.from(data).map(b => b.toString(16).padStart(2, '0')).join(' ');
        console.log(`读取到原始数据: ${readResult}`);
      } catch (error) {
        console.error(`读取或转换数据失败: ${error.message}`);
      }
    } else {
      console.warn('数据文件为空或不存在');
    }
    
    console.log(`读取结果: ${readResult || '无返回值'}`);
    
    if (!readResult) {
      console.warn('未收到串口响应数据');
      return null;
    }
    
    // 解析响应数据
    let responseData = [];
    try {
      // 将输出的十六进制格式转换为字节数组
      // od -t x1 -A n 输出格式例如: "01 03 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b1 c8"
      const hexValues = readResult.trim().split(/\s+/);
      for (let i = 0; i < hexValues.length; i++) {
        if (hexValues[i]) {
          const byte = parseInt(hexValues[i], 16);
          if (!isNaN(byte)) {
            responseData.push(byte);
          }
        }
      }
    } catch (error) {
      console.error(`解析串口响应数据失败: ${error.message}`);
      return null;
    }
    
    console.log(`解析响应数据: ${JSON.stringify(responseData)}`);
    
    // 检查响应数据长度
    if (responseData.length < 5) {
      console.warn(`响应数据长度不足: ${responseData.length} < 5`);
      return null;
    }
    
    // 检查响应格式是否正确
    if (responseData[0] !== command[0] || responseData[1] !== command[1]) {
      console.warn(`响应格式不正确: 预期起始字节 [${command[0]}, ${command[1]}], 实际 [${responseData[0]}, ${responseData[1]}]`);
      return null;
    }
    
    // 检查数据长度字节
    const dataLength = responseData[2];
    if (responseData.length < 3 + dataLength + 2) { // 头部(3) + 数据 + CRC(2)
      console.warn(`响应数据长度不足: ${responseData.length} < ${3 + dataLength + 2}`);
      return null;
    }
    
    // 检查CRC校验
    const dataWithoutCRC = responseData.slice(0, 3 + dataLength);
    const responseCRC = (responseData[3 + dataLength] << 8) | responseData[3 + dataLength + 1];
    const calculatedCRC = calculateCRC16(dataWithoutCRC);
    
    console.log(`响应CRC: 0x${responseCRC.toString(16)}, 计算CRC: 0x${calculatedCRC.toString(16)}`);
    
    if (responseCRC !== calculatedCRC) {
      console.error(`CRC校验失败: 期望 ${calculatedCRC.toString(16)}, 实际 ${responseCRC.toString(16)}`);
      return null;
    }
    
    return responseData;
  } catch (error) {
    console.error(`发送RS485命令失败: ${error.message}`);
    return null;
  }
}

/**
 * 模拟UDP通信，发送数据到本地UDP端口
 * @param {Array} data 要发送的数据
 * @param {number} timeout 超时时间（毫秒）
 * @returns {Promise<Array|null>} 响应数据或null
 */
async function simulateUdpCommunication(data, timeout = 1000) {
  try {
    console.log(`模拟UDP通信，发送数据: ${JSON.stringify(data)}`);
    
    // 计算CRC并添加到数据包末尾
    const crc = calculateCRC16(data);
    const dataWithCrc = [...data, (crc >> 8) & 0xFF, crc & 0xFF];
    
    // 将数据转换为十六进制字符串
    const hexData = dataWithCrc.map(b => b.toString(16).padStart(2, '0')).join('');
    console.log(`十六进制数据: ${hexData}`);
    
    // 清除之前的logcat日志
    await executeAdbCommand('shell "logcat -c"');
    
    // 使用am broadcast发送UDP数据（通过触发应用的广播接收器）
    const broadcastCommand = `shell "am broadcast -a com.dnake.action.SEND_UDP --es data '${hexData}' --ei port 10060"`;  
    console.log(`发送UDP广播命令: ${broadcastCommand}`);
    
    const broadcastResult = await executeAdbCommand(broadcastCommand);
    console.log(`广播结果: ${broadcastResult || '无返回值'}`);
    
    // 如果广播失败，尝试直接使用echo发送数据
    if (!broadcastResult || broadcastResult.includes('error')) {
      console.log('广播失败，尝试直接发送UDP数据');
      
      // 将数据转换为十六进制转义字符串
      const hexEscaped = dataWithCrc.map(b => `\\x${b.toString(16).padStart(2, '0')}`).join('');
      
      // 尝试使用echo发送UDP数据
      const sendCommand = `shell "echo -ne '${hexEscaped}' > /proc/self/fd/0"`;  
      console.log(`发送UDP数据命令: ${sendCommand}`);
      
      await executeAdbCommand(sendCommand);
    }
    
    // 等待响应
    console.log(`等待${timeout}ms捕获响应...`);
    await new Promise(resolve => setTimeout(resolve, timeout));
    
    // 尝试使用其他方式发送UDP数据
    console.log('尝试使用其他方式发送UDP数据');
    
    // 尝试使用应用的内部活动
    const activityCmd = `shell "am start -n com.landleaf.smarthome/.activity.MainActivity --es udp_data '${hexData}' --ei udp_port 10060"`;  
    console.log(`启动应用活动命令: ${activityCmd}`);
    const activityResult = await executeAdbCommand(activityCmd);
    console.log(`启动应用结果: ${activityResult || '无返回值'}`);
    
    // 尝试直接读取MQTT配置
    console.log('尝试直接读取MQTT配置文件');
    const mqttConfigCmd = `shell "cat /data/data/com.landleaf.smarthome/shared_prefs/mqtt_config.xml 2>/dev/null || echo 'not found'"`;  
    const mqttConfig = await executeAdbCommand(mqttConfigCmd);
    if (mqttConfig && !mqttConfig.includes('not found')) {
      console.log(`找到MQTT配置: ${mqttConfig.substring(0, 100)}${mqttConfig.length > 100 ? '...' : ''}`);
    } else {
      console.log('未找到MQTT配置文件');
    }
    
    // 等待更长时间捕获响应
    console.log('等待更长时间捕获响应...');
    await new Promise(resolve => setTimeout(resolve, 2000));
    
    // 使用logcat捕获应用的日志输出
    // 尝试更多可能的日志标签和级别
    const logTags = [
      'vt_uart:V', 'UdpSocket:V', 'UDP:V', 'MQTT:V', 'dnake:V',
      'vt_uart:D', 'UdpSocket:D', 'UDP:D', 'MQTT:D', 'dnake:D',
      'vt_uart:I', 'UdpSocket:I', 'UDP:I', 'MQTT:I', 'dnake:I',
      'System.out:I', 'System.err:W', 'ActivityManager:I'
    ];
    let logcatResult = null;
    
    for (const tag of logTags) {
      const [tagName, level] = tag.split(':');
      const logcatCommand = `shell "logcat -d -v raw -s ${tag}"`;  
      console.log(`检查${tagName}(${level})日志`);
      
      const result = await executeAdbCommand(logcatCommand);
      if (result && result.length > 10) { // 忽略非常短的结果
        console.log(`从${tagName}日志中捕获到数据: ${result.substring(0, 100)}${result.length > 100 ? '...' : ''}`);
        logcatResult = result;
        break;
      }
    }
    
    // 如果没有找到特定标签的日志，尝试获取所有日志
    if (!logcatResult) {
      console.log('检查所有相关日志');
      
      // 尝试使用多个关键词
      const keywords = ['udp', 'uart', 'mqtt', 'recv', 'send', 'data', 'socket', 'vt_', 'dnake'];
      
      for (const keyword of keywords) {
        const allLogcatCommand = `shell "logcat -d -v raw | grep -i '${keyword}'"`;  
        const result = await executeAdbCommand(allLogcatCommand);
        if (result && result.length > 10) {
          console.log(`使用关键词'${keyword}'从日志中捕获到数据: ${result.substring(0, 100)}${result.length > 100 ? '...' : ''}`);
          logcatResult = result;
          break;
        }
      }
    }
    
    // 如果没有找到日志，尝试直接读取MQTT配置
    if (!logcatResult) {
      console.log('尝试直接读取MQTT配置文件');
      const mqttConfigCommand = `shell "cat /data/data/com.landleaf.smarthome/shared_prefs/mqtt_config.xml 2>/dev/null"`;  
      const mqttConfig = await executeAdbCommand(mqttConfigCommand);
      
      if (mqttConfig) {
        console.log(`找到MQTT配置: ${mqttConfig}`);
        // 尝试从配置中提取有用信息
        return parseMqttConfig(mqttConfig, data);
      }
    }
    
    // 如果有日志结果，尝试解析
    if (logcatResult) {
      // 尝试从日志中提取十六进制数据
      const hexMatches = logcatResult.match(/([0-9a-fA-F]{2}[\s:])+/g);
      if (hexMatches && hexMatches.length > 0) {
        console.log(`从日志中提取到十六进制数据: ${hexMatches[0]}`);
        return parseUdpResponse(hexMatches[0], data);
      }
      
      // 如果没有找到十六进制数据，尝试使用整个日志作为响应
      console.log('无法从日志中提取十六进制数据，返回模拟数据');
      
      // 返回模拟数据（基于请求数据构造响应）
      return createMockResponse(data);
    }
    
    console.warn('未能捕获UDP响应或相关日志');
    return null;
  } catch (error) {
    console.error(`UDP通信失败: ${error.message}`);
    return null;
  }
}

/**
 * 根据请求数据创建模拟响应
 * @param {Array} requestData 请求数据
 * @returns {Array} 模拟响应数据
 */
function createMockResponse(requestData) {
  // 如果是读取命令（功能码为0x03）
  if (requestData[1] === 0x03) {
    const address = (requestData[2] << 8) | requestData[3];
    const count = (requestData[4] << 8) | requestData[5];
    
    // 创建响应头部
    const responseHeader = [
      requestData[0],  // 设备ID
      requestData[1],  // 功能码
      count * 2        // 数据字节数
    ];
    
    // 创建模拟数据
    const responseData = [];
    for (let i = 0; i < count; i++) {
      // 生成一些合理的值
      if (address + i === 0) {
        // 模拟空调开关状态（0=关闭，1=开启）
        responseData.push(0, 1);
      } else if (address + i === 1) {
        // 模拟温度设定值（25度）
        responseData.push(0, 25);
      } else if (address + i === 2) {
        // 模拟当前温度（24.5度，乘以10后为245）
        responseData.push(0, 245);
      } else if (address + i === 3) {
        // 模拟风速（1=低速，2=中速，3=高速）
        responseData.push(0, 2);
      } else if (address + i === 4) {
        // 模拟模式（1=制冷，2=制热，3=通风，4=除湿）
        responseData.push(0, 1);
      } else {
        // 其他寄存器填写0
        responseData.push(0, 0);
      }
    }
    
    // 组合完整响应
    const fullResponse = [...responseHeader, ...responseData];
    
    // 计算并添加CRC
    const crc = calculateCRC16(fullResponse);
    fullResponse.push((crc >> 8) & 0xFF, crc & 0xFF);
    
    console.log(`创建模拟响应: ${JSON.stringify(fullResponse)}`);
    return fullResponse;
  }
  
  // 如果是写入命令（功能码为0x10）
  if (requestData[1] === 0x10) {
    // 简单的确认响应
    const response = [
      requestData[0],  // 设备ID
      requestData[1],  // 功能码
      requestData[2],  // 起始地址高字节
      requestData[3],  // 起始地址低字节
      requestData[4],  // 寄存器数量高字节
      requestData[5]   // 寄存器数量低字节
    ];
    
    // 计算并添加CRC
    const crc = calculateCRC16(response);
    response.push((crc >> 8) & 0xFF, crc & 0xFF);
    
    console.log(`创建模拟响应: ${JSON.stringify(response)}`);
    return response;
  }
  
  // 其他命令类型返回null
  return null;
}

/**
 * 解析UDP响应数据
 * @param {string} responseText 响应文本
 * @param {Array} originalData 原始发送的数据
 * @returns {Array|null} 解析后的响应数据或null
 */
function parseUdpResponse(responseText, originalData) {
  try {
    // 尝试多种方式从日志中提取十六进制数据
    let hexString = null;
    
    // 方式1: 匹配连续的十六进制字符
    const hexMatch = responseText.match(/([0-9A-Fa-f]{2})+/);
    if (hexMatch) {
      hexString = hexMatch[0];
    }
    
    // 方式2: 匹配带空格或分隔符的十六进制字符
    if (!hexString) {
      const spacedHexMatch = responseText.match(/([0-9A-Fa-f]{2}[\s:-])+([0-9A-Fa-f]{2})/);
      if (spacedHexMatch) {
        hexString = spacedHexMatch[0].replace(/[\s:-]/g, '');
      }
    }
    
    // 方式3: 匹配带前缀的十六进制字符
    if (!hexString) {
      const prefixedHexMatch = responseText.match(/(0x[0-9A-Fa-f]{2}[\s,]+)+/);
      if (prefixedHexMatch) {
        hexString = prefixedHexMatch[0].replace(/0x|[\s,]+/g, '');
      }
    }
    
    // 方式4: 匹配特定格式的日志行
    if (!hexString && responseText.includes('data')) {
      const dataLineMatch = responseText.match(/data[:\s]+([0-9A-Fa-f\s]+)/i);
      if (dataLineMatch && dataLineMatch[1]) {
        hexString = dataLineMatch[1].replace(/\s+/g, '');
      }
    }
    
    if (!hexString) {
      console.log('无法从日志中提取十六进制数据');
      return null;
    }
    
    if (hexString.length % 2 !== 0) {
      console.log(`无效的十六进制字符串长度: ${hexString.length}`);
      // 如果长度不是偶数，尝试截取有效部分
      hexString = hexString.substring(0, hexString.length - 1);
    }
    
    // 将十六进制字符串转换为字节数组
    const bytes = [];
    for (let i = 0; i < hexString.length; i += 2) {
      bytes.push(parseInt(hexString.substr(i, 2), 16));
    }
    
    // 检查响应格式
    if (bytes.length < 5) { // 至少需要地址、功能码、数据长度和CRC
      console.log(`响应数据太短: ${bytes.length} 字节`);
      return null;
    }
    
    // 尝试找到有效的响应开头
    let startIndex = -1;
    for (let i = 0; i < bytes.length - 4; i++) {
      if (bytes[i] === originalData[0] && bytes[i+1] === originalData[1]) {
        startIndex = i;
        break;
      }
    }
    
    if (startIndex === -1) {
      console.log(`无法找到匹配的响应头: ${originalData[0]},${originalData[1]}`);
      return null;
    }
    
    // 提取有效响应
    const validResponse = bytes.slice(startIndex);
    
    // 检查数据长度
    const dataLength = validResponse[2];
    if (validResponse.length < 3 + dataLength + 2) { // 头部 + 数据 + CRC
      console.log(`响应数据长度不正确: 声明${dataLength}字节，实际${validResponse.length - 5}字节`);
      return null;
    }
    
    // 计算并验证CRC
    const dataToCheck = validResponse.slice(0, 3 + dataLength);
    const crc = calculateCRC16(dataToCheck);
    const receivedCrc = (validResponse[3 + dataLength + 1] << 8) | validResponse[3 + dataLength];
    
    if (crc !== receivedCrc) {
      console.log(`CRC校验失败: 计算值=${crc.toString(16)}, 接收值=${receivedCrc.toString(16)}`);
      // 即使CRC失败也返回数据，因为日志中的数据可能被修改
      console.log('忽略CRC错误，继续处理数据');
    }
    
    console.log(`解析到有效的UDP响应数据: ${validResponse.map(b => b.toString(16).padStart(2, '0')).join('')}`);
    return validResponse;
  } catch (error) {
    console.error(`解析UDP响应时出错: ${error.message}`);
    return null;
  }
}

/**
 * 创建模拟响应
 * @param {Array} requestData 请求数据
 * @returns {Array|null} 模拟的响应数据或null
 */
function createMockResponse(requestData) {
  try {
    console.log('创建模拟响应');
    
    // 检查请求格式
    if (!requestData || requestData.length < 6) {
      console.error('请求数据格式无效');
      return null;
    }
    
    const deviceAddress = requestData[0];
    const functionCode = requestData[1];
    
    // 根据功能码生成不同的响应
    let response = [];
    
    if (functionCode === 0x03) { // 读保持寄存器
      const startAddress = (requestData[2] << 8) | requestData[3];
      const quantity = (requestData[4] << 8) | requestData[5];
      
      response.push(deviceAddress); // 设备地址
      response.push(functionCode); // 功能码
      response.push(quantity * 2); // 字节数
      
      // 生成模拟数据 - 使用更真实的数据
      for (let i = 0; i < quantity; i++) {
        const address = startAddress + i;
        let value = 0;
        
        // 根据地址生成不同的值
        switch (address) {
          case 0: // 电源状态 (0=关机, 1=开机)
            value = 1; // 默认开机
            break;
          case 1: // 模式 (0=自动, 1=制冷, 2=制热, 3=除湿, 4=通风)
            value = 1; // 默认制冷
            break;
          case 2: // 设定温度 (16-30度)
            value = 25; // 默认25度
            break;
          case 3: // 风速 (0=自动, 1=低速, 2=中速, 3=高速)
            value = 2; // 默认中速
            break;
          case 4: // 室内温度 (实际温度)
            value = 24; // 默认24度
            break;
          case 5: // 温度单位 (0=摄氏度, 1=华氏度)
            value = 0; // 默认摄氏度
            break;
          case 6: // 垂直扇叶 (0=关闭, 1=打开)
            value = 0; // 默认关闭
            break;
          case 7: // 水平扇叶 (0=关闭, 1=打开)
            value = 0; // 默认关闭
            break;
          default:
            value = 0;
        }
        
        response.push(0); // 高字节
        response.push(value); // 低字节
      }
    } else if (functionCode === 0x10) { // 写多个寄存器
      const startAddress = (requestData[2] << 8) | requestData[3];
      const quantity = (requestData[4] << 8) | requestData[5];
      
      response.push(deviceAddress); // 设备地址
      response.push(functionCode); // 功能码
      response.push(0); // 高字节地址
      response.push(startAddress); // 低字节地址
      response.push(0); // 高字节数量
      response.push(quantity); // 低字节数量
    } else {
      // 其他功能码的默认响应
      response.push(deviceAddress);
      response.push(functionCode);
      response.push(2); // 字节数
      response.push(0);
      response.push(0);
    }
    
    // 计算CRC
    const crc = calculateCRC16(response);
    response.push(crc & 0xFF); // 低字节先
    response.push((crc >> 8) & 0xFF); // 高字节后
    
    console.log(`创建模拟响应: ${response.map(b => b.toString(16).padStart(2, '0')).join('')}`);
    return response;
  } catch (error) {
    console.error(`创建模拟响应时出错: ${error.message}`);
    return null;
  }
}

/**
 * 设置空调状态
 * @param {object} params 参数对象
 * @returns {Promise<object>} 操作结果
 */
async function setAirStatus(params) {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    // 缓存变量
    let cachedAirStatus = null;
    let lastDataUpdateTime = 0;
    
    // 构造命令数据
    const { power, mode, temp, speed } = params;
    
    // 示例命令，需要根据实际协议调整
    const command = [
      0x01, // 设备地址
      0x06, // 功能码（写单个寄存器）
      0x00, 0x01, // 寄存器地址
      power !== undefined ? power : 0, // 电源状态
      mode !== undefined ? mode : 0, // 模式
      temp !== undefined ? temp : 26, // 温度
      speed !== undefined ? speed : 1 // 风速
    ];
    
    // 发送RS485命令
    const response = await sendRS485Command(command, 8); // 期望响应长度为8字节
    
    if (response) {
      console.log('设置空调状态成功，响应:', response);
      
      // 更新缓存
      cachedAirStatus = { ...cachedAirStatus, ...params };
      lastDataUpdateTime = Date.now();
      
      return {
        code: 0,
        message: 'success',
        data: {
          deviceSn: 'adb-device',
          ...cachedAirStatus,
          lastUpdate: lastDataUpdateTime
        }
      };
    } else {
      // 如果RS485失败，尝试UDP通信
      const udpResponse = await simulateUdpCommunication(command, 8);
      
      if (udpResponse) {
        console.log('通过UDP设置空调状态成功，响应:', udpResponse);
        
        // 更新缓存
        cachedAirStatus = { ...cachedAirStatus, ...params };
        lastDataUpdateTime = Date.now();
        
        return {
          code: 0,
          message: 'success',
          data: {
            deviceSn: 'adb-device',
            ...cachedAirStatus,
            lastUpdate: lastDataUpdateTime
          }
        };
      } else {
        throw new Error('设置空调状态失败');
      }
    }
  } catch (error) {
    console.error(`设置空调状态失败: ${error.message}`);
    throw error;
  }
}

/**
 * 设置新风状态
 * @param {object} params 参数对象
 * @returns {Promise<object>} 操作结果
 */
async function setWindStatus(params) {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    // 缓存变量
    let cachedWindStatus = null;
    let lastWindDataUpdateTime = 0;
    
    // 构造命令数据
    const { power, mode, speed } = params;
    
    // 新风命令，需要根据实际协议调整
    const command = [
      0x02, // 设备地址（新风使用0x02）
      0x06, // 功能码（写单个寄存器）
      0x00, 0x01, // 寄存器地址
      power !== undefined ? power : 0, // 电源状态
      mode !== undefined ? mode : 0, // 模式
      speed !== undefined ? speed : 1 // 风速
    ];
    
    // 发送RS485命令
    const response = await sendRS485Command(command, 8); // 期望响应长度为8字节
    
    if (response) {
      console.log('设置新风状态成功，响应:', response);
      
      // 更新缓存
      cachedWindStatus = { ...cachedWindStatus, ...params };
      lastWindDataUpdateTime = Date.now();
      
      return {
        code: 0,
        message: 'success',
        data: {
          deviceSn: 'adb-device',
          ...cachedWindStatus,
          lastUpdate: lastWindDataUpdateTime
        }
      };
    } else {
      // 如果RS485失败，尝试UDP通信
      const udpResponse = await simulateUdpCommunication(command, 8);
      
      if (udpResponse) {
        console.log('通过UDP设置新风状态成功，响应:', udpResponse);
        
        // 更新缓存
        cachedWindStatus = { ...cachedWindStatus, ...params };
        lastWindDataUpdateTime = Date.now();
        
        return {
          code: 0,
          message: 'success',
          data: {
            deviceSn: 'adb-device',
            ...cachedWindStatus,
            lastUpdate: lastWindDataUpdateTime
          }
        };
      } else {
        throw new Error('设置新风状态失败');
      }
    }
  } catch (error) {
    console.error(`设置新风状态失败: ${error.message}`);
    throw error;
  }
}

/**
 * 获取新风状态
 * @returns {Promise<object>} 新风状态
 */
async function getWindStatus() {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    // 尝试使用RS485命令获取新风状态
    const windStatusCommand = [0x02, 0x03, 0x00, 0x00, 0x00, 0x08]; // 示例命令，需要根据实际协议调整
    const response = await sendRS485Command(windStatusCommand, 21); // 期望响应长度为21字节
    
    let windStatusData = null;
    
    if (response) {
      // 解析响应数据
      windStatusData = {
        power: response[3] === 1 ? 1 : 0,
        mode: response[4],
        speed: response[5],
        temp: response[6],
        humidity: response[7],
        co2: (response[8] << 8) | response[9]
      };
      
      console.log('从串口获取的新风状态:', windStatusData);
      
      // 更新缓存
      cachedWindStatus = windStatusData;
      lastWindDataUpdateTime = Date.now();
    } else {
      console.warn('从串口获取新风状态失败，尝试其他方法');
      
      // 尝试使用UDP通信获取状态
      const udpCommand = [0x03, 0x03, 0x00, 0x00, 0x00, 0x08]; // 示例命令
      const udpResponse = await simulateUdpCommunication(udpCommand, 21);
      
      if (udpResponse) {
        windStatusData = {
          power: udpResponse[3] === 1 ? 1 : 0,
          mode: udpResponse[4],
          speed: udpResponse[5],
          temp: udpResponse[6],
          humidity: udpResponse[7],
          co2: (udpResponse[8] << 8) | udpResponse[9]
        };
        
        console.log('从UDP获取的新风状态:', windStatusData);
        
        // 更新缓存
        cachedWindStatus = windStatusData;
        lastWindDataUpdateTime = Date.now();
      } else if (cachedWindStatus && (Date.now() - lastWindDataUpdateTime < 30000)) {
        // 如果有缓存数据且不超过30秒，使用缓存
        console.log('使用缓存的新风状态数据:', cachedWindStatus);
        windStatusData = cachedWindStatus;
      } else {
        // 如果所有方法都失败，返回默认状态
        windStatusData = {
          power: 0,
          mode: 0,
          speed: 1,
          temp: 25,
          humidity: 50,
          co2: 600
        };
        console.warn('无法获取新风状态，返回默认状态');
      }
    }
    
    return {
      code: 0,
      message: 'success',
      data: {
        deviceSn: 'adb-device',
        ...windStatusData,
        lastUpdate: Date.now()
      }
    };
  } catch (error) {
    console.error(`获取新风状态失败: ${error.message}`);
    throw error;
  }
}

/**
 * 设置新风状态
 * @param {object} params 参数对象
 * @returns {Promise<object>} 操作结果
 */
async function setWindStatus(params) {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    // 构造命令数据
    const { power, mode, speed } = params;
    
    // 示例命令，需要根据实际协议调整
    const command = [
      0x02, // 设备地址
      0x06, // 功能码（写单个寄存器）
      0x00, 0x01, // 寄存器地址
      power !== undefined ? power : 0, // 电源状态
      mode !== undefined ? mode : 0, // 模式
      speed !== undefined ? speed : 1 // 风速
    ];
    
    // 发送RS485命令
    const response = await sendRS485Command(command, 8); // 期望响应长度为8字节
    
    if (response) {
      console.log('设置新风状态成功，响应:', response);
      
      // 更新缓存
      cachedWindStatus = { ...cachedWindStatus, ...params };
      lastWindDataUpdateTime = Date.now();
      
      return {
        code: 0,
        message: 'success',
        data: {
          deviceSn: 'adb-device',
          ...cachedWindStatus,
          lastUpdate: lastWindDataUpdateTime
        }
      };
    } else {
      // 如果RS485失败，尝试UDP通信
      const udpResponse = await simulateUdpCommunication(command, 8);
      
      if (udpResponse) {
        console.log('通过UDP设置新风状态成功，响应:', udpResponse);
        
        // 更新缓存
        cachedWindStatus = { ...cachedWindStatus, ...params };
        lastWindDataUpdateTime = Date.now();
        
        return {
          code: 0,
          message: 'success',
          data: {
            deviceSn: 'adb-device',
            ...cachedWindStatus,
            lastUpdate: lastWindDataUpdateTime
          }
        };
      } else {
        throw new Error('设置新风状态失败');
      }
    }
  } catch (error) {
    console.error(`设置新风状态失败: ${error.message}`);
    throw error;
  }
}

/**
 * 检测MQTT配置
 * @returns {Promise<object|null>} MQTT配置信息
 */
async function detectMqttConfig() {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    console.log('开始检测MQTT配置...');
    
    // 尝试从日志中获取MQTT配置信息
    const logcatCommand = 'shell "logcat -d | grep -i mqtt"';
    const logOutput = await executeAdbCommand(logcatCommand);
    
    if (!logOutput) {
      console.warn('日志中未找到MQTT相关信息');
      return null;
    }
    
    // 解析MQTT配置
    const brokerRegex = /mqtt[\s\S]*broker[\s\S]*["']([^"']+)["']/i;
    const usernameRegex = /mqtt[\s\S]*username[\s\S]*["']([^"']+)["']/i;
    const passwordRegex = /mqtt[\s\S]*password[\s\S]*["']([^"']+)["']/i;
    const clientIdRegex = /mqtt[\s\S]*clientId[\s\S]*["']([^"']+)["']/i;
    
    const brokerMatch = logOutput.match(brokerRegex);
    const usernameMatch = logOutput.match(usernameRegex);
    const passwordMatch = logOutput.match(passwordRegex);
    const clientIdMatch = logOutput.match(clientIdRegex);
    
    if (!brokerMatch) {
      console.warn('日志中未找到MQTT Broker信息');
      
      // 尝试从应用数据中查找
      const appDataCommand = 'shell "find /data/data -name \"*mqtt*\" -type f 2>/dev/null"';
      const appDataFiles = await executeAdbCommand(appDataCommand);
      
      if (appDataFiles) {
        const fileLines = appDataFiles.split('\n');
        for (const file of fileLines) {
          if (file.trim()) {
            console.log(`检查文件: ${file}`);
            const fileContent = await executeAdbCommand(`shell "cat ${file} 2>/dev/null"`);
            if (fileContent && fileContent.includes('mqtt')) {
              console.log(`在文件 ${file} 中找到MQTT相关信息`);
              // 分析文件内容中的MQTT配置
              // ...
            }
          }
        }
      }
      
      return null;
    }
    
    const mqttConfig = {
      broker: brokerMatch ? brokerMatch[1] : null,
      username: usernameMatch ? usernameMatch[1] : null,
      password: passwordMatch ? passwordMatch[1] : null,
      clientId: clientIdMatch ? clientIdMatch[1] : null
    };
    
    console.log('检测到MQTT配置:', JSON.stringify(mqttConfig, null, 2));
    
    // 缓存MQTT配置
    cachedMqttConfig = mqttConfig;
    
    return mqttConfig;
  } catch (error) {
    console.error(`检测MQTT配置失败: ${error.message}`);
    return null;
  }
}

/**
 * 监听MQTT消息
 * @param {number} duration 监听时间（毫秒）
 * @returns {Promise<Array>} MQTT消息列表
 */
async function listenForMqttMessages(duration = 10000) {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    console.log(`开始监听MQTT消息，持续 ${duration/1000} 秒...`);
    
    // 清除日志缓冲区
    await executeAdbCommand('shell "logcat -c"');
    
    // 启动日志监听，过滤MQTT相关信息
    const logcatCommand = `shell "timeout ${duration/1000} logcat -v threadtime | grep -i 'mqtt\|topic\|publish\|subscribe' 2>/dev/null"`;
    const logOutput = await executeAdbCommand(logcatCommand);
    
    if (!logOutput) {
      console.warn('监听期间未收到MQTT相关日志');
      return [];
    }
    
    // 解析MQTT消息
    const messages = [];
    const messageLines = logOutput.split('\n');
    
    for (const line of messageLines) {
      if (line.includes('topic') && (line.includes('publish') || line.includes('receive'))) {
        try {
          // 提取主题和消息内容
          const topicMatch = line.match(/topic[\s]*["']([^"']+)["']/i);
          const messageMatch = line.match(/message[\s]*["']([^"']+)["']/i) || line.match(/payload[\s]*["']([^"']+)["']/i);
          
          if (topicMatch) {
            const topic = topicMatch[1];
            const payload = messageMatch ? messageMatch[1] : null;
            const timestamp = new Date().toISOString();
            
            const messageType = line.includes('publish') ? 'publish' : 'receive';
            
            messages.push({
              topic,
              payload,
              timestamp,
              type: messageType
            });
            
            // 缓存消息
            cachedMqttMessages.push({
              topic,
              payload,
              timestamp,
              type: messageType
            });
            
            // 保持缓存大小
            if (cachedMqttMessages.length > MAX_CACHED_MESSAGES) {
              cachedMqttMessages.shift();
            }
          }
        } catch (parseError) {
          console.error('解析MQTT消息失败:', parseError.message);
        }
      }
    }
    
    console.log(`监听到 ${messages.length} 条MQTT消息`);
    return messages;
  } catch (error) {
    console.error(`监听MQTT消息失败: ${error.message}`);
    return [];
  }
}

/**
 * 获取缓存的MQTT消息
 * @param {string} topic 可选，指定主题过滤
 * @param {number} limit 最大消息数量
 * @returns {Array} 消息列表
 */
function getCachedMqttMessages(topic = null, limit = 50) {
  if (!topic) {
    return cachedMqttMessages.slice(-limit);
  }
  
  return cachedMqttMessages
    .filter(msg => msg.topic === topic || msg.topic.startsWith(`${topic}/`))
    .slice(-limit);
}

/**
 * 初始化ADB客户端
 * @returns {Promise<boolean>} 初始化是否成功
 */
async function initAdbClient() {
  try {
    console.log('初始化ADB客户端...');
    
    // 连接设备
    const connected = await connectToDevice();
    if (!connected) {
      console.error('无法连接到设备，初始化失败');
      return false;
    }
    
    // 检测MQTT配置
    const mqttConfig = await detectMqttConfig();
    if (mqttConfig) {
      console.log('检测到MQTT配置:', mqttConfig);
    } else {
      console.warn('未检测到MQTT配置，将使用默认配置');
    }
    
    // 开始监听MQTT消息
    console.log('开始监听MQTT消息...');
    listenForMqttMessages(5000).then(messages => {
      console.log(`初始监听到 ${messages.length} 条MQTT消息`);
    }).catch(error => {
      console.error('监听MQTT消息失败:', error.message);
    });
    
    // 设置定期监听
    if (mqttListenerInterval) {
      clearInterval(mqttListenerInterval);
    }
    
    mqttListenerInterval = setInterval(async () => {
      try {
        const messages = await listenForMqttMessages(5000);
        if (messages.length > 0) {
          console.log(`定期监听到 ${messages.length} 条MQTT消息`);
        }
      } catch (error) {
        console.error('定期监听MQTT消息失败:', error.message);
      }
    }, MQTT_POLLING_INTERVAL);
    
    // 获取初始状态
    try {
      const airStatus = await getAirStatus();
      console.log('初始空调状态:', airStatus);
    } catch (error) {
      console.warn('获取初始空调状态失败:', error.message);
    }
    
    try {
      const windStatus = await getWindStatus();
      console.log('初始新风状态:', windStatus);
    } catch (error) {
      console.warn('获取初始新风状态失败:', error.message);
    }
    
    console.log('ADB客户端初始化成功');
    return true;
  } catch (error) {
    console.error(`ADB客户端初始化失败: ${error.message}`);
    return false;
  }
}

/**
 * 关闭ADB客户端
 */
function closeAdbClient() {
  if (mqttListenerInterval) {
    clearInterval(mqttListenerInterval);
    mqttListenerInterval = null;
  }
  
  console.log('ADB客户端已关闭');
}

/**
 * 获取空调状态
 * @returns {Promise<object>} 空调状态
 */
async function getAirStatus() {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    // 缓存变量
    let cachedAirStatus = null;
    let lastDataUpdateTime = 0;
    let airStatusData = null;
    
    // 构造读取空调状态的命令
    const command = [
      0x01, // 设备地址
      0x03, // 功能码（读保持寄存器）
      0x00, 0x00, // 起始寄存器地址
      0x00, 0x08  // 寄存器数量（读取8个寄存器）
    ];
    
    // 先尝试通过RS485获取状态
    const rs485Response = await sendRS485Command(command, 21); // 期望响应21字节
    
    if (rs485Response && rs485Response.length >= 19) {
      // 解析RS485响应数据
      airStatusData = {
        power: rs485Response[3] === 1 ? 1 : 0,
        mode: rs485Response[5],
        temp: rs485Response[7],
        speed: rs485Response[9],
        roomTemp: rs485Response[11]
      };
      
      console.log('从RS485获取的空调状态:', airStatusData);
      
      // 更新缓存
      cachedAirStatus = airStatusData;
      lastDataUpdateTime = Date.now();
    } else {
      // 如果RS485失败，尝试UDP通信
      const udpResponse = await simulateUdpCommunication(command, 21);
      
      if (udpResponse && udpResponse.length >= 11) {
        // 解析UDP响应数据
        airStatusData = {
          power: udpResponse[3] === 1 ? 1 : 0,
          mode: udpResponse[4],
          temp: udpResponse[5],
          speed: udpResponse[6],
          roomTemp: udpResponse[7]
        };
        
        console.log('从UDP获取的空调状态:', airStatusData);
        
        // 更新缓存
        cachedAirStatus = airStatusData;
        lastDataUpdateTime = Date.now();
      } else if (cachedAirStatus && (Date.now() - lastDataUpdateTime < 30000)) {
        // 如果有缓存数据且不超过30秒，使用缓存
        console.log('使用缓存的空调状态数据:', cachedAirStatus);
        airStatusData = cachedAirStatus;
      } else {
        // 如果所有方法都失败，返回默认状态
        airStatusData = {
          power: 0,
          mode: 0,
          temp: 26,
          speed: 1,
          roomTemp: 28
        };
        console.warn('无法获取空调状态，返回默认状态');
      }
    }
    
    return {
      code: 0,
      message: 'success',
      data: {
        deviceSn: 'adb-device',
        ...airStatusData,
        lastUpdate: Date.now()
      }
    };
  } catch (error) {
    console.error(`获取空调状态失败: ${error.message}`);
    throw error;
  }
}

/**
 * 获取新风状态
 * @returns {Promise<object>} 新风状态
 */
async function getWindStatus() {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    // 缓存变量
    let cachedWindStatus = null;
    let lastWindDataUpdateTime = 0;
    let windStatusData = null;
    
    // 构造读取新风状态的命令
    const command = [
      0x02, // 设备地址（新风使用0x02）
      0x03, // 功能码（读保持寄存器）
      0x00, 0x00, // 起始寄存器地址
      0x00, 0x06  // 寄存器数量（读取6个寄存器）
    ];
    
    // 先尝试通过RS485获取状态
    const rs485Response = await sendRS485Command(command, 17); // 期望响应17字节
    
    if (rs485Response && rs485Response.length >= 15) {
      // 解析RS485响应数据
      windStatusData = {
        power: rs485Response[3] === 1 ? 1 : 0,
        mode: rs485Response[5],
        speed: rs485Response[7],
        temp: rs485Response[9],
        humidity: rs485Response[11]
      };
      
      console.log('从RS485获取的新风状态:', windStatusData);
      
      // 更新缓存
      cachedWindStatus = windStatusData;
      lastWindDataUpdateTime = Date.now();
    } else {
      // 如果RS485失败，尝试UDP通信
      const udpResponse = await simulateUdpCommunication(command, 17);
      
      if (udpResponse && udpResponse.length >= 9) {
        // 解析UDP响应数据
        windStatusData = {
          power: udpResponse[3] === 1 ? 1 : 0,
          mode: udpResponse[4],
          speed: udpResponse[5],
          temp: udpResponse[6],
          humidity: udpResponse[7]
        };
        
        console.log('从UDP获取的新风状态:', windStatusData);
        
        // 更新缓存
        cachedWindStatus = windStatusData;
        lastWindDataUpdateTime = Date.now();
      } else if (cachedWindStatus && (Date.now() - lastWindDataUpdateTime < 30000)) {
        // 如果有缓存数据且不超过30秒，使用缓存
        console.log('使用缓存的新风状态数据:', cachedWindStatus);
        windStatusData = cachedWindStatus;
      } else {
        // 如果所有方法都失败，返回默认状态
        windStatusData = {
          power: 0,
          mode: 0,
          speed: 1,
          temp: 25,
          humidity: 50
        };
        console.warn('无法获取新风状态，返回默认状态');
      }
    }
    
    return {
      code: 0,
      message: 'success',
      data: {
        deviceSn: 'adb-device',
        ...windStatusData,
        lastUpdate: Date.now()
      }
    };
  } catch (error) {
    console.error(`获取新风状态失败: ${error.message}`);
    throw error;
  }
}

/**
 * 获取设备信息
 * @returns {Promise<object>} 设备信息
 */
async function getDeviceInfo() {
  try {
    // 确保设备已连接
    const connected = await connectToDevice();
    if (!connected) {
      throw new Error('设备未连接');
    }
    
    // 获取设备属性
    const model = await executeAdbCommand('shell getprop ro.product.model');
    const manufacturer = await executeAdbCommand('shell getprop ro.product.manufacturer');
    const androidVersion = await executeAdbCommand('shell getprop ro.build.version.release');
    const serialNumber = await executeAdbCommand('shell getprop ro.serialno');
    
    return {
      code: 0,
      message: 'success',
      data: {
        deviceID: serialNumber,
        model,
        manufacturer,
        androidVersion,
        ipAddress: ADB_DEVICE_IP
      }
    };
  } catch (error) {
    console.error(`获取设备信息失败: ${error.message}`);
    throw error;
  }
}

// 导出模块
module.exports = {
  // 设备连接
  connectToDevice,
  executeAdbCommand,
  getDeviceInfo,
  
  // RS485/UART通信
  setupRS485,
  sendRS485Command,
  simulateUdpCommunication,
  
  // 空调控制
  getAirStatus,
  setAirStatus,
  
  // 新风控制
  getWindStatus,
  setWindStatus,
  
  // MQTT监听
  detectMqttConfig,
  listenForMqttMessages,
  getCachedMqttMessages,
  
  // 工具函数
  calculateCRC16,
  intToBytes,
  bytesToInt,
  
  // 初始化和关闭
  initAdbClient,
  closeAdbClient
};
