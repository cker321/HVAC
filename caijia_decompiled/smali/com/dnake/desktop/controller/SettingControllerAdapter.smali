.class public final Lcom/dnake/desktop/controller/SettingControllerAdapter;
.super Lcom/yanzhenjie/andserver/framework/handler/MappingAdapter;
.source "SettingControllerAdapter.java"


# instance fields
.field private mHost:Lcom/dnake/desktop/controller/SettingController;

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
    new-instance v0, Lcom/dnake/desktop/controller/SettingController;

    invoke-direct {v0}, Lcom/dnake/desktop/controller/SettingController;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mHost:Lcom/dnake/desktop/controller/SettingController;

    .line 24
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mMappingMap:Ljava/util/Map;

    .line 27
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;-><init>()V

    .line 29
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Path;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;-><init>()V

    const-string v2, "/user/register/info"

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
    new-instance v2, Lcom/dnake/desktop/controller/SettingControllerInfoUpdateHandler;

    iget-object v3, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mHost:Lcom/dnake/desktop/controller/SettingController;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v1, v4}, Lcom/dnake/desktop/controller/SettingControllerInfoUpdateHandler;-><init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V

    .line 41
    iget-object v1, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mMappingMap:Ljava/util/Map;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    # 添加空调状态API映射
    .line 100
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;-><init>()V

    .line 101
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Path;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;-><init>()V

    const-string v2, "/api/air/status"

    .line 102
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->addRule(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setPath(Lcom/yanzhenjie/andserver/framework/mapping/Path;)V

    .line 104
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Method;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Method;-><init>()V

    const-string v2, "GET"

    .line 105
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Method;->addRule(Ljava/lang/String;)V

    .line 106
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setMethod(Lcom/yanzhenjie/andserver/framework/mapping/Method;)V

    .line 107
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Addition;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Addition;-><init>()V

    .line 108
    new-instance v2, Lcom/dnake/desktop/controller/SettingControllerGetAirStatusHandler;

    iget-object v3, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mHost:Lcom/dnake/desktop/controller/SettingController;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v1, v4}, Lcom/dnake/desktop/controller/SettingControllerGetAirStatusHandler;-><init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V

    .line 109
    iget-object v1, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mMappingMap:Ljava/util/Map;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    # 添加新风状态API映射
    .line 110
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;-><init>()V

    .line 111
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Path;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;-><init>()V

    const-string v2, "/api/wind/status"

    .line 112
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->addRule(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setPath(Lcom/yanzhenjie/andserver/framework/mapping/Path;)V

    .line 114
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Method;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Method;-><init>()V

    const-string v2, "GET"

    .line 115
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Method;->addRule(Ljava/lang/String;)V

    .line 116
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setMethod(Lcom/yanzhenjie/andserver/framework/mapping/Method;)V

    .line 117
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Addition;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Addition;-><init>()V

    .line 118
    new-instance v2, Lcom/dnake/desktop/controller/SettingControllerGetWindStatusHandler;

    iget-object v3, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mHost:Lcom/dnake/desktop/controller/SettingController;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v1, v4}, Lcom/dnake/desktop/controller/SettingControllerGetWindStatusHandler;-><init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V

    .line 119
    iget-object v1, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mMappingMap:Ljava/util/Map;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    # 添加空调控制API映射
    .line 120
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;-><init>()V

    .line 121
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Path;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;-><init>()V

    const-string v2, "/api/air/control"

    .line 122
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->addRule(Ljava/lang/String;)V

    .line 123
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setPath(Lcom/yanzhenjie/andserver/framework/mapping/Path;)V

    .line 124
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Method;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Method;-><init>()V

    const-string v2, "POST"

    .line 125
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Method;->addRule(Ljava/lang/String;)V

    .line 126
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setMethod(Lcom/yanzhenjie/andserver/framework/mapping/Method;)V

    .line 127
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Addition;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Addition;-><init>()V

    .line 128
    new-instance v2, Lcom/dnake/desktop/controller/SettingControllerControlAirHandler;

    iget-object v3, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mHost:Lcom/dnake/desktop/controller/SettingController;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v1, v4}, Lcom/dnake/desktop/controller/SettingControllerControlAirHandler;-><init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V

    .line 129
    iget-object v1, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mMappingMap:Ljava/util/Map;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    # 添加新风控制API映射
    .line 130
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;-><init>()V

    .line 131
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Path;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;-><init>()V

    const-string v2, "/api/wind/control"

    .line 132
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->addRule(Ljava/lang/String;)V

    .line 133
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setPath(Lcom/yanzhenjie/andserver/framework/mapping/Path;)V

    .line 134
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Method;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Method;-><init>()V

    const-string v2, "POST"

    .line 135
    invoke-virtual {v1, v2}, Lcom/yanzhenjie/andserver/framework/mapping/Method;->addRule(Ljava/lang/String;)V

    .line 136
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->setMethod(Lcom/yanzhenjie/andserver/framework/mapping/Method;)V

    .line 137
    new-instance v1, Lcom/yanzhenjie/andserver/framework/mapping/Addition;

    invoke-direct {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Addition;-><init>()V

    .line 138
    new-instance v2, Lcom/dnake/desktop/controller/SettingControllerControlWindHandler;

    iget-object v3, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mHost:Lcom/dnake/desktop/controller/SettingController;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v0, v1, v4}, Lcom/dnake/desktop/controller/SettingControllerControlWindHandler;-><init>(Ljava/lang/Object;Lcom/yanzhenjie/andserver/framework/mapping/Mapping;Lcom/yanzhenjie/andserver/framework/mapping/Addition;Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;)V

    .line 139
    iget-object v1, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mMappingMap:Ljava/util/Map;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method protected getHost()Lcom/dnake/desktop/controller/SettingController;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mHost:Lcom/dnake/desktop/controller/SettingController;

    return-object v0
.end method

.method protected bridge synthetic getHost()Ljava/lang/Object;
    .locals 1

    .line 17
    invoke-virtual {p0}, Lcom/dnake/desktop/controller/SettingControllerAdapter;->getHost()Lcom/dnake/desktop/controller/SettingController;

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
    iget-object v0, p0, Lcom/dnake/desktop/controller/SettingControllerAdapter;->mMappingMap:Ljava/util/Map;

    return-object v0
.end method
