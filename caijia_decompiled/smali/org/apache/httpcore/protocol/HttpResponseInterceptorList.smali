.class public interface abstract Lorg/apache/httpcore/protocol/HttpResponseInterceptorList;
.super Ljava/lang/Object;
.source "HttpResponseInterceptorList.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# virtual methods
.method public abstract addResponseInterceptor(Lorg/apache/httpcore/HttpResponseInterceptor;)V
.end method

.method public abstract addResponseInterceptor(Lorg/apache/httpcore/HttpResponseInterceptor;I)V
.end method

.method public abstract clearResponseInterceptors()V
.end method

.method public abstract getResponseInterceptor(I)Lorg/apache/httpcore/HttpResponseInterceptor;
.end method

.method public abstract getResponseInterceptorCount()I
.end method

.method public abstract removeResponseInterceptorByClass(Ljava/lang/Class;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lorg/apache/httpcore/HttpResponseInterceptor;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setInterceptors(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;)V"
        }
    .end annotation
.end method
