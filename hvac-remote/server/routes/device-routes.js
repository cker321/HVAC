/**
 * 设备路由
 * 
 * 定义与设备相关的API路由
 */

const express = require('express');
const deviceController = require('../controllers/device-controller');

const router = express.Router();

// 获取设备信息
router.get('/info', deviceController.getDeviceInfo);

// 获取所有设备状态
router.get('/status', deviceController.getAllDeviceStatus);

module.exports = router;
