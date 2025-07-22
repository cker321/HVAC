.class public Lcom/yanzhenjie/andserver/ComponentRegister;
.super Ljava/lang/Object;
.source "ComponentRegister.java"


# static fields
.field private static final ANDSERVER_SUFFIX:Ljava/lang/String; = ".generator.andserver"

.field private static final PROCESSOR_PACKAGE:Ljava/lang/String; = ".andserver.processor.generator."

.field private static final REGISTER_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/yanzhenjie/andserver/ComponentRegister;->REGISTER_LIST:Ljava/util/List;

    const-string v1, "AdapterRegister"

    .line 38
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    sget-object v0, Lcom/yanzhenjie/andserver/ComponentRegister;->REGISTER_LIST:Ljava/util/List;

    const-string v1, "ConfigRegister"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    sget-object v0, Lcom/yanzhenjie/andserver/ComponentRegister;->REGISTER_LIST:Ljava/util/List;

    const-string v1, "ConverterRegister"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    sget-object v0, Lcom/yanzhenjie/andserver/ComponentRegister;->REGISTER_LIST:Ljava/util/List;

    const-string v1, "InterceptorRegister"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    sget-object v0, Lcom/yanzhenjie/andserver/ComponentRegister;->REGISTER_LIST:Ljava/util/List;

    const-string v1, "ResolverRegister"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/yanzhenjie/andserver/ComponentRegister;->mContext:Landroid/content/Context;

    return-void
.end method

.method private registerClass(Lcom/yanzhenjie/andserver/register/Register;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 77
    :try_start_0
    invoke-static {p3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p3

    .line 78
    const-class v0, Lcom/yanzhenjie/andserver/register/OnRegister;

    invoke-virtual {v0, p3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    invoke-virtual {p3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/yanzhenjie/andserver/register/OnRegister;

    .line 80
    iget-object v0, p0, Lcom/yanzhenjie/andserver/ComponentRegister;->mContext:Landroid/content/Context;

    invoke-interface {p3, v0, p2, p1}, Lcom/yanzhenjie/andserver/register/OnRegister;->onRegister(Landroid/content/Context;Ljava/lang/String;Lcom/yanzhenjie/andserver/register/Register;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 86
    invoke-virtual {p1}, Ljava/lang/InstantiationException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p1

    .line 84
    invoke-virtual {p1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    :catch_2
    :cond_0
    :goto_0
    return-void
.end method


# virtual methods
.method public register(Lcom/yanzhenjie/andserver/register/Register;Ljava/lang/String;)V
    .locals 10

    .line 52
    iget-object v0, p0, Lcom/yanzhenjie/andserver/ComponentRegister;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    :try_start_0
    const-string v1, ""

    .line 55
    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 57
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 60
    array-length v1, v0

    if-nez v1, :cond_0

    goto :goto_3

    .line 64
    :cond_0
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_2

    aget-object v4, v0, v3

    const-string v5, ".generator.andserver"

    .line 65
    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 66
    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v4, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 67
    sget-object v5, Lcom/yanzhenjie/andserver/ComponentRegister;->REGISTER_LIST:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v4, v7, v2

    const-string v8, ".andserver.processor.generator."

    const/4 v9, 0x1

    aput-object v8, v7, v9

    const/4 v8, 0x2

    aput-object v6, v7, v8

    const-string v6, "%s%s%s"

    .line 68
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 69
    invoke-direct {p0, p1, p2, v6}, Lcom/yanzhenjie/andserver/ComponentRegister;->registerClass(Lcom/yanzhenjie/andserver/register/Register;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    :goto_3
    return-void
.end method
