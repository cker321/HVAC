<template>
  <div class="air-control-view">
    <div class="header">
      <button class="back-button" @click="goBack">
        <span>&larr;</span> 返回
      </button>
      <h1>空调控制</h1>
    </div>
    
    <div class="content" v-if="airStatus">
      <div class="status-card">
        <div class="room-info">
          <h2>{{ deviceInfo ? `${deviceInfo.floor}楼 ${deviceInfo.unit}单元 ${deviceInfo.roomId}房间` : '房间' }}</h2>
          <div class="temperature-display">
            <div class="current-temp">
              <span class="temp-value">{{ airStatus.intakeTemperature || '--' }}</span>
              <span class="temp-unit">°C</span>
              <div class="temp-label">室内温度</div>
            </div>
            <div class="set-temp">
              <span class="temp-value">{{ airStatus.settingTemp || '--' }}</span>
              <span class="temp-unit">°C</span>
              <div class="temp-label">设定温度</div>
            </div>
          </div>
        </div>
        
        <div class="control-panel">
          <div class="power-control">
            <button 
              class="power-button" 
              :class="{ 'on': airStatus.powerSetting }"
              @click="togglePower"
            >
              <span class="power-icon">⏻</span>
              <span>{{ airStatus.powerSetting ? '开启' : '关闭' }}</span>
            </button>
          </div>
          
          <div class="temperature-control">
            <h3>温度控制</h3>
            <div class="temp-buttons">
              <button class="temp-button decrease" @click="decreaseTemp">-</button>
              <div class="temp-display">{{ airStatus.settingTemp || '--' }}°C</div>
              <button class="temp-button increase" @click="increaseTemp">+</button>
            </div>
          </div>
          
          <div class="mode-control">
            <h3>模式</h3>
            <div class="mode-buttons">
              <button 
                v-for="(mode, index) in modes" 
                :key="index"
                class="mode-button"
                :class="{ 'active': airStatus.settingMode === mode.value }"
                @click="setMode(mode.value)"
              >
                {{ mode.label }}
              </button>
            </div>
          </div>
          
          <div class="fan-control">
            <h3>风速</h3>
            <div class="fan-buttons">
              <button 
                v-for="(speed, index) in fanSpeeds" 
                :key="index"
                class="fan-button"
                :class="{ 'active': airStatus.settingWindSpeed === speed.value }"
                @click="setFanSpeed(speed.value)"
              >
                {{ speed.label }}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="loading-state" v-else-if="isLoading">
      <p>加载空调状态中...</p>
    </div>
    
    <div class="error-state" v-else-if="hasError">
      <p>加载空调状态失败: {{ errorMessage }}</p>
      <button @click="refreshStatus">重试</button>
    </div>
    
    <div class="empty-state" v-else>
      <p>未找到空调状态信息</p>
      <button @click="refreshStatus">刷新</button>
    </div>
  </div>
</template>

<script>
import { ref, computed, onMounted, onBeforeUnmount, watch } from 'vue'
import { useStore } from 'vuex'
import { useRouter } from 'vue-router'

