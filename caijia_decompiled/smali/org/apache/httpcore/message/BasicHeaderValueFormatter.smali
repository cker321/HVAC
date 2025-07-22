.class public Lorg/apache/httpcore/message/BasicHeaderValueFormatter;
.super Ljava/lang/Object;
.source "BasicHeaderValueFormatter.java"

# interfaces
.implements Lorg/apache/httpcore/message/HeaderValueFormatter;


# static fields
.field public static final DEFAULT:Lorg/apache/httpcore/message/BasicHeaderValueFormatter;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

.field public static final SEPARATORS:Ljava/lang/String; = " ;,:@()<>\\\"/[]?={}\t"

.field public static final UNSAFE_CHARS:Ljava/lang/String; = "\"\\"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 56
    new-instance v0, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

    invoke-direct {v0}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;-><init>()V

    sput-object v0, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->DEFAULT:Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

    .line 58
    new-instance v0, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

    invoke-direct {v0}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;-><init>()V

    sput-object v0, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatElements([Lorg/apache/httpcore/HeaderElement;ZLorg/apache/httpcore/message/HeaderValueFormatter;)Ljava/lang/String;
    .locals 1

    if-eqz p2, :cond_0

    goto :goto_0

    .line 92
    :cond_0
    sget-object p2, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

    :goto_0
    const/4 v0, 0x0

    .line 93
    invoke-interface {p2, v0, p0, p1}, Lorg/apache/httpcore/message/HeaderValueFormatter;->formatElements(Lorg/apache/httpcore/util/CharArrayBuffer;[Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/util/CharArrayBuffer;

    move-result-object p0

    invoke-virtual {p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static formatHeaderElement(Lorg/apache/httpcore/HeaderElement;ZLorg/apache/httpcore/message/HeaderValueFormatter;)Ljava/lang/String;
    .locals 1

    if-eqz p2, :cond_0

    goto :goto_0

    .line 159
    :cond_0
    sget-object p2, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

    :goto_0
    const/4 v0, 0x0

    .line 160
    invoke-interface {p2, v0, p0, p1}, Lorg/apache/httpcore/message/HeaderValueFormatter;->formatHeaderElement(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/util/CharArrayBuffer;

    move-result-object p0

    invoke-virtual {p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static formatNameValuePair(Lorg/apache/httpcore/NameValuePair;ZLorg/apache/httpcore/message/HeaderValueFormatter;)Ljava/lang/String;
    .locals 1

    if-eqz p2, :cond_0

    goto :goto_0

    .line 311
    :cond_0
    sget-object p2, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

    :goto_0
    const/4 v0, 0x0

    .line 312
    invoke-interface {p2, v0, p0, p1}, Lorg/apache/httpcore/message/HeaderValueFormatter;->formatNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/util/CharArrayBuffer;

    move-result-object p0

    invoke-virtual {p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static formatParameters([Lorg/apache/httpcore/NameValuePair;ZLorg/apache/httpcore/message/HeaderValueFormatter;)Ljava/lang/String;
    .locals 1

    if-eqz p2, :cond_0

    goto :goto_0

    .line 245
    :cond_0
    sget-object p2, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueFormatter;

    :goto_0
    const/4 v0, 0x0

    .line 246
    invoke-interface {p2, v0, p0, p1}, Lorg/apache/httpcore/message/HeaderValueFormatter;->formatParameters(Lorg/apache/httpcore/util/CharArrayBuffer;[Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/util/CharArrayBuffer;

    move-result-object p0

    invoke-virtual {p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected doFormatValue(Lorg/apache/httpcore/util/CharArrayBuffer;Ljava/lang/String;Z)V
    .locals 4

    const/4 v0, 0x0

    if-nez p3, :cond_0

    const/4 v1, 0x0

    .line 379
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    if-nez p3, :cond_0

    .line 380
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result p3

    invoke-virtual {p0, p3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->isSeparator(C)Z

    move-result p3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/16 v1, 0x22

    if-eqz p3, :cond_1

    .line 385
    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(C)V

    .line 387
    :cond_1
    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 388
    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 389
    invoke-virtual {p0, v2}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->isUnsafe(C)Z

    move-result v3

    if-eqz v3, :cond_2

    const/16 v3, 0x5c

    .line 390
    invoke-virtual {p1, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(C)V

    .line 392
    :cond_2
    invoke-virtual {p1, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(C)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    if-eqz p3, :cond_4

    .line 395
    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(C)V

    :cond_4
    return-void
.end method

.method protected estimateElementsLen([Lorg/apache/httpcore/HeaderElement;)I
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 130
    array-length v1, p1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    goto :goto_1

    .line 134
    :cond_0
    array-length v1, p1

    sub-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x2

    .line 135
    array-length v2, p1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, p1, v0

    .line 136
    invoke-virtual {p0, v3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->estimateHeaderElementLen(Lorg/apache/httpcore/HeaderElement;)I

    move-result v3

    add-int/2addr v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_1
    return v0
.end method

.method protected estimateHeaderElementLen(Lorg/apache/httpcore/HeaderElement;)I
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 209
    :cond_0
    invoke-interface {p1}, Lorg/apache/httpcore/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    .line 210
    invoke-interface {p1}, Lorg/apache/httpcore/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 213
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x3

    add-int/2addr v1, v2

    .line 216
    :cond_1
    invoke-interface {p1}, Lorg/apache/httpcore/HeaderElement;->getParameterCount()I

    move-result v2

    if-lez v2, :cond_2

    :goto_0
    if-ge v0, v2, :cond_2

    .line 220
    invoke-interface {p1, v0}, Lorg/apache/httpcore/HeaderElement;->getParameter(I)Lorg/apache/httpcore/NameValuePair;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->estimateNameValuePairLen(Lorg/apache/httpcore/NameValuePair;)I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    add-int/2addr v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method protected estimateNameValuePairLen(Lorg/apache/httpcore/NameValuePair;)I
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 353
    :cond_0
    invoke-interface {p1}, Lorg/apache/httpcore/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    .line 354
    invoke-interface {p1}, Lorg/apache/httpcore/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 357
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, 0x3

    add-int/2addr v0, p1

    :cond_1
    return v0
.end method

.method protected estimateParametersLen([Lorg/apache/httpcore/NameValuePair;)I
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 283
    array-length v1, p1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    goto :goto_1

    .line 287
    :cond_0
    array-length v1, p1

    sub-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0x2

    .line 288
    array-length v2, p1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, p1, v0

    .line 289
    invoke-virtual {p0, v3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->estimateNameValuePairLen(Lorg/apache/httpcore/NameValuePair;)I

    move-result v3

    add-int/2addr v1, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return v1

    :cond_2
    :goto_1
    return v0
.end method

.method public formatElements(Lorg/apache/httpcore/util/CharArrayBuffer;[Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/util/CharArrayBuffer;
    .locals 2

    const-string v0, "Header element array"

    .line 102
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 103
    invoke-virtual {p0, p2}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->estimateElementsLen([Lorg/apache/httpcore/HeaderElement;)I

    move-result v0

    if-nez p1, :cond_0

    .line 106
    new-instance p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-direct {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    goto :goto_0

    .line 108
    :cond_0
    invoke-virtual {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->ensureCapacity(I)V

    :goto_0
    const/4 v0, 0x0

    .line 111
    :goto_1
    array-length v1, p2

    if-ge v0, v1, :cond_2

    if-lez v0, :cond_1

    const-string v1, ", "

    .line 113
    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 115
    :cond_1
    aget-object v1, p2, v0

    invoke-virtual {p0, p1, v1, p3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->formatHeaderElement(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/util/CharArrayBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-object p1
.end method

.method public formatHeaderElement(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/HeaderElement;Z)Lorg/apache/httpcore/util/CharArrayBuffer;
    .locals 3

    const-string v0, "Header element"

    .line 169
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 170
    invoke-virtual {p0, p2}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->estimateHeaderElementLen(Lorg/apache/httpcore/HeaderElement;)I

    move-result v0

    if-nez p1, :cond_0

    .line 173
    new-instance p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-direct {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    goto :goto_0

    .line 175
    :cond_0
    invoke-virtual {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->ensureCapacity(I)V

    .line 178
    :goto_0
    invoke-interface {p2}, Lorg/apache/httpcore/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 179
    invoke-interface {p2}, Lorg/apache/httpcore/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/16 v1, 0x3d

    .line 181
    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(C)V

    .line 182
    invoke-virtual {p0, p1, v0, p3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->doFormatValue(Lorg/apache/httpcore/util/CharArrayBuffer;Ljava/lang/String;Z)V

    .line 185
    :cond_1
    invoke-interface {p2}, Lorg/apache/httpcore/HeaderElement;->getParameterCount()I

    move-result v0

    if-lez v0, :cond_2

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_2

    const-string v2, "; "

    .line 188
    invoke-virtual {p1, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 189
    invoke-interface {p2, v1}, Lorg/apache/httpcore/HeaderElement;->getParameter(I)Lorg/apache/httpcore/NameValuePair;

    move-result-object v2

    invoke-virtual {p0, p1, v2, p3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->formatNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/util/CharArrayBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return-object p1
.end method

.method public formatNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/util/CharArrayBuffer;
    .locals 1

    const-string v0, "Name / value pair"

    .line 321
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 322
    invoke-virtual {p0, p2}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->estimateNameValuePairLen(Lorg/apache/httpcore/NameValuePair;)I

    move-result v0

    if-nez p1, :cond_0

    .line 325
    new-instance p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-direct {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    goto :goto_0

    .line 327
    :cond_0
    invoke-virtual {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->ensureCapacity(I)V

    .line 330
    :goto_0
    invoke-interface {p2}, Lorg/apache/httpcore/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 331
    invoke-interface {p2}, Lorg/apache/httpcore/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    const/16 v0, 0x3d

    .line 333
    invoke-virtual {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(C)V

    .line 334
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->doFormatValue(Lorg/apache/httpcore/util/CharArrayBuffer;Ljava/lang/String;Z)V

    :cond_1
    return-object p1
.end method

.method public formatParameters(Lorg/apache/httpcore/util/CharArrayBuffer;[Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/util/CharArrayBuffer;
    .locals 2

    const-string v0, "Header parameter array"

    .line 255
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 256
    invoke-virtual {p0, p2}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->estimateParametersLen([Lorg/apache/httpcore/NameValuePair;)I

    move-result v0

    if-nez p1, :cond_0

    .line 259
    new-instance p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-direct {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    goto :goto_0

    .line 261
    :cond_0
    invoke-virtual {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->ensureCapacity(I)V

    :goto_0
    const/4 v0, 0x0

    .line 264
    :goto_1
    array-length v1, p2

    if-ge v0, v1, :cond_2

    if-lez v0, :cond_1

    const-string v1, "; "

    .line 266
    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 268
    :cond_1
    aget-object v1, p2, v0

    invoke-virtual {p0, p1, v1, p3}, Lorg/apache/httpcore/message/BasicHeaderValueFormatter;->formatNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/NameValuePair;Z)Lorg/apache/httpcore/util/CharArrayBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    return-object p1
.end method

.method protected isSeparator(C)Z
    .locals 1

    const-string v0, " ;,:@()<>\\\"/[]?={}\t"

    .line 409
    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected isUnsafe(C)Z
    .locals 1

    const-string v0, "\"\\"

    .line 422
    invoke-virtual {v0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
