/**
 * MQTT客户端
 * 
 * 负责与HVAC设备的MQTT通信，包括：
 * - 连接到MQTT代理服务器
 * - 订阅设备状态主题
 * - 发送控制命令
 * - 处理设备状态更新
 */

const mqtt = require('mqtt');
const deviceState = require('./device-state');

// MQTT配置
const MQTT_HOST = process.env.MQTT_HOST || '47.103.96.246'; // 从设备代码中推断的MQTT服务器
const MQTT_PORT = process.env.MQTT_PORT || '9883';
const MQTT_CLIENT_ID = `hvac-remote-${Math.random().toString(16).substring(2, 8)}`;

// 主题配置
const TOPICS = {
  AIR_STATUS: 'device/+/air/status',
  WIND_STATUS: 'device/+/wind/status',
  AIR_CONTROL: 'device/+/air/control',
  WIND_CONTROL: 'device/+/wind/control'
};

let client = null;

/**
 * 连接到MQTT代理服务器
 */
function connect() {
  console.log('正在连接到MQTT服务器...');
  
  client = mqtt.connect(`mqtt://${MQTT_HOST}:${MQTT_PORT}`, {
    clientId: MQTT_CLIENT_ID,
    clean: true,
    connectTimeout: 4000,
    reconnectPeriod: 1000
  });
  
  // 连接事件处理
  client.on('connect', () => {
    console.log('已连接到MQTT服务器');
    
    // 订阅主题
    client.subscribe([TOPICS.AIR_STATUS, TOPICS.WIND_STATUS], (err) => {
      if (err) {
        console.error('订阅主题失败:', err);
      } else {
        console.log('已订阅设备状态主题');
      }
    });
  });
  
  // 消息事件处理
  client.on('message', (topic, message) => {
    console.log(`收到MQTT消息: ${topic}`);
    
    try {
      const data = JSON.parse(message.toString());
      
      // 根据主题处理不同类型的消息
      if (topic.includes('air/status')) {
        deviceState.updateAirStatus(data);
      } else if (topic.includes('wind/status')) {
        deviceState.updateWindStatus(data);
      }
    } catch (error) {
      console.error('处理MQTT消息失败:', error);
    }
  });
  
  // 错误事件处理
  client.on('error', (error) => {
    console.error('MQTT连接错误:', error);
  });
  
  // 重连事件处理
  client.on('reconnect', () => {
    console.log('正在尝试重新连接到MQTT服务器...');
  });
  
  // 断开连接事件处理
  client.on('close', () => {
    console.log('MQTT连接已关闭');
  });
}

/**
 * 发送空调控制命令
 * @param {string} deviceId 设备ID
 * @param {object} command 控制命令
 */
function sendAirCommand(deviceId, command) {
  if (!client || !client.connected) {
    console.error('MQTT客户端未连接');
    return false;
  }
  
  const topic = TOPICS.AIR_CONTROL.replace('+', deviceId);
  client.publish(topic, JSON.stringify(command));
  console.log(`已发送空调控制命令: ${topic}`, command);
  return true;
}

/**
 * 发送新风控制命令
 * @param {string} deviceId 设备ID
 * @param {object} command 控制命令
 */
function sendWindCommand(deviceId, command) {
  if (!client || !client.connected) {
    console.error('MQTT客户端未连接');
    return false;
  }
  
  const topic = TOPICS.WIND_CONTROL.replace('+', deviceId);
  client.publish(topic, JSON.stringify(command));
  console.log(`已发送新风控制命令: ${topic}`, command);
  return true;
}

/**
 * 断开MQTT连接
 */
function disconnect() {
  if (client) {
    client.end();
    console.log('已断开MQTT连接');
  }
}

module.exports = {
  connect,
  sendAirCommand,
  sendWindCommand,
  disconnect
};
