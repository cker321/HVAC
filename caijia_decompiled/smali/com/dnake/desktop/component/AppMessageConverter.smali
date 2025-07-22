.class public Lcom/dnake/desktop/component/AppMessageConverter;
.super Ljava/lang/Object;
.source "AppMessageConverter.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/MessageConverter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public convert(Ljava/lang/Object;Lcom/yanzhenjie/andserver/util/MediaType;)Lcom/yanzhenjie/andserver/http/ResponseBody;
    .locals 0

    .line 43
    new-instance p2, Lcom/yanzhenjie/andserver/framework/body/JsonBody;

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/component/AppMessageConverter;->successfulJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/yanzhenjie/andserver/framework/body/JsonBody;-><init>(Ljava/lang/String;)V

    return-object p2
.end method

.method public convert(Ljava/io/InputStream;Lcom/yanzhenjie/andserver/util/MediaType;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    .line 49
    :cond_0
    invoke-virtual {p2}, Lcom/yanzhenjie/andserver/util/MediaType;->getCharset()Ljava/nio/charset/Charset;

    move-result-object p2

    :goto_0
    if-nez p2, :cond_1

    .line 51
    invoke-static {p1}, Lcom/yanzhenjie/andserver/util/IOUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p3}, Lcom/landleaf/smarthome/util/JsonUtils;->jsonToObj(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 53
    :cond_1
    invoke-static {p1, p2}, Lcom/yanzhenjie/andserver/util/IOUtils;->toString(Ljava/io/InputStream;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p3}, Lcom/landleaf/smarthome/util/JsonUtils;->jsonToObj(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public successfulJson(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 57
    new-instance v0, Lcom/dnake/desktop/bean/ReturnData;

    invoke-direct {v0}, Lcom/dnake/desktop/bean/ReturnData;-><init>()V

    const/4 v1, 0x1

    .line 58
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/ReturnData;->setSuccess(Z)V

    const/16 v1, 0xc8

    .line 59
    invoke-virtual {v0, v1}, Lcom/dnake/desktop/bean/ReturnData;->setErrorCode(I)V

    .line 60
    invoke-virtual {v0, p1}, Lcom/dnake/desktop/bean/ReturnData;->setData(Ljava/lang/Object;)V

    .line 61
    invoke-static {v0}, Lcom/landleaf/smarthome/util/JsonUtils;->objToJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
