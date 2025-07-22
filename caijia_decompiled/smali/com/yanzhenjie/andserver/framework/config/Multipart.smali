.class public Lcom/yanzhenjie/andserver/framework/config/Multipart;
.super Ljava/lang/Object;
.source "Multipart.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;
    }
.end annotation


# instance fields
.field private final allFileMaxSize:J

.field private final fileMaxSize:J

.field private final maxInMemorySize:I

.field private final uploadTempDir:Ljava/io/File;


# direct methods
.method private constructor <init>(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    invoke-static {p1}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->access$100(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart;->allFileMaxSize:J

    .line 39
    invoke-static {p1}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->access$200(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart;->fileMaxSize:J

    .line 40
    invoke-static {p1}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->access$300(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)I

    move-result v0

    iput v0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart;->maxInMemorySize:I

    .line 41
    invoke-static {p1}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->access$400(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)Ljava/io/File;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart;->uploadTempDir:Ljava/io/File;

    return-void
.end method

.method synthetic constructor <init>(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;Lcom/yanzhenjie/andserver/framework/config/Multipart$1;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/framework/config/Multipart;-><init>(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)V

    return-void
.end method

.method public static newBuilder()Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;
    .locals 2

    .line 29
    new-instance v0, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;-><init>(Lcom/yanzhenjie/andserver/framework/config/Multipart$1;)V

    return-object v0
.end method


# virtual methods
.method public getAllFileMaxSize()J
    .locals 2

    .line 45
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart;->allFileMaxSize:J

    return-wide v0
.end method

.method public getFileMaxSize()J
    .locals 2

    .line 49
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart;->fileMaxSize:J

    return-wide v0
.end method

.method public getMaxInMemorySize()I
    .locals 1

    .line 53
    iget v0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart;->maxInMemorySize:I

    return v0
.end method

.method public getUploadTempDir()Ljava/io/File;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart;->uploadTempDir:Ljava/io/File;

    return-object v0
.end method
