.class public final synthetic Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$IuNg8LtrNaDl8NEK_kHTq3Xkkf4;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# static fields
.field public static final synthetic INSTANCE:Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$IuNg8LtrNaDl8NEK_kHTq3Xkkf4;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$IuNg8LtrNaDl8NEK_kHTq3Xkkf4;

    invoke-direct {v0}, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$IuNg8LtrNaDl8NEK_kHTq3Xkkf4;-><init>()V

    sput-object v0, Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$IuNg8LtrNaDl8NEK_kHTq3Xkkf4;->INSTANCE:Lcom/landleaf/smarthome/net/mqtt/-$$Lambda$MqttMessageCallback$IuNg8LtrNaDl8NEK_kHTq3Xkkf4;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p1}, Lcom/landleaf/smarthome/net/mqtt/MqttMessageCallback;->lambda$messageArrived$3(Ljava/lang/Throwable;)V

    return-void
.end method
