# 家庭空调与新风控制安卓APP控制与通信机制文档

## 1. 系统架构概述

该安卓应用是一个家庭空调和新风控制系统，采用多层架构设计，包含用户界面、业务逻辑和多种通信机制。应用主要通过三种通信方式与外部设备和服务器进行交互：

1. **MQTT通信**：用于远程控制和状态上报
2. **HTTP通信**：用于获取配置信息和更新
3. **硬件串口通信**：用于直接控制本地设备

### 1.1 系统架构图

```
+----------------------------------+
|        安卓APP (com.dnake.desktop)   |
+----------------------------------+
|                                  |
|  +----------------------------+  |
|  |       MainActivity         |  |
|  | (主界面，包含4个Fragment)  |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  |       CoreService          |  |         +-------------------+
|  | (核心服务，AndServer HTTP) |<-------->| 浏览器访问       |
|  +----------------------------+  |  HTTP   | (端口8888)       |
|                                  |         +-------------------+
|  +----------------------------+  |
|  |      通信模块            |  |
|  |                            |  |         +-------------------+
|  |  +----------------------+  |  |         |                   |
|  |  |    MQTT客户端      |<------------>| MQTT服务器        |
|  |  | (MqttClient类)      |  |  MQTT    | (tcp://47.103.96.246:9883) |
|  |  +----------------------+  |  |         +-------------------+
|  |                            |  |
|  |  +----------------------+  |  |         +-------------------+
|  |  |    HTTP客户端      |<------------>| 云平台API服务器  |
|  |  | (ApiFactory类)      |  |  HTTP    |                   |
|  |  +----------------------+  |  |         +-------------------+
|  |                            |  |
|  |  +----------------------+  |  |         +-------------------+
|  |  |    串口通信模块    |<------------>| 本地硬件设备    |
|  |  | (HardwareExecutor类) |  |  串口    | (空调、新风等)   |
|  |  +----------------------+  |  |         +-------------------+
|  |                            |  |
|  +----------------------------+  |
|                                  |
|  +----------------------------+  |
|  |      设备控制模型        |  |
|  | (空调、新风、传感器等)   |  |
|  +----------------------------+  |
|                                  |
+----------------------------------+
```

上图展示了应用的核心架构和通信流程。应用通过MainActivity提供用户界面，通过CoreService提供HTTP服务，并通过三个不同的通信模块与外部系统交互。

## 2. 通信机制详解

### 2.1 MQTT通信机制

MQTT通信是应用与云平台进行实时数据交换的主要方式，用于设备状态上报和远程控制指令下发。

#### 2.1.1 核心组件

- **MqttClient**：MQTT客户端实现，负责连接管理、消息发布和订阅
- **MqttMessageCallback**：消息回调处理器，处理接收到的MQTT消息
- **MqttExecutor**：MQTT执行器，封装了各种消息发送方法
- **MqttConst**：定义MQTT相关常量，如服务器地址、主题等

#### 2.1.2 通信流程

1. **连接建立**：
   ```java
   MqttExecutor.getInstance().connect("88888888");  // 设备ID作为客户端标识
   ```

2. **消息订阅**：
   ```java
   // 订阅主题格式：/screen/service/cloud/to/screen/{设备ID}
   this.mqtAsyncClient.subscribe(MqttConst.COMMON_RESPONSE_TOPIC + str, 0, ...);
   ```

3. **消息发布**：
   ```java
   // 发布主题格式：/screen/service/screen/to/cloud/{设备ID}
   this.mqtAsyncClient.publish(MqttConst.COMMON_REQUEST_TOPIC + str, mqttMessage, ...);
   ```

4. **设备状态上报**：
   ```java
   MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
   ```

#### 2.1.3 MQTT服务器配置

- 服务器地址：`tcp://47.103.96.246:9883`
- 用户名：`admin`
- 密码：`public`
- 主题前缀：
  - 请求主题：`/screen/service/screen/to/cloud/`
  - 响应主题：`/screen/service/cloud/to/screen/`
  - 上传主题：`/screen/upload/screen/to/cloud/`

