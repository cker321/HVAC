<template>
  <div class="app-container">
    <header class="app-header">
      <h1>HVAC 远程控制系统</h1>
      <div class="device-info" v-if="deviceInfo">
        <span>设备ID: {{ deviceInfo.deviceId }}</span>
        <span>IP: {{ deviceInfo.ip }}</span>
        <span>房间: {{ deviceInfo.floor }}-{{ deviceInfo.unit }}-{{ deviceInfo.roomId }}</span>
      </div>
    </header>
    
    <main class="app-content">
      <router-view />
    </main>
    
    <footer class="app-footer">
      <p>&copy; 2025 HVAC 远程控制系统</p>
    </footer>
  </div>
</template>

<script>
import { mapActions, mapState } from 'vuex'

export default {
  name: 'App',
  computed: {
    ...mapState({
      deviceInfo: state => state.device.deviceInfo
    })
  },
  methods: {
    ...mapActions('device', ['fetchDeviceInfo'])
  },
  mounted() {
    // 获取设备信息
    this.fetchDeviceInfo();
    
    // 每30秒刷新一次设备状态
    setInterval(() => {
      this.fetchDeviceInfo();
    }, 30000);
  }
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Helvetica Neue', Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  background-color: #f5f7fa;
}

.app-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

.app-header {
  background-color: #1976d2;
  color: white;
  padding: 1rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.app-header h1 {
  margin: 0;
  font-size: 1.5rem;
}

.device-info {
  margin-top: 0.5rem;
  font-size: 0.9rem;
}

.device-info span {
  margin-right: 1rem;
}

.app-content {
  flex: 1;
  padding: 1rem;
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

.app-footer {
  background-color: #f5f5f5;
  padding: 1rem;
  text-align: center;
  font-size: 0.9rem;
  color: #666;
}
</style>
