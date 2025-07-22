.class public Lcom/dnake/desktop/dnake/v700/dmsg$DmsgThread;
.super Ljava/lang/Object;
.source "dmsg.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/dnake/v700/dmsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DmsgThread"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    const/high16 v0, 0x20000

    new-array v1, v0, [B

    .line 218
    new-instance v2, Ljava/net/DatagramPacket;

    invoke-direct {v2, v1, v0}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 222
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/dnake/desktop/dnake/v700/dmsg;->access$100()Ljava/net/DatagramSocket;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 223
    invoke-static {}, Lcom/dnake/desktop/dnake/v700/dmsg;->access$100()Ljava/net/DatagramSocket;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 224
    invoke-virtual {v2}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-static {v0}, Lcom/dnake/desktop/dnake/v700/dmsg;->access$202(Ljava/net/InetAddress;)Ljava/net/InetAddress;

    .line 225
    invoke-virtual {v2}, Ljava/net/DatagramPacket;->getPort()I

    move-result v0

    invoke-static {v0}, Lcom/dnake/desktop/dnake/v700/dmsg;->access$302(I)I

    .line 226
    invoke-static {v2}, Lcom/dnake/desktop/dnake/v700/dmsg;->access$400(Ljava/net/DatagramPacket;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 229
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    :goto_1
    const/4 v0, 0x0

    .line 231
    invoke-static {v0}, Lcom/dnake/desktop/dnake/v700/dmsg;->access$202(Ljava/net/InetAddress;)Ljava/net/InetAddress;

    goto :goto_0
.end method