### 2.2 HTTP通信机制

HTTP通信主要用于获取配置信息、天气数据、场景列表等非实时数据。

#### 2.2.1 核心组件

- **ApiFactory**：HTTP客户端工厂，创建和管理Retrofit实例
- **NetApi**：定义HTTP API接口
- **NetResponse**：HTTP响应数据结构
- **NetRequest**：HTTP请求数据结构

#### 2.2.2 API接口

应用通过Retrofit实现RESTful API调用，主要接口包括：

- 获取天气信息：`getWeather()`
- 获取楼层设备列表：`getFloorDeviceList()`
- 获取场景列表：`getSceneList()`
- 获取定时场景列表：`getTimingSceneList()`
- 更新定时场景：`updateTimingSceneList()`
- 检查应用更新：`apkUpdate()`

#### 2.2.3 服务器配置

- 正式环境：`https://gateway.landleaf-tech.com/homeauto-contact-screen/contact-screen/screen/`
- 测试环境：`http://gateway.landleaf-iot.com:80/gateway/homeauto-contact-screen/contact-screen/screen/`

### 2.3 硬件串口通信机制

硬件串口通信用于直接控制本地设备，如空调、新风系统等。

#### 2.3.1 核心组件

- **HardwareExecutor**：硬件执行器，封装了设备读写操作
- **ProtocolUtils**：协议工具类，处理通信协议转换
- **HardwareProtocolConst**：定义硬件通信协议常量

#### 2.3.2 通信流程

1. **设备状态读取**：
   ```java
   HardwareExecutor.getInstance(context).deviceReadAsyn(deviceModel);
   ```

2. **设备控制命令发送**：
   ```java
   HardwareExecutor.getInstance(context).deviceWriteAsyn(deviceModel, attributeTag, attributeValue);
   ```

## 3. 设备控制模型

### 3.1 设备属性定义

应用定义了丰富的设备属性标签，用于控制和监测设备状态：

- **环境参数**：
  - 温度(TEMP)：`temperature`
  - 湿度(HUMIDITY)：`humidity`
  - PM2.5(PM25)：`pm25`
  - CO2：`co2`
  - VOC：`voc`
  - 甲醛(HCHO)：`formaldehyde`

- **控制参数**：
  - 开关(SWITCH)：`switch`
  - 模式(SYS_MODE)：`mode`
  - 风速(WIND_SPEED)：`wind_speed`
  - 设定温度(TEMP_SETTING)：`setting_temperature`
  - 除湿(DEHUMI)：`dehumidification`
  - 加湿使能(HUMI_ENABLE)：`humidification_enable`

- **状态参数**：
  - 故障警告(FAULT_ALERT)：`fault_warning`
  - 通信故障(COMMUNICATION_FAULT)：`communication_fault_1`/`communication_fault_2`
  - 安全状态(SAFE_STATE)：`arming_state`

### 3.2 设备类型

应用支持多种设备类型，主要包括：

- **空调控制模型**：`AirControlModel`
- **新风控制模型**：`WindControlModel`
- **传感器模型**：`SensorModel`
- **多联机模型**：`DJVRVModel`

## 4. 应用架构与工作流程

### 4.1 应用启动流程

1. 应用启动时，`MainActivity`初始化界面并设置沉浸式状态栏
2. 连接MQTT服务器，订阅相关主题
3. 通过HTTP API获取天气信息和楼层设备列表
4. 初始化设备控制模型

### 4.2 设备控制流程

#### 空调控制流程

1. 用户在界面上调整空调参数（如温度、模式、风速等）
2. 应用将控制命令通过MQTT发送到云平台：
   ```java
   MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
   ```
3. 云平台将命令转发到对应设备
4. 设备执行命令并上报执行结果
5. 应用接收执行结果并更新界面

#### 本地设备直接控制流程

