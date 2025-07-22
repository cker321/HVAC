.class public Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;
.super Ljava/lang/Object;
.source "StandardSessionManager.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/session/SessionManager;


# instance fields
.field private mIdGenerator:Lcom/yanzhenjie/andserver/http/session/IdGenerator;

.field private mStore:Lcom/yanzhenjie/andserver/http/session/Store;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Lcom/yanzhenjie/andserver/http/session/StandardIdGenerator;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/http/session/StandardIdGenerator;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;->mIdGenerator:Lcom/yanzhenjie/andserver/http/session/IdGenerator;

    .line 37
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    const-string v1, "_andserver_session_"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 38
    new-instance p1, Lcom/yanzhenjie/andserver/http/session/StandardStore;

    invoke-direct {p1, v0}, Lcom/yanzhenjie/andserver/http/session/StandardStore;-><init>(Ljava/io/File;)V

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;->mStore:Lcom/yanzhenjie/andserver/http/session/Store;

    return-void
.end method

.method private newSession()Lcom/yanzhenjie/andserver/http/session/StandardSession;
    .locals 3

    .line 84
    new-instance v0, Lcom/yanzhenjie/andserver/http/session/StandardSession;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;-><init>()V

    .line 85
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 86
    invoke-virtual {v0, v1, v2}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->setCreatedTime(J)V

    .line 87
    invoke-virtual {v0, v1, v2}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->setLastAccessedTime(J)V

    const/4 v1, 0x1

    .line 88
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->setNew(Z)V

    .line 89
    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->setValid(Z)V

    return-object v0
.end method


# virtual methods
.method public add(Lcom/yanzhenjie/andserver/http/session/Session;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 43
    instance-of v0, p1, Lcom/yanzhenjie/andserver/http/session/StandardSession;

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/yanzhenjie/andserver/http/session/Session;->isNew()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    check-cast p1, Lcom/yanzhenjie/andserver/http/session/StandardSession;

    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, v0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->setNew(Z)V

    .line 46
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;->mStore:Lcom/yanzhenjie/andserver/http/session/Store;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/session/Store;->replace(Lcom/yanzhenjie/andserver/http/session/StandardSession;)Z

    :cond_0
    return-void
.end method

.method public changeSessionId(Lcom/yanzhenjie/andserver/http/session/Session;)V
    .locals 1

    .line 52
    instance-of v0, p1, Lcom/yanzhenjie/andserver/http/session/StandardSession;

    if-eqz v0, :cond_0

    .line 53
    check-cast p1, Lcom/yanzhenjie/andserver/http/session/StandardSession;

    .line 54
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;->mIdGenerator:Lcom/yanzhenjie/andserver/http/session/IdGenerator;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/http/session/IdGenerator;->generateId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->setId(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public createSession()Lcom/yanzhenjie/andserver/http/session/Session;
    .locals 2

    .line 61
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;->newSession()Lcom/yanzhenjie/andserver/http/session/StandardSession;

    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;->mIdGenerator:Lcom/yanzhenjie/andserver/http/session/IdGenerator;

    invoke-interface {v1}, Lcom/yanzhenjie/andserver/http/session/IdGenerator;->generateId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->setId(Ljava/lang/String;)V

    return-object v0
.end method

.method public findSession(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/session/Session;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;->mStore:Lcom/yanzhenjie/andserver/http/session/Store;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/session/Store;->getSession(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/session/StandardSession;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->setLastAccessedTime(J)V

    :cond_0
    return-object p1
.end method

.method public remove(Lcom/yanzhenjie/andserver/http/session/Session;)V
    .locals 1

    .line 78
    instance-of v0, p1, Lcom/yanzhenjie/andserver/http/session/StandardSession;

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSessionManager;->mStore:Lcom/yanzhenjie/andserver/http/session/Store;

    check-cast p1, Lcom/yanzhenjie/andserver/http/session/StandardSession;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/http/session/Store;->remove(Lcom/yanzhenjie/andserver/http/session/StandardSession;)Z

    :cond_0
    return-void
.end method
