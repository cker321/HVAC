.class public Lorg/apache/httpcore/config/ConnectionConfig;
.super Ljava/lang/Object;
.source "ConnectionConfig.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/httpcore/config/ConnectionConfig$Builder;
    }
.end annotation


# static fields
.field public static final DEFAULT:Lorg/apache/httpcore/config/ConnectionConfig;


# instance fields
.field private final bufferSize:I

.field private final charset:Ljava/nio/charset/Charset;

.field private final fragmentSizeHint:I

.field private final malformedInputAction:Ljava/nio/charset/CodingErrorAction;

.field private final messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

.field private final unmappableInputAction:Ljava/nio/charset/CodingErrorAction;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    new-instance v0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    invoke-direct {v0}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;-><init>()V

    invoke-virtual {v0}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->build()Lorg/apache/httpcore/config/ConnectionConfig;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/config/ConnectionConfig;->DEFAULT:Lorg/apache/httpcore/config/ConnectionConfig;

    return-void
.end method

.method constructor <init>(IILjava/nio/charset/Charset;Ljava/nio/charset/CodingErrorAction;Ljava/nio/charset/CodingErrorAction;Lorg/apache/httpcore/config/MessageConstraints;)V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput p1, p0, Lorg/apache/httpcore/config/ConnectionConfig;->bufferSize:I

    .line 64
    iput p2, p0, Lorg/apache/httpcore/config/ConnectionConfig;->fragmentSizeHint:I

    .line 65
    iput-object p3, p0, Lorg/apache/httpcore/config/ConnectionConfig;->charset:Ljava/nio/charset/Charset;

    .line 66
    iput-object p4, p0, Lorg/apache/httpcore/config/ConnectionConfig;->malformedInputAction:Ljava/nio/charset/CodingErrorAction;

    .line 67
    iput-object p5, p0, Lorg/apache/httpcore/config/ConnectionConfig;->unmappableInputAction:Ljava/nio/charset/CodingErrorAction;

    .line 68
    iput-object p6, p0, Lorg/apache/httpcore/config/ConnectionConfig;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    return-void
.end method

.method public static copy(Lorg/apache/httpcore/config/ConnectionConfig;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;
    .locals 2

    const-string v0, "Connection config"

    .line 118
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    new-instance v0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    invoke-direct {v0}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;-><init>()V

    .line 120
    invoke-virtual {p0}, Lorg/apache/httpcore/config/ConnectionConfig;->getBufferSize()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setBufferSize(I)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object v0

    .line 121
    invoke-virtual {p0}, Lorg/apache/httpcore/config/ConnectionConfig;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setCharset(Ljava/nio/charset/Charset;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object v0

    .line 122
    invoke-virtual {p0}, Lorg/apache/httpcore/config/ConnectionConfig;->getFragmentSizeHint()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setFragmentSizeHint(I)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object v0

    .line 123
    invoke-virtual {p0}, Lorg/apache/httpcore/config/ConnectionConfig;->getMalformedInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setMalformedInputAction(Ljava/nio/charset/CodingErrorAction;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object v0

    .line 124
    invoke-virtual {p0}, Lorg/apache/httpcore/config/ConnectionConfig;->getUnmappableInputAction()Ljava/nio/charset/CodingErrorAction;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setUnmappableInputAction(Ljava/nio/charset/CodingErrorAction;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object v0

    .line 125
    invoke-virtual {p0}, Lorg/apache/httpcore/config/ConnectionConfig;->getMessageConstraints()Lorg/apache/httpcore/config/MessageConstraints;

    move-result-object p0

    invoke-virtual {v0, p0}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->setMessageConstraints(Lorg/apache/httpcore/config/MessageConstraints;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static custom()Lorg/apache/httpcore/config/ConnectionConfig$Builder;
    .locals 1

    .line 114
    new-instance v0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;

    invoke-direct {v0}, Lorg/apache/httpcore/config/ConnectionConfig$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 43
    invoke-virtual {p0}, Lorg/apache/httpcore/config/ConnectionConfig;->clone()Lorg/apache/httpcore/config/ConnectionConfig;

    move-result-object v0

    return-object v0
.end method

.method protected clone()Lorg/apache/httpcore/config/ConnectionConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 97
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/config/ConnectionConfig;

    return-object v0
.end method

.method public getBufferSize()I
    .locals 1

    .line 72
    iget v0, p0, Lorg/apache/httpcore/config/ConnectionConfig;->bufferSize:I

    return v0
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .line 80
    iget-object v0, p0, Lorg/apache/httpcore/config/ConnectionConfig;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getFragmentSizeHint()I
    .locals 1

    .line 76
    iget v0, p0, Lorg/apache/httpcore/config/ConnectionConfig;->fragmentSizeHint:I

    return v0
.end method

.method public getMalformedInputAction()Ljava/nio/charset/CodingErrorAction;
    .locals 1

    .line 84
    iget-object v0, p0, Lorg/apache/httpcore/config/ConnectionConfig;->malformedInputAction:Ljava/nio/charset/CodingErrorAction;

    return-object v0
.end method

.method public getMessageConstraints()Lorg/apache/httpcore/config/MessageConstraints;
    .locals 1

    .line 92
    iget-object v0, p0, Lorg/apache/httpcore/config/ConnectionConfig;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    return-object v0
.end method

.method public getUnmappableInputAction()Ljava/nio/charset/CodingErrorAction;
    .locals 1

    .line 88
    iget-object v0, p0, Lorg/apache/httpcore/config/ConnectionConfig;->unmappableInputAction:Ljava/nio/charset/CodingErrorAction;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[bufferSize="

    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/httpcore/config/ConnectionConfig;->bufferSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", fragmentSizeHint="

    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/httpcore/config/ConnectionConfig;->fragmentSizeHint:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", charset="

    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/httpcore/config/ConnectionConfig;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", malformedInputAction="

    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/httpcore/config/ConnectionConfig;->malformedInputAction:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", unmappableInputAction="

    .line 107
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/httpcore/config/ConnectionConfig;->unmappableInputAction:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", messageConstraints="

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/httpcore/config/ConnectionConfig;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
