.class public Lorg/apache/httpcore/message/BasicHeaderElementIterator;
.super Ljava/lang/Object;
.source "BasicHeaderElementIterator.java"

# interfaces
.implements Lorg/apache/httpcore/HeaderElementIterator;


# instance fields
.field private buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

.field private currentElement:Lorg/apache/httpcore/HeaderElement;

.field private cursor:Lorg/apache/httpcore/message/ParserCursor;

.field private final headerIt:Lorg/apache/httpcore/HeaderIterator;

.field private final parser:Lorg/apache/httpcore/message/HeaderValueParser;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/HeaderIterator;)V
    .locals 1

    .line 66
    sget-object v0, Lorg/apache/httpcore/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/httpcore/message/BasicHeaderValueParser;

    invoke-direct {p0, p1, v0}, Lorg/apache/httpcore/message/BasicHeaderElementIterator;-><init>(Lorg/apache/httpcore/HeaderIterator;Lorg/apache/httpcore/message/HeaderValueParser;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/HeaderIterator;Lorg/apache/httpcore/message/HeaderValueParser;)V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 50
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/httpcore/HeaderElement;

    .line 51
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    .line 52
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    const-string v0, "Header iterator"

    .line 60
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/HeaderIterator;

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->headerIt:Lorg/apache/httpcore/HeaderIterator;

    const-string p1, "Parser"

    .line 61
    invoke-static {p2, p1}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/message/HeaderValueParser;

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->parser:Lorg/apache/httpcore/message/HeaderValueParser;

    return-void
.end method

.method private bufferHeaderValue()V
    .locals 4

    const/4 v0, 0x0

    .line 71
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    .line 72
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    .line 73
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->headerIt:Lorg/apache/httpcore/HeaderIterator;

    invoke-interface {v0}, Lorg/apache/httpcore/HeaderIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 74
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->headerIt:Lorg/apache/httpcore/HeaderIterator;

    invoke-interface {v0}, Lorg/apache/httpcore/HeaderIterator;->nextHeader()Lorg/apache/httpcore/Header;

    move-result-object v0

    .line 75
    instance-of v1, v0, Lorg/apache/httpcore/FormattedHeader;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 76
    check-cast v0, Lorg/apache/httpcore/FormattedHeader;

    invoke-interface {v0}, Lorg/apache/httpcore/FormattedHeader;->getBuffer()Lorg/apache/httpcore/util/CharArrayBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    .line 77
    new-instance v3, Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v1

    invoke-direct {v3, v2, v1}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    iput-object v3, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    .line 78
    invoke-interface {v0}, Lorg/apache/httpcore/FormattedHeader;->getValuePos()I

    move-result v0

    invoke-virtual {v3, v0}, Lorg/apache/httpcore/message/ParserCursor;->updatePos(I)V

    goto :goto_0

    .line 81
    :cond_1
    invoke-interface {v0}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    new-instance v1, Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v1, v3}, Lorg/apache/httpcore/util/CharArrayBuffer;-><init>(I)V

    iput-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    .line 84
    invoke-virtual {v1, v0}, Lorg/apache/httpcore/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 85
    new-instance v0, Lorg/apache/httpcore/message/ParserCursor;

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    invoke-virtual {v1}, Lorg/apache/httpcore/util/CharArrayBuffer;->length()I

    move-result v1

    invoke-direct {v0, v2, v1}, Lorg/apache/httpcore/message/ParserCursor;-><init>(II)V

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    :cond_2
    :goto_0
    return-void
.end method

.method private parseNextElement()V
    .locals 3

    .line 93
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->headerIt:Lorg/apache/httpcore/HeaderIterator;

    invoke-interface {v0}, Lorg/apache/httpcore/HeaderIterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    return-void

    .line 94
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 96
    :cond_3
    invoke-direct {p0}, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->bufferHeaderValue()V

    .line 99
    :cond_4
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    if-eqz v0, :cond_0

    .line 101
    :cond_5
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {v0}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v0

    if-nez v0, :cond_7

    .line 102
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->parser:Lorg/apache/httpcore/message/HeaderValueParser;

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    iget-object v2, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    invoke-interface {v0, v1, v2}, Lorg/apache/httpcore/message/HeaderValueParser;->parseHeaderElement(Lorg/apache/httpcore/util/CharArrayBuffer;Lorg/apache/httpcore/message/ParserCursor;)Lorg/apache/httpcore/HeaderElement;

    move-result-object v0

    .line 103
    invoke-interface {v0}, Lorg/apache/httpcore/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Lorg/apache/httpcore/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 105
    :cond_6
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/httpcore/HeaderElement;

    return-void

    .line 110
    :cond_7
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    invoke-virtual {v0}, Lorg/apache/httpcore/message/ParserCursor;->atEnd()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 112
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->cursor:Lorg/apache/httpcore/message/ParserCursor;

    .line 113
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->buffer:Lorg/apache/httpcore/util/CharArrayBuffer;

    goto :goto_0
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 121
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/httpcore/HeaderElement;

    if-nez v0, :cond_0

    .line 122
    invoke-direct {p0}, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->parseNextElement()V

    .line 124
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/httpcore/HeaderElement;

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 144
    invoke-virtual {p0}, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->nextElement()Lorg/apache/httpcore/HeaderElement;

    move-result-object v0

    return-object v0
.end method

.method public nextElement()Lorg/apache/httpcore/HeaderElement;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/httpcore/HeaderElement;

    if-nez v0, :cond_0

    .line 130
    invoke-direct {p0}, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->parseNextElement()V

    .line 133
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/httpcore/HeaderElement;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    .line 138
    iput-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElementIterator;->currentElement:Lorg/apache/httpcore/HeaderElement;

    return-object v0

    .line 134
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "No more header elements available"

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation

    .line 149
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Remove not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
