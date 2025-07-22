.class public Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;
.super Ljava/lang/Object;
.source "DeviceModelDao.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/landleaf/smarthome/model/DeviceModelDao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Properties"
.end annotation


# static fields
.field public static final DeviceName:Lorg/greenrobot/greendao/Property;

.field public static final DeviceSn:Lorg/greenrobot/greendao/Property;

.field public static final HvacFlag:Lorg/greenrobot/greendao/Property;

.field public static final Id:Lorg/greenrobot/greendao/Property;

.field public static final Port:Lorg/greenrobot/greendao/Property;

.field public static final ProductCode:Lorg/greenrobot/greendao/Property;

.field public static final Protocol:Lorg/greenrobot/greendao/Property;

.field public static final RoomId:Lorg/greenrobot/greendao/Property;

.field public static final SortNo:Lorg/greenrobot/greendao/Property;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 28
    new-instance v6, Lorg/greenrobot/greendao/Property;

    const-class v2, Ljava/lang/Long;

    const/4 v1, 0x0

    const-string v3, "id"

    const/4 v4, 0x1

    const-string v5, "_id"

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v6, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->Id:Lorg/greenrobot/greendao/Property;

    .line 29
    new-instance v0, Lorg/greenrobot/greendao/Property;

    const-class v9, Ljava/lang/String;

    const/4 v8, 0x1

    const-string v10, "deviceSn"

    const/4 v11, 0x0

    const-string v12, "DEVICE_SN"

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->DeviceSn:Lorg/greenrobot/greendao/Property;

    .line 30
    new-instance v0, Lorg/greenrobot/greendao/Property;

    const-class v3, Ljava/lang/String;

    const/4 v2, 0x2

    const-string v4, "deviceName"

    const/4 v5, 0x0

    const-string v6, "DEVICE_NAME"

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->DeviceName:Lorg/greenrobot/greendao/Property;

    .line 31
    new-instance v0, Lorg/greenrobot/greendao/Property;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x3

    const-string v10, "port"

    const-string v12, "PORT"

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->Port:Lorg/greenrobot/greendao/Property;

    .line 32
    new-instance v0, Lorg/greenrobot/greendao/Property;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x4

    const-string v4, "protocol"

    const-string v6, "PROTOCOL"

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->Protocol:Lorg/greenrobot/greendao/Property;

    .line 33
    new-instance v0, Lorg/greenrobot/greendao/Property;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x5

    const-string v10, "sortNo"

    const-string v12, "SORT_NO"

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->SortNo:Lorg/greenrobot/greendao/Property;

    .line 34
    new-instance v0, Lorg/greenrobot/greendao/Property;

    const-class v3, Ljava/lang/Long;

    const/4 v2, 0x6

    const-string v4, "roomId"

    const-string v6, "ROOM_ID"

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->RoomId:Lorg/greenrobot/greendao/Property;

    .line 35
    new-instance v0, Lorg/greenrobot/greendao/Property;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x7

    const-string v10, "productCode"

    const-string v12, "PRODUCT_CODE"

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->ProductCode:Lorg/greenrobot/greendao/Property;

    .line 36
    new-instance v0, Lorg/greenrobot/greendao/Property;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/16 v2, 0x8

    const-string v4, "hvacFlag"

    const-string v6, "HVAC_FLAG"

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/DeviceModelDao$Properties;->HvacFlag:Lorg/greenrobot/greendao/Property;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
