.class public final Lcom/dnake/desktop/controller/PageControllerAdapter;
.super Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;
.source "PageControllerAdapter.java"


# instance fields
.field private mHost:Lcom/dnake/desktop/controller/PageController;

.field private mMappingMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            "Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 22
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;-><init>()V

    .line 23
    new-instance v0, Lcom/dnake/desktop/controller/PageController;

    invoke-direct {v0}, Lcom/dnake/desktop/controller/PageController;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/controller/PageControllerAdapter;->mHost:Lcom/dnake/desktop/controller/PageController;

    .line 24
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/controller/PageControllerAdapter;->mMappingMap:Ljava/util/Map;

    .line 27
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;-><init>()V

    .line 29
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Path;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;-><init>()V

    const-string v2, "/"

    .line 30
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->addRule(Ljava/lang/String;)V

    .line 31
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setPath(Lcom/yanzhenjie/andserver/framework/mapping/Path;)V

    .line 33
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Method;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Method;-><init>()V

    const-string v2, "GET"

    .line 34
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Method;->addRule(Ljava/lang/String;)V

    .line 35
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setMethod(Lcom/yanzhenjie/andserver/framework/mapping/Method;)V

    .line 37
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Addition;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Addition;-><init>()V

    .line 40
    new-instance v2, Lcom/dnake/desktop/controller/PageControllerIndexHandler;

    iget-object v3, p0, Lcom/dnake/desktop/controller/PageControllerAdapter;->mHost:Lcom/dnake/desktop/controller/PageController;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v1, v4}, Lcom/dnake/desktop/controller/PageControllerIndexHandler;-><init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V

    .line 41
    iget-object v1, p0, Lcom/dnake/desktop/controller/PageControllerAdapter;->mMappingMap:Ljava/util/Map;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected getHost()Lcom/dnake/desktop/controller/PageController;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/dnake/desktop/controller/PageControllerAdapter;->mHost:Lcom/dnake/desktop/controller/PageController;

    return-object v0
.end method

.method protected bridge synthetic getHost()Ljava/lang/Object;
    .locals 1

    .line 17
    invoke-virtual {p0}, Lcom/dnake/desktop/controller/PageControllerAdapter;->getHost()Lcom/dnake/desktop/controller/PageController;

    move-result-object v0

    return-object v0
.end method

.method protected getMappingMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mapping;",
            "Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;",
            ">;"
        }
    .end annotation

    .line 47
    iget-object v0, p0, Lcom/dnake/desktop/controller/PageControllerAdapter;->mMappingMap:Ljava/util/Map;

    return-object v0
.end method
