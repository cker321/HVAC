.class public final Lcom/dnake/desktop/andserver/processor/generator/ResolverRegister;
.super Ljava/lang/Object;
.source "ResolverRegister.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/register/OnRegister;


# instance fields
.field private mMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/framework/ExceptionResolver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/andserver/processor/generator/ResolverRegister;->mMap:Ljava/util/Map;

    .line 21
    new-instance v1, Lcom/dnake/desktop/component/AppExceptionResolver;

    invoke-direct {v1}, Lcom/dnake/desktop/component/AppExceptionResolver;-><init>()V

    const-string v2, "default"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public onRegister(Landroid/content/Context;Ljava/lang/String;Lcom/yanzhenjie/andserver/register/Register;)V
    .locals 0

    .line 26
    iget-object p1, p0, Lcom/dnake/desktop/andserver/processor/generator/ResolverRegister;->mMap:Ljava/util/Map;

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/yanzhenjie/andserver/framework/ExceptionResolver;

    if-eqz p1, :cond_0

    .line 28
    invoke-interface {p3, p1}, Lcom/yanzhenjie/andserver/register/Register;->setResolver(Lcom/yanzhenjie/andserver/framework/ExceptionResolver;)V

    :cond_0
    return-void
.end method
