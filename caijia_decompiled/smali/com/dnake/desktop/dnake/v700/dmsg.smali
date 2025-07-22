.class public Lcom/dnake/desktop/dnake/v700/dmsg;
.super Ljava/lang/Object;
.source "dmsg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dnake/desktop/dnake/v700/dmsg$DmsgThread;,
        Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;
    }
.end annotation


# static fields
.field private static ds:Ljava/net/DatagramSocket;

.field private static msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

.field private static rAddr:Ljava/net/InetAddress;

.field private static rPort:I


# instance fields
.field public mBody:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 125
    iput-object v0, p0, Lcom/dnake/desktop/dnake/v700/dmsg;->mBody:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$100()Ljava/net/DatagramSocket;
    .locals 1

    .line 14
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->ds:Ljava/net/DatagramSocket;

    return-object v0
.end method

.method static synthetic access$202(Ljava/net/InetAddress;)Ljava/net/InetAddress;
    .locals 0

    .line 14
    sput-object p0, Lcom/dnake/desktop/dnake/v700/dmsg;->rAddr:Ljava/net/InetAddress;

    return-object p0
.end method

.method static synthetic access$302(I)I
    .locals 0

    .line 14
    sput p0, Lcom/dnake/desktop/dnake/v700/dmsg;->rPort:I

    return p0
.end method

.method static synthetic access$400(Ljava/net/DatagramPacket;)V
    .locals 0

    .line 14
    invoke-static {p0}, Lcom/dnake/desktop/dnake/v700/dmsg;->process(Ljava/net/DatagramPacket;)V

    return-void
.end method

.method public static ack(ILjava/lang/String;)V
    .locals 3

    .line 107
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->rAddr:Ljava/net/InetAddress;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, " OK\r\n\r\n"

    const-string v1, "MSG/1.0 "

    if-eqz p1, :cond_1

    .line 112
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 114
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 115
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    .line 117
    new-instance p1, Ljava/net/DatagramPacket;

    array-length v0, p0

    sget-object v1, Lcom/dnake/desktop/dnake/v700/dmsg;->rAddr:Ljava/net/InetAddress;

    sget v2, Lcom/dnake/desktop/dnake/v700/dmsg;->rPort:I

    invoke-direct {p1, p0, v0, v1, v2}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 119
    :try_start_0
    sget-object p0, Lcom/dnake/desktop/dnake/v700/dmsg;->ds:Ljava/net/DatagramSocket;

    invoke-virtual {p0, p1}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 121
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    return-void
.end method

