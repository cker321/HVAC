/**
 * 新风路由
 * 
 * 定义与新风相关的API路由
 */

const express = require('express');
const windController = require('../controllers/wind-controller');

const router = express.Router();

// 获取新风状态 - 支持查询参数
router.get('/status', windController.getWindStatus);

// 控制新风 - 支持请求体中传递deviceId
router.post('/control', windController.controlWind);

module.exports = router;
