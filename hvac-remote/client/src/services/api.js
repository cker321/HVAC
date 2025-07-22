import axios from 'axios'

// API基础URL
const API_URL = process.env.VUE_APP_API_URL || 'http://localhost:3000'

// 创建axios实例
const apiClient = axios.create({
  baseURL: API_URL,
  timeout: 5000,
  headers: {
    'Content-Type': 'application/json'
  }
})

// 响应拦截器
apiClient.interceptors.response.use(
  response => {
    // 如果响应包含data字段和isSuccess字段，说明是设备API的响应格式
    if (response.data && Object.prototype.hasOwnProperty.call(response.data, 'isSuccess')) {
      return response.data;
    }
    // 如果响应包含code和message字段，说明是我们的RS485 API响应格式
    if (response.data && Object.prototype.hasOwnProperty.call(response.data, 'code')) {
      return response.data;
    }
    return response;
  },
  error => {
    console.error('API请求错误:', error)
    return Promise.reject(error)
  }
)

// 请求拦截器
apiClient.interceptors.request.use(
  config => {
    // 可以在这里添加认证信息等
    return config
  },
  error => {
    return Promise.reject(error)
  }
)

// 响应拦截器
apiClient.interceptors.response.use(
  response => {
    return response
  },
  error => {
    console.error('API请求错误:', error)
    return Promise.reject(error)
  }
)

// 设备API
export const deviceApi = {
  // 获取设备信息
  getDeviceInfo() {
    return apiClient.get('/user/register/info')
  },
  
  // 获取所有设备状态
  getAllStatus() {
    return apiClient.get('/device/status')
  },
  
  // 获取温湿度信息
  getTemperatureAndHumidity() {
    return apiClient.get('/api/temperature-humidity')
  },
  
  // 发送RS485读取命令
  sendRs485ReadCommand(address, functionCode, startAddress, quantity) {
    return apiClient.post('/api/rs485/read', {
      address,
      functionCode,
      startAddress,
      quantity
    })
  },
  
  // 发送RS485写入命令
  sendRs485WriteCommand(address, functionCode, startAddress, data) {
    return apiClient.post('/api/rs485/write', {
      address,
      functionCode,
      startAddress,
      data
    })
  }
}

// 空调API
export const airApi = {
  // 获取空调状态
  getStatus(deviceId) {
    return apiClient.get(`/api/air/status?deviceId=${deviceId || ''}`)
  },
  
  // 控制空调
  control(deviceId, command) {
    // 创建控制命令对象
    const controlCommand = { ...command };
    if (deviceId) {
      controlCommand.deviceId = deviceId;
    }
    
    return apiClient.post('/api/air/control', controlCommand)
  },
  
  // 直接控制空调参数
  setPower(power) {
    return apiClient.post('/api/rs485/write', {
      address: 1,
      functionCode: 6,
      startAddress: 0,
      data: power ? 1 : 0
    })
  },
  
  setMode(mode) {
    return apiClient.post('/api/rs485/write', {
      address: 1,
      functionCode: 6,
      startAddress: 1,
      data: mode
    })
  },
  
  setTemperature(temp) {
    return apiClient.post('/api/rs485/write', {
      address: 1,
      functionCode: 6,
      startAddress: 2,
      data: temp
    })
  },
  
  setFanSpeed(speed) {
    return apiClient.post('/api/rs485/write', {
      address: 1,
      functionCode: 6,
      startAddress: 3,
      data: speed
    })
  }
}

// 新风API
export const windApi = {
  // 获取新风状态
  getStatus(deviceId) {
    return apiClient.get(`/api/wind/status?deviceId=${deviceId || ''}`)
  },
  
  // 控制新风
  control(deviceId, command) {
    // 创建控制命令对象
    const controlCommand = { ...command };
    if (deviceId) {
      controlCommand.deviceId = deviceId;
    }
    
    return apiClient.post('/api/wind/control', controlCommand)
  },
  
  // 直接控制新风参数
  setPower(power) {
    return apiClient.post('/api/rs485/write', {
      address: 2,
      functionCode: 6,
      startAddress: 0,
      data: power ? 1 : 0
    })
  },
  
  setMode(mode) {
    return apiClient.post('/api/rs485/write', {
      address: 2,
      functionCode: 6,
      startAddress: 1,
      data: mode
    })
  },
  
  setFanSpeed(speed) {
    return apiClient.post('/api/rs485/write', {
      address: 2,
      functionCode: 6,
      startAddress: 2,
      data: speed
    })
  }
}

// 环境监控API
export const environmentApi = {
  // 获取当前温湿度
  getCurrentTemperatureAndHumidity() {
    return apiClient.get('/api/temperature-humidity')
  },
  
  // 获取空调室内温度
  getAirRoomTemperature() {
    return apiClient.post('/api/rs485/read', {
      address: 1,
      functionCode: 3,
      startAddress: 4,
      quantity: 1
    })
  },
  
  // 获取新风温湿度
  getWindTemperatureAndHumidity() {
    return apiClient.post('/api/rs485/read', {
      address: 2,
      functionCode: 3,
      startAddress: 3,
      quantity: 2
    })
  }
}

export default {
  deviceApi,
  airApi,
  windApi,
  environmentApi
}
