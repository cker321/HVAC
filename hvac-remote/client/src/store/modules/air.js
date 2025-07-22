import { airApi } from '@/services/api'

const state = {
  airStatus: {},
  currentDeviceId: null
}

const getters = {
  getAirStatus: state => deviceId => {
    if (deviceId) {
      return state.airStatus[deviceId]
    }
    return state.airStatus[state.currentDeviceId] || null
  },
  getCurrentDeviceId: state => state.currentDeviceId
}

const mutations = {
  SET_AIR_STATUS(state, { deviceId, status }) {
    debugger
    state.airStatus = {
      ...state.airStatus,
      [deviceId]: status
    }
  },
  SET_CURRENT_DEVICE_ID(state, deviceId) {
    state.currentDeviceId = deviceId
  }
}

const actions = {
  // 设置当前设备ID
  setCurrentDeviceId({ commit }, deviceId) {
    commit('SET_CURRENT_DEVICE_ID', deviceId)
  },
  
  // 获取空调状态
  async fetchAirStatus({ commit, dispatch }, deviceId) {
    try {
        debugger
      dispatch('setLoading', true, { root: true })
      const response = await airApi.getStatus(deviceId)
      
      // 处理不同的响应格式
      let statusData = null;
      if (response.data && response.data.code === 0 && response.data.data) {
        // 新的API格式，有code/message/data字段
        statusData = response.data.data;
      } else if (response.data) {
        // 直接返回状态对象
        statusData = response.data;
      }
      commit('SET_AIR_STATUS', { deviceId, status: statusData })
      return statusData
    } catch (error) {
      dispatch('setError', error.message || '获取空调状态失败', { root: true })
      console.error('获取空调状态失败:', error)
      throw error
    } finally {
      dispatch('setLoading', false, { root: true })
    }
  },
  
  // 控制空调
  async controlAir({ dispatch, state }, { command, deviceId }) {
    const targetDeviceId = deviceId || state.currentDeviceId
    
    if (!targetDeviceId) {
      dispatch('setError', '未指定设备ID', { root: true })
      throw new Error('未指定设备ID')
    }
    
    try {
      dispatch('setLoading', true, { root: true })
      const response = await airApi.control(targetDeviceId, command)
      
      // 控制成功后刷新状态
      await dispatch('fetchAirStatus', targetDeviceId)
      
      // 处理不同的响应格式
      let resultData = null;
      if (response.data && response.data.code === 0 && response.data.data) {
        // 新的API格式，有code/message/data字段
        resultData = response.data.data;
      } else if (response.data) {
        // 直接返回结果对象
        resultData = response.data;
      }
      
      return resultData
    } catch (error) {
      dispatch('setError', error.message || '控制空调失败', { root: true })
      console.error('控制空调失败:', error)
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
