.class public Lorg/apache/httpcore/entity/EntityTemplate;
.super Lorg/apache/httpcore/entity/AbstractHttpEntity;
.source "EntityTemplate.java"


# instance fields
.field private final contentproducer:Lorg/apache/httpcore/entity/ContentProducer;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/entity/ContentProducer;)V
    .locals 1

    .line 49
    invoke-direct {p0}, Lorg/apache/httpcore/entity/AbstractHttpEntity;-><init>()V

    const-string v0, "Content producer"

    .line 50
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/entity/ContentProducer;

    iput-object p1, p0, Lorg/apache/httpcore/entity/EntityTemplate;->contentproducer:Lorg/apache/httpcore/entity/ContentProducer;

    return-void
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 61
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/entity/EntityTemplate;->writeTo(Ljava/io/OutputStream;)V

    .line 62
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v1
.end method

.method public getContentLength()J
    .locals 2

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .locals 1

    const/4 v0, 0x0

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

    .line 72
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 73
    iget-object v0, p0, Lorg/apache/httpcore/entity/EntityTemplate;->contentproducer:Lorg/apache/httpcore/entity/ContentProducer;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/entity/ContentProducer;->writeTo(Ljava/io/OutputStream;)V

    return-void
.end method
