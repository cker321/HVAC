.class public abstract Lorg/apache/httpcore/message/AbstractHttpMessage;
.super Ljava/lang/Object;
.source "AbstractHttpMessage.java"

# interfaces
.implements Lorg/apache/httpcore/HttpMessage;


# instance fields
.field protected headergroup:Lorg/apache/httpcore/message/HeaderGroup;

.field protected params:Lorg/apache/httpcore/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, v0}, Lorg/apache/httpcore/message/AbstractHttpMessage;-><init>(Lorg/apache/httpcore/params/HttpParams;)V

    return-void
.end method

.method protected constructor <init>(Lorg/apache/httpcore/params/HttpParams;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Lorg/apache/httpcore/message/HeaderGroup;

    invoke-direct {v0}, Lorg/apache/httpcore/message/HeaderGroup;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    .line 60
    iput-object p1, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->params:Lorg/apache/httpcore/params/HttpParams;

    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "Header name"

    .line 106
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 107
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    new-instance v1, Lorg/apache/httpcore/message/BasicHeader;

    invoke-direct {v1, p1, p2}, Lorg/apache/httpcore/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/message/HeaderGroup;->addHeader(Lorg/apache/httpcore/Header;)V

    return-void
.end method

.method public addHeader(Lorg/apache/httpcore/Header;)V
    .locals 1

    .line 100
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/message/HeaderGroup;->addHeader(Lorg/apache/httpcore/Header;)V

    return-void
.end method

.method public containsHeader(Ljava/lang/String;)Z
    .locals 1

    .line 70
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/message/HeaderGroup;->containsHeader(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public getAllHeaders()[Lorg/apache/httpcore/Header;
    .locals 1

    .line 94
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0}, Lorg/apache/httpcore/message/HeaderGroup;->getAllHeaders()[Lorg/apache/httpcore/Header;

    move-result-object v0

    return-object v0
.end method

.method public getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;
    .locals 1

    .line 82
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/message/HeaderGroup;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object p1

    return-object p1
.end method

.method public getHeaders(Ljava/lang/String;)[Lorg/apache/httpcore/Header;
    .locals 1

    .line 76
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/message/HeaderGroup;->getHeaders(Ljava/lang/String;)[Lorg/apache/httpcore/Header;

    move-result-object p1

    return-object p1
.end method

.method public getLastHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;
    .locals 1

    .line 88
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/message/HeaderGroup;->getLastHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object p1

    return-object p1
.end method

.method public getParams()Lorg/apache/httpcore/params/HttpParams;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 167
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->params:Lorg/apache/httpcore/params/HttpParams;

    if-nez v0, :cond_0

    .line 168
    new-instance v0, Lorg/apache/httpcore/params/BasicHttpParams;

    invoke-direct {v0}, Lorg/apache/httpcore/params/BasicHttpParams;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->params:Lorg/apache/httpcore/params/HttpParams;

    .line 170
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->params:Lorg/apache/httpcore/params/HttpParams;

    return-object v0
.end method

.method public headerIterator()Lorg/apache/httpcore/HeaderIterator;
    .locals 1

    .line 152
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0}, Lorg/apache/httpcore/message/HeaderGroup;->iterator()Lorg/apache/httpcore/HeaderIterator;

    move-result-object v0

    return-object v0
.end method

.method public headerIterator(Ljava/lang/String;)Lorg/apache/httpcore/HeaderIterator;
    .locals 1

    .line 158
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/message/HeaderGroup;->iterator(Ljava/lang/String;)Lorg/apache/httpcore/HeaderIterator;

    move-result-object p1

    return-object p1
.end method

.method public removeHeader(Lorg/apache/httpcore/Header;)V
    .locals 1

    .line 132
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/message/HeaderGroup;->removeHeader(Lorg/apache/httpcore/Header;)V

    return-void
.end method

.method public removeHeaders(Ljava/lang/String;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    .line 141
    :cond_0
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0}, Lorg/apache/httpcore/message/HeaderGroup;->iterator()Lorg/apache/httpcore/HeaderIterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Lorg/apache/httpcore/HeaderIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 142
    invoke-interface {v0}, Lorg/apache/httpcore/HeaderIterator;->nextHeader()Lorg/apache/httpcore/Header;

    move-result-object v1

    .line 143
    invoke-interface {v1}, Lorg/apache/httpcore/Header;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 144
    invoke-interface {v0}, Lorg/apache/httpcore/HeaderIterator;->remove()V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "Header name"

    .line 119
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 120
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    new-instance v1, Lorg/apache/httpcore/message/BasicHeader;

    invoke-direct {v1, p1, p2}, Lorg/apache/httpcore/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/httpcore/message/HeaderGroup;->updateHeader(Lorg/apache/httpcore/Header;)V

    return-void
.end method

.method public setHeader(Lorg/apache/httpcore/Header;)V
    .locals 1

    .line 113
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/message/HeaderGroup;->updateHeader(Lorg/apache/httpcore/Header;)V

    return-void
.end method

.method public setHeaders([Lorg/apache/httpcore/Header;)V
    .locals 1

    .line 126
    iget-object v0, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->headergroup:Lorg/apache/httpcore/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/httpcore/message/HeaderGroup;->setHeaders([Lorg/apache/httpcore/Header;)V

    return-void
.end method

.method public setParams(Lorg/apache/httpcore/params/HttpParams;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, "HTTP parameters"

    .line 179
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/apache/httpcore/params/HttpParams;

    iput-object p1, p0, Lorg/apache/httpcore/message/AbstractHttpMessage;->params:Lorg/apache/httpcore/params/HttpParams;

    return-void
.end method
