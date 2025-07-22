.class public Lorg/apache/commons/fileupload/ParameterParser;
.super Ljava/lang/Object;
.source "ParameterParser.java"


# instance fields
.field private chars:[C

.field private i1:I

.field private i2:I

.field private len:I

.field private lowerCaseNames:Z

.field private pos:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->chars:[C

    const/4 v0, 0x0

    .line 47
    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    .line 52
    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->len:I

    .line 57
    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    .line 62
    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    .line 67
    iput-boolean v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->lowerCaseNames:Z

    return-void
.end method

.method private getToken(Z)Ljava/lang/String;
    .locals 4

    .line 97
    :goto_0
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    iget v1, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/apache/commons/fileupload/ParameterParser;->chars:[C

    aget-char v0, v1, v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    goto :goto_0

    .line 101
    :cond_0
    :goto_1
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    iget v1, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    if-le v0, v1, :cond_1

    iget-object v1, p0, Lorg/apache/commons/fileupload/ParameterParser;->chars:[C

    add-int/lit8 v0, v0, -0x1

    aget-char v0, v1, v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 102
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    goto :goto_1

    :cond_1
    if-eqz p1, :cond_2

    .line 105
    iget p1, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    sub-int v1, p1, v0

    const/4 v2, 0x2

    if-lt v1, v2, :cond_2

    iget-object v1, p0, Lorg/apache/commons/fileupload/ParameterParser;->chars:[C

    aget-char v2, v1, v0

    const/16 v3, 0x22

    if-ne v2, v3, :cond_2

    add-int/lit8 v2, p1, -0x1

    aget-char v1, v1, v2

    if-ne v1, v3, :cond_2

    add-int/lit8 v0, v0, 0x1

    .line 109
    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    add-int/lit8 p1, p1, -0x1

    .line 110
    iput p1, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    :cond_2
    const/4 p1, 0x0

    .line 113
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    iget v1, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    if-le v0, v1, :cond_3

    .line 114
    new-instance p1, Ljava/lang/String;

    iget-object v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->chars:[C

    iget v1, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    iget v2, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    sub-int/2addr v2, v1

    invoke-direct {p1, v0, v1, v2}, Ljava/lang/String;-><init>([CII)V

    :cond_3
    return-object p1
.end method

.method private hasChar()Z
    .locals 2

    .line 83
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    iget v1, p0, Lorg/apache/commons/fileupload/ParameterParser;->len:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isOneOf(C[C)Z
    .locals 4

    .line 130
    array-length v0, p2

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-char v3, p2, v2

    if-ne p1, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v1
.end method

.method private parseQuotedToken([C)Ljava/lang/String;
    .locals 6

    .line 175
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    .line 176
    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 179
    :goto_0
    invoke-direct {p0}, Lorg/apache/commons/fileupload/ParameterParser;->hasChar()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_3

    .line 180
    iget-object v3, p0, Lorg/apache/commons/fileupload/ParameterParser;->chars:[C

    iget v5, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    aget-char v3, v3, v5

    if-nez v1, :cond_0

    .line 181
    invoke-direct {p0, v3, p1}, Lorg/apache/commons/fileupload/ParameterParser;->isOneOf(C[C)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_2

    :cond_0
    if-nez v2, :cond_1

    const/16 v5, 0x22

    if-ne v3, v5, :cond_1

    xor-int/lit8 v1, v1, 0x1

    :cond_1
    if-nez v2, :cond_2

    const/16 v2, 0x5c

    if-ne v3, v2, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    .line 188
    :goto_1
    iget v3, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    add-int/2addr v3, v4

    iput v3, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    .line 189
    iget v3, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    add-int/2addr v3, v4

    iput v3, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    goto :goto_0

    .line 192
    :cond_3
    :goto_2
    invoke-direct {p0, v4}, Lorg/apache/commons/fileupload/ParameterParser;->getToken(Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseToken([C)Ljava/lang/String;
    .locals 2

    .line 150
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i1:I

    .line 151
    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    .line 152
    :goto_0
    invoke-direct {p0}, Lorg/apache/commons/fileupload/ParameterParser;->hasChar()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 153
    iget-object v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->chars:[C

    iget v1, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    aget-char v0, v0, v1

    .line 154
    invoke-direct {p0, v0, p1}, Lorg/apache/commons/fileupload/ParameterParser;->isOneOf(C[C)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 157
    :cond_0
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->i2:I

    .line 158
    iget v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    goto :goto_0

    :cond_1
    :goto_1
    const/4 p1, 0x0

    .line 160
    invoke-direct {p0, p1}, Lorg/apache/commons/fileupload/ParameterParser;->getToken(Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public isLowerCaseNames()Z
    .locals 1

    .line 204
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/ParameterParser;->lowerCaseNames:Z

    return v0
.end method

.method public parse(Ljava/lang/String;C)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "C)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 258
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    return-object p1

    .line 260
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/fileupload/ParameterParser;->parse([CC)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public parse(Ljava/lang/String;[C)Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[C)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-eqz p2, :cond_3

    .line 230
    array-length v0, p2

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    .line 233
    aget-char v1, p2, v0

    if-eqz p1, :cond_2

    .line 235
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 236
    array-length v3, p2

    :goto_0
    if-ge v0, v3, :cond_2

    aget-char v4, p2, v0

    .line 237
    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    if-ge v5, v2, :cond_1

    move v1, v4

    move v2, v5

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 244
    :cond_2
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/fileupload/ParameterParser;->parse(Ljava/lang/String;C)Ljava/util/Map;

    move-result-object p1

    return-object p1

    .line 231
    :cond_3
    :goto_1
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    return-object p1
.end method

.method public parse([CC)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([CC)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 275
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    return-object p1

    :cond_0
    const/4 v0, 0x0

    .line 277
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1, p2}, Lorg/apache/commons/fileupload/ParameterParser;->parse([CIIC)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public parse([CIIC)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([CIIC)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 299
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    return-object p1

    .line 301
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 302
    iput-object p1, p0, Lorg/apache/commons/fileupload/ParameterParser;->chars:[C

    .line 303
    iput p2, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    .line 304
    iput p3, p0, Lorg/apache/commons/fileupload/ParameterParser;->len:I

    .line 308
    :cond_1
    :goto_0
    invoke-direct {p0}, Lorg/apache/commons/fileupload/ParameterParser;->hasChar()Z

    move-result p2

    if-eqz p2, :cond_5

    const/4 p2, 0x2

    new-array p2, p2, [C

    const/16 p3, 0x3d

    const/4 v1, 0x0

    aput-char p3, p2, v1

    const/4 v2, 0x1

    aput-char p4, p2, v2

    .line 309
    invoke-direct {p0, p2}, Lorg/apache/commons/fileupload/ParameterParser;->parseToken([C)Ljava/lang/String;

    move-result-object p2

    const/4 v3, 0x0

    .line 312
    invoke-direct {p0}, Lorg/apache/commons/fileupload/ParameterParser;->hasChar()Z

    move-result v4

    if-eqz v4, :cond_2

    iget v4, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    aget-char v5, p1, v4

    if-ne v5, p3, :cond_2

    add-int/lit8 v4, v4, 0x1

    .line 313
    iput v4, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    new-array p3, v2, [C

    aput-char p4, p3, v1

    .line 314
    invoke-direct {p0, p3}, Lorg/apache/commons/fileupload/ParameterParser;->parseQuotedToken([C)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 319
    :try_start_0
    invoke-static {v3}, Lorg/apache/commons/fileupload/util/mime/MimeUtility;->decodeText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    nop

    .line 325
    :cond_2
    :goto_1
    invoke-direct {p0}, Lorg/apache/commons/fileupload/ParameterParser;->hasChar()Z

    move-result p3

    if-eqz p3, :cond_3

    iget p3, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    aget-char v1, p1, p3

    if-ne v1, p4, :cond_3

    add-int/lit8 p3, p3, 0x1

    .line 326
    iput p3, p0, Lorg/apache/commons/fileupload/ParameterParser;->pos:I

    :cond_3
    if-eqz p2, :cond_1

    .line 328
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p3

    if-lez p3, :cond_1

    .line 329
    iget-boolean p3, p0, Lorg/apache/commons/fileupload/ParameterParser;->lowerCaseNames:Z

    if-eqz p3, :cond_4

    .line 330
    sget-object p3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p2, p3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    .line 333
    :cond_4
    invoke-virtual {v0, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_5
    return-object v0
.end method

.method public setLowerCaseNames(Z)V
    .locals 0

    .line 216
    iput-boolean p1, p0, Lorg/apache/commons/fileupload/ParameterParser;->lowerCaseNames:Z

    return-void
.end method
