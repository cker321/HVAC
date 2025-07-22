.class public Lorg/apache/httpcore/protocol/HttpCoreContext;
.super Ljava/lang/Object;
.source "HttpCoreContext.java"

# interfaces
.implements Lorg/apache/httpcore/protocol/HttpContext;


# static fields
.field public static final HTTP_CONNECTION:Ljava/lang/String; = "http.connection"

.field public static final HTTP_REQUEST:Ljava/lang/String; = "http.request"

.field public static final HTTP_REQ_SENT:Ljava/lang/String; = "http.request_sent"

.field public static final HTTP_RESPONSE:Ljava/lang/String; = "http.response"

.field public static final HTTP_TARGET_HOST:Ljava/lang/String; = "http.target_host"


# instance fields
.field private final context:Lorg/apache/httpcore/protocol/HttpContext;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v0, Lorg/apache/httpcore/protocol/BasicHttpContext;

    invoke-direct {v0}, Lorg/apache/httpcore/protocol/BasicHttpContext;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/protocol/HttpCoreContext;->context:Lorg/apache/httpcore/protocol/HttpContext;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 0

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p1, p0, Lorg/apache/httpcore/protocol/HttpCoreContext;->context:Lorg/apache/httpcore/protocol/HttpContext;

    return-void
.end method

.method public static adapt(Lorg/apache/httpcore/protocol/HttpContext;)Lorg/apache/httpcore/protocol/HttpCoreContext;
    .locals 1

    const-string v0, "HTTP context"

    .line 80
    invoke-static {p0, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    instance-of v0, p0, Lorg/apache/httpcore/protocol/HttpCoreContext;

    if-eqz v0, :cond_0

    check-cast p0, Lorg/apache/httpcore/protocol/HttpCoreContext;

    goto :goto_0

    :cond_0
    new-instance v0, Lorg/apache/httpcore/protocol/HttpCoreContext;

    invoke-direct {v0, p0}, Lorg/apache/httpcore/protocol/HttpCoreContext;-><init>(Lorg/apache/httpcore/protocol/HttpContext;)V

    move-object p0, v0

    :goto_0
    return-object p0
.end method

.method public static create()Lorg/apache/httpcore/protocol/HttpCoreContext;
    .locals 2

    .line 76
    new-instance v0, Lorg/apache/httpcore/protocol/HttpCoreContext;

    new-instance v1, Lorg/apache/httpcore/protocol/BasicHttpContext;

    invoke-direct {v1}, Lorg/apache/httpcore/protocol/BasicHttpContext;-><init>()V

    invoke-direct {v0, v1}, Lorg/apache/httpcore/protocol/HttpCoreContext;-><init>(Lorg/apache/httpcore/protocol/HttpContext;)V

    return-object v0
.end method


# virtual methods
.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 100
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpCoreContext;->context:Lorg/apache/httpcore/protocol/HttpContext;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    const-string v0, "Attribute class"

    .line 114
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 115
    invoke-virtual {p0, p1}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 119
    :cond_0
    invoke-virtual {p2, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getConnection()Lorg/apache/httpcore/HttpConnection;
    .locals 2

    .line 127
    const-class v0, Lorg/apache/httpcore/HttpConnection;

    const-string v1, "http.connection"

    invoke-virtual {p0, v1, v0}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/HttpConnection;

    return-object v0
.end method

.method public getConnection(Ljava/lang/Class;)Lorg/apache/httpcore/HttpConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/apache/httpcore/HttpConnection;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    const-string v0, "http.connection"

    .line 123
    invoke-virtual {p0, v0, p1}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/HttpConnection;

    return-object p1
.end method

.method public getRequest()Lorg/apache/httpcore/HttpRequest;
    .locals 2

    .line 131
    const-class v0, Lorg/apache/httpcore/HttpRequest;

    const-string v1, "http.request"

    invoke-virtual {p0, v1, v0}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/HttpRequest;

    return-object v0
.end method

.method public getResponse()Lorg/apache/httpcore/HttpResponse;
    .locals 2

    .line 140
    const-class v0, Lorg/apache/httpcore/HttpResponse;

    const-string v1, "http.response"

    invoke-virtual {p0, v1, v0}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/HttpResponse;

    return-object v0
.end method

.method public getTargetHost()Lorg/apache/httpcore/HttpHost;
    .locals 2

    .line 148
    const-class v0, Lorg/apache/httpcore/HttpHost;

    const-string v1, "http.target_host"

    invoke-virtual {p0, v1, v0}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/httpcore/HttpHost;

    return-object v0
.end method

.method public isRequestSent()Z
    .locals 2

    .line 135
    const-class v0, Ljava/lang/Boolean;

    const-string v1, "http.request_sent"

    invoke-virtual {p0, v1, v0}, Lorg/apache/httpcore/protocol/HttpCoreContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 136
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 110
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpCoreContext;->context:Lorg/apache/httpcore/protocol/HttpContext;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/protocol/HttpContext;->removeAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 105
    iget-object v0, p0, Lorg/apache/httpcore/protocol/HttpCoreContext;->context:Lorg/apache/httpcore/protocol/HttpContext;

    invoke-interface {v0, p1, p2}, Lorg/apache/httpcore/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public setTargetHost(Lorg/apache/httpcore/HttpHost;)V
    .locals 1

    const-string v0, "http.target_host"

    .line 144
    invoke-virtual {p0, v0, p1}, Lorg/apache/httpcore/protocol/HttpCoreContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
