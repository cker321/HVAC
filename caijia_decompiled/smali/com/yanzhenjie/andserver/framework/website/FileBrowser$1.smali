.class Lcom/yanzhenjie/andserver/framework/website/FileBrowser$1;
.super Lcom/yanzhenjie/andserver/framework/body/FileBody;
.source "FileBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/framework/website/FileBrowser;->getBody(Lcom/yanzhenjie/andserver/http/HttpRequest;)Lcom/yanzhenjie/andserver/http/ResponseBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yanzhenjie/andserver/framework/website/FileBrowser;


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/framework/website/FileBrowser;Ljava/io/File;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/website/FileBrowser$1;->this$0:Lcom/yanzhenjie/andserver/framework/website/FileBrowser;

    invoke-direct {p0, p2}, Lcom/yanzhenjie/andserver/framework/body/FileBody;-><init>(Ljava/io/File;)V

    return-void
.end method


# virtual methods
.method public contentType()Lcom/yanzhenjie/andserver/util/MediaType;
    .locals 4

    .line 134
    invoke-super {p0}, Lcom/yanzhenjie/andserver/framework/body/FileBody;->contentType()Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 136
    new-instance v1, Lcom/yanzhenjie/andserver/util/MediaType;

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/yanzhenjie/andserver/util/MediaType;->getSubtype()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Lorg/apache/commons/io/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v0, v3}, Lcom/yanzhenjie/andserver/util/MediaType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    move-object v0, v1

    :cond_0
    return-object v0
.end method
