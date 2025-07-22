/**
 * 设备状态管理
 * 
 * 负责存储和管理设备状态数据，包括：
 * - 空调状态
 * - 新风状态
 * - 设备信息
 */

// 设备状态存储
const state = {
  deviceInfo: null,
  airStatus: {},
  windStatus: {}
};

/**
 * 更新设备信息
 * @param {object} info 设备信息
 */
function updateDeviceInfo(info) {
  state.deviceInfo = info;
}

/**
 * 更新空调状态
 * @param {object} status 空调状态
 */
function updateAirStatus(status) {
  if (status && status.deviceSn) {
    state.airStatus[status.deviceSn] = status;
  }
}

/**
 * 更新新风状态
 * @param {object} status 新风状态
 */
function updateWindStatus(status) {
  if (status && status.deviceSn) {
    state.windStatus[status.deviceSn] = status;
  }
}

/**
 * 获取设备信息
 * @returns {object} 设备信息
 */
function getDeviceInfo() {
  return state.deviceInfo;
}

/**
 * 获取空调状态
 * @param {string} deviceSn 设备序列号
 * @returns {object} 空调状态
 */
function getAirStatus(deviceSn) {
  if (deviceSn) {
    return state.airStatus[deviceSn];
  }
  return state.airStatus;
}

/**
 * 获取新风状态
 * @param {string} deviceSn 设备序列号
 * @returns {object} 新风状态
 */
function getWindStatus(deviceSn) {
  if (deviceSn) {
    return state.windStatus[deviceSn];
  }
  return state.windStatus;
}

module.exports = {
  updateDeviceInfo,
  updateAirStatus,
  updateWindStatus,
  getDeviceInfo,
  getAirStatus,
  getWindStatus
};
