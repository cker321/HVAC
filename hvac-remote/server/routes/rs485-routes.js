/**
 * RS485路由
 * 
 * 定义与RS485通信相关的API路由
 */

const express = require('express');
const httpClient = require('../utils/http-client');

const router = express.Router();

// 发送RS485读取命令
router.post('/read', async (req, res) => {
  try {
    const { address, functionCode, startAddress, quantity } = req.body;
    
    if (!address || !functionCode || startAddress === undefined || !quantity) {
      return res.status(400).json({
        code: 400,
        message: '参数错误',
        data: null
      });
    }
    
    const result = await httpClient.sendRs485ReadCommand(address, functionCode, startAddress, quantity);
    res.json(result);
  } catch (error) {
    console.error('RS485读取命令失败:', error);
    res.status(500).json({
      code: 500,
      message: '服务器错误',
      data: null
    });
  }
});

// 发送RS485写入命令
router.post('/write', async (req, res) => {
  try {
    const { address, functionCode, startAddress, data } = req.body;
    
    if (!address || !functionCode || startAddress === undefined || data === undefined) {
      return res.status(400).json({
        code: 400,
        message: '参数错误',
        data: null
      });
    }
    
    const result = await httpClient.sendRs485WriteCommand(address, functionCode, startAddress, data);
    res.json(result);
  } catch (error) {
    console.error('RS485写入命令失败:', error);
    res.status(500).json({
      code: 500,
      message: '服务器错误',
      data: null
    });
  }
});

// 获取温湿度信息
router.get('/temperature-humidity', async (req, res) => {
  try {
    const result = await httpClient.getTemperatureAndHumidity();
    res.json(result);
  } catch (error) {
    console.error('获取温湿度信息失败:', error);
    res.status(500).json({
      code: 500,
      message: '服务器错误',
      data: null
    });
  }
});

module.exports = router;
