.class public Lcom/yanzhenjie/andserver/framework/body/JsonBody;
.super Lcom/yanzhenjie/andserver/framework/body/StringBody;
.source "JsonBody.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 0

    .line 34
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/body/StringBody;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public contentType()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 1

    .line 40
    sget-object v0, Lcom/yanzhenjie/andserver/util/MediaType;->APPLICATION_JSON_UTF8:Lcom/yanzhenjie/andserver/util/MediaType;

    return-object v0
.end method
