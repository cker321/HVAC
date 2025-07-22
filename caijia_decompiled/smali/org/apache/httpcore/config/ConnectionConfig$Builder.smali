.class public Lorg/apache/httpcore/config/ConnectionConfig$Builder;
.super Ljava/lang/Object;
.source "ConnectionConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/httpcore/config/ConnectionConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private bufferSize:I

.field private charset:Ljava/nio/charset/Charset;

.field private fragmentSizeHint:I

.field private malformedInputAction:Ljava/nio/charset/CodingErrorAction;

.field private messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

.field private unmappableInputAction:Ljava/nio/charset/CodingErrorAction;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 138
    iput v0, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->fragmentSizeHint:I

    return-void
.end method


# virtual methods
.method public build()Lorg/apache/httpcore/config/ConnectionConfig;
    .locals 8

    .line 178
    iget-object v0, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->charset:Ljava/nio/charset/Charset;

    if-nez v0, :cond_1

    .line 179
    iget-object v1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->malformedInputAction:Ljava/nio/charset/CodingErrorAction;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->unmappableInputAction:Ljava/nio/charset/CodingErrorAction;

    if-eqz v1, :cond_1

    .line 180
    :cond_0
    sget-object v0, Lorg/apache/httpcore/Consts;->ASCII:Ljava/nio/charset/Charset;

    :cond_1
    move-object v4, v0

    .line 182
    iget v0, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->bufferSize:I

    if-lez v0, :cond_2

    move v2, v0

    goto :goto_0

    :cond_2
    const/16 v0, 0x2000

    const/16 v2, 0x2000

    .line 183
    :goto_0
    iget v0, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->fragmentSizeHint:I

    if-ltz v0, :cond_3

    move v3, v0

    goto :goto_1

    :cond_3
    move v3, v2

    .line 184
    :goto_1
    new-instance v0, Lorg/apache/httpcore/config/ConnectionConfig;

    iget-object v5, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->malformedInputAction:Ljava/nio/charset/CodingErrorAction;

    iget-object v6, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->unmappableInputAction:Ljava/nio/charset/CodingErrorAction;

    iget-object v7, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lorg/apache/httpcore/config/ConnectionConfig;-><init>(IILjava/nio/charset/Charset;Ljava/nio/charset/CodingErrorAction;Ljava/nio/charset/CodingErrorAction;Lorg/apache/httpcore/config/MessageConstraints;)V

    return-object v0
.end method

.method public setBufferSize(I)Lorg/apache/httpcore/config/ConnectionConfig$Builder;
    .locals 0

    .line 142
    iput p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->bufferSize:I

    return-object p0
.end method

.method public setCharset(Ljava/nio/charset/Charset;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;
    .locals 0

    .line 152
    iput-object p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->charset:Ljava/nio/charset/Charset;

    return-object p0
.end method

.method public setFragmentSizeHint(I)Lorg/apache/httpcore/config/ConnectionConfig$Builder;
    .locals 0

    .line 147
    iput p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->fragmentSizeHint:I

    return-object p0
.end method

.method public setMalformedInputAction(Ljava/nio/charset/CodingErrorAction;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;
    .locals 0

    .line 157
    iput-object p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->malformedInputAction:Ljava/nio/charset/CodingErrorAction;

    if-eqz p1, :cond_0

    .line 158
    iget-object p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->charset:Ljava/nio/charset/Charset;

    if-nez p1, :cond_0

    .line 159
    sget-object p1, Lorg/apache/httpcore/Consts;->ASCII:Ljava/nio/charset/Charset;

    iput-object p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->charset:Ljava/nio/charset/Charset;

    :cond_0
    return-object p0
.end method

.method public setMessageConstraints(Lorg/apache/httpcore/config/MessageConstraints;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;
    .locals 0

    .line 173
    iput-object p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    return-object p0
.end method

.method public setUnmappableInputAction(Ljava/nio/charset/CodingErrorAction;)Lorg/apache/httpcore/config/ConnectionConfig$Builder;
    .locals 0

    .line 165
    iput-object p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->unmappableInputAction:Ljava/nio/charset/CodingErrorAction;

    if-eqz p1, :cond_0

    .line 166
    iget-object p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->charset:Ljava/nio/charset/Charset;

    if-nez p1, :cond_0

    .line 167
    sget-object p1, Lorg/apache/httpcore/Consts;->ASCII:Ljava/nio/charset/Charset;

    iput-object p1, p0, Lorg/apache/httpcore/config/ConnectionConfig$Builder;->charset:Ljava/nio/charset/Charset;

    :cond_0
    return-object p0
.end method
