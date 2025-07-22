.class Lcom/dnake/desktop/dnake/v700/vt_uart$vt_uart_thread;
.super Ljava/lang/Object;
.source "vt_uart.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/dnake/v700/vt_uart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "vt_uart_thread"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/dnake/desktop/dnake/v700/vt_uart$1;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/dnake/desktop/dnake/v700/vt_uart$vt_uart_thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 50
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_2

    const/16 v0, 0x400

    :try_start_0
    new-array v1, v0, [B

    .line 53
    new-instance v2, Ljava/net/DatagramPacket;

    invoke-direct {v2, v1, v0}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 54
    invoke-static {v1}, Ljava/util/Arrays;->sort([B)V

    .line 56
    invoke-static {}, Lcom/dnake/desktop/dnake/v700/vt_uart;->access$100()Ljava/net/DatagramSocket;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 57
    invoke-virtual {v2}, Ljava/net/DatagramPacket;->getLength()I

    move-result v0

    .line 58
    invoke-static {}, Lcom/dnake/desktop/dnake/v700/vt_uart;->access$200()Ljava/nio/ByteBuffer;

    move-result-object v1

    monitor-enter v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v0, :cond_1

    .line 60
    :try_start_1
    new-array v3, v0, [B

    .line 61
    invoke-virtual {v2}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v2

    const/4 v4, 0x0

    invoke-static {v2, v4, v3, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 62
    invoke-static {}, Lcom/dnake/desktop/dnake/v700/vt_uart;->access$200()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-gt v2, v0, :cond_0

    .line 63
    invoke-static {}, Lcom/dnake/desktop/dnake/v700/vt_uart;->access$200()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 65
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/dnake/v700/vt_uart;->access$200()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 67
    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    .line 69
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :cond_2
    return-void
.end method
