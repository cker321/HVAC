<template>
  <div class="settings-view">
    <div class="header">
      <button class="back-button" @click="goBack">
        <span>&larr;</span> 返回
      </button>
      <h1>设置</h1>
    </div>
    
    <div class="content">
      <div class="settings-card">
        <h2>连接设置</h2>
        
        <div class="form-group">
          <label for="deviceIp">设备IP地址</label>
          <input 
            type="text" 
            id="deviceIp" 
            v-model="settings.deviceIp"
            placeholder="例如: 192.168.2.42"
          >
        </div>
        
        <div class="form-group">
          <label for="devicePort">设备端口</label>
          <input 
            type="number" 
            id="devicePort" 
            v-model="settings.devicePort"
            placeholder="例如: 8888"
          >
        </div>
        
        <div class="form-group">
          <label for="mqttHost">MQTT服务器地址</label>
          <input 
            type="text" 
            id="mqttHost" 
            v-model="settings.mqttHost"
            placeholder="例如: 47.103.96.246"
          >
        </div>
        
        <div class="form-group">
          <label for="mqttPort">MQTT服务器端口</label>
          <input 
            type="number" 
            id="mqttPort" 
            v-model="settings.mqttPort"
            placeholder="例如: 9883"
          >
        </div>
        
        <div class="form-actions">
          <button @click="saveSettings" class="save-button">保存设置</button>
          <button @click="resetSettings" class="reset-button">重置</button>
        </div>
      </div>
      
      <div class="settings-card">
        <h2>应用设置</h2>
        
        <div class="form-group">
          <label for="refreshInterval">刷新间隔 (秒)</label>
          <input 
            type="number" 
            id="refreshInterval" 
            v-model="settings.refreshInterval"
            min="5"
            max="300"
          >
        </div>
        
        <div class="form-group checkbox-group">
          <input 
            type="checkbox" 
            id="autoRefresh" 
            v-model="settings.autoRefresh"
          >
          <label for="autoRefresh">自动刷新设备状态</label>
        </div>
        
        <div class="form-actions">
          <button @click="saveSettings" class="save-button">保存设置</button>
          <button @click="resetSettings" class="reset-button">重置</button>
        </div>
      </div>
      
      <div class="settings-card">
        <h2>关于</h2>
        <div class="about-info">
          <p><strong>HVAC 远程控制系统</strong></p>
          <p>版本: 1.0.0</p>
          <p>基于 Node.js 和 Vue.js 构建的远程控制系统，用于控制HVAC设备。</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SettingsView',
  data() {
    return {
      settings: {
        deviceIp: localStorage.getItem('deviceIp') || '192.168.2.42',
        devicePort: localStorage.getItem('devicePort') || '8888',
        mqttHost: localStorage.getItem('mqttHost') || '47.103.96.246',
        mqttPort: localStorage.getItem('mqttPort') || '9883',
        refreshInterval: localStorage.getItem('refreshInterval') || '30',
        autoRefresh: localStorage.getItem('autoRefresh') === 'true'
      },
      defaultSettings: {
        deviceIp: '192.168.2.42',
        devicePort: '8888',
        mqttHost: '47.103.96.246',
        mqttPort: '9883',
        refreshInterval: '30',
        autoRefresh: true
      }
    }
  },
  methods: {
    goBack() {
      this.$router.push('/')
    },
    
    saveSettings() {
      // 保存设置到本地存储
      Object.keys(this.settings).forEach(key => {
        localStorage.setItem(key, this.settings[key])
      })
      
      // 显示保存成功提示
      alert('设置已保存')
      
      // 刷新页面以应用新设置
      // 在实际应用中，可能需要更复杂的逻辑来应用设置而不刷新页面
      setTimeout(() => {
        window.location.reload()
      }, 500)
    },
    
    resetSettings() {
      // 重置为默认设置
      this.settings = { ...this.defaultSettings }
    }
  }
}
</script>

<style scoped>
.settings-view {
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
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.settings-card {
  background-color: #fff;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}

.form-group input[type="text"],
.form-group input[type="number"] {
  width: 100%;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

.checkbox-group {
  display: flex;
  align-items: center;
}

.checkbox-group input {
  margin-right: 0.5rem;
}

.checkbox-group label {
  margin-bottom: 0;
}

.form-actions {
  display: flex;
  gap: 1rem;
  margin-top: 1.5rem;
}

.save-button {
  background-color: #1976d2;
  color: white;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  cursor: pointer;
}

.reset-button {
  background-color: #f5f5f5;
  color: #333;
  border: 1px solid #ddd;
  padding: 0.5rem 1rem;
  border-radius: 4px;
  cursor: pointer;
}

.about-info {
  line-height: 1.6;
}

@media (min-width: 768px) {
  .content {
    max-width: 600px;
    margin: 0 auto;
  }
}
</style>
