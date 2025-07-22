.class public Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;
.super Ljava/lang/Object;
.source "CrossOrigin.java"


# instance fields
.field private allowCredentials:Z

.field private allowedHeaders:[Ljava/lang/String;

.field private exposedHeaders:[Ljava/lang/String;

.field private maxAge:J

.field private methods:[Lcom/yanzhenjie/andserver/http/HttpMethod;

.field private origins:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAllowedHeaders()[Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->allowedHeaders:[Ljava/lang/String;

    return-object v0
.end method

.method public getExposedHeaders()[Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->exposedHeaders:[Ljava/lang/String;

    return-object v0
.end method

.method public getMaxAge()J
    .locals 2

    .line 84
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->maxAge:J

    return-wide v0
.end method

.method public getMethods()[Lcom/yanzhenjie/andserver/http/HttpMethod;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->methods:[Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object v0
.end method

.method public getOrigins()[Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->origins:[Ljava/lang/String;

    return-object v0
.end method

.method public isAllowCredentials()Z
    .locals 1

    .line 75
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->allowCredentials:Z

    return v0
.end method

.method public setAllowCredentials(Z)V
    .locals 0

    .line 79
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->allowCredentials:Z

    return-void
.end method

.method public setAllowedHeaders([Ljava/lang/String;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->allowedHeaders:[Ljava/lang/String;

    return-void
.end method

.method public setExposedHeaders([Ljava/lang/String;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->exposedHeaders:[Ljava/lang/String;

    return-void
.end method

.method public setMaxAge(J)V
    .locals 0

    .line 88
    iput-wide p1, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->maxAge:J

    return-void
.end method

.method public setMethods([Lcom/yanzhenjie/andserver/http/HttpMethod;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->methods:[Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-void
.end method

.method public setOrigins([Ljava/lang/String;)V
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/cross/CrossOrigin;->origins:[Ljava/lang/String;

    return-void
.end method
