.class public interface abstract Lorg/apache/httpcore/HeaderElement;
.super Ljava/lang/Object;
.source "HeaderElement.java"


# virtual methods
.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getParameter(I)Lorg/apache/httpcore/NameValuePair;
.end method

.method public abstract getParameterByName(Ljava/lang/String;)Lorg/apache/httpcore/NameValuePair;
.end method

.method public abstract getParameterCount()I
.end method

.method public abstract getParameters()[Lorg/apache/httpcore/NameValuePair;
.end method

.method public abstract getValue()Ljava/lang/String;
.end method
