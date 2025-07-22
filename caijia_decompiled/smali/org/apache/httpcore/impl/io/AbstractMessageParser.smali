.class public abstract Lorg/apache/httpcore/impl/io/AbstractMessageParser;
.super Ljava/lang/Object;
.source "AbstractMessageParser.java"

# interfaces
.implements Lorg/apache/httpcore/io/HttpMessageParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/apache/httpcore/HttpMessage;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/apache/httpcore/io/HttpMessageParser<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final HEADERS:I = 0x1

.field private static final HEAD_LINE:I


# instance fields
.field private final headerLines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/apache/httpcore/util/CharArrayBuffer;",
            ">;"
        }
    .end annotation
.end field

.field protected final lineParser:Lorg/apache/httpcore/message/LineParser;

.field private message:Lorg/apache/httpcore/HttpMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

.field private final sessionBuffer:Lorg/apache/httpcore/io/SessionInputBuffer;

.field private state:I


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/config/MessageConstraints;)V
    .locals 1

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Session input buffer"

    .line 111
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/io/SessionInputBuffer;

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/httpcore/io/SessionInputBuffer;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    sget-object p2, Lorg/apache/httpcore/message/BasicLineParser;->INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;

    :goto_0
    iput-object p2, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->lineParser:Lorg/apache/httpcore/message/LineParser;

    if-eqz p3, :cond_1

    goto :goto_1

    .line 113
    :cond_1
    sget-object p3, Lorg/apache/httpcore/config/MessageConstraints;->DEFAULT:Lorg/apache/httpcore/config/MessageConstraints;

    :goto_1
    iput-object p3, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    .line 114
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    const/4 p1, 0x0

    .line 115
    iput p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->state:I

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/io/SessionInputBuffer;Lorg/apache/httpcore/message/LineParser;Lorg/apache/httpcore/params/HttpParams;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Session input buffer"

    .line 86
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "HTTP parameters"

    .line 87
    invoke-static {p3, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 88
    iput-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/httpcore/io/SessionInputBuffer;

    .line 89
    invoke-static {p3}, Lorg/apache/httpcore/params/HttpParamConfig;->getMessageConstraints(Lorg/apache/httpcore/params/HttpParams;)Lorg/apache/httpcore/config/MessageConstraints;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 90
    :cond_0
    sget-object p2, Lorg/apache/httpcore/message/BasicLineParser;->INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;

    :goto_0
    iput-object p2, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->lineParser:Lorg/apache/httpcore/message/LineParser;

    .line 91
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    const/4 p1, 0x0

    .line 92
    iput p1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->state:I

    return-void
.end method

.method public static parseHeaders(Lorg/apache/httpcore/io/SessionInputBuffer;IILorg/apache/httpcore/message/LineParser;)[Lorg/apache/httpcore/Header;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p3, :cond_0

    goto :goto_0

    .line 143
    :cond_0
    sget-object p3, Lorg/apache/httpcore/message/BasicLineParser;->INSTANCE:Lorg/apache/httpcore/message/BasicLineParser;

    :goto_0
    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->parseHeaders(Lorg/apache/httpcore/io/SessionInputBuffer;IILorg/apache/httpcore/message/LineParser;Ljava/util/List;)[Lorg/apache/httpcore/Header;

    move-result-object p0

    return-object p0
.end method

.method public static parseHeaders(Lorg/apache/httpcore/io/SessionInputBuffer;IILorg/apache/httpcore/message/LineParser;Ljava/util/List;)[Lorg/apache/httpcore/Header;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/io/SessionInputBuffer;",
            "II",
            "Lorg/apache/httpcore/message/LineParser;",
            "Ljava/util/List<",
            "Lorg/apache/httpcore/util/CharArrayBuffer;",
            ">;)[",
            "Lorg/apache/httpcore/Header;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Session input buffer"

    .line 178
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Line parser"

    .line 179
    invoke-static {p3, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Header line list"

    .line 180
    invoke-static {p4, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const/4 v0, 0x0

    move-object v1, v0

    move-object v2, v1

    :cond_0
    :goto_0
    if-nez v1, :cond_1

    .line 186
    new-instance v1, Lorg/apache/httpcore/util/CharArrayBuffer;

    const/16 v3, 0x40

    invoke-direct {v1, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    goto :goto_1

    .line 188
    :cond_1
    invoke-virtual {v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->clear()V

    .line 190
    :goto_1
    invoke-interface {p0, v1}, Lorg/apache/httpcore/io/SessionInputBuffer;->readLine(Lorg/apache/httpcore/util/CharArrayBuffer;)I

    move-result v3

    const/4 v4, -0x1

    const/4 v5, 0x0

    if-eq v3, v4, :cond_a

    .line 191
    invoke-virtual {v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ge v3, v4, :cond_2

    goto :goto_6

    .line 198
    :cond_2
    invoke-virtual {v1, v5}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v3

    const/16 v6, 0x9

    const/16 v7, 0x20

    if-eq v3, v7, :cond_3

    invoke-virtual {v1, v5}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_8

    :cond_3
    if-eqz v2, :cond_8

    .line 202
    :goto_2
    invoke-virtual {v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v3

    if-ge v5, v3, :cond_5

    .line 203
    invoke-virtual {v1, v5}, Lorg/apache/httpcore/util/CharArrayBuffer;->charAt(I)C

    move-result v3

    if-eq v3, v7, :cond_4

    if-eq v3, v6, :cond_4

    goto :goto_3

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_5
    :goto_3
    if-lez p2, :cond_7

    .line 210
    invoke-virtual {v2}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v3

    add-int/2addr v3, v4

    invoke-virtual {v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v4

    add-int/2addr v3, v4

    sub-int/2addr v3, v5

    if-gt v3, p2, :cond_6

    goto :goto_4

    .line 211
    :cond_6
    new-instance p0, Lorg/apache/httpcore/MessageConstraintException;

    const-string p1, "Maximum line length limit exceeded"

    invoke-direct {p0, p1}, Lorg/apache/httpcore/MessageConstraintException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 213
    :cond_7
    :goto_4
    invoke-virtual {v2, v7}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(C)V

    .line 214
    invoke-virtual {v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v3

    sub-int/2addr v3, v5

    invoke-virtual {v2, v1, v5, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Lorg/apache/httpcore/util/CharArrayBuffer;II)V

    goto :goto_5

    .line 216
    :cond_8
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v2, v1

    move-object v1, v0

    :goto_5
    if-lez p1, :cond_0

    .line 220
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v3

    if-ge v3, p1, :cond_9

    goto :goto_0

    .line 221
    :cond_9
    new-instance p0, Lorg/apache/httpcore/MessageConstraintException;

    const-string p1, "Maximum header count exceeded"

    invoke-direct {p0, p1}, Lorg/apache/httpcore/MessageConstraintException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 224
    :cond_a
    :goto_6
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p0

    new-array p0, p0, [Lorg/apache/httpcore/Header;

    .line 225
    :goto_7
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p1

    if-ge v5, p1, :cond_b

    .line 226
    invoke-interface {p4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/util/CharArrayBuffer;

    .line 228
    :try_start_0
    invoke-interface {p3, p1}, Lorg/apache/httpcore/message/LineParser;->parseHeader(Lorg/apache/httpcore/util/CharArrayBuffer;)Lorg/apache/httpcore/Header;

    move-result-object p1

    aput-object p1, p0, v5
    :try_end_0
    .catch Lorg/apache/httpcore/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v5, v5, 0x1

    goto :goto_7

    :catch_0
    move-exception p0

    .line 230
    new-instance p1, Lorg/apache/httpcore/ProtocolException;

    invoke-virtual {p0}, Lorg/apache/httpcore/ParseException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_b
    return-object p0
.end method


# virtual methods
.method public parse()Lorg/apache/httpcore/HttpMessage;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    .line 255
    iget v0, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->state:I

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 279
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Inconsistent parser state"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 259
    :cond_1
    :try_start_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/httpcore/io/SessionInputBuffer;

    invoke-virtual {p0, v0}, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->parseHead(Lorg/apache/httpcore/io/SessionInputBuffer;)Lorg/apache/httpcore/HttpMessage;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->message:Lorg/apache/httpcore/HttpMessage;
    :try_end_0
    .catch Lorg/apache/httpcore/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    iput v1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->state:I

    .line 266
    :goto_0
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->sessionBuffer:Lorg/apache/httpcore/io/SessionInputBuffer;

    iget-object v1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    .line 268
    invoke-virtual {v1}, Lorg/apache/httpcore/config/MessageConstraints;->getMaxHeaderCount()I

    move-result v1

    iget-object v2, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->messageConstraints:Lorg/apache/httpcore/config/MessageConstraints;

    .line 269
    invoke-virtual {v2}, Lorg/apache/httpcore/config/MessageConstraints;->getMaxLineLength()I

    move-result v2

    iget-object v3, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->lineParser:Lorg/apache/httpcore/message/LineParser;

    iget-object v4, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    .line 266
    invoke-static {v0, v1, v2, v3, v4}, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->parseHeaders(Lorg/apache/httpcore/io/SessionInputBuffer;IILorg/apache/httpcore/message/LineParser;Ljava/util/List;)[Lorg/apache/httpcore/Header;

    move-result-object v0

    .line 272
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->message:Lorg/apache/httpcore/HttpMessage;

    invoke-interface {v1, v0}, Lorg/apache/httpcore/HttpMessage;->setHeaders([Lorg/apache/httpcore/Header;)V

    .line 273
    iget-object v0, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->message:Lorg/apache/httpcore/HttpMessage;

    const/4 v1, 0x0

    .line 274
    iput-object v1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->message:Lorg/apache/httpcore/HttpMessage;

    .line 275
    iget-object v1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->headerLines:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    const/4 v1, 0x0

    .line 276
    iput v1, p0, Lorg/apache/httpcore/impl/io/AbstractMessageParser;->state:I

    return-object v0

    :catch_0
    move-exception v0

    .line 261
    new-instance v1, Lorg/apache/httpcore/ProtocolException;

    invoke-virtual {v0}, Lorg/apache/httpcore/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected abstract parseHead(Lorg/apache/httpcore/io/SessionInputBuffer;)Lorg/apache/httpcore/HttpMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/io/SessionInputBuffer;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/httpcore/HttpException;,
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method
