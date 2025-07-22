.class public Lorg/apache/httpcore/message/BasicHttpEntityEnclosingRequest;
.super Lorg/apache/httpcore/message/BasicHttpRequest;
.source "BasicHttpEntityEnclosingRequest.java"

# interfaces
.implements Lorg/apache/httpcore/HttpEntityEnclosingRequest;


# instance fields
.field private entity:Lorg/apache/httpcore/HttpEntity;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2}, Lorg/apache/httpcore/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/httpcore/ProtocolVersion;)V
    .locals 0

    .line 53
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/httpcore/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/httpcore/ProtocolVersion;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/RequestLine;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1}, Lorg/apache/httpcore/message/BasicHttpRequest;-><init>(Lorg/apache/httpcore/RequestLine;)V

    return-void
.end method


# virtual methods
.method public expectContinue()Z
    .locals 2

    const-string v0, "Expect"

    .line 72
    invoke-virtual {p0, v0}, Lorg/apache/httpcore/message/BasicHttpEntityEnclosingRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/httpcore/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 73
    invoke-interface {v0}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string v1, "100-continue"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getEntity()Lorg/apache/httpcore/HttpEntity;
    .locals 1

    .line 62
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHttpEntityEnclosingRequest;->entity:Lorg/apache/httpcore/HttpEntity;

    return-object v0
.end method

.method public setEntity(Lorg/apache/httpcore/HttpEntity;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHttpEntityEnclosingRequest;->entity:Lorg/apache/httpcore/HttpEntity;

    return-void
.end method
