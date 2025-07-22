package com.landleaf.smarthome.net.mqtt;

/* loaded from: classes.dex */
public interface MqttConst {
    public static final int COMMON_QOS = 0;
    public static final String COMMON_REQUEST_TOPIC = "/screen/service/screen/to/cloud/";
    public static final String COMMON_RESPONSE_TOPIC = "/screen/service/cloud/to/screen/";
    public static final String CONFIG_APK_UPDATE = "ApkUpdate";
    public static final String CONFIG_FLOOR_ROOM_DEVICE = "FloorRoomDevice";
    public static final String CONFIG_NEWS = "News";
    public static final String CONFIG_SCENE = "Scene";
    public static final String CONFIG_TIMING_SCENE = "SceneTiming";
    public static final String DEVICE_UPLOAD_REQUEST_TOPIC = "/screen/upload/screen/to/cloud/";
    public static final String METHOD_CONFIG_UPDATE = "FamilyConfigUpdate";
    public static final String METHOD_DEVICE_READ = "DeviceStatusRead";
    public static final String METHOD_DEVICE_UPDATE = "DeviceStatusUpdate";
    public static final String METHOD_DEVICE_WRITE = "DeviceWrite";
    public static final String METHOD_SCENE_SET = "FamilySceneSet";
    public static final String METHOD_SCENE_UPDATE = "ScreenSceneSetUpload";
    public static final String METHOD_SECURITY_ALARM = "FamilySecurityAlarmEvent";
    public static final String MQTT_URL = "tcp://47.103.96.246:9883";
    public static final String NAME = "admin";
    public static final String PWD = "public";
    public static final int SECURITY_ALARM_LOG_REPORTING = 2;
    public static final int SECURITY_ALARM_REAL_TIME = 1;
}
