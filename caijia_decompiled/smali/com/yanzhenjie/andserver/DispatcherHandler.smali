.class public Lcom/yanzhenjie/andserver/DispatcherHandler;
.super Ljava/lang/Object;
.source "DispatcherHandler.java"

# interfaces
.implements Lorg/apache/httpcore/protocol/HttpRequestHandler;
.implements Lcom/yanzhenjie/andserver/register/Register;


# instance fields
.field private mAdapterList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private mConverter:Lcom/yanzhenjie/andserver/framework/MessageConverter;

.field private mInterceptorList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/HandlerInterceptor;",
            ">;"
        }
    .end annotation
.end field

.field private mMultipart:Lcom/yanzhenjie/andserver/framework/config/Multipart;

.field private mResolver:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;

.field private mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

.field private mViewResolver:Lcom/yanzhenjie/andserver/framework/view/ViewResolver;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mAdapterList:Ljava/util/List;

    .line 76
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mInterceptorList:Ljava/util/List;

    .line 79
    iput-object p1, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mContext:Landroid/content/Context;

    .line 80
    new-instance v0, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;

    invoke-direct {v0, p1}, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

    .line 81
    new-instance p1, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;

    invoke-direct {p1}, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;-><init>()V

    iput-object p1, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mViewResolver:Lcom/yanzhenjie/andserver/framework/view/ViewResolver;

    .line 82
    new-instance p1, Lcom/yanzhenjie/andserver/framework/ExceptionResolver$ResolverWrapper;

    sget-object v0, Lcom/yanzhenjie/andserver/framework/ExceptionResolver;->DEFAULT:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;

    invoke-direct {p1, v0}, Lcom/yanzhenjie/andserver/framework/ExceptionResolver$ResolverWrapper;-><init>(Lcom/yanzhenjie/andserver/framework/ExceptionResolver;)V

    iput-object p1, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mResolver:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;

    .line 84
    iget-object p1, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mInterceptorList:Ljava/util/List;

    new-instance v0, Lcom/yanzhenjie/andserver/framework/ModifiedInterceptor;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/ModifiedInterceptor;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static synthetic access$000(Lcom/yanzhenjie/andserver/DispatcherHandler;Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 0

    .line 65
    invoke-direct {p0, p1, p2}, Lcom/yanzhenjie/andserver/DispatcherHandler;->handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V

    return-void
.end method

.method private configMultipart(Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;)V
    .locals 7

    .line 179
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mMultipart:Lcom/yanzhenjie/andserver/framework/config/Multipart;

    if-eqz v0, :cond_5

    .line 180
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/config/Multipart;->getAllFileMaxSize()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    cmp-long v6, v0, v4

    if-eqz v6, :cond_0

    cmp-long v6, v0, v2

    if-lez v6, :cond_1

    .line 182
    :cond_0
    invoke-interface {p1, v0, v1}, Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;->setAllFileMaxSize(J)V

    .line 185
    :cond_1
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mMultipart:Lcom/yanzhenjie/andserver/framework/config/Multipart;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/config/Multipart;->getFileMaxSize()J

    move-result-wide v0

    cmp-long v6, v0, v4

    if-eqz v6, :cond_2

    cmp-long v4, v0, v2

    if-lez v4, :cond_3

    .line 187
    :cond_2
    invoke-interface {p1, v0, v1}, Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;->setFileMaxSize(J)V

    .line 190
    :cond_3
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mMultipart:Lcom/yanzhenjie/andserver/framework/config/Multipart;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/config/Multipart;->getMaxInMemorySize()I

    move-result v0

    if-lez v0, :cond_4

    .line 192
    invoke-interface {p1, v0}, Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;->setMaxInMemorySize(I)V

    .line 195
    :cond_4
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mMultipart:Lcom/yanzhenjie/andserver/framework/config/Multipart;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/framework/config/Multipart;->getUploadTempDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 197
    invoke-interface {p1, v0}, Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;->setUploadTempDir(Ljava/io/File;)V

    :cond_5
    return-void
.end method

.method private getHandlerAdapter(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;
    .locals 3

    .line 210
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mAdapterList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;

    .line 211
    invoke-interface {v1, p1}, Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;->intercept(Lcom/yanzhenjie/andserver/http/HttpRequest;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 4

    .line 132
    new-instance v0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;-><init>()V

    .line 134
    :try_start_0
    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;->isMultipart(Lcom/yanzhenjie/andserver/http/HttpRequest;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 135
    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/DispatcherHandler;->configMultipart(Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;)V

    .line 136
    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;->resolveMultipart(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    move-result-object p1

    .line 140
    :cond_0
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/DispatcherHandler;->getHandlerAdapter(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 146
    invoke-interface {v1, p1}, Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;->getHandler(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 152
    invoke-direct {p0, p1, p2, v1}, Lcom/yanzhenjie/andserver/DispatcherHandler;->preHandle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_2

    .line 172
    instance-of p2, p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    if-eqz p2, :cond_1

    .line 173
    check-cast p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;->cleanupMultipart(Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;)V

    :cond_1
    return-void

    :cond_2
    :try_start_1
    const-string v2, "android.context"

    .line 157
    iget-object v3, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mContext:Landroid/content/Context;

    invoke-interface {p1, v2, v3}, Lcom/yanzhenjie/andserver/http/HttpRequest;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "http.message.converter"

    .line 158
    iget-object v3, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mConverter:Lcom/yanzhenjie/andserver/framework/MessageConverter;

    invoke-interface {p1, v2, v3}, Lcom/yanzhenjie/andserver/http/HttpRequest;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 159
    invoke-interface {v1, p1, p2}, Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;->handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)Lcom/yanzhenjie/andserver/framework/view/View;

    move-result-object v1

    .line 160
    iget-object v2, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mViewResolver:Lcom/yanzhenjie/andserver/framework/view/ViewResolver;

    invoke-virtual {v2, v1, p1, p2}, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;->resolve(Lcom/yanzhenjie/andserver/framework/view/View;Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V

    .line 161
    invoke-direct {p0, p1, p2}, Lcom/yanzhenjie/andserver/DispatcherHandler;->processSession(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 172
    instance-of p2, p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    if-eqz p2, :cond_5

    goto :goto_1

    .line 148
    :cond_3
    :try_start_2
    new-instance v1, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 142
    :cond_4
    new-instance v1, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v1

    .line 164
    :try_start_3
    iget-object v2, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mResolver:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;

    invoke-interface {v2, p1, p2, v1}, Lcom/yanzhenjie/andserver/framework/ExceptionResolver;->onResolve(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p2

    goto :goto_2

    :catch_0
    move-exception v1

    .line 166
    :try_start_4
    new-instance v2, Lcom/yanzhenjie/andserver/error/ServerInternalException;

    invoke-direct {v2, v1}, Lcom/yanzhenjie/andserver/error/ServerInternalException;-><init>(Ljava/lang/Throwable;)V

    const/16 v1, 0x1f4

    .line 167
    invoke-interface {p2, v1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setStatus(I)V

    .line 168
    new-instance v1, Lcom/yanzhenjie/andserver/framework/body/StringBody;

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v1}, Lcom/yanzhenjie/andserver/http/HttpResponse;->setBody(Lcom/yanzhenjie/andserver/http/ResponseBody;)V

    .line 170
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/yanzhenjie/andserver/DispatcherHandler;->processSession(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 172
    instance-of p2, p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    if-eqz p2, :cond_5

    .line 173
    :goto_1
    check-cast p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;->cleanupMultipart(Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;)V

    :cond_5
    return-void

    .line 172
    :goto_2
    instance-of v1, p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    if-eqz v1, :cond_6

    .line 173
    check-cast p1, Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/multipart/MultipartResolver;->cleanupMultipart(Lcom/yanzhenjie/andserver/http/multipart/MultipartRequest;)V

    .line 175
    :cond_6
    throw p2
.end method

.method private preHandle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 228
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mInterceptorList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/framework/HandlerInterceptor;

    .line 229
    invoke-interface {v1, p1, p2, p3}, Lcom/yanzhenjie/andserver/framework/HandlerInterceptor;->onIntercept(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;Lcom/yanzhenjie/andserver/framework/handler/RequestHandler;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private processSession(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V
    .locals 3

    const-string v0, "http.request.Session"

    .line 261
    invoke-interface {p1, v0}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 262
    instance-of v0, p1, Lcom/yanzhenjie/andserver/http/session/Session;

    if-eqz v0, :cond_0

    .line 263
    check-cast p1, Lcom/yanzhenjie/andserver/http/session/Session;

    .line 265
    :try_start_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/session/SessionManager;->add(Lcom/yanzhenjie/andserver/http/session/Session;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "AndServer"

    const-string v2, "Session persistence failed."

    .line 267
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 270
    :goto_0
    new-instance v0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;

    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/session/Session;->getId()Ljava/lang/String;

    move-result-object p1

    const-string v1, "ASESSIONID"

    invoke-direct {v0, v1, p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "/"

    .line 271
    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->setPath(Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 272
    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->setHttpOnly(Z)V

    .line 273
    invoke-interface {p2, v0}, Lcom/yanzhenjie/andserver/http/HttpResponse;->addCookie(Lcom/yanzhenjie/andserver/http/cookie/Cookie;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public addAdapter(Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;)V
    .locals 1

    const-string v0, "The adapter cannot be null."

    .line 89
    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mAdapterList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mAdapterList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public addInterceptor(Lcom/yanzhenjie/andserver/framework/HandlerInterceptor;)V
    .locals 1

    const-string v0, "The interceptor cannot be null."

    .line 98
    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mInterceptorList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mInterceptorList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public getRequestDispatcher(Lcom/yanzhenjie/andserver/http/HttpRequest;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/RequestDispatcher;
    .locals 2

    move-object v0, p1

    .line 239
    :goto_0
    instance-of v1, v0, Lcom/yanzhenjie/andserver/http/RequestWrapper;

    if-eqz v1, :cond_0

    .line 240
    move-object v0, p1

    check-cast v0, Lcom/yanzhenjie/andserver/http/RequestWrapper;

    .line 241
    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/http/RequestWrapper;->getRequest()Lcom/yanzhenjie/andserver/http/HttpRequest;

    move-result-object v0

    goto :goto_0

    .line 244
    :cond_0
    move-object v1, v0

    check-cast v1, Lcom/yanzhenjie/andserver/http/StandardRequest;

    .line 245
    invoke-virtual {v1, p2}, Lcom/yanzhenjie/andserver/http/StandardRequest;->setPath(Ljava/lang/String;)V

    .line 247
    invoke-direct {p0, v0}, Lcom/yanzhenjie/andserver/DispatcherHandler;->getHandlerAdapter(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/framework/handler/HandlerAdapter;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 252
    new-instance p1, Lcom/yanzhenjie/andserver/DispatcherHandler$1;

    invoke-direct {p1, p0}, Lcom/yanzhenjie/andserver/DispatcherHandler$1;-><init>(Lcom/yanzhenjie/andserver/DispatcherHandler;)V

    return-object p1

    .line 249
    :cond_1
    new-instance p2, Lcom/yanzhenjie/andserver/error/NotFoundException;

    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/HttpRequest;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/yanzhenjie/andserver/error/NotFoundException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p2

    :goto_2
    goto :goto_1
.end method

.method public handle(Lorg/apache/httpcore/HttpRequest;Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)V
    .locals 2

    .line 126
    new-instance v0, Lcom/yanzhenjie/andserver/http/StandardRequest;

    new-instance v1, Lcom/yanzhenjie/andserver/http/StandardContext;

    invoke-direct {v1, p3}, Lcom/yanzhenjie/andserver/http/StandardContext;-><init>(Lorg/apache/httpcore/protocol/HttpContext;)V

    iget-object p3, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mSessionManager:Lcom/yanzhenjie/andserver/http/session/SessionManager;

    invoke-direct {v0, p1, v1, p0, p3}, Lcom/yanzhenjie/andserver/http/StandardRequest;-><init>(Lorg/apache/httpcore/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpContext;Lcom/yanzhenjie/andserver/DispatcherHandler;Lcom/yanzhenjie/andserver/http/session/SessionManager;)V

    .line 127
    new-instance p1, Lcom/yanzhenjie/andserver/http/StandardResponse;

    invoke-direct {p1, p2}, Lcom/yanzhenjie/andserver/http/StandardResponse;-><init>(Lorg/apache/httpcore/HttpResponse;)V

    .line 128
    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/DispatcherHandler;->handle(Lcom/yanzhenjie/andserver/http/HttpRequest;Lcom/yanzhenjie/andserver/http/HttpResponse;)V

    return-void
.end method

.method public setConverter(Lcom/yanzhenjie/andserver/framework/MessageConverter;)V
    .locals 1

    .line 107
    iput-object p1, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mConverter:Lcom/yanzhenjie/andserver/framework/MessageConverter;

    .line 108
    new-instance v0, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;

    invoke-direct {v0, p1}, Lcom/yanzhenjie/andserver/framework/view/ViewResolver;-><init>(Lcom/yanzhenjie/andserver/framework/MessageConverter;)V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mViewResolver:Lcom/yanzhenjie/andserver/framework/view/ViewResolver;

    return-void
.end method

.method public setMultipart(Lcom/yanzhenjie/andserver/framework/config/Multipart;)V
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mMultipart:Lcom/yanzhenjie/andserver/framework/config/Multipart;

    return-void
.end method

.method public setResolver(Lcom/yanzhenjie/andserver/framework/ExceptionResolver;)V
    .locals 1

    const-string v0, "The exceptionResolver cannot be null."

    .line 113
    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 115
    new-instance v0, Lcom/yanzhenjie/andserver/framework/ExceptionResolver$ResolverWrapper;

    invoke-direct {v0, p1}, Lcom/yanzhenjie/andserver/framework/ExceptionResolver$ResolverWrapper;-><init>(Lcom/yanzhenjie/andserver/framework/ExceptionResolver;)V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/DispatcherHandler;->mResolver:Lcom/yanzhenjie/andserver/framework/ExceptionResolver;

    return-void
.end method