.method private static is_utf8([BI)Ljava/lang/Boolean;
    .locals 12

    const/4 v0, 0x1

    .line 239
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    if-nez p0, :cond_0

    return-object v1

    :cond_0
    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v3, p1, :cond_6

    .line 242
    aget-byte v6, p0, v3

    const/16 v7, 0x7f

    if-lez v6, :cond_1

    aget-byte v6, p0, v3

    if-ge v6, v7, :cond_1

    goto/16 :goto_3

    .line 244
    :cond_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 245
    aget-byte v6, p0, v3

    const/16 v8, 0xe0

    and-int/2addr v6, v8

    const/16 v9, 0x80

    const/16 v10, 0xc0

    if-ne v6, v10, :cond_3

    add-int/lit8 v6, v3, 0x1

    array-length v11, p0

    if-gt v6, v11, :cond_3

    .line 246
    aget-byte v8, p0, v6

    and-int/2addr v8, v10

    if-ne v8, v9, :cond_5

    .line 247
    aget-byte v8, p0, v3

    and-int/lit16 v8, v8, 0xff

    .line 248
    aget-byte v9, p0, v6

    and-int/lit16 v9, v9, 0xff

    const/16 v10, 0x81

    if-gt v10, v8, :cond_2

    const/16 v10, 0xfe

    if-gt v8, v10, :cond_2

    const/16 v8, 0x40

    if-gt v8, v9, :cond_2

    if-gt v9, v10, :cond_2

    if-eq v9, v7, :cond_2

    .line 250
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "Not do!"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    :cond_2
    :goto_1
    add-int/lit8 v5, v5, 0x1

    move v3, v6

    goto :goto_3

    .line 257
    :cond_3
    aget-byte v6, p0, v3

    const/16 v7, 0xf0

    and-int/2addr v6, v7

    if-ne v6, v8, :cond_4

    add-int/lit8 v6, v3, 0x2

    array-length v8, p0

    if-gt v6, v8, :cond_4

    add-int/lit8 v7, v3, 0x1

    .line 258
    aget-byte v7, p0, v7

    and-int/2addr v7, v10

    if-ne v7, v9, :cond_5

    aget-byte v7, p0, v6

    and-int/2addr v7, v10

    if-ne v7, v9, :cond_5

    goto :goto_1

    .line 264
    :cond_4
    aget-byte v6, p0, v3

    and-int/lit16 v6, v6, 0xf8

    if-ne v6, v7, :cond_5

    add-int/lit8 v6, v3, 0x3

    array-length v7, p0

    if-gt v6, v7, :cond_5

    add-int/lit8 v7, v3, 0x1

    .line 265
    aget-byte v7, p0, v7

    and-int/2addr v7, v10

    if-ne v7, v9, :cond_5

    add-int/lit8 v7, v3, 0x2

    aget-byte v7, p0, v7

    and-int/2addr v7, v10

    if-ne v7, v9, :cond_5

    aget-byte v7, p0, v6

    and-int/2addr v7, v10

    if-ne v7, v9, :cond_5

    goto :goto_1

    :cond_5
    :goto_2
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v4, v4, 0x1

    :goto_3
    add-int/2addr v3, v0

    goto/16 :goto_0

    .line 276
    :cond_6
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_8

    if-lez v4, :cond_8

    mul-int/lit8 v5, v5, 0xa

    if-lt v5, v4, :cond_7

    goto :goto_4

    :cond_7
    const/4 v0, 0x0

    :cond_8
    :goto_4
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private static mPort(Ljava/lang/String;)I
    .locals 5

    .line 28
    invoke-static {}, Lcom/dnake/desktop/dnake/v700/dmsg;->setup_port()V

    .line 30
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 31
    iget-object v4, v3, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_0

    .line 32
    iget p0, v3, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method private static process(Ljava/net/DatagramPacket;)V
    .locals 5

    .line 187
    invoke-virtual {p0}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/DatagramPacket;->getLength()I

    move-result v1

    invoke-static {v0, v1}, Lcom/dnake/desktop/dnake/v700/dmsg;->is_utf8([BI)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 189
    :try_start_0
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v3

    invoke-virtual {p0}, Ljava/net/DatagramPacket;->getLength()I

    move-result p0

    const-string v4, "GBK"

    invoke-direct {v0, v3, v2, p0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 191
    invoke-virtual {p0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    move-object v0, v1

    goto :goto_0

    .line 194
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v3

    invoke-virtual {p0}, Ljava/net/DatagramPacket;->getLength()I

    move-result p0

    invoke-direct {v0, v3, v2, p0}, Ljava/lang/String;-><init>([BII)V

    .line 196
    :goto_0
    new-instance p0, Ljava/util/StringTokenizer;

    const-string v3, " "

    invoke-direct {p0, v0, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    invoke-virtual {p0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 198
    invoke-virtual {p0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p0

    if-eqz v0, :cond_1

    const-string v2, "\r\n\r\n"

    .line 203
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    :cond_1
    if-lez v2, :cond_2

    add-int/lit8 v2, v2, 0x4

    .line 207
    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_2
    if-eqz p0, :cond_3

    if-eqz v3, :cond_3

    const-string v0, "POST"

    .line 210
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 211
    invoke-static {p0, v1}, Lcom/dnake/desktop/dnake/v700/devent;->event(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method public static setup_port()V
    .locals 4

    .line 38
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    if-nez v0, :cond_0

    const/16 v0, 0xa

    new-array v0, v0, [Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    .line 39
    sput-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    .line 41
    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/4 v3, 0x0

    aput-object v1, v0, v3

    .line 42
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const-string v1, "/talk"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 43
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const/16 v1, 0x2648

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 45
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/4 v3, 0x1

    aput-object v1, v0, v3

    .line 46
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const-string v1, "/ui"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 47
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const/16 v1, 0x2649

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 49
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/4 v3, 0x2

    aput-object v1, v0, v3

    .line 50
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const-string v1, "/monitor"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 51
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const/16 v1, 0x264a

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 53
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/4 v3, 0x3

    aput-object v1, v0, v3

    .line 54
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const-string v1, "/upgrade"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 55
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const/16 v1, 0x264b

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 57
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/4 v3, 0x4

    aput-object v1, v0, v3

    .line 58
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const-string v1, "/control"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 59
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const/16 v1, 0x264c

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 61
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/4 v3, 0x5

    aput-object v1, v0, v3

    .line 62
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const-string v1, "/security"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 63
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const/16 v1, 0x2666

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 65
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/4 v3, 0x6

    aput-object v1, v0, v3

    .line 66
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const-string v1, "/smart"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 67
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const/16 v1, 0x2667

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 69
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/4 v3, 0x7

    aput-object v1, v0, v3

    .line 70
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const-string v1, "/apps"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 71
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const/16 v1, 0x2668

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 73
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/16 v3, 0x8

    aput-object v1, v0, v3

    .line 74
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const-string v1, "/settings"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 75
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v3

    const/16 v1, 0x2669

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 77
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    new-instance v1, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    invoke-direct {v1, v2}, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;-><init>(Lcom/dnake/desktop/dnake/v700/dmsg$1;)V

    const/16 v2, 0x9

    aput-object v1, v0, v2

    .line 78
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v2

    const-string v1, "/exApp"

    iput-object v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->url:Ljava/lang/String;

    .line 79
    sget-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->msg_port:[Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;

    aget-object v0, v0, v2

    const/16 v1, 0x267a

    iput v1, v0, Lcom/dnake/desktop/dnake/v700/dmsg$__msg_port;->port:I

    .line 82
    new-instance v0, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    .line 83
    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitAll()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v0

    .line 84
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    :cond_0
    return-void
.end method

.method public static start(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    .line 89
    invoke-static {p0}, Lcom/dnake/desktop/dnake/v700/dmsg;->mPort(Ljava/lang/String;)I

    move-result p0

    if-gez p0, :cond_0

    const/4 p0, 0x0

    .line 91
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    .line 94
    :cond_0
    :try_start_0
    new-instance v0, Ljava/net/DatagramSocket;

    const-string v1, "127.0.0.1"

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    sput-object v0, Lcom/dnake/desktop/dnake/v700/dmsg;->ds:Ljava/net/DatagramSocket;
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    .line 96
    :goto_0
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 99
    :goto_1
    new-instance p0, Lcom/dnake/desktop/dnake/v700/dmsg$DmsgThread;

    invoke-direct {p0}, Lcom/dnake/desktop/dnake/v700/dmsg$DmsgThread;-><init>()V

    .line 100
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 101
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    const/4 p0, 0x1

    .line 103
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public to(Ljava/lang/String;Ljava/lang/String;)I
    .locals 6

    const/4 v0, 0x0

    .line 128
    iput-object v0, p0, Lcom/dnake/desktop/dnake/v700/dmsg;->mBody:Ljava/lang/String;

    .line 130
    invoke-static {p1}, Lcom/dnake/desktop/dnake/v700/dmsg;->mPort(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x0

    if-gez v1, :cond_0

    return v2

    .line 136
    :cond_0
    :try_start_0
    new-instance v3, Ljava/net/DatagramSocket;

    invoke-direct {v3}, Ljava/net/DatagramSocket;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    const-string v0, " MSG/1.0\r\n\r\n"

    const-string v4, "POST "

    if-eqz p2, :cond_1

    .line 139
    :try_start_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 141
    :cond_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 142
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p2

    .line 144
    new-instance v0, Ljava/net/DatagramPacket;

    array-length v4, p2

    const-string v5, "127.0.0.1"

    .line 145
    invoke-static {v5}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v5

    invoke-direct {v0, p2, v4, v5, v1}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    const/16 p2, 0x1f4

    .line 146
    invoke-virtual {v3, p2}, Ljava/net/DatagramSocket;->setSoTimeout(I)V

    .line 147
    invoke-virtual {v3, v0}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    const/16 p2, 0x2000

    new-array v0, p2, [B

    .line 150
    new-instance v1, Ljava/net/DatagramPacket;

    invoke-direct {v1, v0, p2}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 151
    invoke-virtual {v3, v1}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 153
    invoke-virtual {v1}, Ljava/net/DatagramPacket;->getLength()I

    move-result p2

    const/16 v0, 0x8

    if-ge p2, v0, :cond_2

    .line 154
    invoke-virtual {v3}, Ljava/net/DatagramSocket;->close()V

    return v2

    .line 158
    :cond_2
    invoke-virtual {v1}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object p2

    invoke-virtual {v1}, Ljava/net/DatagramPacket;->getLength()I

    move-result v0

    invoke-static {p2, v0}, Lcom/dnake/desktop/dnake/v700/dmsg;->is_utf8([BI)Ljava/lang/Boolean;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    if-nez p2, :cond_3

    .line 160
    :try_start_2
    new-instance p2, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v0

    invoke-virtual {v1}, Ljava/net/DatagramPacket;->getLength()I

    move-result v1

    const-string v4, "GBK"

    invoke-direct {p2, v0, v2, v1, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-object p1, p2

    goto :goto_1

    :catch_0
    move-exception p2

    .line 162
    :try_start_3
    invoke-virtual {p2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1

    .line 165
    :cond_3
    new-instance p1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object p2

    invoke-virtual {v1}, Ljava/net/DatagramPacket;->getLength()I

    move-result v0

    invoke-direct {p1, p2, v2, v0}, Ljava/lang/String;-><init>([BII)V

    .line 167
    :goto_1
    new-instance p2, Ljava/util/StringTokenizer;

    const-string v0, " "

    invoke-direct {p2, p1, v0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    invoke-virtual {p2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    .line 169
    invoke-virtual {p2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p2

    const-string v0, "\r\n\r\n"

    .line 171
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_4

    add-int/lit8 v0, v0, 0x4

    .line 174
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/dnake/v700/dmsg;->mBody:Ljava/lang/String;

    .line 176
    :cond_4
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    return p1

    :catch_1
    move-exception p1

    move-object v0, v3

    goto :goto_2

    :catch_2
    move-exception p1

    .line 178
    :goto_2
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    if-eqz v0, :cond_5

    .line 181
    invoke-virtual {v0}, Ljava/net/DatagramSocket;->close()V

    :cond_5
    const/4 p1, -0x1

    return p1
.end method
