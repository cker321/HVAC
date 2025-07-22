.class public Lorg/apache/httpcore/message/BasicLineParser;
.super Ljava/lang/Object;
.source "BasicLineParser.java"

# interfaces
.implements Lorg/apache/httpcore/message/LineParser;


# static fields
.field public static final DEFAULT:Lorg/apache/httpcore/message/BasicLineParser;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;


# instance fields
.field protected final protocol:Lorg/apache/httpcore/ProtocolVersion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 72
    new-instance v0, Lorg/apache/httpcore/message/BasicLineParser;

    invoke-direct {v0}, Lorg/apache/httpcore/message/BasicLineParser;-><init>()V

    sput-object v0, Lorg/apache/httpcore/message/BasicLineParser;->DEFAULT:Lorg/apache/httpcore/message/BasicLineParser;

    .line 74
    new-instance v0, Lorg/apache/httpcore/message/BasicLineParser;

    invoke-direct {v0}, Lorg/apache/httpcore/message/BasicLineParser;-><init>()V

    sput-object v0, Lorg/apache/httpcore/message/BasicLineParser;->INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 99
    invoke-direct {p0, v0}, Lorg/apache/httpcore/message/BasicLineParser;-><init>(Lorg/apache/httpcore/ProtocolVersion;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/ProtocolVersion;)V
    .locals 0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 91
    :cond_0
    sget-object p1, Lorg/apache/httpcore/HttpVersion;->HTTP_1_1:Lorg/apache/httpcore/HttpVersion;

    :goto_0
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicLineParser;->protocol:Lorg/apache/httpcore/ProtocolVersion;

    return-void
.end method

