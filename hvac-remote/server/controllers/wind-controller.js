/**
 * 新风控制器
 * 
 * 处理与新风相关的API请求
 */

const httpClient = require('../utils/http-client');
const mqttClient = require('../utils/mqtt-client');
const deviceState = require('../utils/device-state');

/**
 * 获取新风状态
 * @param {object} req 请求对象
 * @param {object} res 响应对象
 */
async function getWindStatus(req, res) {
  try {
    // 从查询参数获取deviceId
    const deviceId = req.query.deviceId;
    
    // 先尝试从缓存中获取状态
    let status = deviceState.getWindStatus(deviceId);
    
    // 如果缓存中没有数据，尝试从 HTTP 客户端获取
    if (!status) {
      try {
        const result = await httpClient.getWindStatus(deviceId);
        if (result && result.data) {
          status = result.data;
          // 更新缓存
          deviceState.updateWindStatus(status);
        }
      } catch (httpError) {
        console.error('从 HTTP 获取新风状态失败:', httpError);
      }
    }
    
    if (!status) {
      return res.status(404).json({
        code: 404,
        message: '未找到新风状态',
        data: null
      });
    }
    
    res.json({
      code: 0,
      message: 'success',
      data: status
    });
  } catch (error) {
    console.error('获取新风状态失败:', error);
    res.status(500).json({
      code: 500,
      message: '获取新风状态失败',
      data: null
    });
  }
}

/**
 * 控制新风
 * @param {object} req 请求对象
 * @param {object} res 响应对象
 */
async function controlWind(req, res) {
  try {
    // 从请求体中获取deviceId和命令
    const command = req.body;
    const deviceId = command.deviceId;
    
    // 首先尝试通过MQTT发送命令
    let mqttSuccess = false;
    try {
      mqttSuccess = mqttClient.sendWindCommand(deviceId, command);
    } catch (mqttError) {
      console.error('MQTT控制新风失败:', mqttError);
    }
    
    // 如果MQTT失败，尝试通过HTTP/RS485发送命令
    if (!mqttSuccess) {
      try {
        const result = await httpClient.controlWind(command);
        
        // 获取更新后的状态
        const updatedStatus = await httpClient.getWindStatus(deviceId);
        if (updatedStatus && updatedStatus.data) {
          deviceState.updateWindStatus(updatedStatus.data);
        }
        
        return res.json({
          code: 0,
          message: 'success',
          data: result.data || { success: true, method: 'http' }
        });
      } catch (httpError) {
        console.error('HTTP控制新风失败:', httpError);
        throw httpError;
      }
    }
    
    res.json({
      code: 0,
      message: 'success',
      data: { success: true, method: 'mqtt' }
    });
  } catch (error) {
    console.error('控制新风失败:', error);
    res.status(500).json({
      code: 500,
      message: '控制新风失败',
      data: null
    });
  }
}

module.exports = {
  getWindStatus,
  controlWind
};
