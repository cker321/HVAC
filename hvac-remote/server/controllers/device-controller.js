/**
 * 设备控制器
 * 
 * 处理与设备相关的API请求
 */

const httpClient = require('../utils/http-client');
const deviceState = require('../utils/device-state');

/**
 * 获取设备信息
 * @param {object} req 请求对象
 * @param {object} res 响应对象
 */
async function getDeviceInfo(req, res) {
  try {
    const deviceInfo = await httpClient.getDeviceInfo();
    
    // 更新设备状态
    deviceState.updateDeviceInfo(deviceInfo);
    
    res.json(deviceInfo);
  } catch (error) {
    console.error('获取设备信息失败:', error);
    res.status(500).json({ error: '获取设备信息失败', message: error.message });
  }
}

/**
 * 获取所有设备状态
 * @param {object} req 请求对象
 * @param {object} res 响应对象
 */
function getAllDeviceStatus(req, res) {
  try {
    const status = {
      deviceInfo: deviceState.getDeviceInfo(),
      airStatus: deviceState.getAirStatus(),
      windStatus: deviceState.getWindStatus()
    };
    
    res.json(status);
  } catch (error) {
    console.error('获取设备状态失败:', error);
    res.status(500).json({ error: '获取设备状态失败', message: error.message });
  }
}

module.exports = {
  getDeviceInfo,
  getAllDeviceStatus
};
