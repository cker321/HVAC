.class public Lcom/dnake/desktop/utils/CommonUtils;
.super Ljava/lang/Object;
.source "CommonUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dnake/desktop/utils/CommonUtils$ViewHolder;
    }
.end annotation


# instance fields
.field pvCustomTime:Lcom/bigkoo/pickerview/view/TimePickerView;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dnake/desktop/utils/CommonUtils$1;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lcom/dnake/desktop/utils/CommonUtils;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/dnake/desktop/utils/CommonUtils;
    .locals 1

    .line 53
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils$ViewHolder;->access$000()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    return-object v0
.end method

.method private getWindValue4AttrValue(ILjava/lang/String;Ljava/lang/String;)I
    .locals 7

    const-string v0, "switch"

    .line 137
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/16 v3, 0x1bc3

    if-nez v0, :cond_0

    const-string v0, "humidification_enable"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    const-string v0, "on"

    .line 138
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-ne p1, v3, :cond_1

    goto :goto_0

    :cond_1
    const/16 v1, 0x80

    :goto_0
    return v1

    :cond_2
    const-string v0, "off"

    .line 141
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    return v2

    :cond_3
    const-string v0, "mode"

    .line 146
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v4, 0x3

    const/4 v5, 0x2

    if-eqz v0, :cond_b

    const-string v0, "dehumidification"

    .line 147
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    if-ne p1, v3, :cond_4

    goto :goto_1

    :cond_4
    const/4 v5, 0x5

    :goto_1
    return v5

    :cond_5
    const-string v0, "cold"

    .line 150
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    return v1

    :cond_6
    const-string v0, "hot"

    .line 153
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    if-ne p1, v3, :cond_7

    goto :goto_2

    :cond_7
    const/4 v4, 0x2

    :goto_2
    return v4

    :cond_8
    const-string v0, "wind"

    .line 156
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v6, 0x4

    if-eqz v0, :cond_a

    if-ne p1, v3, :cond_9

    goto :goto_3

    :cond_9
    const/4 v2, 0x4

    :goto_3
    return v2

    :cond_a
    const-string v0, "intelligent"

    .line 159
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return v6

    :cond_b
    const-string v0, "wind_speed"

    .line 164
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    const-string v0, "low_speed"

    .line 165
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    if-ne p1, v3, :cond_c

    const/4 v2, 0x2

    :cond_c
    return v2

    :cond_d
    const-string v0, "medium_speed"

    .line 168
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    return v1

    :cond_e
    const-string v0, "high_speed"

    .line 171
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    if-ne p1, v3, :cond_f

    goto :goto_4

    :cond_f
    const/4 v2, 0x2

    :goto_4
    return v2

    :cond_10
    const-string p1, "auto"

    .line 174
    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_11

    return v4

    :cond_11
    const-string p1, "setting_temperature"

    .line 179
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_12

    .line 180
    invoke-virtual {p0, p3}, Lcom/dnake/desktop/utils/CommonUtils;->isNumber(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_12

    .line 181
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_12
    return v2
.end method


# virtual methods
.method public addDay(Ljava/util/Date;)Ljava/util/Date;
    .locals 2

    .line 276
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 277
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/4 p1, 0x5

    const/4 v1, 0x1

    .line 278
    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->add(II)V

    .line 279
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    return-object p1
.end method

.method public create2DCode(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 254
    new-instance v0, Lcom/google/zxing/MultiFormatWriter;

    invoke-direct {v0}, Lcom/google/zxing/MultiFormatWriter;-><init>()V

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    const/16 v2, 0x12c

    invoke-virtual {v0, p1, v1, v2, v2}, Lcom/google/zxing/MultiFormatWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;

    move-result-object p1

    .line 255
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v6

    .line 256
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v7

    mul-int v0, v6, v7

    .line 258
    new-array v1, v0, [I

    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v7, :cond_2

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v6, :cond_1

    .line 261
    invoke-virtual {p1, v3, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_0

    mul-int v4, v2, v6

    add-int/2addr v4, v3

    const/high16 v5, -0x1000000

    .line 262
    aput v5, v1, v4

    goto :goto_2

    :cond_0
    mul-int v4, v2, v6

    add-int/2addr v4, v3

    const/4 v5, -0x1

    .line 264
    aput v5, v1, v4

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 268
    :cond_2
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v7, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    move v3, v6

    .line 270
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    return-object p1
.end method

.method public getWeekOfDate(Ljava/util/Date;)Ljava/lang/String;
    .locals 7

    const-string v0, "\u661f\u671f\u65e5"

    const-string v1, "\u661f\u671f\u4e00"

    const-string v2, "\u661f\u671f\u4e8c"

    const-string v3, "\u661f\u671f\u4e09"

    const-string v4, "\u661f\u671f\u56db"

    const-string v5, "\u661f\u671f\u4e94"

    const-string v6, "\u661f\u671f\u516d"

    .line 195
    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    .line 196
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 197
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/4 p1, 0x7

    .line 198
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    if-gez p1, :cond_0

    const/4 p1, 0x0

    .line 201
    :cond_0
    aget-object p1, v0, p1

    return-object p1
.end method

.method public isNumber(Ljava/lang/String;)Z
    .locals 1

    .line 110
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const-string v0, "(-)?\\d+(\\.\\d+)?"

    .line 113
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public synthetic lambda$null$0$CommonUtils(Lcom/dnake/desktop/callback/SceneSleepClicked;Landroid/view/View;)V
    .locals 0

    .line 229
    iget-object p2, p0, Lcom/dnake/desktop/utils/CommonUtils;->pvCustomTime:Lcom/bigkoo/pickerview/view/TimePickerView;

    invoke-virtual {p2}, Lcom/bigkoo/pickerview/view/TimePickerView;->returnData()V

    .line 230
    iget-object p2, p0, Lcom/dnake/desktop/utils/CommonUtils;->pvCustomTime:Lcom/bigkoo/pickerview/view/TimePickerView;

    invoke-virtual {p2}, Lcom/bigkoo/pickerview/view/TimePickerView;->dismiss()V

    const/4 p2, 0x1

    .line 231
    invoke-interface {p1, p2}, Lcom/dnake/desktop/callback/SceneSleepClicked;->viewClick(Z)V

    return-void
.end method

.method public synthetic lambda$null$1$CommonUtils(Lcom/dnake/desktop/callback/SceneSleepClicked;Landroid/view/View;)V
    .locals 0

    .line 234
    iget-object p2, p0, Lcom/dnake/desktop/utils/CommonUtils;->pvCustomTime:Lcom/bigkoo/pickerview/view/TimePickerView;

    invoke-virtual {p2}, Lcom/bigkoo/pickerview/view/TimePickerView;->dismiss()V

    const/4 p2, 0x0

    .line 235
    invoke-interface {p1, p2}, Lcom/dnake/desktop/callback/SceneSleepClicked;->viewClick(Z)V

    return-void
.end method

.method public synthetic lambda$showSetSleepTimeDialog$2$CommonUtils(Lcom/dnake/desktop/callback/SceneSleepClicked;Landroid/view/View;)V
    .locals 2

    const v0, 0x7f080058

    .line 226
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f080055

    .line 227
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    .line 228
    new-instance v1, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$Yl9a2yo8K0aqgN4jxy4WjhJ2wuw;

    invoke-direct {v1, p0, p1}, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$Yl9a2yo8K0aqgN4jxy4WjhJ2wuw;-><init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/SceneSleepClicked;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 233
    new-instance v0, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$EEaiBdBuPJqF5-nEUWmE7dimvPI;

    invoke-direct {v0, p0, p1}, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$EEaiBdBuPJqF5-nEUWmE7dimvPI;-><init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/SceneSleepClicked;)V

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public parseRemoteInfo(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;",
            ")",
            "Ljava/util/List<",
            "Lcom/dnake/desktop/bean/MqttRemoteControl;",
            ">;"
        }
    .end annotation

    .line 117
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getProductCode()I

    move-result v0

    .line 118
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v1

    invoke-virtual {v1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getDeviceSn()Ljava/lang/String;

    move-result-object v1

    .line 119
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object p1

    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object p1

    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getItems()Ljava/util/List;

    move-result-object p1

    .line 120
    sget-object v2, Lcom/dnake/desktop/App;->instance:Lcom/dnake/desktop/App;

    invoke-static {v0, v2}, Lcom/landleaf/smarthome/net/hardware/ProtocolUtils;->getDeviceModel4ProductTag(ILandroid/content/Context;)Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;

    move-result-object v2

    .line 121
    invoke-virtual {v2}, Lcom/landleaf/smarthome/device/BaseLocalDeviceModel;->getAttTagAdd()Ljava/util/Map;

    move-result-object v2

    .line 122
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 123
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/landleaf/smarthome/model/DeviceAttribute;

    .line 124
    new-instance v5, Lcom/dnake/desktop/bean/MqttRemoteControl;

    invoke-direct {v5, v1, v0}, Lcom/dnake/desktop/bean/MqttRemoteControl;-><init>(Ljava/lang/String;I)V

    .line 125
    invoke-virtual {v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;->getAttrTag()Ljava/lang/String;

    move-result-object v6

    .line 126
    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 127
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {v5, v7}, Lcom/dnake/desktop/bean/MqttRemoteControl;->setControlAddress(I)V

    .line 128
    invoke-virtual {v4}, Lcom/landleaf/smarthome/model/DeviceAttribute;->getAttrValue()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v0, v6, v4}, Lcom/dnake/desktop/utils/CommonUtils;->getWindValue4AttrValue(ILjava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 129
    invoke-virtual {v5, v4}, Lcom/dnake/desktop/bean/MqttRemoteControl;->setControlValue(I)V

    .line 130
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v3
.end method

.method public read(Lcom/dnake/desktop/callback/Rs485Callback;)V
    .locals 0

    .line 61
    invoke-interface {p1}, Lcom/dnake/desktop/callback/Rs485Callback;->read()V

    return-void
.end method

.method public readInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V
    .locals 3

    .line 65
    invoke-static {}, Lcom/dnake/desktop/utils/ThreadPoolManager;->getInstance()Lcom/dnake/desktop/utils/ThreadPoolManager;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/utils/CommonUtils$1;

    invoke-direct {v1, p0, p1}, Lcom/dnake/desktop/utils/CommonUtils$1;-><init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/Rs485Callback;)V

    const/16 p1, 0xa

    const-string v2, "read_nt_thread"

    invoke-virtual {v0, v1, p1, v2}, Lcom/dnake/desktop/utils/ThreadPoolManager;->submitJob(Ljava/lang/Runnable;ILjava/lang/String;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public showSetSleepTimeDialog(Landroid/content/Context;Lcom/dnake/desktop/callback/SceneSleepClicked;)V
    .locals 8

    .line 211
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 212
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const/4 v2, 0x1

    const/16 v3, 0x7de

    const/16 v4, 0x17

    .line 213
    invoke-virtual {v1, v3, v2, v4}, Ljava/util/Calendar;->set(III)V

    .line 214
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const/16 v3, 0x7eb

    const/4 v4, 0x2

    const/16 v5, 0x1c

    .line 215
    invoke-virtual {v1, v3, v4, v5}, Ljava/util/Calendar;->set(III)V

    .line 217
    new-instance v1, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    new-instance v3, Lcom/dnake/desktop/utils/CommonUtils$6;

    invoke-direct {v3, p0, p2}, Lcom/dnake/desktop/utils/CommonUtils$6;-><init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/SceneSleepClicked;)V

    invoke-direct {v1, p1, v3}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;-><init>(Landroid/content/Context;Lcom/bigkoo/pickerview/listener/OnTimeSelectListener;)V

    .line 223
    invoke-virtual {v1, v2}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->isDialog(Z)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    .line 224
    invoke-virtual {p1, v0}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setDate(Ljava/util/Calendar;)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    new-instance v0, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$AwE6iQwsGLtu5Tt9VKm83W7IEOM;

    invoke-direct {v0, p0, p2}, Lcom/dnake/desktop/utils/-$$Lambda$CommonUtils$AwE6iQwsGLtu5Tt9VKm83W7IEOM;-><init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/SceneSleepClicked;)V

    const p2, 0x7f0b0020

    .line 225
    invoke-virtual {p1, p2, v0}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setLayoutRes(ILcom/bigkoo/pickerview/listener/CustomListener;)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    const/16 p2, 0x19

    .line 238
    invoke-virtual {p1, p2}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setContentTextSize(I)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    sget-object p2, Lcom/contrarywind/view/WheelView$DividerType;->WRAP:Lcom/contrarywind/view/WheelView$DividerType;

    .line 239
    invoke-virtual {p1, p2}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    const/4 p2, 0x0

    .line 240
    invoke-virtual {p1, p2}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setOutSideCancelable(Z)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    const/4 v0, 0x6

    new-array v0, v0, [Z

    fill-array-data v0, :array_0

    .line 241
    invoke-virtual {p1, v0}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setType([Z)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    const v0, 0x3f99999a    # 1.2f

    .line 242
    invoke-virtual {p1, v0}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setLineSpacingMultiplier(F)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 243
    invoke-virtual/range {v1 .. v7}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setTextXOffset(IIIIII)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    .line 244
    invoke-virtual {p1, p2}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->isCenterLabel(Z)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    const-string p2, "#2f3032"

    .line 245
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setDividerColor(I)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    .line 246
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setBgColor(I)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    const-string p2, "#1eac29"

    .line 247
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->setTextColorCenter(I)Lcom/bigkoo/pickerview/builder/TimePickerBuilder;

    move-result-object p1

    .line 248
    invoke-virtual {p1}, Lcom/bigkoo/pickerview/builder/TimePickerBuilder;->build()Lcom/bigkoo/pickerview/view/TimePickerView;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/utils/CommonUtils;->pvCustomTime:Lcom/bigkoo/pickerview/view/TimePickerView;

    .line 249
    invoke-virtual {p1}, Lcom/bigkoo/pickerview/view/TimePickerView;->show()V

    return-void

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
        0x1t
        0x0t
    .end array-data
.end method

.method public uploadAllAirStatus(Lcom/dnake/desktop/handler/AirControlHandler;)V
    .locals 3

    .line 92
    invoke-static {}, Lcom/dnake/desktop/utils/ThreadPoolManager;->getInstance()Lcom/dnake/desktop/utils/ThreadPoolManager;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/utils/CommonUtils$4;

    invoke-direct {v1, p0, p1}, Lcom/dnake/desktop/utils/CommonUtils$4;-><init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/handler/AirControlHandler;)V

    const/16 p1, 0xa

    const-string v2, "write_nt_multiple_thread"

    invoke-virtual {v0, v1, p1, v2}, Lcom/dnake/desktop/utils/ThreadPoolManager;->submitJob(Ljava/lang/Runnable;ILjava/lang/String;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public uploadBugInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V
    .locals 3

    .line 101
    invoke-static {}, Lcom/dnake/desktop/utils/ThreadPoolManager;->getInstance()Lcom/dnake/desktop/utils/ThreadPoolManager;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/utils/CommonUtils$5;

    invoke-direct {v1, p0, p1}, Lcom/dnake/desktop/utils/CommonUtils$5;-><init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/Rs485Callback;)V

    const/16 p1, 0xa

    const-string v2, "upload_nt_bug"

    invoke-virtual {v0, v1, p1, v2}, Lcom/dnake/desktop/utils/ThreadPoolManager;->submitJob(Ljava/lang/Runnable;ILjava/lang/String;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public writeAirMultiple(Ljava/util/List;Lcom/dnake/desktop/handler/AirControlHandler;Lcom/dnake/desktop/bean/TicaInnerStatus;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/dnake/desktop/handler/AirControlHandler;",
            "Lcom/dnake/desktop/bean/TicaInnerStatus;",
            ")V"
        }
    .end annotation

    .line 83
    invoke-static {}, Lcom/dnake/desktop/utils/ThreadPoolManager;->getInstance()Lcom/dnake/desktop/utils/ThreadPoolManager;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/utils/CommonUtils$3;

    invoke-direct {v1, p0, p2, p1, p3}, Lcom/dnake/desktop/utils/CommonUtils$3;-><init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/handler/AirControlHandler;Ljava/util/List;Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    const/16 p1, 0xa

    const-string p2, "write_nt_multiple_thread"

    invoke-virtual {v0, v1, p1, p2}, Lcom/dnake/desktop/utils/ThreadPoolManager;->submitJob(Ljava/lang/Runnable;ILjava/lang/String;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V
    .locals 2

    .line 74
    invoke-static {}, Lcom/dnake/desktop/utils/ThreadPoolManager;->getInstance()Lcom/dnake/desktop/utils/ThreadPoolManager;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/utils/CommonUtils$2;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/dnake/desktop/utils/CommonUtils$2;-><init>(Lcom/dnake/desktop/utils/CommonUtils;Lcom/dnake/desktop/callback/Rs485Callback;II)V

    const/16 p1, 0xa

    const-string p2, "write_nt_thread"

    invoke-virtual {v0, v1, p1, p2}, Lcom/dnake/desktop/utils/ThreadPoolManager;->submitJob(Ljava/lang/Runnable;ILjava/lang/String;)Ljava/util/concurrent/Future;

    return-void
.end method
