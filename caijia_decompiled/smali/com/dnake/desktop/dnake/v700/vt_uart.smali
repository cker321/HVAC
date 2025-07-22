.class public Lcom/dnake/desktop/dnake/v700/vt_uart;
.super Ljava/lang/Object;
.source "vt_uart.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dnake/desktop/dnake/v700/vt_uart$vt_uart_thread;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x200

.field private static final RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

.field private static final TAG:Ljava/lang/String;

.field private static final atomicTime:I = 0xa

.field private static final ip:Ljava/lang/String; = "127.0.0.1"

.field private static final rPort:I = 0x274d

.field private static final tPort:I = 0x274c

.field private static uart:Ljava/net/DatagramSocket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    const-class v0, Lcom/dnake/desktop/dnake/v700/vt_uart;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dnake/desktop/dnake/v700/vt_uart;->TAG:Ljava/lang/String;

    const/16 v0, 0x200

    .line 41
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sput-object v0, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100()Ljava/net/DatagramSocket;
    .locals 1

    .line 14
    sget-object v0, Lcom/dnake/desktop/dnake/v700/vt_uart;->uart:Ljava/net/DatagramSocket;

    return-object v0
.end method

.method static synthetic access$200()Ljava/nio/ByteBuffer;
    .locals 1

    .line 14
    sget-object v0, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public static rx([BII)[B
    .locals 4

    const/4 v0, 0x0

    .line 123
    :try_start_0
    sget-object v1, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 125
    invoke-static {p0}, Lcom/dnake/desktop/dnake/v700/vt_uart;->tx([B)V

    const/4 p0, 0x0

    .line 127
    :goto_0
    div-int/lit8 v1, p2, 0xa

    if-ge p0, v1, :cond_2

    .line 128
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v2, p0

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->sleep(J)V

    .line 130
    sget-object v1, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 131
    :try_start_1
    sget-object v2, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    if-ne v2, p1, :cond_1

    .line 134
    sget-object p0, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 136
    sget-object p0, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p0

    if-lt p0, p1, :cond_0

    .line 137
    new-array p0, p1, [B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 138
    :try_start_2
    sget-object p1, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v0, p0

    goto :goto_1

    :catchall_0
    move-exception p1

    move-object v0, p0

    goto :goto_2

    .line 140
    :cond_0
    :goto_1
    :try_start_3
    monitor-exit v1

    goto :goto_3

    .line 142
    :cond_1
    monitor-exit v1

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :catchall_1
    move-exception p1

    :goto_2
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    throw p1
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :catchall_2
    move-exception p0

    goto :goto_4

    :catch_0
    move-exception p0

    .line 145
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 147
    :cond_2
    :goto_3
    sget-object p0, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    return-object v0

    :goto_4
    sget-object p1, Lcom/dnake/desktop/dnake/v700/vt_uart;->RECEIVE_BUFFER:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_6

    :goto_5
    throw p0

    :goto_6
    goto :goto_5
.end method

.method public static setup(II)V
    .locals 3

    .line 85
    new-instance v0, Lcom/dnake/desktop/dnake/v700/dmsg;

    invoke-direct {v0}, Lcom/dnake/desktop/dnake/v700/dmsg;-><init>()V

    .line 86
    new-instance v1, Lcom/dnake/desktop/dnake/v700/dxml;

    invoke-direct {v1}, Lcom/dnake/desktop/dnake/v700/dxml;-><init>()V

    const-string v2, "/params/parity"

    .line 87
    invoke-virtual {v1, v2, p0}, Lcom/dnake/desktop/dnake/v700/dxml;->setInt(Ljava/lang/String;I)V

    const-string p0, "/params/speed"

    .line 88
    invoke-virtual {v1, p0, p1}, Lcom/dnake/desktop/dnake/v700/dxml;->setInt(Ljava/lang/String;I)V

    .line 89
    invoke-virtual {v1}, Lcom/dnake/desktop/dnake/v700/dxml;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "/control/vt_uart/setup"

    invoke-virtual {v0, p1, p0}, Lcom/dnake/desktop/dnake/v700/dmsg;->to(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static start()V
    .locals 2

    .line 29
    :try_start_0
    new-instance v0, Ljava/net/DatagramSocket;

    const/16 v1, 0x274d

    invoke-direct {v0, v1}, Ljava/net/DatagramSocket;-><init>(I)V

    sput-object v0, Lcom/dnake/desktop/dnake/v700/vt_uart;->uart:Ljava/net/DatagramSocket;

    .line 30
    new-instance v0, Lcom/dnake/desktop/dnake/v700/vt_uart$vt_uart_thread;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dnake/desktop/dnake/v700/vt_uart$vt_uart_thread;-><init>(Lcom/dnake/desktop/dnake/v700/vt_uart$1;)V

    .line 31
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 32
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 34
    invoke-virtual {v0}, Ljava/net/SocketException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private static tx([B)V
    .locals 4

    .line 98
    sget-object v0, Lcom/dnake/desktop/dnake/v700/vt_uart;->uart:Ljava/net/DatagramSocket;

    if-eqz v0, :cond_0

    .line 100
    :try_start_0
    new-instance v0, Ljava/net/DatagramPacket;

    array-length v1, p0

    const-string v2, "127.0.0.1"

    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    const/16 v3, 0x274c

    invoke-direct {v0, p0, v1, v2, v3}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 101
    sget-object p0, Lcom/dnake/desktop/dnake/v700/vt_uart;->uart:Ljava/net/DatagramSocket;

    invoke-virtual {p0, v0}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 103
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method
