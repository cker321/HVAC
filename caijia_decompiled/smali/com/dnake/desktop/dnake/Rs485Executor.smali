.class public Lcom/dnake/desktop/dnake/Rs485Executor;
.super Ljava/lang/Object;
.source "Rs485Executor.java"


# static fields
.field private static final DEFAULT_INTERVAL_TIME:I = 0x12c

.field private static final TAG:Ljava/lang/String;

.field private static final ourInstance:Lcom/dnake/desktop/dnake/Rs485Executor;


# instance fields
.field private lock:Ljava/util/concurrent/locks/Lock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 20
    new-instance v0, Lcom/dnake/desktop/dnake/Rs485Executor;

    invoke-direct {v0}, Lcom/dnake/desktop/dnake/Rs485Executor;-><init>()V

    sput-object v0, Lcom/dnake/desktop/dnake/Rs485Executor;->ourInstance:Lcom/dnake/desktop/dnake/Rs485Executor;

    .line 22
    const-class v0, Lcom/dnake/desktop/dnake/Rs485Executor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dnake/desktop/dnake/Rs485Executor;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/locks/ReentrantLock;-><init>(Z)V

    iput-object v0, p0, Lcom/dnake/desktop/dnake/Rs485Executor;->lock:Ljava/util/concurrent/locks/Lock;

    return-void
.end method

.method public static getInstance()Lcom/dnake/desktop/dnake/Rs485Executor;
    .locals 1

    .line 25
    sget-object v0, Lcom/dnake/desktop/dnake/Rs485Executor;->ourInstance:Lcom/dnake/desktop/dnake/Rs485Executor;

    return-object v0
.end method


# virtual methods
.method public GetShortAt([BI)I
    .locals 1

    .line 155
    aget-byte v0, p1, p2

    add-int/lit8 p2, p2, 0x1

    .line 156
    aget-byte p1, p1, p2

    and-int/lit16 p1, p1, 0xff

    shl-int/lit8 p2, v0, 0x8

    add-int/2addr p2, p1

    return p2
.end method

.method public getReceiveLen([B)I
    .locals 4

    const/4 v0, 0x1

    .line 123
    aget-byte v1, p1, v0

    const/4 v2, 0x4

    .line 124
    invoke-virtual {p0, p1, v2}, Lcom/dnake/desktop/dnake/Rs485Executor;->GetShortAt([BI)I

    move-result p1

    const/16 v3, 0x8

    if-eq v1, v0, :cond_1

    const/4 v0, 0x6

    if-eq v1, v0, :cond_3

    const/16 v0, 0x10

    if-eq v1, v0, :cond_3

    const/4 v0, 0x3

    if-eq v1, v0, :cond_0

    if-eq v1, v2, :cond_0

    const/4 v3, 0x0

    goto :goto_1

    :cond_0
    mul-int/lit8 p1, p1, 0x2

    :goto_0
    add-int/lit8 v3, p1, 0x5

    goto :goto_1

    .line 129
    :cond_1
    rem-int/lit8 v1, p1, 0x8

    if-eqz v1, :cond_2

    .line 130
    div-int/2addr p1, v3

    add-int/lit8 p1, p1, 0x5

    add-int/lit8 v3, p1, 0x1

    goto :goto_1

    .line 132
    :cond_2
    div-int/2addr p1, v3

    goto :goto_0

    :cond_3
    :goto_1
    return v3
.end method

.method public setup()V
    .locals 2

    const-string v0, "/exApp"

    .line 38
    invoke-static {v0}, Lcom/dnake/desktop/dnake/v700/dmsg;->start(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 41
    invoke-static {}, Lcom/dnake/desktop/dnake/v700/vt_uart;->start()V

    const/4 v0, 0x0

    const/4 v1, 0x3

    .line 42
    invoke-static {v0, v1}, Lcom/dnake/desktop/dnake/v700/vt_uart;->setup(II)V

    .line 45
    invoke-static {v0}, Lcom/dnake/desktop/dnake/v700/ioctl;->hooter(I)V

    return-void
.end method

.method public updateParam(II)V
    .locals 3

    const/16 v0, 0x65

    const/4 v1, 0x1

    if-eq p1, v0, :cond_2

    const/16 v0, 0x6e

    if-eq p1, v0, :cond_1

    const/16 v0, 0x6f

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :cond_2
    :goto_0
    const/16 p1, 0x2580

    const/4 v0, 0x3

    if-eq p2, p1, :cond_4

    const/16 p1, 0x4b00

    if-eq p2, p1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x4

    .line 82
    :cond_4
    :goto_1
    sget-object p1, Lcom/dnake/desktop/dnake/Rs485Executor;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u66f4\u65b0\u6821\u9a8c:"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",\u66f4\u65b0\u6ce2\u7279\u7387:"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    invoke-static {v1, v0}, Lcom/dnake/desktop/dnake/v700/vt_uart;->setup(II)V

    const-wide/16 p1, 0x3e8

    .line 85
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 87
    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_2
    return-void
.end method

.method public write([BI)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 103
    :try_start_0
    iget-object v0, p0, Lcom/dnake/desktop/dnake/Rs485Executor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    if-eqz p1, :cond_0

    .line 106
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->sleep(J)V

    .line 107
    sget-object v0, Lcom/dnake/desktop/dnake/Rs485Executor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Send:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/dnake/desktop/utils/Rs485Utils;->hexToString([B)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    invoke-virtual {p0, p1}, Lcom/dnake/desktop/dnake/Rs485Executor;->getReceiveLen([B)I

    move-result v0

    invoke-static {p1, v0, p2}, Lcom/dnake/desktop/dnake/v700/vt_uart;->rx([BII)[B

    move-result-object p1

    .line 109
    sget-object p2, Lcom/dnake/desktop/dnake/Rs485Executor;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Receive:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/dnake/desktop/utils/Rs485Utils;->getInstance()Lcom/dnake/desktop/utils/Rs485Utils;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/dnake/desktop/utils/Rs485Utils;->hexToString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    :goto_0
    iget-object p2, p0, Lcom/dnake/desktop/dnake/Rs485Executor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object p1

    :cond_0
    const/4 p1, 0x0

    goto :goto_0

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/dnake/desktop/dnake/Rs485Executor;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p2}, Ljava/util/concurrent/locks/Lock;->unlock()V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method
