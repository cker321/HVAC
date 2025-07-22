.class public Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;
.super Ljava/lang/Object;
.source "ProtocolUtils.java"


# static fields
.field private static baseClass:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAdd4AttTag(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Landroid/content/Context;)I
    .locals 0

    .line 111
    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result p0

    invoke-static {p0, p2}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getDeviceModel4ProductTag(ILandroid/content/Context;)Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 113
    invoke-virtual {p0}, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->getAttTagAdd()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public static getAdd4AttValue(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;Landroid/content/Context;)I
    .locals 0

    .line 128
    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result p0

    invoke-static {p0, p2}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getDeviceModel4ProductTag(ILandroid/content/Context;)Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 130
    invoke-virtual {p0}, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->getAttValueAdd()Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/DeviceAttribute;->getAddValue()I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public static getAllClassByBase(Landroid/content/Context;Ljava/lang/Class;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    .line 174
    sget-object v0, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->baseClass:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 175
    sget-object v0, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->baseClass:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    sget-object p0, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->baseClass:Ljava/util/List;

    return-object p0

    :cond_0
    const/4 v0, 0x0

    .line 178
    sput-object v0, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->baseClass:Ljava/util/List;

    .line 181
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->baseClass:Ljava/util/List;

    .line 183
    invoke-virtual {p1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    .line 185
    :try_start_0
    invoke-static {p0, v0}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getClasses(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    .line 187
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_3

    .line 188
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 189
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 190
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 191
    sget-object v2, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->baseClass:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 196
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 198
    :cond_3
    sget-object p0, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->baseClass:Ljava/util/List;

    return-object p0
.end method

.method public static getAttData4Protocol(Lcom/landleaf/smarthome/model/DeviceModel;IILandroid/content/Context;)Lcom/landleaf/smarthome/model/DeviceAttribute;
    .locals 1

    .line 39
    new-instance v0, Lcom/landleaf/smarthome/model/DeviceAttribute;

    invoke-direct {v0}, Lcom/landleaf/smarthome/model/DeviceAttribute;-><init>()V

    .line 40
    invoke-static {p0, p1, p3}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getAttTag4Add(Lcom/landleaf/smarthome/model/DeviceModel;ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 41
    invoke-static {p0, p1, p2, p3}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getAttValue4Add(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 42
    invoke-virtual {v0, p1}, Lcom/landleaf/smarthome/model/DeviceAttribute;->setAttrTag(Ljava/lang/String;)V

    if-nez p0, :cond_0

    .line 44
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-virtual {v0, p0}, Lcom/landleaf/smarthome/model/DeviceAttribute;->setAttrValue(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getAttTag4Add(Lcom/landleaf/smarthome/model/DeviceModel;ILandroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 57
    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result p0

    invoke-static {p0, p2}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getDeviceModel4ProductTag(ILandroid/content/Context;)Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;

    move-result-object p0

    const/4 p2, 0x0

    if-nez p0, :cond_0

    return-object p2

    .line 61
    :cond_0
    invoke-virtual {p0}, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->getAttTagAdd()Ljava/util/Map;

    move-result-object p0

    .line 62
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 63
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 64
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 65
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_1

    .line 66
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_2
    return-object p2
.end method

.method public static getAttValue4Add(Lcom/landleaf/smarthome/model/DeviceModel;IILandroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 104
    invoke-static {p0, p1, p3}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getAttTag4Add(Lcom/landleaf/smarthome/model/DeviceModel;ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 105
    invoke-static {p0, p1, p2, p3}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getAttValue4Add(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getAttValue4Add(Lcom/landleaf/smarthome/model/DeviceModel;Ljava/lang/String;ILandroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 81
    invoke-virtual {p0}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result p0

    invoke-static {p0, p3}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getDeviceModel4ProductTag(ILandroid/content/Context;)Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;

    move-result-object p0

    .line 82
    invoke-virtual {p0}, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->getAttValueAdd()Ljava/util/Map;

    move-result-object p0

    .line 83
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 84
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    .line 85
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map$Entry;

    .line 86
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/landleaf/smarthome/model/DeviceAttribute;

    .line 87
    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DeviceAttribute;->getAttrTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/model/DeviceAttribute;->getAddValue()I

    move-result v0

    if-ne v0, p2, :cond_0

    .line 88
    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getClasses(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 203
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 204
    invoke-virtual {p0}, Landroid/content/Context;->getPackageCodePath()Ljava/lang/String;

    move-result-object p0

    .line 206
    :try_start_0
    new-instance v1, Ldalvik/system/DexFile;

    invoke-direct {v1, p0}, Ldalvik/system/DexFile;-><init>(Ljava/lang/String;)V

    .line 207
    invoke-virtual {v1}, Ldalvik/system/DexFile;->entries()Ljava/util/Enumeration;

    move-result-object p0

    .line 208
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 209
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 210
    invoke-virtual {v1, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 211
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 215
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    return-object v0
.end method

.method public static getDeviceModel4ProductTag(ILandroid/content/Context;)Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;
    .locals 6

    .line 145
    const-class v0, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;

    invoke-static {p1, v0}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getAllClassByBase(Landroid/content/Context;Ljava/lang/Class;)Ljava/util/List;

    move-result-object p1

    .line 147
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 148
    const-class v2, Lcom/landleaf/smarthome/device/ProductCodeAnnotation;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v2

    check-cast v2, Lcom/landleaf/smarthome/device/ProductCodeAnnotation;

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 149
    :goto_0
    invoke-interface {v2}, Lcom/landleaf/smarthome/device/ProductCodeAnnotation;->value()[I

    move-result-object v5

    array-length v5, v5

    if-ge v4, v5, :cond_0

    .line 150
    invoke-interface {v2}, Lcom/landleaf/smarthome/device/ProductCodeAnnotation;->value()[I

    move-result-object v5

    aget v5, v5, v4

    if-ne v5, p0, :cond_1

    :try_start_0
    const-string p0, "getInstance"

    new-array p1, v3, [Ljava/lang/Class;

    .line 152
    invoke-virtual {v0, p0, p1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array p1, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, p0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 154
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    return-object v1

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method public static getFaults4FaultAdds([I)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 232
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 233
    array-length v1, p0

    int-to-double v1, v1

    const-wide/high16 v3, 0x4030000000000000L    # 16.0

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_4

    const/16 v4, 0x10

    new-array v5, v4, [I

    mul-int/lit8 v6, v3, 0x10

    .line 236
    array-length v7, p0

    sub-int/2addr v7, v6

    if-lt v7, v4, :cond_1

    const/16 v7, 0x10

    goto :goto_1

    :cond_1
    array-length v7, p0

    sub-int/2addr v7, v6

    :goto_1
    invoke-static {p0, v6, v5, v2, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 237
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v4, :cond_3

    .line 239
    aget v8, v5, v7

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 240
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-lez v8, :cond_2

    const/4 v8, 0x1

    goto :goto_3

    :cond_2
    const/4 v8, 0x0

    :goto_3
    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 242
    :cond_3
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v4, v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    return-object v0
.end method
