.class public Lcom/ihsanbal/logging/LoggingInterceptor;
.super Ljava/lang/Object;
.source "LoggingInterceptor.java"

# interfaces
.implements Lokhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ihsanbal/logging/LoggingInterceptor$Builder;
    }
.end annotation


# instance fields
.field private final builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

.field private final isDebug:Z


# direct methods
.method private constructor <init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    .line 30
    invoke-static {p1}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->access$000(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor;->isDebug:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lcom/ihsanbal/logging/LoggingInterceptor$1;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/ihsanbal/logging/LoggingInterceptor;-><init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)V

    return-void
.end method

.method private static createFileRequestRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)Ljava/lang/Runnable;
    .locals 1

    .line 161
    new-instance v0, Lcom/ihsanbal/logging/LoggingInterceptor$2;

    invoke-direct {v0, p0, p1}, Lcom/ihsanbal/logging/LoggingInterceptor$2;-><init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)V

    return-object v0
.end method

.method private static createFileResponseRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/util/List;Ljava/lang/String;)Ljava/lang/Runnable;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ihsanbal/logging/LoggingInterceptor$Builder;",
            "JZI",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Runnable;"
        }
    .end annotation

    .line 181
    new-instance v9, Lcom/ihsanbal/logging/LoggingInterceptor$4;

    move-object v0, v9

    move-object v1, p0

    move-wide v2, p1

    move v4, p3

    move v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/ihsanbal/logging/LoggingInterceptor$4;-><init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    return-object v9
.end method

.method private static createPrintJsonRequestRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)Ljava/lang/Runnable;
    .locals 1

    .line 152
    new-instance v0, Lcom/ihsanbal/logging/LoggingInterceptor$1;

    invoke-direct {v0, p0, p1}, Lcom/ihsanbal/logging/LoggingInterceptor$1;-><init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)V

    return-object v0
.end method

.method private static createPrintJsonResponseRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Runnable;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ihsanbal/logging/LoggingInterceptor$Builder;",
            "JZI",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Runnable;"
        }
    .end annotation

    .line 171
    new-instance v11, Lcom/ihsanbal/logging/LoggingInterceptor$3;

    move-object v0, v11

    move-object v1, p0

    move-wide v2, p1

    move v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Lcom/ihsanbal/logging/LoggingInterceptor$3;-><init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v11
.end method

