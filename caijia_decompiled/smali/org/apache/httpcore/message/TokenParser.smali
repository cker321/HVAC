.class public Lorg/apache/httpcore/message/TokenParser;
.super Ljava/lang/Object;
.source "TokenParser.java"


# static fields
.field public static final CR:C = '\r'

.field public static final DQUOTE:C = '\"'

.field public static final ESCAPE:C = '\\'

.field public static final HT:C = '\t'

.field public static final INSTANCE:Lorg/apache/httpcore/message/TokenParser;

.field public static final LF:C = '\n'

.field public static final SP:C = ' '


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 77
    new-instance v0, Lorg/apache/httpcore/message/TokenParser;

    invoke-direct {v0}, Lorg/apache/httpcore/message/TokenParser;-><init>()V

    sput-object v0, Lorg/apache/httpcore/message/TokenParser;->INSTANCE:Lorg/apache/httpcore/message/TokenParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs INIT_BITSET([I)Ljava/util/BitSet;
    .locals 4

    .line 48
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    .line 49
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, p0, v2

    .line 50
    invoke-virtual {v0, v3}, Ljava/util/BitSet;->set(I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static isWhitespace(C)Z
    .locals 1

    const/16 v0, 0x20

    if-eq p0, v0, :cond_1

    const/16 v0, 0x9

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1

    const/16 v0, 0xa

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method


# virtual methods
.method public copyContent(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;Ljava/lang/StringBuilder;)V
    .locals 5

    .line 179
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v0

    .line 180
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v1

    .line 181
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getUpperBound()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_2

    .line 183
    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v3

    if-eqz p3, :cond_0

    .line 184
    invoke-virtual {p3, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-nez v4, :cond_2

    :cond_0
    invoke-static {v3}, Lorg/apache/httpcore/message/TokenParser;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 188
    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 190
    :cond_2
    :goto_1
    invoke-virtual {p2, v0}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    return-void
.end method

.method public copyQuotedContent(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/lang/StringBuilder;)V
    .locals 9

    .line 229
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 232
    :cond_0
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v0

    .line 233
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v1

    .line 234
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getUpperBound()I

    move-result v2

    .line 235
    invoke-virtual {p1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v3

    const/16 v4, 0x22

    if-eq v3, v4, :cond_1

    return-void

    :cond_1
    const/4 v3, 0x1

    add-int/2addr v0, v3

    add-int/2addr v1, v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v1, v2, :cond_7

    .line 243
    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v7

    const/16 v8, 0x5c

    if-eqz v6, :cond_3

    if-eq v7, v4, :cond_2

    if-eq v7, v8, :cond_2

    .line 246
    invoke-virtual {p3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 248
    :cond_2
    invoke-virtual {p3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v6, 0x0

    goto :goto_1

    :cond_3
    if-ne v7, v4, :cond_4

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    if-ne v7, v8, :cond_5

    const/4 v6, 0x1

    goto :goto_1

    :cond_5
    const/16 v8, 0xd

    if-eq v7, v8, :cond_6

    const/16 v8, 0xa

    if-eq v7, v8, :cond_6

    .line 258
    invoke-virtual {p3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_6
    :goto_1
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 262
    :cond_7
    :goto_2
    invoke-virtual {p2, v0}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    return-void
.end method

.method public copyUnquotedContent(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;Ljava/lang/StringBuilder;)V
    .locals 5

    .line 205
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v0

    .line 206
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v1

    .line 207
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getUpperBound()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_2

    .line 209
    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v3

    if-eqz p3, :cond_0

    .line 210
    invoke-virtual {p3, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-nez v4, :cond_2

    .line 211
    :cond_0
    invoke-static {v3}, Lorg/apache/httpcore/message/TokenParser;->isWhitespace(C)Z

    move-result v4

    if-nez v4, :cond_2

    const/16 v4, 0x22

    if-ne v3, v4, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 215
    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 217
    :cond_2
    :goto_1
    invoke-virtual {p2, v0}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    return-void
.end method

.method public parseToken(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;)Ljava/lang/String;
    .locals 5

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x0

    .line 91
    :goto_1
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v3

    if-nez v3, :cond_3

    .line 92
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v3

    invoke-virtual {p1, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v3

    if-eqz p3, :cond_0

    .line 93
    invoke-virtual {p3, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_2

    .line 95
    :cond_0
    invoke-static {v3}, Lorg/apache/httpcore/message/TokenParser;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 96
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/TokenParser;->skipWhiteSpace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    if-eqz v2, :cond_2

    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_2

    const/16 v2, 0x20

    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    :cond_2
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/httpcore/message/TokenParser;->copyContent(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;Ljava/lang/StringBuilder;)V

    goto :goto_0

    .line 106
    :cond_3
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public parseValue(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;)Ljava/lang/String;
    .locals 6

    .line 120
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x0

    .line 122
    :goto_1
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v3

    if-nez v3, :cond_5

    .line 123
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v3

    invoke-virtual {p1, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v3

    if-eqz p3, :cond_0

    .line 124
    invoke-virtual {p3, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_2

    .line 126
    :cond_0
    invoke-static {v3}, Lorg/apache/httpcore/message/TokenParser;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 127
    invoke-virtual {p0, p1, p2}, Lorg/apache/httpcore/message/TokenParser;->skipWhiteSpace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/16 v4, 0x22

    const/16 v5, 0x20

    if-ne v3, v4, :cond_3

    if-eqz v2, :cond_2

    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_2

    .line 131
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 133
    :cond_2
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/httpcore/message/TokenParser;->copyQuotedContent(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/lang/StringBuilder;)V

    goto :goto_0

    :cond_3
    if-eqz v2, :cond_4

    .line 136
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_4

    .line 137
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 139
    :cond_4
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/httpcore/message/TokenParser;->copyUnquotedContent(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;Ljava/util/BitSet;Ljava/lang/StringBuilder;)V

    goto :goto_0

    .line 143
    :cond_5
    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public skipWhiteSpace(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)V
    .locals 4

    .line 154
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v0

    .line 155
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getPos()I

    move-result v1

    .line 156
    invoke-virtual {p2}, Lorg/apache/httpcore/message/ParserCursor;->getUpperBound()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_1

    .line 158
    invoke-virtual {p1, v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v3

    .line 159
    invoke-static {v3}, Lorg/apache/httpcore/message/TokenParser;->isWhitespace(C)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 164
    :cond_1
    :goto_1
    invoke-virtual {p2, v0}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    return-void
.end method
