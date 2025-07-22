.class public interface abstract Lorg/apache/httpcore/HttpResponse;
.super Ljava/lang/Object;
.source "HttpResponse.java"

# interfaces
.implements Lorg/apache/httpcore/HttpMessage;


# virtual methods
.method public abstract getEntity()Lorg/apache/httpcore/HttpEntity;
.end method

.method public abstract getLocale()Ljava/util/Locale;
.end method

.method public abstract getStatusLine()Lorg/apache/httpcore/StatusLine;
.end method

.method public abstract setEntity(Lorg/apache/httpcore/HttpEntity;)V
.end method

.method public abstract setLocale(Ljava/util/Locale;)V
.end method

.method public abstract setReasonPhrase(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract setStatusCode(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation
.end method

.method public abstract setStatusLine(Lorg/apache/httpcore/ProtocolVersion;I)V
.end method

.method public abstract setStatusLine(Lorg/apache/httpcore/ProtocolVersion;ILjava/lang/String;)V
.end method

.method public abstract setStatusLine(Lorg/apache/httpcore/StatusLine;)V
.end method