.method public static parseHeader(Ljava/lang/String;Lorg/apache/httpcore/message/LineParser;)Lorg/apache/httpcore/Header;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Value"

    .line 430
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 432
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 433
    invoke-virtual {v0, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 434
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicLineParser;->INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;

    .line 435
    :goto_0
    invoke-interface {p1, v0}, Lorg/apache/httpcore/message/LineParser;->parseHeader(Lorg/apache/httpcore/util/CharArrayBuffer;)Lorg/apache/httpcore/Header;

    move-result-object p0

    return-object p0
.end method

.method public static parseProtocolVersion(Ljava/lang/String;Lorg/apache/httpcore/message/LineParser;)Lorg/apache/httpcore/ProtocolVersion;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Value"

    .line 106
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 108
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 109
    invoke-virtual {v0, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 110
    new-instance v1, Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 111
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicLineParser;->INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;

    .line 112
    :goto_0
    invoke-interface {p1, v0, v1}, Lorg/apache/httpcore/message/LineParser;->parseProtocolVersion(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/ProtocolVersion;

    move-result-object p0

    return-object p0
.end method

.method public static parseRequestLine(Ljava/lang/String;Lorg/apache/httpcore/message/LineParser;)Lorg/apache/httpcore/RequestLine;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Value"

    .line 257
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 259
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 260
    invoke-virtual {v0, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 261
    new-instance v1, Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 262
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicLineParser;->INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;

    .line 263
    :goto_0
    invoke-interface {p1, v0, v1}, Lorg/apache/httpcore/message/LineParser;->parseRequestLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/RequestLine;

    move-result-object p0

    return-object p0
.end method

.method public static parseStatusLine(Ljava/lang/String;Lorg/apache/httpcore/message/LineParser;)Lorg/apache/httpcore/StatusLine;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Value"

    .line 345
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 347
    new-instance v0, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    .line 348
    invoke-virtual {v0, p0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 349
    new-instance v1, Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v2, 0x0

    invoke-direct {v1, v2, p0}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 350
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicLineParser;->INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;

    .line 351
    :goto_0
    invoke-interface {p1, v0, v1}, Lorg/apache/httpcore/message/LineParser;->parseStatusLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/StatusLine;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method protected createProtocolVersion(II)Lorg/apache/httpcore/ProtocolVersion;
    .locals 1

    .line 201
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicLineParser;->protocol:Lorg/apache/httpcore/ProtocolVersion;

    invoke-virtual {v0, p1, p2}, Lorg/apache/httpcore/ProtocolVersion;->forVersion(II)Lorg/apache/httpcore/ProtocolVersion;

    move-result-object p1

    return-object p1
.end method

.method protected createRequestLine(Ljava/lang/String;Ljava/lang/String;Lorg/apache/httpcore/ProtocolVersion;)Lorg/apache/httpcore/RequestLine;
    .locals 1

    .line 337
    new-instance v0, Lorg/apache/httpcore/message/BasicRequestLine;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/httpcore/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/httpcore/ProtocolVersion;)V

    return-object v0
.end method

.method protected createStatusLine(Lorg/apache/httpcore/ProtocolVersion;ILjava/lang/String;)Lorg/apache/httpcore/StatusLine;
    .locals 1

    .line 422
    new-instance v0, Lorg/apache/httpcore/message/BasicStatusLine;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/httpcore/message/BasicStatusLine;-><init>(Lorg/apache/httpcore/ProtocolVersion;ILjava/lang/String;)V

    return-object v0
.end method

.method public hasProtocolVersion(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Z
    .locals 8

    const-string v0, "Char array buffer"

    .line 210
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Parser cursor"

    .line 211
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 212
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result p2

    .line 214
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicLineParser;->protocol:Lorg/apache/httpcore/ProtocolVersion;

    invoke-virtual {v0}, Lorg/apache/httpcore/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v0

    .line 215
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 217
    invoke-virtual {p1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v2

    add-int/lit8 v3, v1, 0x4

    const/4 v4, 0x0

    if-ge v2, v3, :cond_0

    return v4

    :cond_0
    if-gez p2, :cond_1

    .line 225
    invoke-virtual {p1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result p2

    add-int/lit8 p2, p2, -0x4

    sub-int/2addr p2, v1

    goto :goto_1

    :cond_1
    if-nez p2, :cond_2

    .line 228
    :goto_0
    invoke-virtual {p1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v2

    if-ge p2, v2, :cond_2

    .line 229
    invoke-virtual {p1, p2}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lorg/apache/httpcore/protocol/HTTP;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_2

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    add-int v2, p2, v1

    add-int/lit8 v3, v2, 0x4

    .line 235
    invoke-virtual {p1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v5

    if-le v3, v5, :cond_3

    return v4

    :cond_3
    const/4 v3, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x0

    :goto_2
    if-eqz v5, :cond_5

    if-ge v6, v1, :cond_5

    add-int v5, p2, v6

    .line 243
    invoke-virtual {p1, v5}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v5

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v5, v7, :cond_4

    const/4 v5, 0x1

    goto :goto_3

    :cond_4
    const/4 v5, 0x0

    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_5
    if-eqz v5, :cond_7

    .line 246
    invoke-virtual {p1, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result p1

    const/16 p2, 0x2f

    if-ne p1, p2, :cond_6

    const/4 v4, 0x1

    :cond_6
    move v5, v4

    :cond_7
    return v5
.end method

.method public parseHeader(Lorg/apache/httpcore/util/CharArrayBuffer;)Lorg/apache/httpcore/Header;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    .line 445
    new-instance v0, Lorg/apache/httpcore/message/BufferedHeader;

    invoke-direct {v0, p1}, Lorg/apache/httpcore/message/BufferedHeader;-><init>(Lorg/apache/httpcore/util/CharArrayBuffer;)V

    return-object v0
.end method

.method public parseProtocolVersion(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/ProtocolVersion;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Char array buffer"

    .line 120
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Parser cursor"

    .line 121
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 122
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicLineParser;->protocol:Lorg/apache/httpcore/ProtocolVersion;

    invoke-virtual {v0}, Lorg/apache/httpcore/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v0

    .line 123
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 125
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v2

    .line 126
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getUpperBound()I

    move-result v3

    .line 128
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicLineParser;->skipWhitespace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V

    .line 130
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v4

    add-int v5, v4, v1

    add-int/lit8 v6, v5, 0x4

    const-string v7, "Not a valid protocol version: "

    if-gt v6, v3, :cond_7

    const/4 v6, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x1

    const/4 v10, 0x0

    :goto_0
    if-eqz v9, :cond_1

    if-ge v10, v1, :cond_1

    add-int v9, v4, v10

    .line 142
    invoke-virtual {p1, v9}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v9

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-ne v9, v11, :cond_0

    const/4 v9, 0x1

    goto :goto_1

    :cond_0
    const/4 v9, 0x0

    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_1
    if-eqz v9, :cond_3

    .line 145
    invoke-virtual {p1, v5}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v0

    const/16 v5, 0x2f

    if-ne v0, v5, :cond_2

    const/4 v6, 0x1

    :cond_2
    move v9, v6

    :cond_3
    if-eqz v9, :cond_6

    add-int/2addr v1, v8

    add-int/2addr v4, v1

    const/16 v0, 0x2e

    .line 155
    invoke-virtual {p1, v0, v4, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->indexOf(III)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_5

    .line 163
    :try_start_0
    invoke-virtual {p1, v4, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    add-int/2addr v0, v8

    const/16 v5, 0x20

    .line 171
    invoke-virtual {p1, v5, v0, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->indexOf(III)I

    move-result v5

    if-ne v5, v1, :cond_4

    move v5, v3

    .line 177
    :cond_4
    :try_start_1
    invoke-virtual {p1, v0, v5}, Lorg/apache/httpcore/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 184
    invoke-virtual {p2, v5}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    .line 186
    invoke-virtual {p0, v4, p1}, Lorg/apache/httpcore/message/BasicLineParser;->createProtocolVersion(II)Lorg/apache/httpcore/ProtocolVersion;

    move-result-object p1

    return-object p1

    .line 179
    :catch_0
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid protocol minor version number: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    invoke-virtual {p1, v2, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 165
    :catch_1
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid protocol major version number: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    invoke-virtual {p1, v2, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 157
    :cond_5
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid protocol version number: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    invoke-virtual {p1, v2, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 148
    :cond_6
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    invoke-virtual {p1, v2, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 134
    :cond_7
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    invoke-virtual {p1, v2, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p2

    :goto_3
    goto :goto_2
.end method

.method public parseRequestLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/RequestLine;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Invalid request line: "

    const-string v1, "Char array buffer"

    .line 280
    invoke-static {p1, v1}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v1, "Parser cursor"

    .line 281
    invoke-static {p2, v1}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 282
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v1

    .line 283
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getUpperBound()I

    move-result v2

    .line 286
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicLineParser;->skipWhitespace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V

    .line 287
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v3

    const/16 v4, 0x20

    .line 289
    invoke-virtual {p1, v4, v3, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->indexOf(III)I

    move-result v5

    if-ltz v5, :cond_2

    .line 294
    invoke-virtual {p1, v3, v5}, Lorg/apache/httpcore/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v3

    .line 295
    invoke-virtual {p2, v5}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    .line 297
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicLineParser;->skipWhitespace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V

    .line 298
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v5

    .line 300
    invoke-virtual {p1, v4, v5, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->indexOf(III)I

    move-result v4

    if-ltz v4, :cond_1

    .line 305
    invoke-virtual {p1, v5, v4}, Lorg/apache/httpcore/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v5

    .line 306
    invoke-virtual {p2, v4}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    .line 308
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicLineParser;->parseProtocolVersion(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v4

    .line 310
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicLineParser;->skipWhitespace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V

    .line 311
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 316
    invoke-virtual {p0, v3, v5, v4}, Lorg/apache/httpcore/message/BasicLineParser;->createRequestLine(Ljava/lang/String;Ljava/lang/String;Lorg/apache/httpcore/ProtocolVersion;)Lorg/apache/httpcore/RequestLine;

    move-result-object p1

    return-object p1

    .line 312
    :cond_0
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    invoke-virtual {p1, v1, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p2, v3}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 302
    :cond_1
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    invoke-virtual {p1, v1, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p2, v3}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 291
    :cond_2
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    invoke-virtual {p1, v1, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p2, v3}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 318
    :catch_0
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    invoke-virtual {p1, v1, v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public parseStatusLine(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/StatusLine;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation

    const-string v0, "Char array buffer"

    .line 359
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Parser cursor"

    .line 360
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 361
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v0

    .line 362
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getUpperBound()I

    move-result v1

    .line 366
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicLineParser;->parseProtocolVersion(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v2

    .line 369
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/BasicLineParser;->skipWhitespace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V

    .line 370
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result p2

    const/16 v3, 0x20

    .line 372
    invoke-virtual {p1, v3, p2, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->indexOf(III)I

    move-result v3

    if-gez v3, :cond_0

    move v3, v1

    .line 377
    :cond_0
    invoke-virtual {p1, p2, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object p2

    const/4 v4, 0x0

    .line 378
    :goto_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_1

    const-string v6, "Status line contains invalid status code: "

    if-ge v4, v5, :cond_2

    .line 379
    :try_start_1
    invoke-virtual {p2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_1

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 380
    :cond_1
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    invoke-virtual {p1, v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v2}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    .line 386
    :cond_2
    :try_start_2
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_1

    if-ge v3, v1, :cond_3

    .line 396
    :try_start_3
    invoke-virtual {p1, v3, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_3
    const-string v3, ""

    .line 400
    :goto_1
    invoke-virtual {p0, v2, p2, v3}, Lorg/apache/httpcore/message/BasicLineParser;->createStatusLine(Lorg/apache/httpcore/ProtocolVersion;ILjava/lang/String;)Lorg/apache/httpcore/StatusLine;

    move-result-object p1

    return-object p1

    .line 388
    :catch_0
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    invoke-virtual {p1, v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v2}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_1

    .line 403
    :catch_1
    new-instance p2, Lorg/apache/httpcore/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid status line: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    invoke-virtual {p1, v0, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/apache/httpcore/ParseException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p2

    :goto_3
    goto :goto_2
.end method

.method protected skipWhitespace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V
    .locals 3

    .line 453
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v0

    .line 454
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getUpperBound()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_0

    .line 456
    invoke-virtual {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lorg/apache/httpcore/protocol/HTTP;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 459
    :cond_0
    invoke-virtual {p2, v0}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    return-void
.end method
