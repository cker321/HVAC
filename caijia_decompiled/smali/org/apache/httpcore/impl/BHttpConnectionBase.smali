.class public Lorg/apache/httpcore/impl/BHttpConnectionBase;
.super Ljava/lang/Object;
.source "BHttpConnectionBase.java"

# interfaces
.implements Lorg/apache/httpcore/HttpInetConnection;


# instance fields
.field private final connMetrics:Lorg/apache/httpcore/impl/HttpConnectionMetricsImpl;

.field private final inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

.field private final incomingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

.field private final messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

.field private final outbuffer:Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

.field private final outgoingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

.field private final socketHolder:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lorg/apache/httpcore/config/MessageConstraints;Lorg/apache/httpcore/entity/ContentLengthStrategy;Lorg/apache/httpcore/entity/ContentLengthStrategy;)V
    .locals 12

    move-object v0, p0

    move v7, p1

    move-object/from16 v8, p5

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v1, "Buffer size"

    .line 111
    invoke-static {p1, v1}, Lorg/apache/httpcore/util/Args;->positive(ILjava/lang/String;)I

    .line 112
    new-instance v9, Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;

    invoke-direct {v9}, Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;-><init>()V

    .line 113
    new-instance v10, Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;

    invoke-direct {v10}, Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;-><init>()V

    .line 114
    new-instance v11, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    if-eqz v8, :cond_0

    move-object v5, v8

    goto :goto_0

    :cond_0
    sget-object v1, Lorg/apache/httpcore/config/MessageConstraints;->DEFAULT:Lorg/apache/httpcore/config/MessageConstraints;

    move-object v5, v1

    :goto_0
    const/4 v4, -0x1

    move-object v1, v11

    move-object v2, v9

    move v3, p1

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;-><init>(Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;IILorg/apache/httpcore/config/MessageConstraints;Ljava/nio/charset/CharsetDecoder;)V

    iput-object v11, v0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    .line 116
    new-instance v1, Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

    move v2, p2

    move-object/from16 v3, p4

    invoke-direct {v1, v10, p1, p2, v3}, Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;-><init>(Lorg/apache/httpcore/impl/io/HttpTransportMetricsImpl;IILjava/nio/charset/CharsetEncoder;)V

    iput-object v1, v0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outbuffer:Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

    .line 118
    iput-object v8, v0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    .line 119
    new-instance v1, Lorg/apache/httpcore/impl/HttpConnectionMetricsImpl;

    invoke-direct {v1, v9, v10}, Lorg/apache/httpcore/impl/HttpConnectionMetricsImpl;-><init>(Lorg/apache/httpcore/io/HttpTransportMetrics;Lorg/apache/httpcore/io/HttpTransportMetrics;)V

    iput-object v1, v0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->connMetrics:Lorg/apache/httpcore/impl/HttpConnectionMetricsImpl;

    if-eqz p6, :cond_1

    move-object/from16 v1, p6

    goto :goto_1

    .line 120
    :cond_1
    sget-object v1, Lorg/apache/httpcore/impl/entity/LaxContentLengthStrategy;->INSTANCE:Lorg/apache/httpcore/impl/entity/LaxContentLengthStrategy;

    :goto_1
    iput-object v1, v0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->incomingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    if-eqz p7, :cond_2

    move-object/from16 v1, p7

    goto :goto_2

    .line 122
    :cond_2
    sget-object v1, Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;->INSTANCE:Lorg/apache/httpcore/impl/entity/StrictContentLengthStrategy;

    :goto_2
    iput-object v1, v0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outgoingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    .line 124
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v1, v0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method private fillInputBuffer(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 338
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    .line 339
    invoke-virtual {v0}, Ljava/net/Socket;->getSoTimeout()I

    move-result v1

    .line 341
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 342
    iget-object p1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    invoke-virtual {p1}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->fillBuffer()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 344
    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    return p1

    :catchall_0
    move-exception p1

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 345
    throw p1
.end method


# virtual methods
.method protected awaitInput(I)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 349
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 352
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/httpcore/impl/BHttpConnectionBase;->fillInputBuffer(I)I

    .line 353
    iget-object p1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    invoke-virtual {p1}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result p1

    return p1
.end method

.method protected bind(Ljava/net/Socket;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Socket"

    .line 159
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 160
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 161
    iget-object p1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bind(Ljava/io/InputStream;)V

    .line 162
    iget-object p1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outbuffer:Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

    invoke-virtual {p1, v0}, Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;->bind(Ljava/io/OutputStream;)V

    return-void
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 314
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    if-eqz v0, :cond_0

    .line 317
    :try_start_0
    iget-object v1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    invoke-virtual {v1}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->clear()V

    .line 318
    iget-object v1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outbuffer:Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

    invoke-virtual {v1}, Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 321
    :try_start_1
    invoke-virtual {v0}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 325
    :catch_0
    :try_start_2
    invoke-virtual {v0}, Ljava/net/Socket;->shutdownInput()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 332
    :catch_1
    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 333
    throw v1

    :cond_0
    :goto_0
    return-void
.end method

.method protected createInputStream(JLorg/apache/httpcore/io/SessionInputBuffer;)Ljava/io/InputStream;
    .locals 3

    const-wide/16 v0, -0x2

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    .line 207
    new-instance p1, Lorg/apache/httpcore/impl/io/ChunkedInputStream;

    iget-object p2, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    invoke-direct {p1, p3, p2}, Lorg/apache/httpcore/impl/io/ChunkedInputStream;-><init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/config/MessageConstraints;)V

    return-object p1

    :cond_0
    const-wide/16 v0, -0x1

    cmp-long v2, p1, v0

    if-nez v2, :cond_1

    .line 209
    new-instance p1, Lorg/apache/httpcore/impl/io/IdentityInputStream;

    invoke-direct {p1, p3}, Lorg/apache/httpcore/impl/io/IdentityInputStream;-><init>(Lorg/apache/httpcore/io/SessionInputBuffer;)V

    return-object p1

    :cond_1
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_2

    .line 211
    sget-object p1, Lorg/apache/httpcore/impl/io/EmptyInputStream;->INSTANCE:Lorg/apache/httpcore/impl/io/EmptyInputStream;

    return-object p1

    .line 213
    :cond_2
    new-instance v0, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;

    invoke-direct {v0, p3, p1, p2}, Lorg/apache/httpcore/impl/io/ContentLengthInputStream;-><init>(Lorg/apache/httpcore/io/SessionInputBuffer;J)V

    return-object v0
.end method

.method protected createOutputStream(JLorg/apache/httpcore/io/SessionOutputBuffer;)Ljava/io/OutputStream;
    .locals 3

    const-wide/16 v0, -0x2

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    .line 190
    new-instance p1, Lorg/apache/httpcore/impl/io/ChunkedOutputStream;

    const/16 p2, 0x800

    invoke-direct {p1, p2, p3}, Lorg/apache/httpcore/impl/io/ChunkedOutputStream;-><init>(ILorg/apache/httpcore/io/SessionOutputBuffer;)V

    return-object p1

    :cond_0
    const-wide/16 v0, -0x1

    cmp-long v2, p1, v0

    if-nez v2, :cond_1

    .line 192
    new-instance p1, Lorg/apache/httpcore/impl/io/IdentityOutputStream;

    invoke-direct {p1, p3}, Lorg/apache/httpcore/impl/io/IdentityOutputStream;-><init>(Lorg/apache/httpcore/io/SessionOutputBuffer;)V

    return-object p1

    .line 194
    :cond_1
    new-instance v0, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;

    invoke-direct {v0, p3, p1, p2}, Lorg/apache/httpcore/impl/io/ContentLengthOutputStream;-><init>(Lorg/apache/httpcore/io/SessionOutputBuffer;J)V

    return-object v0
.end method

.method protected doFlush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 174
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outbuffer:Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;->flush()V

    return-void
.end method

.method protected ensureOpen()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    if-eqz v0, :cond_2

    .line 132
    iget-object v1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    invoke-virtual {v1}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->isBound()Z

    move-result v1

    if-nez v1, :cond_0

    .line 133
    iget-object v1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    invoke-virtual {p0, v0}, Lorg/apache/httpcore/impl/BHttpConnectionBase;->getSocketInputStream(Ljava/net/Socket;)Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;->bind(Ljava/io/InputStream;)V

    .line 135
    :cond_0
    iget-object v1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outbuffer:Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

    invoke-virtual {v1}, Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;->isBound()Z

    move-result v1

    if-nez v1, :cond_1

    .line 136
    iget-object v1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outbuffer:Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

    invoke-virtual {p0, v0}, Lorg/apache/httpcore/impl/BHttpConnectionBase;->getSocketOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;->bind(Ljava/io/OutputStream;)V

    :cond_1
    return-void

    .line 130
    :cond_2
    new-instance v0, Lorg/apache/httpcore/ConnectionClosedException;

    invoke-direct {v0}, Lorg/apache/httpcore/ConnectionClosedException;-><init>()V

    throw v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 1

    .line 249
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    if-eqz v0, :cond_0

    .line 250
    invoke-virtual {v0}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getLocalPort()I
    .locals 1

    .line 255
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    if-eqz v0, :cond_0

    .line 256
    invoke-virtual {v0}, Ljava/net/Socket;->getLocalPort()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public getMetrics()Lorg/apache/httpcore/HttpConnectionMetrics;
    .locals 1

    .line 381
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->connMetrics:Lorg/apache/httpcore/impl/HttpConnectionMetricsImpl;

    return-object v0
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .locals 1

    .line 261
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    if-eqz v0, :cond_0

    .line 262
    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getRemotePort()I
    .locals 1

    .line 267
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    if-eqz v0, :cond_0

    .line 268
    invoke-virtual {v0}, Ljava/net/Socket;->getPort()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method protected getSessionInputBuffer()Lorg/apache/httpcore/io/SessionInputBuffer;
    .locals 1

    .line 166
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    return-object v0
.end method

.method protected getSessionOutputBuffer()Lorg/apache/httpcore/io/SessionOutputBuffer;
    .locals 1

    .line 170
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outbuffer:Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

    return-object v0
.end method

.method protected getSocket()Ljava/net/Socket;
    .locals 1

    .line 183
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    return-object v0
.end method

.method protected getSocketInputStream(Ljava/net/Socket;)Ljava/io/InputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    return-object p1
.end method

.method protected getSocketOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 145
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    return-object p1
.end method

.method public getSocketTimeout()I
    .locals 2

    .line 287
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    .line 290
    :try_start_0
    invoke-virtual {v0}, Ljava/net/Socket;->getSoTimeout()I

    move-result v0
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    :cond_0
    return v1
.end method

.method protected incrementRequestCount()V
    .locals 1

    .line 372
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->connMetrics:Lorg/apache/httpcore/impl/HttpConnectionMetricsImpl;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/HttpConnectionMetricsImpl;->incrementRequestCount()V

    return-void
.end method

.method protected incrementResponseCount()V
    .locals 1

    .line 376
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->connMetrics:Lorg/apache/httpcore/impl/HttpConnectionMetricsImpl;

    invoke-virtual {v0}, Lorg/apache/httpcore/impl/HttpConnectionMetricsImpl;->incrementResponseCount()V

    return-void
.end method

.method public isOpen()Z
    .locals 1

    .line 179
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isStale()Z
    .locals 3

    .line 358
    invoke-virtual {p0}, Lorg/apache/httpcore/impl/BHttpConnectionBase;->isOpen()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    .line 362
    :try_start_0
    invoke-direct {p0, v1}, Lorg/apache/httpcore/impl/BHttpConnectionBase;->fillInputBuffer(I)I

    move-result v2
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-gez v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :catch_0
    :goto_0
    return v1

    :catch_1
    return v0
.end method

.method protected prepareInput(Lorg/apache/httpcore/HttpMessage;)Lorg/apache/httpcore/HttpEntity;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    .line 218
    new-instance v0, Lorg/apache/httpcore/entity/BasicHttpEntity;

    invoke-direct {v0}, Lorg/apache/httpcore/entity/BasicHttpEntity;-><init>()V

    .line 220
    iget-object v1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->incomingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    invoke-interface {v1, p1}, Lorg/apache/httpcore/entity/ContentLengthStrategy;->determineLength(Lorg/apache/httpcore/HttpMessage;)J

    move-result-wide v1

    .line 221
    iget-object v3, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->inBuffer:Lorg/apache/httpcore/impl/io/SessionInputBufferImpl;

    invoke-virtual {p0, v1, v2, v3}, Lorg/apache/httpcore/impl/BHttpConnectionBase;->createInputStream(JLorg/apache/httpcore/io/SessionInputBuffer;)Ljava/io/InputStream;

    move-result-object v3

    const-wide/16 v4, -0x1

    const-wide/16 v6, -0x2

    cmp-long v8, v1, v6

    if-nez v8, :cond_0

    const/4 v1, 0x1

    .line 223
    invoke-virtual {v0, v1}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setChunked(Z)V

    .line 224
    invoke-virtual {v0, v4, v5}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setContentLength(J)V

    .line 225
    invoke-virtual {v0, v3}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    cmp-long v7, v1, v4

    if-nez v7, :cond_1

    .line 227
    invoke-virtual {v0, v6}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setChunked(Z)V

    .line 228
    invoke-virtual {v0, v4, v5}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setContentLength(J)V

    .line 229
    invoke-virtual {v0, v3}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    goto :goto_0

    .line 231
    :cond_1
    invoke-virtual {v0, v6}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setChunked(Z)V

    .line 232
    invoke-virtual {v0, v1, v2}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setContentLength(J)V

    .line 233
    invoke-virtual {v0, v3}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    :goto_0
    const-string v1, "Content-Type"

    .line 236
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 238
    invoke-virtual {v0, v1}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setContentType(Lorg/apache/httpcore/Header;)V

    :cond_2
    const-string v1, "Content-Encoding"

    .line 240
    invoke-interface {p1, v1}, Lorg/apache/httpcore/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 242
    invoke-virtual {v0, p1}, Lorg/apache/httpcore/entity/BasicHttpEntity;->setContentEncoding(Lorg/apache/httpcore/Header;)V

    :cond_3
    return-object v0
.end method

.method protected prepareOutput(Lorg/apache/httpcore/HttpMessage;)Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    .line 199
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outgoingContentStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/entity/ContentLengthStrategy;->determineLength(Lorg/apache/httpcore/HttpMessage;)J

    move-result-wide v0

    .line 200
    iget-object p1, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->outbuffer:Lorg/apache/httpcore/impl/io/SessionOutputBufferImpl;

    invoke-virtual {p0, v0, v1, p1}, Lorg/apache/httpcore/impl/BHttpConnectionBase;->createOutputStream(JLorg/apache/httpcore/io/SessionOutputBuffer;)Ljava/io/OutputStream;

    move-result-object p1

    return-object p1
.end method

.method public setSocketTimeout(I)V
    .locals 1

    .line 273
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    if-eqz v0, :cond_0

    .line 276
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/net/Socket;->setSoTimeout(I)V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public shutdown()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 300
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 304
    :try_start_0
    invoke-virtual {v0, v1, v2}, Ljava/net/Socket;->setSoLinger(ZI)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 307
    :catch_0
    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 308
    throw v1

    :cond_0
    :goto_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 386
    iget-object v0, p0, Lorg/apache/httpcore/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    if-eqz v0, :cond_1

    .line 388
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 389
    invoke-virtual {v0}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v2

    .line 390
    invoke-virtual {v0}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    .line 392
    invoke-static {v1, v0}, Lorg/apache/httpcore/util/NetUtils;->formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V

    const-string v0, "<->"

    .line 393
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    invoke-static {v1, v2}, Lorg/apache/httpcore/util/NetUtils;->formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V

    .line 396
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const-string v0, "[Not bound]"

    return-object v0
.end method
