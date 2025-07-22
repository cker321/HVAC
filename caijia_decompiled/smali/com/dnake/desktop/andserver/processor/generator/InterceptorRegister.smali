.class public final Lcom/dnake/desktop/andserver/processor/generator/InterceptorRegister;
.super Ljava/lang/Object;
.source "InterceptorRegister.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/register/OnRegister;


# instance fields
.field private mMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/HandlerInterceptor;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/andserver/processor/generator/InterceptorRegister;->mMap:Ljava/util/Map;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 24
    new-instance v1, Lcom/dnake/desktop/component/LoggerInterceptor;

    invoke-direct {v1}, Lcom/dnake/desktop/component/LoggerInterceptor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 25
    iget-object v1, p0, Lcom/dnake/desktop/andserver/processor/generator/InterceptorRegister;->mMap:Ljava/util/Map;

    const-string v2, "default"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onRegister(Landroid/content/Context;Ljava/lang/String;Lcom/yanzhenjie/andserver/register/Register;)V
    .locals 0

    .line 30
    iget-object p1, p0, Lcom/dnake/desktop/andserver/processor/generator/InterceptorRegister;->mMap:Ljava/util/Map;

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_0

    .line 31
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_0

    .line 32
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/yanzhenjie/andserver/framework/HandlerInterceptor;

    .line 33
    invoke-interface {p3, p2}, Lcom/yanzhenjie/andserver/register/Register;->addInterceptor(Lcom/yanzhenjie/andserver/framework/HandlerInterceptor;)V

    goto :goto_0

    :cond_0
    return-void
.end method
