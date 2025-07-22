.class public Lcom/landleaf/smarthome/db/converter/DeviceConverter;
.super Ljava/lang/Object;
.source "DeviceConverter.java"

# interfaces
.implements Lorg/greenrobot/greendao/converter/PropertyConverter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/greenrobot/greendao/converter/PropertyConverter<",
        "Ljava/util/List<",
        "Lcom/landleaf/smarthome/model/DeviceModel;",
        ">;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic convertToDatabaseValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/db/converter/DeviceConverter;->convertToDatabaseValue(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public convertToDatabaseValue(Ljava/util/List;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 28
    invoke-static {p1}, Lcom/landleaf/smarthome/util/JsonUtils;->objToJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic convertToEntityProperty(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/landleaf/smarthome/db/converter/DeviceConverter;->convertToEntityProperty(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public convertToEntityProperty(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/DeviceModel;",
            ">;"
        }
    .end annotation

    .line 22
    new-instance v0, Lcom/landleaf/smarthome/db/converter/DeviceConverter$1;

    invoke-direct {v0, p0}, Lcom/landleaf/smarthome/db/converter/DeviceConverter$1;-><init>(Lcom/landleaf/smarthome/db/converter/DeviceConverter;)V

    invoke-virtual {v0}, Lcom/landleaf/smarthome/db/converter/DeviceConverter$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 23
    invoke-static {p1, v0}, Lcom/landleaf/smarthome/util/JsonUtils;->jsonToObj(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1
.end method