1. 用户在界面上调整设备参数
2. 应用通过串口通信直接发送控制命令：
   ```java
   HardwareExecutor.getInstance(context).deviceWriteAsyn(deviceModel, "switch", "on");
   ```
3. 设备执行命令并返回结果
4. 应用接收结果并更新界面

### 4.3 数据上报流程

1. 设备状态变化（如温度、湿度变化）
2. 设备通过串口上报状态数据
3. 应用处理数据并更新本地模型
4. 应用通过MQTT上报数据到云平台：
   ```java
   MqttExecutor.getInstance().publishUploadMessage(deviceId, jsonData);
   ```

## 5. 安全机制

应用实现了基本的安全机制：

1. **MQTT认证**：使用用户名和密码进行MQTT服务器认证
2. **HTTPS通信**：正式环境使用HTTPS加密通信
3. **设备ID绑定**：通信过程中绑定设备ID，确保控制命令的正确路由

## 6. 通信协议示例

### 6.1 MQTT消息格式

#### 设备控制请求
```json
{
  "method": "DeviceWrite",
  "params": {
    "deviceSn": "5",
    "productCode": "sensor",
    "attributes": [
      {
        "attrTag": "temperature",
        "attrValue": "25"
      },
      {
        "attrTag": "switch",
        "attrValue": "on"
      }
    ]
  }
}
```

#### 设备状态上报
```json
{
  "method": "DeviceStatusUpdate",
  "params": {
    "deviceSn": "5",
    "productCode": "sensor",
    "attributes": [
      {
        "attrTag": "temperature",
        "attrValue": "26.5"
      },
      {
        "attrTag": "humidity",
        "attrValue": "45"
      },
      {
        "attrTag": "pm25",
        "attrValue": "30"
      },
      {
        "attrTag": "co2",
        "attrValue": "200"
      },
      {
        "attrTag": "voc",
        "attrValue": "0.2"
      }
    ]
  }
}
```

### 6.2 HTTP API响应格式

```json
{
  "code": 200,
  "message": "success",
  "data": {
    // 具体数据内容
  }
}
```

## 7. 应用资源结构

通过分析反编译后的resources目录，可以进一步了解应用的资源结构和配置信息。

### 7.1 AndroidManifest.xml配置

应用的AndroidManifest.xml文件提供了重要的配置信息：

- **包名**：`com.dnake.desktop`
- **最低SDK版本**：19 (Android 4.4 KitKat)
- **目标SDK版本**：29 (Android 10)
- **主Activity**：`com.dnake.desktop.MainActivity`
- **核心服务**：`com.dnake.desktop.CoreService`
- **开机自启动**：通过`BootBroadcastReceiver`实现
- **权限申请**：
  - 网络访问权限（INTERNET）
  - 存储读写权限
  - 网络状态访问权限
  - 设备状态读取权限
  - 系统设置修改权限

### 7.2 Web界面资源

应用内置了一个完整的Web界面，位于`assets/web`目录下：

- **前端框架**：使用layui框架构建UI
- **主页面**：`index.html`
- **JavaScript**：包含多个JS文件，负责前端逻辑
- **CSS样式**：定义界面样式

这个Web界面通过内置的AndServer（在8888端口）提供服务，可以通过浏览器访问，实现远程监控和控制功能。

### 7.3 AndServer配置

应用使用AndServer框架提供HTTP服务，配置文件位于`assets/com.dnake.desktop.generator.andserver`，该服务负责：

- 提供Web界面访问
- 提供HTTP API接口
- 实现本地网络控制功能

## 8. 总结

该家庭空调与新风控制安卓APP通过MQTT、HTTP和串口通信三种机制实现了对设备的全面控制和状态监测。MQTT提供了实时控制和状态上报能力，HTTP提供了配置和非实时数据获取能力，串口通信提供了本地设备直接控制能力。

此外，应用还内置了一个完整的Web界面和HTTP服务器，提供了基于浏览器的访问方式，增强了系统的可访问性和灵活性。这些通信机制和界面相互补充，共同构成了一个完整的智能家居控制系统。
