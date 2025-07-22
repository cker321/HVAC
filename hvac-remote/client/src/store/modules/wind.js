import { windApi } from '@/services/api'

const state = {
  windStatus: {},
  currentDeviceId: null
}

const getters = {
  getWindStatus: state => deviceId => {
    if (deviceId) {
      return state.windStatus[deviceId]
    }
    return state.windStatus[state.currentDeviceId] || null
  },
  getCurrentDeviceId: state => state.currentDeviceId
}

const mutations = {
  SET_WIND_STATUS(state, { deviceId, status }) {
    state.windStatus = {
      ...state.windStatus,
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
  
  // 获取新风状态
  async fetchWindStatus({ commit, dispatch }, deviceId) {
    try {
      dispatch('setLoading', true, { root: true })
      const response = await windApi.getStatus(deviceId)
      
      // 处理不同的响应格式
      let statusData = null;
      if (response.data && response.data.code === 0 && response.data.data) {
        // 新的API格式，有code/message/data字段
        statusData = response.data.data;
      } else if (response.data) {
        // 直接返回状态对象
        statusData = response.data;
      }
      
      commit('SET_WIND_STATUS', { deviceId, status: statusData })
      return statusData
    } catch (error) {
      dispatch('setError', error.message || '获取新风状态失败', { root: true })
      console.error('获取新风状态失败:', error)
      throw error
    } finally {
      dispatch('setLoading', false, { root: true })
    }
  },
  
  // 控制新风
  async controlWind({ dispatch, state }, { command, deviceId }) {
    const targetDeviceId = deviceId || state.currentDeviceId
    
    if (!targetDeviceId) {
      dispatch('setError', '未指定设备ID', { root: true })
      throw new Error('未指定设备ID')
    }
    
    try {
      dispatch('setLoading', true, { root: true })
      const response = await windApi.control(targetDeviceId, command)
      
      // 控制成功后刷新状态
      await dispatch('fetchWindStatus', targetDeviceId)
      
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
      dispatch('setError', error.message || '控制新风失败', { root: true })
      console.error('控制新风失败:', error)
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
