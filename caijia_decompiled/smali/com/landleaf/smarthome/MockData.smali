.class public Lcom/landleaf/smarthome/MockData;
.super Ljava/lang/Object;
.source "MockData.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDeviceModel()Lcom/landleaf/smarthome/model/DeviceModel;
    .locals 7

    .line 47
    new-instance v0, Lcom/landleaf/smarthome/model/DeviceModel;

    invoke-direct {v0}, Lcom/landleaf/smarthome/model/DeviceModel;-><init>()V

    const-string v1, "1"

    .line 48
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setDeviceSn(Ljava/lang/String;)V

    const/16 v1, 0x1f41

    .line 49
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setProductCode(I)V

    .line 50
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 51
    new-instance v2, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v3, "switch"

    const-string v4, "off"

    invoke-direct {v2, v3, v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    new-instance v3, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v4, "mode"

    const-string v5, "hot"

    invoke-direct {v3, v4, v5}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    new-instance v4, Lcom/landleaf/smarthome/model/DeviceAttribute;

    const-string v5, "wind_speed"

    const-string v6, "first_gear"

    invoke-direct {v4, v5, v6}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    invoke-virtual {v0, v1}, Lcom/landleaf/smarthome/model/DeviceModel;->setAttrs(Ljava/util/List;)V

    return-object v0
.end method

.method public static getSecurityList()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/SecurityModel;",
            ">;"
        }
    .end annotation

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    new-instance v1, Lcom/landleaf/smarthome/model/SecurityModel;

    invoke-direct {v1}, Lcom/landleaf/smarthome/model/SecurityModel;-><init>()V

    const/4 v2, 0x1

    .line 23
    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/model/SecurityModel;->setAlarmId(I)V

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Lcom/landleaf/smarthome/model/SecurityModel;->setAlarmTime(J)V

    .line 25
    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/model/SecurityModel;->setAlarmZone(I)V

    const-string v2, "\u7ea2\u5916"

    .line 26
    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/model/SecurityModel;->setAlarmDevice(Ljava/lang/String;)V

    const-string v2, "\u62a5\u8b66"

    .line 27
    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/model/SecurityModel;->setContext(Ljava/lang/String;)V

    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    new-instance v1, Lcom/landleaf/smarthome/model/SecurityModel;

    invoke-direct {v1}, Lcom/landleaf/smarthome/model/SecurityModel;-><init>()V

    const/4 v3, 0x2

    .line 32
    invoke-virtual {v1, v3}, Lcom/landleaf/smarthome/model/SecurityModel;->setAlarmId(I)V

    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/landleaf/smarthome/model/SecurityModel;->setAlarmTime(J)V

    .line 34
    invoke-virtual {v1, v3}, Lcom/landleaf/smarthome/model/SecurityModel;->setAlarmZone(I)V

    const-string v3, "\u70df\u611f"

    .line 35
    invoke-virtual {v1, v3}, Lcom/landleaf/smarthome/model/SecurityModel;->setAlarmDevice(Ljava/lang/String;)V

    .line 36
    invoke-virtual {v1, v2}, Lcom/landleaf/smarthome/model/SecurityModel;->setContext(Ljava/lang/String;)V

    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
