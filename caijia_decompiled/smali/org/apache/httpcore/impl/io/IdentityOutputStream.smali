.class public Lorg/apache/httpcore/impl/io/IdentityOutputStream;
.super Ljava/io/OutputStream;
.source "IdentityOutputStream.java"


# instance fields
.field private closed:Z

.field private final out:Lorg/apache/httpcore/io/SessionOutputBuffer;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/io/SessionOutputBuffer;)V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    const/4 v0, 0x0

    .line 56
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->closed:Z

    const-string v0, "Session output buffer"

    .line 60
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/io/SessionOutputBuffer;

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->closed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 71
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->closed:Z

    .line 72
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/httpcore/io/SessionOutputBuffer;->flush()V

    :cond_0
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/httpcore/io/SessionOutputBuffer;->flush()V

    return-void
.end method

.method public write(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 96
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->closed:Z

    if-nez v0, :cond_0

    .line 99
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/io/SessionOutputBuffer;->write(I)V

    return-void

    .line 97
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Attempted write to closed stream."

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 83
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->closed:Z

    if-nez v0, :cond_0

    .line 86
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/IdentityOutputStream;->out:Lorg/apache/httpcore/io/SessionOutputBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/httpcore/io/SessionOutputBuffer;->write([BII)V

    return-void

    .line 84
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Attempted write to closed stream."

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
