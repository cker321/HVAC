.class public interface abstract Lcom/yanzhenjie/andserver/http/HttpContext;
.super Ljava/lang/Object;
.source "HttpContext.java"


# static fields
.field public static final ANDROID_CONTEXT:Ljava/lang/String; = "android.context"

.field public static final HTTP_MESSAGE_CONVERTER:Ljava/lang/String; = "http.message.converter"

.field public static final REQUEST_CREATED_SESSION:Ljava/lang/String; = "http.request.Session"

.field public static final RESPONSE_PRODUCE_TYPE:Ljava/lang/String; = "http.response.Produce"


# virtual methods
.method public abstract getAttribute(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract removeAttribute(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
.end method
