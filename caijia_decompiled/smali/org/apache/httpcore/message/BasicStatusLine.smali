.class public Lorg/apache/httpcore/message/BasicStatusLine;
.super Ljava/lang/Object;
.source "BasicStatusLine.java"

# interfaces
.implements Lorg/apache/httpcore/StatusLine;
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x21e85bd4afe13085L


# instance fields
.field private final protoVersion:Lorg/apache/httpcore/ProtocolVersion;

.field private final reasonPhrase:Ljava/lang/String;

.field private final statusCode:I


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/ProtocolVersion;ILjava/lang/String;)V
    .locals 1

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Version"

    .line 71
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/ProtocolVersion;

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicStatusLine;->protoVersion:Lorg/apache/httpcore/ProtocolVersion;

    const-string p1, "Status code"

    .line 72
    invoke-static {p2, p1}, Lorg/apache/httpcore/util/Args;->notNegative(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lorg/apache/httpcore/message/BasicStatusLine;->statusCode:I

    .line 73
    iput-object p3, p0, Lorg/apache/httpcore/message/BasicStatusLine;->reasonPhrase:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 101
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;
    .locals 1

    .line 85
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicStatusLine;->protoVersion:Lorg/apache/httpcore/ProtocolVersion;

    return-object v0
.end method

.method public getReasonPhrase()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicStatusLine;->reasonPhrase:Ljava/lang/String;

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .line 80
    iget v0, p0, Lorg/apache/httpcore/message/BasicStatusLine;->statusCode:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 96
    sget-object v0, Lorg/apache/httpcore/message/BasicLineFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicLineFormatter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p0}, Lorg/apache/httpcore/message/BasicLineFormatter;->formatStatusLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/StatusLine;)Lorg/apache/httpcore/util/CharArrayBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
