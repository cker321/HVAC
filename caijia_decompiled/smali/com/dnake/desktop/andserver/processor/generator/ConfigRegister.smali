.class public final Lcom/dnake/desktop/andserver/processor/generator/ConfigRegister;
.super Ljava/lang/Object;
.source "ConfigRegister.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/register/OnRegister;


# instance fields
.field private mMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/framework/config/WebConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/andserver/processor/generator/ConfigRegister;->mMap:Ljava/util/Map;

    .line 25
    new-instance v1, Lcom/dnake/desktop/component/AppConfig;

    invoke-direct {v1}, Lcom/dnake/desktop/component/AppConfig;-><init>()V

    const-string v2, "default"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onRegister(Landroid/content/Context;Ljava/lang/String;Lcom/yanzhenjie/andserver/register/Register;)V
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/dnake/desktop/andserver/processor/generator/ConfigRegister;->mMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/yanzhenjie/andserver/framework/config/WebConfig;

    if-eqz p2, :cond_1

    .line 32
    invoke-static {}, Lcom/yanzhenjie/andserver/framework/config/Delegate;->newInstance()Lcom/yanzhenjie/andserver/framework/config/Delegate;

    move-result-object v0

    .line 33
    invoke-interface {p2, p1, v0}, Lcom/yanzhenjie/andserver/framework/config/WebConfig;->onConfig(Landroid/content/Context;Lcom/yanzhenjie/andserver/framework/config/WebConfig$Delegate;)V

    .line 34
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/config/Delegate;->getWebsites()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 35
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_0

    .line 36
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/yanzhenjie/andserver/framework/website/Website;

    .line 37
    invoke-interface {p3, p2}, Lcom/yanzhenjie/andserver/register/Register;->addAdapter(Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;)V

    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/config/Delegate;->getMultipart()Lcom/yanzhenjie/andserver/framework/config/Multipart;

    move-result-object p1

    .line 41
    invoke-interface {p3, p1}, Lcom/yanzhenjie/andserver/register/Register;->setMultipart(Lcom/yanzhenjie/andserver/framework/config/Multipart;)V

    :cond_1
    return-void
.end method
