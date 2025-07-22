.class public Lcom/landleaf/smarthome/model/RoomModelDao$Properties;
.super Ljava/lang/Object;
.source "RoomModelDao.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/landleaf/smarthome/model/RoomModelDao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Properties"
.end annotation


# static fields
.field public static final FloorId:Lorg/greenrobot/greendao/Property;

.field public static final Id:Lorg/greenrobot/greendao/Property;

.field public static final RoomName:Lorg/greenrobot/greendao/Property;

.field public static final RoomType:Lorg/greenrobot/greendao/Property;

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

    sput-object v6, Lcom/landleaf/smarthome/model/RoomModelDao$Properties;->Id:Lorg/greenrobot/greendao/Property;

    .line 29
    new-instance v0, Lorg/greenrobot/greendao/Property;

    const-class v9, Ljava/lang/String;

    const/4 v8, 0x1

    const-string v10, "roomName"

    const/4 v11, 0x0

    const-string v12, "ROOM_NAME"

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/RoomModelDao$Properties;->RoomName:Lorg/greenrobot/greendao/Property;

    .line 30
    new-instance v0, Lorg/greenrobot/greendao/Property;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x2

    const-string v4, "roomType"

    const/4 v5, 0x0

    const-string v6, "ROOM_TYPE"

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/RoomModelDao$Properties;->RoomType:Lorg/greenrobot/greendao/Property;

    .line 31
    new-instance v0, Lorg/greenrobot/greendao/Property;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x3

    const-string v10, "sortNo"

    const-string v12, "SORT_NO"

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/RoomModelDao$Properties;->SortNo:Lorg/greenrobot/greendao/Property;

    .line 32
    new-instance v0, Lorg/greenrobot/greendao/Property;

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v2, 0x4

    const-string v4, "floorId"

    const-string v6, "FLOOR_ID"

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lorg/greenrobot/greendao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/landleaf/smarthome/model/RoomModelDao$Properties;->FloorId:Lorg/greenrobot/greendao/Property;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
