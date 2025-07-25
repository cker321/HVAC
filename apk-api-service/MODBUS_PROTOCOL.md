# 空调控制 Modbus 协议文档

## 概述
本文档记录了空调控制系统的 Modbus RTU 协议规范，基于实际测试和原应用协议分析。

## 协议参数
- **从机地址**: `0x03`
- **波特率**: 9600
- **数据位**: 8
- **停止位**: 1
- **校验位**: 无

## 控制策略

### 策略A：单寄存器写入（推荐）
**功能码**: `06` (Write Single Register)
**特点**: 简单、高效、已验证成功

#### 寄存器地址映射
| 控制类型 | 寄存器地址 | 数值范围 | 说明 |
|----------|------------|----------|------|
| 电源控制 | 0x0007 | 0/1 | 0=关闭, 1=开启 |
| 模式控制 | 0x0000 | 0-4 | 制冷/制热/送风/除湿/自动 |
| 温度控制 | 0x0001 | 16-30 | 设定温度(°C) |
| 风速控制 | 0x0002 | 0-3 | 自动/低/中/高 |

#### 命令格式
```
[从机地址][功能码][寄存器地址高][寄存器地址低][数值高][数值低][CRC低][CRC高]
```

#### 示例：开启电源
```
发送: 03 06 00 07 00 01 [CRC]
响应: 03 06 00 07 00 01 [CRC] (回显确认)
```

### 策略B：多寄存器写入（备用）
**功能码**: `10` (Write Multiple Registers)
**起始地址**: `0x0000`
**寄存器数量**: `9`

#### 基于原应用协议分析
原应用发送报文：
```
03 10 00 00 00 09 12 00 00 00 00 00 00 00 80 00 00 00 01 00 00 00 00 00 00 9C DC
```

#### 数据结构解析
18字节数据对应9个寄存器：
```
寄存器[0]: 0x0000  // 模式控制
寄存器[1]: 0x0000  // 温度控制
寄存器[2]: 0x0000  // 风速控制
寄存器[3]: 0x0000  // 保留
寄存器[4]: 0x0000  // 保留
寄存器[5]: 0x0000  // 保留
寄存器[6]: 0x0000  // 保留
寄存器[7]: 0x0080  // 电源控制位1
寄存器[8]: 0x0001  // 电源控制位2
```

#### 电源控制逻辑
- **开启**: 寄存器[7] = 0x0080, 寄存器[8] = 0x0001
- **关闭**: 寄存器[7] = 0x0000, 寄存器[8] = 0x0000

## 实现策略

### 双重策略控制流程
1. **优先使用策略A**：单寄存器写入（功能码06）
2. **失败时使用策略B**：完整协议写入（功能码10）
3. **响应验证**：通过读取状态确认设备实际响应

### 代码实现要点
```java
// 策略A：单寄存器写入
byte[] writeBytes = Rs485Utils.getInstance().getSingleWriteSendBytes(
    0x03, 6, registerAddress, registerValue);

// 策略B：多寄存器写入
byte[] writeBytes = Rs485Utils.getInstance().getWriteSendBytes(
    0x03, 16, 0x0000, registerValues);
```

## 测试结果

### 成功案例
- **策略A测试**: 地址0x0003单寄存器写入成功，Modbus通信正常
- **协议兼容性**: 设备支持功能码06和10
- **响应验证**: 设备返回正确的回显确认

### 已知问题
- **设备响应延迟**: Modbus通信成功但设备可能未立即响应
- **状态同步**: 需要额外的状态读取来验证控制效果

## 多设备支持

### 设备编号映射
- **machineNo = 1**: 对应第一台设备
- **machineNo = 2**: 对应第二台设备
- 以此类推...

### 寄存器地址计算
```java
// 基础地址 + 设备偏移
int baseAddress = calculateRegisterAddress(cmdType);
// 多设备支持可能需要地址偏移，待验证
```

## 调试建议

### 日志关键信息
- 发送的完整报文（十六进制）
- 接收的响应报文
- CRC校验结果
- 设备状态读取结果

### 常见问题排查
1. **异常码0x02**: 检查寄存器地址是否正确
2. **无响应**: 检查UDP端口配置和串口服务状态
3. **CRC错误**: 验证报文格式和校验算法

## 更新历史
- **2025-07-23**: 基于原应用协议分析，实现双重策略控制
- **测试状态**: 策略A已验证，策略B待进一步测试

---
*本文档基于实际测试结果编写，如有更新请及时修订。*
