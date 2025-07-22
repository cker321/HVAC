import { deviceApi, environmentApi } from '@/services/api'

const state = {
  deviceInfo: null,
  allStatus: null,
  environmentData: null
}

const getters = {
  getDeviceInfo: state => state.deviceInfo,
  getAllStatus: state => state.allStatus,
  getEnvironmentData: state => state.environmentData
}

const mutations = {
  SET_DEVICE_INFO(state, info) {
    state.deviceInfo = info
  },
  SET_ALL_STATUS(state, status) {
    state.allStatus = status
  },
  SET_ENVIRONMENT_DATA(state, data) {
    state.environmentData = data
  }
}

const actions = {
  // 获取设备信息
  async fetchDeviceInfo({ commit, dispatch }) {
    try {
      dispatch('setLoading', true, { root: true })
      const response = await deviceApi.getDeviceInfo()
      
      // 处理不同的响应格式
      let deviceInfo = null;
      if (response.data && response.data.code === 0 && response.data.data) {
        // 新的API格式，有code/message/data字段
        deviceInfo = response.data;
      } else if (response.data) {
        // 直接返回设备信息对象
        deviceInfo = response.data;
      }
      
      commit('SET_DEVICE_INFO', deviceInfo)
      console.log('获取设备信息成功:', deviceInfo)
      return deviceInfo
    } catch (error) {
      dispatch('setError', error.message || '获取设备信息失败', { root: true })
      console.error('获取设备信息失败:', error)
      throw error
    } finally {
      dispatch('setLoading', false, { root: true })
    }
  },
  
  // 获取所有设备状态
  async fetchAllStatus({ commit, dispatch }) {
    try {
      dispatch('setLoading', true, { root: true })
      const response = await deviceApi.getAllStatus()
      
      // 处理不同的响应格式
      let statusData = null;
      if (response.data && response.data.code === 0 && response.data.data) {
        // 新的API格式，有code/message/data字段
        statusData = response.data.data;
      } else if (response.data) {
        // 直接返回状态对象
        statusData = response.data;
      }
      
      commit('SET_ALL_STATUS', statusData)
      return statusData
    } catch (error) {
      dispatch('setError', error.message || '获取设备状态失败', { root: true })
      console.error('获取设备状态失败:', error)
      throw error
    } finally {
      dispatch('setLoading', false, { root: true })
    }
  },
  
  // 获取环境数据（温湿度信息）
  async fetchEnvironmentData({ commit, dispatch }) {
    try {
      dispatch('setLoading', true, { root: true })
      const response = await environmentApi.getCurrentTemperatureAndHumidity()
      
      // 处理不同的响应格式
      let envData = null;
      if (response.data && response.data.code === 0 && response.data.data) {
        // 新的API格式，有code/message/data字段
        envData = response.data.data;
      } else if (response.data) {
        // 直接返回环境数据对象
        envData = response.data;
      }
      
      commit('SET_ENVIRONMENT_DATA', envData)
      return envData
    } catch (error) {
      dispatch('setError', error.message || '获取环境数据失败', { root: true })
      console.error('获取环境数据失败:', error)
      throw error
    } finally {
      dispatch('setLoading', false, { root: true })
    }
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
