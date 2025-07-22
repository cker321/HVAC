.class public Lorg/apache/httpcore/entity/SerializableEntity;
.super Lorg/apache/httpcore/entity/AbstractHttpEntity;
.source "SerializableEntity.java"


# instance fields
.field private objRef:Ljava/io/Serializable;

.field private objSer:[B


# direct methods
.method public constructor <init>(Ljava/io/Serializable;)V
    .locals 1

    .line 80
    invoke-direct {p0}, Lorg/apache/httpcore/entity/AbstractHttpEntity;-><init>()V

    const-string v0, "Source object"

    .line 81
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    iput-object p1, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objRef:Ljava/io/Serializable;

    return-void
.end method

.method public constructor <init>(Ljava/io/Serializable;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    invoke-direct {p0}, Lorg/apache/httpcore/entity/AbstractHttpEntity;-><init>()V

    const-string v0, "Source object"

    .line 64
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    if-eqz p2, :cond_0

    .line 66
    invoke-direct {p0, p1}, Lorg/apache/httpcore/entity/SerializableEntity;->createBytes(Ljava/io/Serializable;)V

    goto :goto_0

    .line 68
    :cond_0
    iput-object p1, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objRef:Ljava/io/Serializable;

    :goto_0
    return-void
.end method

.method private createBytes(Ljava/io/Serializable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 87
    new-instance v1, Ljava/io/ObjectOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 88
    invoke-virtual {v1, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 89
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->flush()V

    .line 90
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objSer:[B

    return-void
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objSer:[B

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objRef:Ljava/io/Serializable;

    invoke-direct {p0, v0}, Lorg/apache/httpcore/entity/SerializableEntity;->createBytes(Ljava/io/Serializable;)V

    .line 98
    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objSer:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .line 103
    iget-object v0, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objSer:[B

    if-nez v0, :cond_0

    const-wide/16 v0, -0x1

    goto :goto_0

    :cond_0
    array-length v0, v0

    int-to-long v0, v0

    :goto_0
    return-wide v0
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .locals 1

    .line 113
    iget-object v0, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objSer:[B

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Output stream"

    .line 118
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    iget-object v0, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objSer:[B

    if-nez v0, :cond_0

    .line 120
    new-instance v0, Ljava/io/ObjectOutputStream;

    invoke-direct {v0, p1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 121
    iget-object p1, p0, Lorg/apache/httpcore/entity/SerializableEntity;->objRef:Ljava/io/Serializable;

    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 122
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->flush()V

    goto :goto_0

    .line 124
    :cond_0
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 125
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    :goto_0
    return-void
.end method