.method private isNotFileRequest(Ljava/lang/String;)Z
    .locals 1

    if-eqz p1, :cond_1

    const-string v0, "json"

    .line 145
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "xml"

    .line 146
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "plain"

    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "html"

    .line 148
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .line 35
    invoke-interface/range {p1 .. p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v0

    .line 36
    iget-object v3, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-virtual {v3}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getHeaders()Ljava/util/HashMap;

    move-result-object v3

    .line 37
    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 38
    invoke-virtual {v0}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v0

    .line 39
    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 40
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 41
    invoke-virtual {v0, v5, v6}, Lokhttp3/Request$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 46
    :cond_1
    iget-object v3, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-virtual {v3}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getHttpUrl()Ljava/util/HashMap;

    move-result-object v3

    .line 47
    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v4

    if-lez v4, :cond_3

    .line 48
    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v4

    invoke-virtual {v0}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v5}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lokhttp3/HttpUrl;->newBuilder(Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    move-result-object v4

    .line 49
    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 50
    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 51
    invoke-virtual {v4, v6, v7}, Lokhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/HttpUrl$Builder;

    goto :goto_1

    .line 53
    :cond_2
    invoke-virtual {v0}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v4}, Lokhttp3/HttpUrl$Builder;->build()Lokhttp3/HttpUrl;

    move-result-object v3

    invoke-virtual {v0, v3}, Lokhttp3/Request$Builder;->url(Lokhttp3/HttpUrl;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    :cond_3
    move-object v3, v0

    .line 56
    iget-boolean v0, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->isDebug:Z

    if-eqz v0, :cond_e

    iget-object v0, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-virtual {v0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object v0

    sget-object v4, Lcom/ihsanbal/logging/Level;->NONE:Lcom/ihsanbal/logging/Level;

    if-ne v0, v4, :cond_4

    goto/16 :goto_8

    .line 60
    :cond_4
    invoke-virtual {v3}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object v0

    const/4 v4, 0x0

    if-eqz v0, :cond_5

    .line 63
    invoke-virtual {v0}, Lokhttp3/RequestBody;->contentType()Lokhttp3/MediaType;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 64
    invoke-virtual {v0}, Lokhttp3/RequestBody;->contentType()Lokhttp3/MediaType;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/MediaType;->subtype()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_5
    move-object v0, v4

    .line 67
    :goto_2
    iget-object v5, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-static {v5}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->access$100(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)Ljava/util/concurrent/Executor;

    move-result-object v5

    .line 69
    invoke-direct {v1, v0}, Lcom/ihsanbal/logging/LoggingInterceptor;->isNotFileRequest(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    if-eqz v5, :cond_6

    .line 71
    iget-object v0, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-static {v0, v3}, Lcom/ihsanbal/logging/LoggingInterceptor;->createPrintJsonRequestRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_3

    .line 73
    :cond_6
    iget-object v0, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-static {v0, v3}, Lcom/ihsanbal/logging/Printer;->printJsonRequest(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)V

    goto :goto_3

    :cond_7
    if-eqz v5, :cond_8

    .line 77
    iget-object v0, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-static {v0, v3}, Lcom/ihsanbal/logging/LoggingInterceptor;->createFileRequestRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_3

    .line 79
    :cond_8
    iget-object v0, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-static {v0, v3}, Lcom/ihsanbal/logging/Printer;->printFileRequest(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)V

    .line 83
    :goto_3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 85
    iget-object v0, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-static {v0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->access$200(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 87
    :try_start_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v8, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-static {v8}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->access$300(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)J

    move-result-wide v8

    invoke-virtual {v0, v8, v9}, Ljava/util/concurrent/TimeUnit;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v0

    .line 89
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 91
    :goto_4
    new-instance v0, Lokhttp3/Response$Builder;

    invoke-direct {v0}, Lokhttp3/Response$Builder;-><init>()V

    const-string v8, "application/json"

    .line 92
    invoke-static {v8}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v8

    iget-object v9, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    invoke-static {v9}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->access$400(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;)Lcom/ihsanbal/logging/BufferListener;

    move-result-object v9

    invoke-interface {v9, v3}, Lcom/ihsanbal/logging/BufferListener;->getJsonResponse(Lokhttp3/Request;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lokhttp3/ResponseBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/ResponseBody;

    move-result-object v8

    invoke-virtual {v0, v8}, Lokhttp3/Response$Builder;->body(Lokhttp3/ResponseBody;)Lokhttp3/Response$Builder;

    move-result-object v0

    .line 93
    invoke-interface/range {p1 .. p1}, Lokhttp3/Interceptor$Chain;->request()Lokhttp3/Request;

    move-result-object v2

    invoke-virtual {v0, v2}, Lokhttp3/Response$Builder;->request(Lokhttp3/Request;)Lokhttp3/Response$Builder;

    move-result-object v0

    sget-object v2, Lokhttp3/Protocol;->HTTP_2:Lokhttp3/Protocol;

    .line 94
    invoke-virtual {v0, v2}, Lokhttp3/Response$Builder;->protocol(Lokhttp3/Protocol;)Lokhttp3/Response$Builder;

    move-result-object v0

    const-string v2, "Mock"

    .line 95
    invoke-virtual {v0, v2}, Lokhttp3/Response$Builder;->message(Ljava/lang/String;)Lokhttp3/Response$Builder;

    move-result-object v0

    const/16 v2, 0xc8

    .line 96
    invoke-virtual {v0, v2}, Lokhttp3/Response$Builder;->code(I)Lokhttp3/Response$Builder;

    move-result-object v0

    .line 97
    invoke-virtual {v0}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v0

    goto :goto_5

    .line 99
    :cond_9
    invoke-interface {v2, v3}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v0

    .line 101
    :goto_5
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    sub-long/2addr v8, v6

    invoke-virtual {v2, v8, v9}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v11

    .line 103
    invoke-virtual {v3}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lokhttp3/HttpUrl;->encodedPathSegments()Ljava/util/List;

    move-result-object v2

    .line 104
    invoke-virtual {v0}, Lokhttp3/Response;->headers()Lokhttp3/Headers;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Headers;->toString()Ljava/lang/String;

    move-result-object v15

    .line 105
    invoke-virtual {v0}, Lokhttp3/Response;->code()I

    move-result v14

    .line 106
    invoke-virtual {v0}, Lokhttp3/Response;->isSuccessful()Z

    move-result v13

    .line 107
    invoke-virtual {v0}, Lokhttp3/Response;->message()Ljava/lang/String;

    move-result-object v3

    .line 108
    invoke-virtual {v0}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v6

    .line 109
    invoke-virtual {v6}, Lokhttp3/ResponseBody;->contentType()Lokhttp3/MediaType;

    move-result-object v7

    if-eqz v7, :cond_a

    .line 115
    invoke-virtual {v7}, Lokhttp3/MediaType;->subtype()Ljava/lang/String;

    move-result-object v4

    .line 118
    :cond_a
    invoke-direct {v1, v4}, Lcom/ihsanbal/logging/LoggingInterceptor;->isNotFileRequest(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 119
    invoke-virtual {v6}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/ihsanbal/logging/Printer;->getJsonString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 120
    invoke-virtual {v0}, Lokhttp3/Response;->request()Lokhttp3/Request;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v6

    invoke-virtual {v6}, Lokhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v19

    if-eqz v5, :cond_b

    .line 123
    iget-object v10, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    move-object/from16 v16, v4

    move-object/from16 v17, v2

    move-object/from16 v18, v3

    invoke-static/range {v10 .. v19}, Lcom/ihsanbal/logging/LoggingInterceptor;->createPrintJsonResponseRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-interface {v5, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_6

    .line 126
    :cond_b
    iget-object v10, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    move-object/from16 v16, v4

    move-object/from16 v17, v2

    move-object/from16 v18, v3

    invoke-static/range {v10 .. v19}, Lcom/ihsanbal/logging/Printer;->printJsonResponse(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    :goto_6
    invoke-static {v7, v4}, Lokhttp3/ResponseBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/ResponseBody;

    move-result-object v2

    .line 139
    invoke-virtual {v0}, Lokhttp3/Response;->newBuilder()Lokhttp3/Response$Builder;

    move-result-object v0

    .line 140
    invoke-virtual {v0, v2}, Lokhttp3/Response$Builder;->body(Lokhttp3/ResponseBody;)Lokhttp3/Response$Builder;

    move-result-object v0

    .line 141
    invoke-virtual {v0}, Lokhttp3/Response$Builder;->build()Lokhttp3/Response;

    move-result-object v0

    return-object v0

    :cond_c
    if-eqz v5, :cond_d

    .line 132
    iget-object v10, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    move-object/from16 v16, v2

    move-object/from16 v17, v3

    invoke-static/range {v10 .. v17}, Lcom/ihsanbal/logging/LoggingInterceptor;->createFileResponseRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/util/List;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-interface {v5, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_7

    .line 134
    :cond_d
    iget-object v10, v1, Lcom/ihsanbal/logging/LoggingInterceptor;->builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    move-object/from16 v16, v2

    move-object/from16 v17, v3

    invoke-static/range {v10 .. v17}, Lcom/ihsanbal/logging/Printer;->printFileResponse(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    :goto_7
    return-object v0

    .line 57
    :cond_e
    :goto_8
    invoke-interface {v2, v3}, Lokhttp3/Interceptor$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;

    move-result-object v0

    return-object v0
.end method
