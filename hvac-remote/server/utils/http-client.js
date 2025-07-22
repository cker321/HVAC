/**
 * HTTP客户端
 * 
 * 负责与HVAC设备的HTTP服务器通信，包括：
 * - 获取设备信息
 * - 发送RS485读写命令
 * - 获取设备状态
 * - 控制空调和新风系统
 */

const axios = require('axios');
const adbClient = require('./adb-client');

// 设备HTTP服务器配置
/**
 * 说明：
 * 1. 安卓设备通过CoreService运行AndServer，在8888端口提供HTTP服务
 * 2. 需要在.env文件中设置DEVICE_IP和DEVICE_PORT，或者在运行时提供环境变量
 * 3. 如果使用测试代理服务器，请将DEVICE_IP设置为127.0.0.1，DEVICE_PORT设置为3002
 */

// 请替换为安卓设备的实际IP地址和端口
const DEVICE_IP = process.env.DEVICE_IP || '192.168.2.42'; // 默认使用本地测试服务器
const DEVICE_PORT = process.env.DEVICE_PORT || '8888';   // 默认使用测试服务器端口
const BASE_URL = `http://${DEVICE_IP}:${DEVICE_PORT}`;

// 是否使用ADB通信
const USE_ADB = true;

// 创建HTTP客户端实例
const httpClient = axios.create({
  baseURL: BASE_URL,
  timeout: 5000,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  }
});

// 初始化ADB连接
async function initAdb() {
  if (USE_ADB) {
    try {
      const connected = await adbClient.connectToDevice();
      console.log(`ADB连接状态: ${connected ? '已连接' : '未连接'}`);
      return connected;
    } catch (error) {
      console.error('ADB初始化失败:', error.message);
      return false;
    }
  }
  return false;
}

// 尝试初始化ADB连接
initAdb().then(connected => {
  if (connected) {
    console.log('ADB连接成功，将使用ADB与设备通信');
  } else if (USE_ADB) {
    console.warn('ADB连接失败，将尝试使用HTTP API与设备通信');
  } else {
    console.log('未启用ADB，将使用HTTP API与设备通信');
  }
});

/**
 * 获取设备注册信息
 * @returns {Promise<object>} 设备信息
 */
async function getDeviceInfo() {
  try {
    // 如果启用了ADB，优先使用ADB获取设备信息
    if (USE_ADB) {
      try {
        const result = await adbClient.getDeviceInfo();
        console.log('通过ADB获取设备信息成功');
        return result;
      } catch (adbError) {
        console.error('通过ADB获取设备信息失败:', adbError.message);
        console.log('尝试使用HTTP API获取设备信息...');
      }
    }
    
    // 使用HTTP API获取设备信息
    const response = await httpClient.get('/user/register/info');
    return response.data;
  } catch (error) {
    console.error('获取设备信息失败:', error.message);
    throw error;
  }
}

/**
 * 发送RS485写入命令
 * @param {number} address 设备地址
 * @param {number} functionCode 功能码
 * @param {number} startAddress 起始地址
 * @param {number} data 写入数据
 * @returns {Promise<object>} 写入结果
 */
async function sendRs485WriteCommand(address, functionCode, startAddress, data) {
  try {
    const response = await httpClient.post('/api/rs485/write', {
      address,
      functionCode,
      startAddress,
      data
    });
    return response.data;
  } catch (error) {
    console.error('发送RS485写入命令失败:', error.message);
    throw error;
  }
}

/**
 * 发送RS485读取命令
 * @param {number} address 设备地址
 * @param {number} functionCode 功能码
 * @param {number} startAddress 起始地址
 * @param {number} quantity 读取数量
 * @returns {Promise<object>} 读取结果
 */
async function sendRs485ReadCommand(address, functionCode, startAddress, quantity) {
  try {
    const response = await httpClient.post('/api/rs485/read', {
      address,
      functionCode,
      startAddress,
      quantity
    });
    return response.data;
  } catch (error) {
    console.error('发送RS485读取命令失败:', error.message);
    throw error;
  }
}

/**
 * 控制空调
 * @param {object} params 控制参数
 * @returns {Promise<object>} 控制结果
 */
