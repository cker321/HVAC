.class public Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
.super Ljava/lang/Object;
.source "LoggingInterceptor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ihsanbal/logging/LoggingInterceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = "LoggingI"


# instance fields
.field private executor:Ljava/util/concurrent/Executor;

.field private final headers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private isDebug:Z

.field private isLogHackEnable:Z

.field private isMockEnabled:Z

.field private level:Lcom/ihsanbal/logging/Level;

.field private listener:Lcom/ihsanbal/logging/BufferListener;

.field private logger:Lcom/ihsanbal/logging/Logger;

.field private final queries:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private requestTag:Ljava/lang/String;

.field private responseTag:Ljava/lang/String;

.field private sleepMs:J

.field private type:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 207
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 195
    iput-boolean v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable:Z

    const/4 v0, 0x4

    .line 197
    iput v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->type:I

    .line 200
    sget-object v0, Lcom/ihsanbal/logging/Level;->BASIC:Lcom/ihsanbal/logging/Level;

    iput-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->level:Lcom/ihsanbal/logging/Level;

    .line 208
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->headers:Ljava/util/HashMap;

    .line 209
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->queries:Ljava/util/HashMap;

    return-void
.end method

.method static synthetic access$000(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)Z
    .locals 0

    .line 190
    iget-boolean p0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isDebug:Z

    return p0
.end method

.method static synthetic access$100(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 190
    iget-object p0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->executor:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method static synthetic access$200(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)Z
    .locals 0

    .line 190
    iget-boolean p0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isMockEnabled:Z

    return p0
.end method

.method static synthetic access$300(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)J
    .locals 2

    .line 190
    iget-wide v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->sleepMs:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)Lcom/ihsanbal/logging/BufferListener;
    .locals 0

    .line 190
    iget-object p0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->listener:Lcom/ihsanbal/logging/BufferListener;

    return-object p0
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 1

    .line 265
    iget-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->headers:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 1

    .line 276
    iget-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->queries:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public build()Lcom/ihsanbal/logging/LoggingInterceptor;
    .locals 2

    .line 380
    new-instance v0, Lcom/ihsanbal/logging/LoggingInterceptor;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ihsanbal/logging/LoggingInterceptor;-><init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lcom/ihsanbal/logging/LoggingInterceptor$1;)V

    return-object v0
.end method

.method public enableAndroidStudio_v3_LogsHack(Z)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 375
    iput-boolean p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable:Z

    return-object p0
.end method

.method public enableMock(ZJLcom/ihsanbal/logging/BufferListener;)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 359
    iput-boolean p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isMockEnabled:Z

    .line 360
    iput-wide p2, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->sleepMs:J

    .line 361
    iput-object p4, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->listener:Lcom/ihsanbal/logging/BufferListener;

    return-object p0
.end method

.method public executor(Ljava/util/concurrent/Executor;)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 348
    iput-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->executor:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 251
    iget-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method getHeaders()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 231
    iget-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->headers:Ljava/util/HashMap;

    return-object v0
.end method

.method getHttpUrl()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 235
    iget-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->queries:Ljava/util/HashMap;

    return-object v0
.end method

.method getLevel()Lcom/ihsanbal/logging/Level;
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->level:Lcom/ihsanbal/logging/Level;

    return-object v0
.end method

.method getLogger()Lcom/ihsanbal/logging/Logger;
    .locals 1

    .line 247
    iget-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->logger:Lcom/ihsanbal/logging/Logger;

    return-object v0
.end method

.method getTag(Z)Ljava/lang/String;
    .locals 0

    if-eqz p1, :cond_1

    .line 240
    iget-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->requestTag:Ljava/lang/String;

    invoke-static {p1}, Lcom/ihsanbal/logging/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->TAG:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->requestTag:Ljava/lang/String;

    :goto_0
    return-object p1

    .line 242
    :cond_1
    iget-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->responseTag:Ljava/lang/String;

    invoke-static {p1}, Lcom/ihsanbal/logging/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->TAG:Ljava/lang/String;

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->responseTag:Ljava/lang/String;

    :goto_1
    return-object p1
.end method

.method getType()I
    .locals 1

    .line 213
    iget v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->type:I

    return v0
.end method

.method isLogHackEnable()Z
    .locals 1

    .line 255
    iget-boolean v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable:Z

    return v0
.end method

.method public log(I)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 328
    iput p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->type:I

    return-object p0
.end method

.method public loggable(Z)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 318
    iput-boolean p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isDebug:Z

    return-object p0
.end method

.method public logger(Lcom/ihsanbal/logging/Logger;)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 338
    iput-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->logger:Lcom/ihsanbal/logging/Logger;

    return-object p0
.end method

.method public request(Ljava/lang/String;)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 298
    iput-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->requestTag:Ljava/lang/String;

    return-object p0
.end method

.method public response(Ljava/lang/String;)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 309
    iput-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->responseTag:Ljava/lang/String;

    return-object p0
.end method

.method public setLevel(Lcom/ihsanbal/logging/Level;)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 226
    iput-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->level:Lcom/ihsanbal/logging/Level;

    return-object p0
.end method

.method public tag(Ljava/lang/String;)Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    .locals 0

    .line 287
    sput-object p1, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->TAG:Ljava/lang/String;

    return-object p0
.end method
