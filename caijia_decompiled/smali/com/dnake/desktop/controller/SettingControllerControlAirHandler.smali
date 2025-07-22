.class public Lcom/dnake/desktop/controller/SettingControllerControlAirHandler;
.super Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;
.source "SettingControllerControlAirHandler.java"


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;-><init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V

    return-void
.end method


# virtual methods
.method public handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Lcom/dnake/desktop/controller/SettingControllerControlAirHandler;->getHost()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/controller/SettingController;

    .line 26
    const-class v1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {p0, p1, v1}, Lcom/dnake/desktop/controller/SettingControllerControlAirHandler;->parseObject(Lcom/yanzhenjie/andserver/http/HttpRequest;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 27
    invoke-virtual {v0, p1}, Lcom/dnake/desktop/controller/SettingController;->controlAir(Lcom/dnake/desktop/bean/TicaInnerStatus;)Ljava/lang/String;

    move-result-object p1

    .line 28
    invoke-virtual {p0, p2, p1}, Lcom/dnake/desktop/controller/SettingControllerControlAirHandler;->sendObject(Lcom/yanzhenjie/andserver/http/HttpResponse;Ljava/lang/Object;)V

    return-void
.end method