async function controlAir(params) {
  try {
    // 如果启用了ADB，优先使用ADB控制空调
    if (USE_ADB) {
      try {
        const result = await adbClient.controlAir(params);
        console.log('通过ADB控制空调成功');
        return result;
      } catch (adbError) {
        console.error('通过ADB控制空调失败:', adbError.message);
        console.log('尝试使用HTTP API控制空调...');
      }
    }
    
    // 尝试使用HTTP API控制
    try {
      const response = await httpClient.post('/api/air/control', params);
      return response.data;
    } catch (httpError) {
      console.log('通过HTTP API控制空调失败，尝试使用RS485写入命令');
      
      // 如果HTTP API失败，则使用RS485写入命令
      const address = 1; // 空调设备地址
      const functionCode = 6; // 写单个寄存器
      
      // 处理不同的控制参数
      if (params.power !== undefined) {
        await sendRs485WriteCommand(address, functionCode, 0, params.power);
      }
      
      if (params.mode !== undefined) {
        await sendRs485WriteCommand(address, functionCode, 1, params.mode);
      }
      
      if (params.temp !== undefined) {
        await sendRs485WriteCommand(address, functionCode, 2, params.temp);
      }
      
      if (params.speed !== undefined) {
        await sendRs485WriteCommand(address, functionCode, 3, params.speed);
      }
      
      // 返回控制结果
      return {
        code: 0,
        message: 'success',
        data: params
      };
    }
  } catch (error) {
    console.error('控制空调失败:', error.message);
    throw error;
  }
}

/**
 * 控制新风
 * @param {object} params 控制参数
 * @returns {Promise<object>} 控制结果
 */
async function controlWind(params) {
  try {
    // 如果启用了ADB，优先使用ADB控制新风
    if (USE_ADB) {
      try {
        const result = await adbClient.controlWind(params);
        console.log('通过ADB控制新风成功');
        return result;
      } catch (adbError) {
        console.error('通过ADB控制新风失败:', adbError.message);
        console.log('尝试使用HTTP API控制新风...');
      }
    }
    
    // 尝试使用HTTP API控制
    try {
      const response = await httpClient.post('/api/wind/control', params);
      return response.data;
    } catch (httpError) {
      console.log('通过HTTP API控制新风失败，尝试使用RS485写入命令');
      
      // 如果HTTP API失败，则使用RS485写入命令
      const address = 2; // 新风设备地址
      const functionCode = 6; // 写单个寄存器
      
      // 处理不同的控制参数
      if (params.power !== undefined) {
        await sendRs485WriteCommand(address, functionCode, 0, params.power);
      }
      
      if (params.mode !== undefined) {
        await sendRs485WriteCommand(address, functionCode, 1, params.mode);
      }
      
      if (params.speed !== undefined) {
        await sendRs485WriteCommand(address, functionCode, 2, params.speed);
      }
      
      // 返回控制结果
      return {
        code: 0,
        message: 'success',
        data: params
      };
    }
  } catch (error) {
    console.error('控制新风失败:', error.message);
    throw error;
  }
}

/**
 * 获取空调状态
 * @param {string} deviceId 设备ID
 * @returns {Promise<object>} 空调状态
 */
async function getAirStatus(deviceId) {
  try {
    // 如果启用了ADB，优先使用ADB获取空调状态
    if (USE_ADB) {
      try {
        const result = await adbClient.getAirStatus();
        console.log('通过ADB获取空调状态成功');
        return result;
      } catch (adbError) {
        console.error('通过ADB获取空调状态失败:', adbError.message);
        console.log('尝试使用HTTP API获取空调状态...');
      }
    }
    
    // 尝试使用HTTP API获取状态
    try {
      const response = await httpClient.get(`/api/air/status?deviceId=${deviceId}`);
      return response.data;
    } catch (httpError) {
      console.log('通过HTTP API获取空调状态失败，尝试使用RS485读取命令');
      
      // 如果HTTP API失败，则使用RS485读取命令
      const address = 1; // 空调设备地址
      const functionCode = 3; // 读保持寄存器
      const startAddress = 0; // 起始地址
      const quantity = 16; // 读取数量
      
      const result = await sendRs485ReadCommand(address, functionCode, startAddress, quantity);
      
      if (result && result.data && result.data.values) {
        const values = result.data.values;
        
        // 解析空调状态
        const status = {
          code: 0,
          message: 'success',
          data: {
            deviceSn: deviceId,
            power: values[0],
            mode: values[1],
            temp: values[2],
            speed: values[3],
            roomTemp: values[4]
          }
        };
        
        return status;
      }
      
      throw new Error('无法通过RS485读取空调状态');
    }
  } catch (error) {
    console.error('获取空调状态失败:', error.message);
    throw error;
  }
}

