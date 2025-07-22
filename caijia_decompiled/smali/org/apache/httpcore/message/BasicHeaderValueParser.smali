.class public Lorg/apache/httpcore/message/BasicHeaderValueParser;
.super Ljava/lang/Object;
.source "BasicHeaderValueParser.java"

# interfaces
.implements Lorg/apache/httpcore/message/HeaderValueParser;


# static fields
.field public static final DEFAULT:Lorg/apache/httpcore/message/BasicHeaderValueParser;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private static final ELEM_DELIMITER:C = ','

.field public static final INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueParser;

.field private static final PARAM_DELIMITER:C = ';'

.field private static final TOKEN_DELIMS:Ljava/util/BitSet;

.field private static final VALUE_DELIMS:Ljava/util/BitSet;


# instance fields
.field private final tokenParser:Lorg/apache/httpcore/message/TokenParser;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    new-instance v0, Lorg/apache/httpcore/message/BasicHeaderValueParser;

    invoke-direct {v0}, Lorg/apache/httpcore/message/BasicHeaderValueParser;-><init>()V

    sput-object v0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->DEFAULT:Lorg/apache/httpcore/message/BasicHeaderValueParser;

    .line 63
    new-instance v0, Lorg/apache/httpcore/message/BasicHeaderValueParser;

    invoke-direct {v0}, Lorg/apache/httpcore/message/BasicHeaderValueParser;-><init>()V

    sput-object v0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueParser;

    const/4 v0, 0x3

    new-array v0, v0, [I

    .line 70
    fill-array-data v0, :array_0

    invoke-static {v0}, Lorg/apache/httpcore/message/TokenParser;->INIT_BITSET([I)Ljava/util/BitSet;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->TOKEN_DELIMS:Ljava/util/BitSet;

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 71
    fill-array-data v0, :array_1

    invoke-static {v0}, Lorg/apache/httpcore/message/TokenParser;->INIT_BITSET([I)Ljava/util/BitSet;

    move-result-object v0

    sput-object v0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->VALUE_DELIMS:Ljava/util/BitSet;

    return-void

    nop

    :array_0
    .array-data 4
        0x3d
        0x3b
        0x2c
    .end array-data

    :array_1
    .array-data 4
        0x3b
        0x2c
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    sget-object v0, Lorg/apache/httpcore/message/TokenParser;->INSTANCE:Lorg/apache/httpcore/message/TokenParser;

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->tokenParser:Lorg/apache/httpcore/message/TokenParser;

    return-void
.end method

.method public static parseElements(Ljava/lang/String;Lorg/apache/httpcore/message/HeaderValueParser;)[Lorg/apache/httpcore/HeaderElement;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Value"

    .line 91
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 94
    invoke-virtual {v0, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 95
    new-instance v1, Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 96
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueParser;

    .line 97
    :goto_0
    invoke-interface {p1, v0, v1}, Lorg/apache/httpcore/message/HeaderValueParser;->parseElements(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)[Lorg/apache/httpcore/HeaderElement;

    move-result-object p0

    return-object p0
.end method

.method public static parseHeaderElement(Ljava/lang/String;Lorg/apache/httpcore/message/HeaderValueParser;)Lorg/apache/httpcore/HeaderElement;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Value"

    .line 129
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 131
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 132
    invoke-virtual {v0, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 133
    new-instance v1, Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 134
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueParser;

    .line 135
    :goto_0
    invoke-interface {p1, v0, v1}, Lorg/apache/httpcore/message/HeaderValueParser;->parseHeaderElement(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/HeaderElement;

    move-result-object p0

    return-object p0
.end method

.method public static parseNameValuePair(Ljava/lang/String;Lorg/apache/httpcore/message/HeaderValueParser;)Lorg/apache/httpcore/NameValuePair;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Value"

    .line 223
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 225
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 226
    invoke-virtual {v0, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 227
    new-instance v1, Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 228
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueParser;

    .line 229
    :goto_0
    invoke-interface {p1, v0, v1}, Lorg/apache/httpcore/message/HeaderValueParser;->parseNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/NameValuePair;

    move-result-object p0

    return-object p0
.end method

.method public static parseParameters(Ljava/lang/String;Lorg/apache/httpcore/message/HeaderValueParser;)[Lorg/apache/httpcore/NameValuePair;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Value"

    .line 182
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 184
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 185
    invoke-virtual {v0, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 186
    new-instance v1, Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 187
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueParser;

    .line 188
    :goto_0
    invoke-interface {p1, v0, v1}, Lorg/apache/httpcore/message/HeaderValueParser;->parseParameters(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)[Lorg/apache/httpcore/NameValuePair;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected createHeaderElement(Ljava/lang/String;Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;)Lorg/apache/httpcore/HeaderElement;
    .locals 1

    .line 167
    new-instance v0, Lorg/apache/httpcore/message/BasicHeaderElement;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/httpcore/message/BasicHeaderElement;-><init>(Ljava/lang/String;Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;)V

    return-object v0
.end method

.method protected createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/NameValuePair;
    .locals 1

    .line 300
    new-instance v0, Lorg/apache/httpcore/message/BasicNameValuePair;

    invoke-direct {v0, p1, p2}, Lorg/apache/httpcore/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public parseElements(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)[Lorg/apache/httpcore/HeaderElement;
    .locals 3

    const-string v0, "Char array buffer"

    .line 105
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Parser cursor"

    .line 106
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 108
    :cond_0
    :goto_0
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v1

    if-nez v1, :cond_2

    .line 109
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->parseHeaderElement(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/HeaderElement;

    move-result-object v1

    .line 110
    invoke-interface {v1}, Lorg/apache/httpcore/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Lorg/apache/httpcore/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 111
    :cond_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 114
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Lorg/apache/httpcore/HeaderElement;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/httpcore/HeaderElement;

    return-object p1
.end method

.method public parseHeaderElement(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/HeaderElement;
    .locals 3

    const-string v0, "Char array buffer"

    .line 143
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Parser cursor"

    .line 144
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 145
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->parseNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/NameValuePair;

    move-result-object v0

    .line 147
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v1

    if-nez v1, :cond_0

    .line 148
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v1

    const/16 v2, 0x2c

    if-eq v1, v2, :cond_0

    .line 150
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->parseParameters(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)[Lorg/apache/httpcore/NameValuePair;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 153
    :goto_0
    invoke-interface {v0}, Lorg/apache/httpcore/NameValuePair;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0}, Lorg/apache/httpcore/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2, v0, p1}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->createHeaderElement(Ljava/lang/String;Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;)Lorg/apache/httpcore/HeaderElement;

    move-result-object p1

    return-object p1
.end method

.method public parseNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/NameValuePair;
    .locals 4

    const-string v0, "Char array buffer"

    .line 237
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Parser cursor"

    .line 238
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 240
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->tokenParser:Lorg/apache/httpcore/message/TokenParser;

    sget-object v1, Lorg/apache/httpcore/message/BasicHeaderValueParser;->TOKEN_DELIMS:Ljava/util/BitSet;

    invoke-virtual {v0, p1, p2, v1}, Lorg/apache/httpcore/message/TokenParser;->parseToken(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;)Ljava/lang/String;

    move-result-object v0

    .line 241
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 242
    new-instance p1, Lorg/apache/httpcore/message/BasicNameValuePair;

    invoke-direct {p1, v0, v2}, Lorg/apache/httpcore/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    .line 244
    :cond_0
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v1

    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v1

    .line 245
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p2, v3}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    const/16 v3, 0x3d

    if-eq v1, v3, :cond_1

    .line 247
    invoke-virtual {p0, v0, v2}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/NameValuePair;

    move-result-object p1

    return-object p1

    .line 249
    :cond_1
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->tokenParser:Lorg/apache/httpcore/message/TokenParser;

    sget-object v2, Lorg/apache/httpcore/message/BasicHeaderValueParser;->VALUE_DELIMS:Ljava/util/BitSet;

    invoke-virtual {v1, p1, p2, v2}, Lorg/apache/httpcore/message/TokenParser;->parseValue(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;)Ljava/lang/String;

    move-result-object p1

    .line 250
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v1

    if-nez v1, :cond_2

    .line 251
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p2, v1}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    .line 253
    :cond_2
    invoke-virtual {p0, v0, p1}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/NameValuePair;

    move-result-object p1

    return-object p1
.end method

.method public parseNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;[C)Lorg/apache/httpcore/NameValuePair;
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "Char array buffer"

    .line 263
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Parser cursor"

    .line 264
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 266
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    if-eqz p3, :cond_0

    .line 268
    array-length v1, p3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-char v3, p3, v2

    .line 269
    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/16 p3, 0x3d

    .line 272
    invoke-virtual {v0, p3}, Ljava/util/BitSet;->set(I)V

    .line 273
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->tokenParser:Lorg/apache/httpcore/message/TokenParser;

    invoke-virtual {v1, p1, p2, v0}, Lorg/apache/httpcore/message/TokenParser;->parseToken(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;)Ljava/lang/String;

    move-result-object v1

    .line 274
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 275
    new-instance p1, Lorg/apache/httpcore/message/BasicNameValuePair;

    invoke-direct {p1, v1, v3}, Lorg/apache/httpcore/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    .line 277
    :cond_1
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v2

    invoke-virtual {p1, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v2

    .line 278
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p2, v4}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    if-eq v2, p3, :cond_2

    .line 280
    invoke-virtual {p0, v1, v3}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/NameValuePair;

    move-result-object p1

    return-object p1

    .line 282
    :cond_2
    invoke-virtual {v0, p3}, Ljava/util/BitSet;->clear(I)V

    .line 283
    iget-object p3, p0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->tokenParser:Lorg/apache/httpcore/message/TokenParser;

    invoke-virtual {p3, p1, p2, v0}, Lorg/apache/httpcore/message/TokenParser;->parseValue(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;)Ljava/lang/String;

    move-result-object p1

    .line 284
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result p3

    if-nez p3, :cond_3

    .line 285
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result p3

    add-int/lit8 p3, p3, 0x1

    invoke-virtual {p2, p3}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    .line 287
    :cond_3
    invoke-virtual {p0, v1, p1}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->createNameValuePair(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/httpcore/NameValuePair;

    move-result-object p1

    return-object p1
.end method

.method public parseParameters(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)[Lorg/apache/httpcore/NameValuePair;
    .locals 3

    const-string v0, "Char array buffer"

    .line 197
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Parser cursor"

    .line 198
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 199
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->tokenParser:Lorg/apache/httpcore/message/TokenParser;

    invoke-virtual {v0, p1, p2}, Lorg/apache/httpcore/message/TokenParser;->skipWhiteSpace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V

    .line 200
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 201
    :cond_0
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v1

    if-nez v1, :cond_1

    .line 202
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicHeaderValueParser;->parseNameValuePair(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/NameValuePair;

    move-result-object v1

    .line 203
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v1

    const/16 v2, 0x2c

    if-ne v1, v2, :cond_0

    .line 209
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Lorg/apache/httpcore/NameValuePair;

    invoke-interface {v0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lorg/apache/httpcore/NameValuePair;

    return-object p1
.end method
