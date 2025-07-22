<template>
  <div class="wind-control-view">
    <div class="header">
      <button class="back-button" @click="goBack">
        <span>&larr;</span> 返回
      </button>
      <h1>新风控制</h1>
    </div>
    
    <div class="content" v-if="windStatus">
      <div class="status-card">
        <div class="room-info">
          <h2>{{ deviceInfo ? `${deviceInfo.floor}楼 ${deviceInfo.unit}单元 ${deviceInfo.roomId}房间` : '房间' }}</h2>
          <div class="environment-display">
            <div class="env-item">
              <span class="env-value">{{ windStatus.showTemp || '--' }}</span>
              <span class="env-unit">°C</span>
              <div class="env-label">室内温度</div>
            </div>
            <div class="env-item">
              <span class="env-value">{{ windStatus.showHumidity || '--' }}</span>
              <span class="env-unit">%</span>
              <div class="env-label">室内湿度</div>
            </div>
          </div>
        </div>
        
        <div class="control-panel">
          <div class="power-control">
            <button 
              class="power-button" 
              :class="{ 'on': windStatus.power === 1 }"
              @click="togglePower"
            >
              <span class="power-icon">⏻</span>
              <span>{{ windStatus.power === 1 ? '开启' : '关闭' }}</span>
            </button>
          </div>
          
          <div class="mode-control">
            <h3>模式</h3>
            <div class="mode-buttons">
              <button 
                v-for="(mode, index) in modes" 
                :key="index"
                class="mode-button"
                :class="{ 'active': windStatus.mode === mode.value }"
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
                :class="{ 'active': windStatus.windSpeed === speed.value }"
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
      <p>加载新风状态中...</p>
    </div>
    
    <div class="error-state" v-else-if="hasError">
      <p>加载新风状态失败: {{ errorMessage }}</p>
      <button @click="refreshStatus">重试</button>
    </div>
    
    <div class="empty-state" v-else>
      <p>未找到新风状态信息</p>
      <button @click="refreshStatus">刷新</button>
    </div>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions } from 'vuex'

export default {
  name: 'WindControlView',
  data() {
    return {
      modes: [
        { label: '送风', value: 0 },
        { label: '制冷', value: 1 },
        { label: '除湿', value: 2 },
        { label: '制热', value: 3 },
        { label: '自动', value: 4 }
      ],
      fanSpeeds: [
        { label: '高速', value: 0 },
        { label: '中速', value: 1 },
        { label: '低速', value: 2 }
      ]
    }
  },
  computed: {
    ...mapState({
      deviceInfo: state => state.device.deviceInfo
    }),
    ...mapGetters([
      'isLoading',
      'hasError',
      'errorMessage'
    ]),
    ...mapGetters('wind', {
      getWindStatus: 'getWindStatus'
    }),
    deviceId() {
      return this.deviceInfo?.deviceId
    },
    windStatus() {
      return this.getWindStatus(this.deviceId)
    }
  },
  methods: {
    ...mapActions('wind', ['fetchWindStatus', 'controlWind']),
    
    goBack() {
      this.$router.push('/')
    },
    
    refreshStatus() {
      if (this.deviceId) {
        this.fetchWindStatus(this.deviceId)
      }
    },
    
    togglePower() {
      this.controlWind({
        deviceId: this.deviceId,
        command: {
          power: this.windStatus.power === 1 ? 0 : 1
        }
      })
    },
    
    setMode(mode) {
      this.controlWind({
        deviceId: this.deviceId,
        command: {
          mode: mode
        }
      })
    },
    
    setFanSpeed(speed) {
      this.controlWind({
        deviceId: this.deviceId,
        command: {
          speed: speed
        }
      })
    }
  },
  mounted() {
    // 设置当前设备ID
    if (this.deviceInfo && this.deviceInfo.deviceId) {
      this.fetchWindStatus(this.deviceInfo.deviceId)
    }
    
    // 每30秒刷新一次状态
    this.refreshInterval = setInterval(() => {
      this.refreshStatus()
    }, 30000)
  },
  beforeUnmount() {
    // 清除定时器
    if (this.refreshInterval) {
      clearInterval(this.refreshInterval)
    }
  }
}
</script>

<style scoped>
.wind-control-view {
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

.environment-display {
  display: flex;
  justify-content: space-around;
  margin-top: 1.5rem;
}

.env-item {
  text-align: center;
}

.env-value {
  font-size: 2.5rem;
  font-weight: bold;
}

.env-unit {
  font-size: 1.2rem;
  margin-left: 0.2rem;
}

.env-label {
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

.mode-control, .fan-control {
  margin-top: 1rem;
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