/**
 * 获取新风状态
 * @param {string} deviceId 设备ID
 * @returns {Promise<object>} 新风状态
 */
async function getWindStatus(deviceId) {
  try {
    // 如果启用了ADB，优先使用ADB获取新风状态
    if (USE_ADB) {
      try {
        const result = await adbClient.getWindStatus();
        console.log('通过ADB获取新风状态成功');
        return result;
      } catch (adbError) {
        console.error('通过ADB获取新风状态失败:', adbError.message);
        console.log('尝试使用HTTP API获取新风状态...');
      }
    }
    
    // 尝试使用HTTP API获取状态
    try {
      const response = await httpClient.get(`/api/wind/status?deviceId=${deviceId}`);
      return response.data;
    } catch (httpError) {
      console.log('通过HTTP API获取新风状态失败，尝试使用RS485读取命令');
      
      // 如果HTTP API失败，则使用RS485读取命令
      const address = 2; // 新风设备地址
      const functionCode = 3; // 读保持寄存器
      const startAddress = 0; // 起始地址
      const quantity = 16; // 读取数量
      
      const result = await sendRs485ReadCommand(address, functionCode, startAddress, quantity);
      
      if (result && result.data && result.data.values) {
        const values = result.data.values;
        
        // 解析新风状态
        const status = {
          code: 0,
          message: 'success',
          data: {
            deviceSn: deviceId,
            power: values[0],
            mode: values[1],
            speed: values[2],
            temp: values[3],
            humidity: values[4]
          }
        };
        
        return status;
      }
      
      throw new Error('无法通过RS485读取新风状态');
    }
  } catch (error) {
    console.error('获取新风状态失败:', error.message);
    throw error;
  }
}

/**
 * 获取温湿度信息
 * @returns {Promise<object>} 温湿度信息
 */
async function getTemperatureAndHumidity() {
  try {
    // 如果启用了ADB，优先使用ADB获取温湿度信息
    if (USE_ADB) {
      try {
        const result = await adbClient.getTemperatureAndHumidity();
        console.log('通过ADB获取温湿度信息成功');
        return result;
      } catch (adbError) {
        console.error('通过ADB获取温湿度信息失败:', adbError.message);
        console.log('尝试使用其他方式获取温湿度信息...');
      }
    }
    
    // 获取空调状态和新风状态
    const airStatus = await getAirStatus('default');
    const windStatus = await getWindStatus('default');
    
    // 提取温湿度信息
    const temperatureAndHumidity = {
      code: 0,
      message: 'success',
      data: {
        airTemp: airStatus.data.roomTemp,
        windTemp: windStatus.data.temp,
        humidity: windStatus.data.humidity
      }
    };
    
    return temperatureAndHumidity;
  } catch (error) {
    console.error('获取温湿度信息失败:', error.message);
    throw error;
  }
}

// 获取所有设备列表
async function getDeviceList() {
  try {
    const response = await httpClient.get('/api/device/list');
    return response.data;
  } catch (error) {
    console.error('获取设备列表失败:', error);
    throw error;
  }
}

// 获取场景列表
async function getSceneList() {
  try {
    const response = await httpClient.get('/api/scene/list');
    return response.data;
  } catch (error) {
    console.error('获取场景列表失败:', error);
    throw error;
  }
}

// 执行场景
async function executeScene(sceneId) {
  try {
    const response = await httpClient.post(`/api/scene/execute`, { sceneId });
    return response.data;
  } catch (error) {
    console.error('执行场景失败:', error);
    throw error;
  }
}

module.exports = {
  getDeviceInfo,
  sendRs485WriteCommand,
  sendRs485ReadCommand,
  controlAir,
  controlWind,
  getAirStatus,
  getWindStatus,
  getDeviceList,
  getSceneList,
  executeScene,
  getTemperatureAndHumidity
};
