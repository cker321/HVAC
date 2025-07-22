.class public Lcom/yanzhenjie/andserver/framework/mapping/Mapping;
.super Ljava/lang/Object;
.source "Mapping.java"


# instance fields
.field private mConsume:Lcom/yanzhenjie/andserver/framework/mapping/Mime;

.field private mHeader:Lcom/yanzhenjie/andserver/framework/mapping/Pair;

.field private mMethod:Lcom/yanzhenjie/andserver/framework/mapping/Method;

.field private mParam:Lcom/yanzhenjie/andserver/framework/mapping/Pair;

.field private mPath:Lcom/yanzhenjie/andserver/framework/mapping/Path;

.field private mProduce:Lcom/yanzhenjie/andserver/framework/mapping/Mime;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getConsume()Lcom/yanzhenjie/andserver/framework/mapping/Mime;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mConsume:Lcom/yanzhenjie/andserver/framework/mapping/Mime;

    return-object v0
.end method

.method public getHeader()Lcom/yanzhenjie/andserver/framework/mapping/Pair;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mHeader:Lcom/yanzhenjie/andserver/framework/mapping/Pair;

    return-object v0
.end method

.method public getMethod()Lcom/yanzhenjie/andserver/framework/mapping/Method;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mMethod:Lcom/yanzhenjie/andserver/framework/mapping/Method;

    return-object v0
.end method

.method public getParam()Lcom/yanzhenjie/andserver/framework/mapping/Pair;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mParam:Lcom/yanzhenjie/andserver/framework/mapping/Pair;

    return-object v0
.end method

.method public getPath()Lcom/yanzhenjie/andserver/framework/mapping/Path;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mPath:Lcom/yanzhenjie/andserver/framework/mapping/Path;

    return-object v0
.end method

.method public getProduce()Lcom/yanzhenjie/andserver/framework/mapping/Mime;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mProduce:Lcom/yanzhenjie/andserver/framework/mapping/Mime;

    return-object v0
.end method

.method public setConsume(Lcom/yanzhenjie/andserver/framework/mapping/Mime;)V
    .locals 0

    .line 72
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mConsume:Lcom/yanzhenjie/andserver/framework/mapping/Mime;

    return-void
.end method

.method public setHeader(Lcom/yanzhenjie/andserver/framework/mapping/Pair;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mHeader:Lcom/yanzhenjie/andserver/framework/mapping/Pair;

    return-void
.end method

.method public setMethod(Lcom/yanzhenjie/andserver/framework/mapping/Method;)V
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mMethod:Lcom/yanzhenjie/andserver/framework/mapping/Method;

    return-void
.end method

.method public setParam(Lcom/yanzhenjie/andserver/framework/mapping/Pair;)V
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mParam:Lcom/yanzhenjie/andserver/framework/mapping/Pair;

    return-void
.end method

.method public setPath(Lcom/yanzhenjie/andserver/framework/mapping/Path;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mPath:Lcom/yanzhenjie/andserver/framework/mapping/Path;

    return-void
.end method

.method public setProduce(Lcom/yanzhenjie/andserver/framework/mapping/Mime;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mapping;->mProduce:Lcom/yanzhenjie/andserver/framework/mapping/Mime;

    return-void
.end method
