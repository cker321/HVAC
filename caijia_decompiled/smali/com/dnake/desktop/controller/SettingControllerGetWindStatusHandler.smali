.class public Lcom/dnake/desktop/controller/SettingControllerGetWindStatusHandler;
.super Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;
.source "SettingControllerGetWindStatusHandler.java"


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/yanzhenjie/andserver/framework/handler/MethodHandler;-><init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V

    return-void
.end method


# virtual methods
.method public handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Lcom/dnake/desktop/controller/SettingControllerGetWindStatusHandler;->getHost()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dnake/desktop/controller/SettingController;

    .line 26
    invoke-virtual {p1}, Lcom/dnake/desktop/controller/SettingController;->getWindStatus()Lcom/dnake/desktop/bean/WindStatus;

    move-result-object p1

    .line 27
    invoke-virtual {p0, p2, p1}, Lcom/dnake/desktop/controller/SettingControllerGetWindStatusHandler;->sendObject(Lcom/yanzhenjie/andserver/http/HttpResponse;Ljava/lang/Object;)V

    return-void
.end method
