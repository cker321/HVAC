.class public Lorg/apache/httpcore/impl/io/IdentityInputStream;
.super Ljava/io/InputStream;
.source "IdentityInputStream.java"


# instance fields
.field private closed:Z

.field private final in:Lorg/apache/httpcore/io/SessionInputBuffer;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;)V
    .locals 1

    .line 61
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    .line 53
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/IdentityInputStream;->closed:Z

    const-string v0, "Session input buffer"

    .line 62
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/io/SessionInputBuffer;

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/IdentityInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    return-void
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/IdentityInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    instance-of v1, v0, Lorg/apache/httpcore/io/BufferInfo;

    if-eqz v1, :cond_0

    .line 68
    check-cast v0, Lorg/apache/httpcore/io/BufferInfo;

    invoke-interface {v0}, Lorg/apache/httpcore/io/BufferInfo;->length()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 75
    iput-boolean v0, p0, Lorg/apache/httpcore/impl/io/IdentityInputStream;->closed:Z

    return-void
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/IdentityInputStream;->closed:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/IdentityInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    invoke-interface {v0}, Lorg/apache/httpcore/io/SessionInputBuffer;->read()I

    move-result v0

    :goto_0
    return v0
.end method

.method public read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    iget-boolean v0, p0, Lorg/apache/httpcore/impl/io/IdentityInputStream;->closed:Z

    if-eqz v0, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/IdentityInputStream;->in:Lorg/apache/httpcore/io/SessionInputBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/httpcore/io/SessionInputBuffer;->read([BII)I

    move-result p1

    :goto_0
    return p1
.end method
