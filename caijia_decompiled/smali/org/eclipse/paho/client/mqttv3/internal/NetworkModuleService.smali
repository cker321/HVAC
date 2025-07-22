.class public Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;
.super Ljava/lang/Object;
.source "NetworkModuleService.java"


# static fields
.field private static final AUTHORITY_PATTERN:Ljava/util/regex/Pattern;

.field private static final AUTH_GROUP_HOST:I = 0x3

.field private static final AUTH_GROUP_PORT:I = 0x5

.field private static final AUTH_GROUP_USERINFO:I = 0x2

.field private static final FACTORY_SERVICE_LOADER:Ljava/util/ServiceLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ServiceLoader<",
            "Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;",
            ">;"
        }
    .end annotation
.end field

.field private static LOG:Lorg/eclipse/paho/client/mqttv3/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 36
    const-class v0, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;

    .line 37
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "org.eclipse.paho.client.mqttv3.internal.nls.logcat"

    .line 36
    invoke-static {v2, v1}, Lorg/eclipse/paho/client/mqttv3/logging/LoggerFactory;->getLogger(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    move-result-object v1

    sput-object v1, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->LOG:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    .line 39
    const-class v1, Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 38
    invoke-static {v1, v0}, Ljava/util/ServiceLoader;->load(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/ServiceLoader;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->FACTORY_SERVICE_LOADER:Ljava/util/ServiceLoader;

    const-string v0, "((.+)@)?([^:]*)(:(\\d+))?"

    .line 42
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->AUTHORITY_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyRFC3986AuthorityPatch(Ljava/net/URI;)V
    .locals 3

    if-eqz p0, :cond_2

    .line 129
    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    .line 130
    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 131
    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 135
    :cond_0
    sget-object v0, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->AUTHORITY_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 136
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x2

    .line 137
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "userInfo"

    invoke-static {p0, v2, v1}, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->setURIField(Ljava/net/URI;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v1, 0x3

    .line 138
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "host"

    invoke-static {p0, v2, v1}, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->setURIField(Ljava/net/URI;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v1, 0x5

    .line 139
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 140
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "port"

    invoke-static {p0, v1, v0}, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->setURIField(Ljava/net/URI;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public static createInstance(Ljava/lang/String;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/paho/client/mqttv3/MqttException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 95
    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 96
    invoke-static {v0}, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->applyRFC3986AuthorityPatch(Ljava/net/URI;)V

    .line 97
    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 98
    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->FACTORY_SERVICE_LOADER:Ljava/util/ServiceLoader;

    monitor-enter v2
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    :try_start_1
    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->FACTORY_SERVICE_LOADER:Ljava/util/ServiceLoader;

    invoke-virtual {v3}, Ljava/util/ServiceLoader;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;

    .line 100
    invoke-interface {v4}, Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;->getSupportedUriSchemes()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 101
    invoke-interface {v4, v0, p1, p2}, Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;->createNetworkModule(Ljava/net/URI;Lorg/eclipse/paho/client/mqttv3/MqttConnectOptions;Ljava/lang/String;)Lorg/eclipse/paho/client/mqttv3/internal/NetworkModule;

    move-result-object p1

    monitor-exit v2

    return-object p1

    .line 98
    :cond_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    :try_start_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_0

    :catchall_0
    move-exception p1

    .line 98
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p1
    :try_end_4
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p1

    .line 111
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :goto_0
    throw p2

    :goto_1
    goto :goto_0
.end method

.method private static setURIField(Ljava/net/URI;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 7

    const/4 v0, 0x1

    .line 152
    :try_start_0
    const-class v1, Ljava/net/URI;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    .line 153
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 154
    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    goto :goto_0

    :catch_2
    move-exception p1

    goto :goto_0

    :catch_3
    move-exception p1

    :goto_0
    move-object v6, p1

    .line 156
    sget-object v1, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->LOG:Lorg/eclipse/paho/client/mqttv3/logging/Logger;

    const-class p1, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    new-array v5, v0, [Ljava/lang/Object;

    const/4 p1, 0x0

    .line 157
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v5, p1

    const-string v3, "setURIField"

    const-string v4, "115"

    .line 156
    invoke-interface/range {v1 .. v6}, Lorg/eclipse/paho/client/mqttv3/logging/Logger;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method

.method public static validateURI(Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 60
    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 61
    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 62
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 65
    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 66
    sget-object v2, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->FACTORY_SERVICE_LOADER:Ljava/util/ServiceLoader;

    monitor-enter v2
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :try_start_1
    sget-object v3, Lorg/eclipse/paho/client/mqttv3/internal/NetworkModuleService;->FACTORY_SERVICE_LOADER:Ljava/util/ServiceLoader;

    invoke-virtual {v3}, Ljava/util/ServiceLoader;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;

    .line 68
    invoke-interface {v4}, Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;->getSupportedUriSchemes()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 69
    invoke-interface {v4, v0}, Lorg/eclipse/paho/client/mqttv3/spi/NetworkModuleFactory;->validateURI(Ljava/net/URI;)V

    .line 70
    monitor-exit v2

    return-void

    .line 66
    :cond_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    :try_start_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "no NetworkModule installed for scheme \""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\" of URI \""

    .line 75
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 74
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_0

    :catchall_0
    move-exception v0

    .line 66
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0

    .line 63
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "missing scheme in broker URI: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    .line 77
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Can\'t parse string to URI \""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\""

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :goto_0
    throw v1

    :goto_1
    goto :goto_0
.end method