export default {
  name: 'AirControlView',
  setup() {
    debugger

    const store = useStore()
    const router = useRouter()
    let refreshInterval = null
    // 数据
    const modes = [
      { label: '制冷', value: 1 },
      { label: '制热', value: 2 },
      { label: '送风', value: 4 },
      { label: '除湿', value: 3 },
      { label: '自动', value: 5 }
    ]
    
    const fanSpeeds = [
      { label: '高速', value: 0 },
      { label: '中速', value: 1 },
      { label: '低速', value: 2 },
      { label: '自动', value: 3 }
    ]
    
    // 计算属性
    const deviceInfo = computed(() => store.state.device.deviceInfo)
    const isLoading = computed(() => store.getters.isLoading)
    const hasError = computed(() => store.getters.hasError)
    const errorMessage = computed(() => store.getters.errorMessage)
    const deviceId = computed(() => deviceInfo.value?.deviceID)
    const airStatus = computed(() => store.getters['air/getAirStatus'](deviceId.value))
    
    // 方法
    const goBack = () => {
      router.push('/')
    }
    
    const refreshStatus = () => {
      debugger
      if (deviceId.value) {
        store.dispatch('air/fetchAirStatus', deviceId.value)
      }
    }
    
    const togglePower = () => {
      store.dispatch('air/controlAir', {
        deviceId: deviceId.value,
        command: {
          power: airStatus.value?.powerSetting ? 0 : 1
        }
      })
    }
    
    const increaseTemp = () => {
      if (airStatus.value?.settingTemp < 30) {
        store.dispatch('air/controlAir', {
          deviceId: deviceId.value,
          command: {
            temp: airStatus.value.settingTemp + 1
          }
        })
      }
    }
    
    const decreaseTemp = () => {
      if (airStatus.value?.settingTemp > 16) {
        store.dispatch('air/controlAir', {
          deviceId: deviceId.value,
          command: {
            temp: airStatus.value.settingTemp - 1
          }
        })
      }
    }
    
    const setMode = (mode) => {
      store.dispatch('air/controlAir', {
        deviceId: deviceId.value,
        command: {
          mode: mode
        }
      })
    }
    
    const setFanSpeed = (speed) => {
      store.dispatch('air/controlAir', {
        deviceId: deviceId.value,
        command: {
          speed: speed
        }
      })
    }
    
    // 生命周期钩子
    onMounted(() => {
      debugger
      // 设置当前设备ID
      if (deviceInfo.value && deviceInfo.value.deviceId) {
        store.dispatch('air/fetchAirStatus', deviceInfo.value.deviceId)
      }
      
      // 每30秒刷新一次状态
      refreshInterval = setInterval(() => {
        refreshStatus()
      }, 30000)
    })
    
    onBeforeUnmount(() => {
      // 清除定时器
      if (refreshInterval) {
        clearInterval(refreshInterval)
      }
    })
    console.log('🚀 ~ AirControlView ~ airStatus.value:', airStatus.value);
    // 返回模板中需要使用的数据和方法
    return {
      modes,
      fanSpeeds,
      deviceInfo,
      isLoading,
      hasError,
      errorMessage,
      deviceId,
      airStatus,
      goBack,
      refreshStatus,
      togglePower,
      increaseTemp,
      decreaseTemp,
      setMode,
      setFanSpeed
    }
  }
}
</script>

<style scoped>
.air-control-view {
  padding: 1rem;
}

.header {
  display: flex;
  align-items: center;
  margin-bottom: 1.5rem;
}

.back-button {
  background: none;
  border: none;
  font-size: 1rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  margin-right: 1rem;
  padding: 0.5rem;
}

.back-button span {
  margin-right: 0.5rem;
}

.content {
  margin-top: 1rem;
}

.status-card {
  background-color: #fff;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.room-info {
  margin-bottom: 2rem;
}

.temperature-display {
  display: flex;
  justify-content: space-around;
  margin-top: 1.5rem;
}

.current-temp, .set-temp {
  text-align: center;
}

.temp-value {
  font-size: 2.5rem;
  font-weight: bold;
}

.temp-unit {
  font-size: 1.2rem;
  margin-left: 0.2rem;
}

.temp-label {
  margin-top: 0.5rem;
  color: #666;
}

.control-panel {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2rem;
}

.power-control {
  display: flex;
  justify-content: center;
  margin-bottom: 1rem;
}

.power-button {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 1rem 2rem;
  border: none;
  border-radius: 50px;
  background-color: #f5f5f5;
  cursor: pointer;
  transition: all 0.3s;
}

.power-button.on {
  background-color: #1976d2;
  color: white;
}

.power-icon {
  font-size: 1.5rem;
  margin-bottom: 0.5rem;
}

.temperature-control, .mode-control, .fan-control {
  margin-top: 1rem;
}

.temp-buttons {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 0.5rem;
}

.temp-button {
  width: 40px;
  height: 40px;
  border: none;
  border-radius: 50%;
  background-color: #1976d2;
  color: white;
  font-size: 1.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
}

.temp-display {
  margin: 0 1.5rem;
  font-size: 1.5rem;
  font-weight: bold;
  min-width: 80px;
  text-align: center;
}

.mode-buttons, .fan-buttons {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-top: 0.5rem;
}

.mode-button, .fan-button {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  background-color: #f5f5f5;
  cursor: pointer;
}

.mode-button.active, .fan-button.active {
  background-color: #1976d2;
  color: white;
  border-color: #1976d2;
}

.loading-state,
.error-state,
.empty-state {
  text-align: center;
  padding: 3rem 0;
}

button {
  background-color: #1976d2;
  color: white;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 1rem;
}

button:hover {
  background-color: #1565c0;
}

@media (min-width: 768px) {
  .control-panel {
    grid-template-columns: 1fr 1fr;
  }
}
</style>
