/**
 * HVAC Remote Control - Server
 * 
 * 主服务器文件，负责启动Express服务器，连接MQTT，
 * 并提供API端点用于远程控制HVAC设备。
 */

const express = require('express');
const cors = require('cors');
const path = require('path');
const dotenv = require('dotenv');
const mqttClient = require('./utils/mqtt-client');
const deviceRoutes = require('./routes/device-routes');
const airRoutes = require('./routes/air-routes');
const windRoutes = require('./routes/wind-routes');
const rs485Routes = require('./routes/rs485-routes');

// 加载环境变量
dotenv.config();

// 初始化Express应用
const app = express();
const PORT = process.env.PORT || 3000;

// 中间件
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// 静态文件服务 - 用于前端部署
app.use(express.static(path.join(__dirname, '../client/dist')));

// API路由
app.use('/api/device', deviceRoutes);
app.use('/api/air', airRoutes);
app.use('/api/wind', windRoutes);
app.use('/api/rs485', rs485Routes);

// 直接转发设备信息接口
app.get('/user/register/info', async (req, res) => {
  try {
    const httpClient = require('./utils/http-client');
    const result = await httpClient.getDeviceInfo();
    res.json(result);
  } catch (error) {
    console.error('获取设备信息失败:', error);
    res.status(500).json({
      errorCode: 500,
      isSuccess: false,
      data: null
    });
  }
});

// 温湿度信息接口
app.get('/api/temperature-humidity', async (req, res) => {
  try {
    const httpClient = require('./utils/http-client');
    const result = await httpClient.getTemperatureAndHumidity();
    res.json(result);
  } catch (error) {
    console.error('获取温湿度信息失败:', error);
    res.status(500).json({
      code: 500,
      message: '获取温湿度信息失败',
      data: null
    });
  }
});

// 前端路由处理 - SPA支持
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, '../client/dist/index.html'));
});

// 启动服务器
app.listen(PORT, () => {
  console.log(`服务器运行在端口 ${PORT}`);
  
  // 连接MQTT
//   mqttClient.connect();
});

// 处理未捕获的异常
process.on('uncaughtException', (error) => {
  console.error('未捕获的异常:', error);
});

// 处理未处理的Promise拒绝
process.on('unhandledRejection', (reason, promise) => {
  console.error('未处理的Promise拒绝:', reason);
});
