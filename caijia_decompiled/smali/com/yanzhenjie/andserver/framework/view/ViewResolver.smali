.class public Lcom/yanzhenjie/andserver/framework/view/ViewResolver;
.super Ljava/lang/Object;
.source "ViewResolver.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/util/Patterns;
.implements Lcom/yanzhenjie/andserver/http/StatusCode;
.implements Lcom/yanzhenjie/andserver/http/HttpHeaders;


# instance fields
.field private mConverter:Lcom/yanzhenjie/andserver/framework/MessageConverter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/yanzhenjie/andserver/framework/MessageConverter;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;->mConverter:Lcom/yanzhenjie/andserver/framework/MessageConverter;

    return-void
.end method

.method private obtainProduce(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 1

    const-string v0, "http.response.Produce"

    .line 88
    invoke-interface {p1, v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 89
    instance-of v0, p1, Lcom/yanzhenjie/andserver/util/MediaType;

    if-eqz v0, :cond_0

    .line 90
    check-cast p1, Lcom/yanzhenjie/andserver/util/MediaType;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private resolvePath(Ljava/lang/Object;Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 1

    .line 96
    instance-of v0, p1, Ljava/lang/CharSequence;

    if-eqz v0, :cond_7

    .line 97
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 98
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "redirect:(.)*"

    .line 103
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 p2, 0x12e

    .line 104
    invoke-interface {p3, p2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    .line 105
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    const/16 v0, 0x9

    if-lt p2, v0, :cond_4

    .line 106
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, "Location"

    .line 107
    invoke-interface {p3, p2, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v0, "forward:(.)*"

    .line 111
    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/16 v0, 0x8

    .line 112
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 113
    invoke-interface {p2, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getRequestDispatcher(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/RequestDispatcher;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 115
    invoke-interface {v0, p2, p3}, Lcom/yanzhenjie/andserver/http/RequestDispatcher;->forward(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V

    goto :goto_0

    .line 117
    :cond_2
    new-instance p2, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-direct {p2, p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 121
    :cond_3
    sget-object v0, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;->PATH:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".html"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 123
    invoke-interface {p2, p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getRequestDispatcher(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/RequestDispatcher;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 125
    invoke-interface {v0, p2, p3}, Lcom/yanzhenjie/andserver/http/RequestDispatcher;->forward(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V

    :cond_4
    :goto_0
    return-void

    .line 127
    :cond_5
    new-instance p2, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-direct {p2, p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 130
    :cond_6
    new-instance p2, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-direct {p2, p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 133
    :cond_7
    new-instance p2, Lcom/yanzhenjie/andserver/error/ServerInternalException;

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p1, p3, v0

    const-string p1, "The return value of [%s] is not supported"

    invoke-static {p1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/yanzhenjie/andserver/error/ServerInternalException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private resolveRest(Ljava/lang/Object;Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 1

    .line 73
    instance-of v0, p1, Lcom/yanzhenjie/andserver/http/ResponseBody;

    if-eqz v0, :cond_0

    .line 74
    check-cast p1, Lcom/yanzhenjie/andserver/http/ResponseBody;

    invoke-interface {p3, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    goto :goto_0

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;->mConverter:Lcom/yanzhenjie/andserver/framework/MessageConverter;

    if-eqz v0, :cond_1

    .line 76
    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;->obtainProduce(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Lcom/yanzhenjie/andserver/framework/MessageConverter;->convert(Ljava/lang/Object;Lcom/yanzhenjie/andserver/util/MediaType;)Lcom/yanzhenjie/andserver/http/ResponseBody;

    move-result-object p1

    invoke-interface {p3, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    goto :goto_0

    :cond_1
    if-nez p1, :cond_2

    .line 78
    new-instance p1, Lcom/yanzhenjie/andserver/framework/body/StringBody;

    const-string p2, ""

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, p1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    goto :goto_0

    .line 79
    :cond_2
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 80
    new-instance v0, Lcom/yanzhenjie/andserver/framework/body/StringBody;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;->obtainProduce(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p2

    invoke-direct {v0, p1, p2}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;Lcom/yanzhenjie/andserver/util/MediaType;)V

    invoke-interface {p3, v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    goto :goto_0

    .line 82
    :cond_3
    new-instance p2, Lcom/yanzhenjie/andserver/framework/body/StringBody;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;)V

    invoke-interface {p3, p2}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public resolve(Lcom/yanzhenjie/andserver/framework/view/View;Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    .line 63
    :cond_0
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/framework/view/View;->output()Ljava/lang/Object;

    move-result-object v0

    .line 65
    invoke-interface {p1}, Lcom/yanzhenjie/andserver/framework/view/View;->rest()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 66
    invoke-direct {p0, v0, p2, p3}, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;->resolveRest(Ljava/lang/Object;Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V

    goto :goto_0

    .line 68
    :cond_1
    invoke-direct {p0, v0, p2, p3}, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;->resolvePath(Ljava/lang/Object;Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V

    :goto_0
    return-void
.end method
