.class public Lorg/apache/httpcore/message/BasicHttpResponse;
.super Lorg/apache/httpcore/message/AbstractHttpMessage;
.source "BasicHttpResponse.java"

# interfaces
.implements Lorg/apache/httpcore/HttpResponse;


# instance fields
.field private code:I

.field private entity:Lorg/apache/httpcore/HttpEntity;

.field private locale:Ljava/util/Locale;

.field private final reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;

.field private reasonPhrase:Ljava/lang/String;

.field private statusline:Lorg/apache/httpcore/StatusLine;

.field private ver:Lorg/apache/httpcore/ProtocolVersion;


# direct methods
.method public constructor <init>(Lorg/apache/httpcore/ProtocolVersion;ILjava/lang/String;)V
    .locals 1

    .line 111
    invoke-direct {p0}, Lorg/apache/httpcore/message/AbstractHttpMessage;-><init>()V

    const-string v0, "Status code"

    .line 112
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNegative(ILjava/lang/String;)I

    const/4 v0, 0x0

    .line 113
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    .line 114
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->ver:Lorg/apache/httpcore/ProtocolVersion;

    .line 115
    iput p2, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->code:I

    .line 116
    iput-object p3, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 117
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;

    .line 118
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/StatusLine;)V
    .locals 1

    .line 89
    invoke-direct {p0}, Lorg/apache/httpcore/message/AbstractHttpMessage;-><init>()V

    const-string v0, "Status line"

    .line 90
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/StatusLine;

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    .line 91
    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->ver:Lorg/apache/httpcore/ProtocolVersion;

    .line 92
    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result v0

    iput v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->code:I

    .line 93
    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    const/4 p1, 0x0

    .line 94
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;

    .line 95
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/StatusLine;Lorg/apache/httpcore/ReasonPhraseCatalog;Ljava/util/Locale;)V
    .locals 1

    .line 72
    invoke-direct {p0}, Lorg/apache/httpcore/message/AbstractHttpMessage;-><init>()V

    const-string v0, "Status line"

    .line 73
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/StatusLine;

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    .line 74
    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->ver:Lorg/apache/httpcore/ProtocolVersion;

    .line 75
    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result v0

    iput v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->code:I

    .line 76
    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 77
    iput-object p2, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;

    .line 78
    iput-object p3, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    return-void
.end method


# virtual methods
.method public getEntity()Lorg/apache/httpcore/HttpEntity;
    .locals 1

    .line 143
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->entity:Lorg/apache/httpcore/HttpEntity;

    return-object v0
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 1

    .line 148
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;
    .locals 1

    .line 125
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->ver:Lorg/apache/httpcore/ProtocolVersion;

    return-object v0
.end method

.method protected getReason(I)Ljava/lang/String;
    .locals 2

    .line 219
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonCatalog:Lorg/apache/httpcore/ReasonPhraseCatalog;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 220
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 219
    :goto_0
    invoke-interface {v0, p1, v1}, Lorg/apache/httpcore/ReasonPhraseCatalog;->getReason(ILjava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method public getStatusLine()Lorg/apache/httpcore/StatusLine;
    .locals 4

    .line 131
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    if-nez v0, :cond_2

    .line 132
    new-instance v0, Lorg/apache/httpcore/message/BasicStatusLine;

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->ver:Lorg/apache/httpcore/ProtocolVersion;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    sget-object v1, Lorg/apache/httpcore/HttpVersion;->HTTP_1_1:Lorg/apache/httpcore/HttpVersion;

    :goto_0
    iget v2, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->code:I

    iget-object v3, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    if-eqz v3, :cond_1

    goto :goto_1

    .line 135
    :cond_1
    invoke-virtual {p0, v2}, Lorg/apache/httpcore/message/BasicHttpResponse;->getReason(I)Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-direct {v0, v1, v2, v3}, Lorg/apache/httpcore/message/BasicStatusLine;-><init>(Lorg/apache/httpcore/ProtocolVersion;ILjava/lang/String;)V

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    .line 137
    :cond_2
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    return-object v0
.end method

.method public setEntity(Lorg/apache/httpcore/HttpEntity;)V
    .locals 0

    .line 200
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->entity:Lorg/apache/httpcore/HttpEntity;

    return-void
.end method

.method public setLocale(Ljava/util/Locale;)V
    .locals 1

    const-string v0, "Locale"

    .line 205
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Locale;

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->locale:Ljava/util/Locale;

    const/4 p1, 0x0

    .line 206
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    return-void
.end method

.method public setReasonPhrase(Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    .line 193
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    .line 194
    invoke-static {p1}, Lorg/apache/httpcore/util/TextUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object p1, v0

    :cond_0
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    return-void
.end method

.method public setStatusCode(I)V
    .locals 1

    const-string v0, "Status code"

    .line 184
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNegative(ILjava/lang/String;)I

    const/4 v0, 0x0

    .line 185
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    .line 186
    iput p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->code:I

    .line 187
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    return-void
.end method

.method public setStatusLine(Lorg/apache/httpcore/ProtocolVersion;I)V
    .locals 1

    const-string v0, "Status code"

    .line 163
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNegative(ILjava/lang/String;)I

    const/4 v0, 0x0

    .line 164
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    .line 165
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->ver:Lorg/apache/httpcore/ProtocolVersion;

    .line 166
    iput p2, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->code:I

    .line 167
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    return-void
.end method

.method public setStatusLine(Lorg/apache/httpcore/ProtocolVersion;ILjava/lang/String;)V
    .locals 1

    const-string v0, "Status code"

    .line 174
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNegative(ILjava/lang/String;)I

    const/4 v0, 0x0

    .line 175
    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    .line 176
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->ver:Lorg/apache/httpcore/ProtocolVersion;

    .line 177
    iput p2, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->code:I

    .line 178
    iput-object p3, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    return-void
.end method

.method public setStatusLine(Lorg/apache/httpcore/StatusLine;)V
    .locals 1

    const-string v0, "Status line"

    .line 154
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/StatusLine;

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->statusline:Lorg/apache/httpcore/StatusLine;

    .line 155
    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getProtocolVersion()Lorg/apache/httpcore/ProtocolVersion;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->ver:Lorg/apache/httpcore/ProtocolVersion;

    .line 156
    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getStatusCode()I

    move-result v0

    iput v0, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->code:I

    .line 157
    invoke-interface {p1}, Lorg/apache/httpcore/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->reasonPhrase:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 226
    invoke-virtual {p0}, Lorg/apache/httpcore/message/BasicHttpResponse;->getStatusLine()Lorg/apache/httpcore/StatusLine;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    .line 227
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 228
    iget-object v2, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 229
    iget-object v2, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->entity:Lorg/apache/httpcore/HttpEntity;

    if-eqz v2, :cond_0

    .line 230
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 231
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHttpResponse;->entity:Lorg/apache/httpcore/HttpEntity;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 233
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
