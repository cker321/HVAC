.class public Lcom/yanzhenjie/andserver/http/Modified;
.super Ljava/lang/Object;
.source "Modified.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/HttpHeaders;


# static fields
.field private static final ETAG_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private isNotModified:Z

.field private mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

.field private mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "\\*|\\s*((W\\/)?(\"[^\"]*\"))\\s*,?"

    .line 34
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/http/Modified;->ETAG_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/Modified;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    .line 43
    iput-object p2, p0, Lcom/yanzhenjie/andserver/http/Modified;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    return-void
.end method

.method private padETagIfNecessary(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 141
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    const-string v0, "\""

    .line 144
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "W/\""

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    return-object p1

    .line 147
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseDateHeader(Ljava/lang/String;)J
    .locals 4

    const-wide/16 v0, -0x1

    .line 181
    :try_start_0
    iget-object v2, p0, Lcom/yanzhenjie/andserver/http/Modified;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v2, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getDateHeader(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    .line 183
    iget-object v2, p0, Lcom/yanzhenjie/andserver/http/Modified;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v2, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 184
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-wide v0

    :cond_0
    const/16 v2, 0x3b

    .line 188
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    const/4 v0, 0x0

    .line 190
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 191
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/Modified;->parseDateValue(Ljava/lang/String;)J

    move-result-wide v0

    :cond_1
    :goto_0
    return-wide v0
.end method

.method private parseDateValue(Ljava/lang/String;)J
    .locals 4

    const-wide/16 v0, -0x1

    if-nez p1, :cond_0

    return-wide v0

    .line 202
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x3

    if-lt v2, v3, :cond_1

    .line 205
    invoke-static {p1}, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->parseDate(Ljava/lang/String;)J

    move-result-wide v0

    :cond_1
    return-wide v0
.end method

.method private validateIfModifiedSince(J)Z
    .locals 6

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-gez v3, :cond_0

    return v0

    :cond_0
    const-string v1, "If-Modified-Since"

    .line 155
    invoke-direct {p0, v1}, Lcom/yanzhenjie/andserver/http/Modified;->parseDateHeader(Ljava/lang/String;)J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    return v0

    :cond_1
    const/4 v3, 0x1

    cmp-long v4, v1, p1

    if-ltz v4, :cond_2

    const/4 v0, 0x1

    .line 161
    :cond_2
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/Modified;->isNotModified:Z

    return v3
.end method

.method private validateIfNoneMatch(Ljava/lang/String;)Z
    .locals 5

    .line 115
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 119
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Modified;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    const-string v2, "If-None-Match"

    invoke-interface {v0, v2}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getHeaders(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 120
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    return v1

    .line 125
    :cond_1
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/Modified;->padETagIfNecessary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 126
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 127
    sget-object v3, Lcom/yanzhenjie/andserver/http/Modified;->ETAG_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 129
    :cond_3
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 130
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "^W/"

    const-string v4, ""

    .line 131
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {v1, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 132
    iput-boolean v2, p0, Lcom/yanzhenjie/andserver/http/Modified;->isNotModified:Z

    goto :goto_0

    :cond_4
    return v2
.end method

.method private validateIfUnmodifiedSince(J)Z
    .locals 6

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-gez v3, :cond_0

    return v0

    :cond_0
    const-string v1, "If-Unmodified-Since"

    .line 169
    invoke-direct {p0, v1}, Lcom/yanzhenjie/andserver/http/Modified;->parseDateHeader(Ljava/lang/String;)J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    return v0

    :cond_1
    const/4 v3, 0x1

    cmp-long v4, v1, p1

    if-ltz v4, :cond_2

    const/4 v0, 0x1

    .line 174
    :cond_2
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/Modified;->isNotModified:Z

    return v3
.end method


# virtual methods
.method public process(J)Z
    .locals 1

    const/4 v0, 0x0

    .line 54
    invoke-virtual {p0, v0, p1, p2}, Lcom/yanzhenjie/andserver/http/Modified;->process(Ljava/lang/String;J)Z

    move-result p1

    return p1
.end method

.method public process(Ljava/lang/String;)Z
    .locals 2

    const-wide/16 v0, -0x1

    .line 65
    invoke-virtual {p0, p1, v0, v1}, Lcom/yanzhenjie/andserver/http/Modified;->process(Ljava/lang/String;J)Z

    move-result p1

    return p1
.end method

.method public process(Ljava/lang/String;J)Z
    .locals 4

    .line 77
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/Modified;->isNotModified:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 82
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/yanzhenjie/andserver/http/Modified;->validateIfUnmodifiedSince(J)Z

    move-result v0

    const/16 v2, 0x19b

    if-eqz v0, :cond_2

    .line 83
    iget-boolean p1, p0, Lcom/yanzhenjie/andserver/http/Modified;->isNotModified:Z

    if-nez p1, :cond_1

    .line 84
    iget-object p1, p0, Lcom/yanzhenjie/andserver/http/Modified;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {p1, v2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    .line 86
    :cond_1
    iget-boolean p1, p0, Lcom/yanzhenjie/andserver/http/Modified;->isNotModified:Z

    return p1

    .line 90
    :cond_2
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/Modified;->validateIfNoneMatch(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 93
    invoke-direct {p0, p2, p3}, Lcom/yanzhenjie/andserver/http/Modified;->validateIfModifiedSince(J)Z

    .line 97
    :cond_3
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Modified;->mRequest:Lcom/yanzhenjie/andserver/http/HttpRequest;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getMethod()Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object v0

    .line 98
    sget-object v3, Lcom/yanzhenjie/andserver/http/HttpMethod;->GET:Lcom/yanzhenjie/andserver/http/HttpMethod;

    if-eq v0, v3, :cond_5

    sget-object v3, Lcom/yanzhenjie/andserver/http/HttpMethod;->HEAD:Lcom/yanzhenjie/andserver/http/HttpMethod;

    if-ne v0, v3, :cond_4

    goto :goto_0

    :cond_4
    const/4 v1, 0x0

    .line 99
    :cond_5
    :goto_0
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/Modified;->isNotModified:Z

    if-eqz v0, :cond_7

    .line 100
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Modified;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    if-eqz v1, :cond_6

    const/16 v2, 0x130

    :cond_6
    invoke-interface {v0, v2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    :cond_7
    if-eqz v1, :cond_a

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_8

    .line 103
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Modified;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    const-string v1, "Last-Modified"

    invoke-interface {v0, v1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    .line 104
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Modified;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-interface {v0, v1, p2, p3}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setDateHeader(Ljava/lang/String;J)V

    .line 106
    :cond_8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_9

    iget-object p2, p0, Lcom/yanzhenjie/andserver/http/Modified;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    const-string p3, "ETag"

    invoke-interface {p2, p3}, Lcom/yanzhenjie/andserver/http/HttpResponse;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_9

    .line 107
    iget-object p2, p0, Lcom/yanzhenjie/andserver/http/Modified;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/Modified;->padETagIfNecessary(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p3, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    :cond_9
    iget-object p1, p0, Lcom/yanzhenjie/andserver/http/Modified;->mResponse:Lcom/yanzhenjie/andserver/http/HttpResponse;

    const-string p2, "Cache-Control"

    const-string p3, "private"

    invoke-interface {p1, p2, p3}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    :cond_a
    iget-boolean p1, p0, Lcom/yanzhenjie/andserver/http/Modified;->isNotModified:Z

    return p1
.end method
