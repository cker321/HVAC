<template>
  <div class="home-view">
    <h1>HVAC 远程控制系统</h1>
    
    <div class="status-overview" v-if="deviceInfo">
      <div class="status-card">
        <h2>设备信息</h2>
        <div class="info-row">
          <span class="label">设备ID:</span>
          <span class="value">{{ deviceInfo.deviceID }}</span>
        </div>
        <div class="info-row">
          <span class="label">IP地址:</span>
          <span class="value">{{ deviceInfo.ipAddress }}</span>
        </div>
        <div class="info-row">
          <span class="label">位置:</span>
          <span class="value">{{ deviceInfo.floorId }}楼 {{ deviceInfo.unit }}单元 {{ deviceInfo.roomId }}房间</span>
        </div>
      </div>
      
      <div class="control-cards">
        <div class="control-card" @click="goToAirControl">
          <div class="card-icon">🌡️</div>
          <h3>空调控制</h3>
          <p>控制房间温度、模式和风速</p>
        </div>
        
        <div class="control-card" @click="goToWindControl">
          <div class="card-icon">💨</div>
          <h3>新风控制</h3>
          <p>控制新风系统的模式和风速</p>
        </div>
      </div>
    </div>
    
    <div class="loading-state" v-else-if="isLoading">
      <p>加载设备信息中...</p>
    </div>
    
    <div class="error-state" v-else-if="hasError">
      <p>加载设备信息失败: {{ errorMessage }}</p>
      <button @click="refreshDeviceInfo">重试</button>
    </div>
    
    <div class="empty-state" v-else>
      <p>未找到设备信息</p>
      <button @click="refreshDeviceInfo">刷新</button>
    </div>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions } from 'vuex'

export default {
  name: 'HomeView',
  computed: {
    ...mapState({
      deviceInfo: state => state.device.deviceInfo
    }),
    ...mapGetters([
      'isLoading',
      'hasError',
      'errorMessage'
    ])
  },
  methods: {
    ...mapActions('device', ['fetchDeviceInfo']),
    
    refreshDeviceInfo() {
      this.fetchDeviceInfo()
    },
    
    goToAirControl() {
      this.$router.push('/air-control')
    },
    
    goToWindControl() {
      this.$router.push('/wind-control')
    }
  },
  mounted() {
    this.fetchDeviceInfo()
  }
}
</script>

<style scoped>
.home-view {
  padding: 1rem;
}

.status-overview {
  margin-top: 2rem;
}

.status-card {
  background-color: #fff;
  border-radius: 8px;
  padding: 1.5rem;
  margin-bottom: 2rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.info-row {
  display: flex;
  margin-bottom: 0.5rem;
}

.label {
  font-weight: bold;
  width: 80px;
}

.control-cards {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 1.5rem;
}

.control-card {
  background-color: #fff;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: transform 0.2s, box-shadow 0.2s;
}

.control-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.card-icon {
  font-size: 2.5rem;
  margin-bottom: 1rem;
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
</style>
