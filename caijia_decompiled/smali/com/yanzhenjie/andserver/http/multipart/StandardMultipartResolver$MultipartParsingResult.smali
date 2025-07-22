.class public Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;
.super Ljava/lang/Object;
.source "StandardMultipartResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "MultipartParsingResult"
.end annotation


# instance fields
.field private final multipartContentTypes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final multipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;"
        }
    .end annotation
.end field

.field private final multipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/util/MultiValueMap;Lcom/yanzhenjie/andserver/util/MultiValueMap;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 273
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;->multipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    .line 274
    iput-object p2, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;->multipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    .line 275
    iput-object p3, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;->multipartContentTypes:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getMultipartContentTypes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 287
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;->multipartContentTypes:Ljava/util/Map;

    return-object v0
.end method

.method public getMultipartFiles()Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Lcom/yanzhenjie/andserver/http/multipart/MultipartFile;",
            ">;"
        }
    .end annotation

    .line 279
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;->multipartFiles:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    return-object v0
.end method

.method public getMultipartParameters()Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 283
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/multipart/StandardMultipartResolver$MultipartParsingResult;->multipartParameters:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    return-object v0
.end method
