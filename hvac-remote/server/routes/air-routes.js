/**
 * 空调路由
 * 
 * 定义与空调相关的API路由
 */

const express = require('express');
const airController = require('../controllers/air-controller');

const router = express.Router();

// 获取空调状态 - 支持查询参数
router.get('/status', airController.getAirStatus);

// 控制空调 - 支持请求体中传递deviceId
router.post('/control', airController.controlAir);

module.exports = router;
