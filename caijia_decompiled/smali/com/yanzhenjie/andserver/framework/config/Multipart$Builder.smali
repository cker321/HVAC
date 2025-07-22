.class public Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;
.super Ljava/lang/Object;
.source "Multipart.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/framework/config/Multipart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private allFileMaxSize:J

.field private fileMaxSize:J

.field private maxInMemorySize:I

.field private uploadTempDir:Ljava/io/File;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/yanzhenjie/andserver/framework/config/Multipart$1;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)J
    .locals 2

    .line 60
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->allFileMaxSize:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)J
    .locals 2

    .line 60
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->fileMaxSize:J

    return-wide v0
.end method

.method static synthetic access$300(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)I
    .locals 0

    .line 60
    iget p0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->maxInMemorySize:I

    return p0
.end method

.method static synthetic access$400(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;)Ljava/io/File;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->uploadTempDir:Ljava/io/File;

    return-object p0
.end method


# virtual methods
.method public allFileMaxSize(J)Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;
    .locals 0

    .line 78
    iput-wide p1, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->allFileMaxSize:J

    return-object p0
.end method

.method public build()Lcom/yanzhenjie/andserver/framework/config/Multipart;
    .locals 2

    .line 115
    new-instance v0, Lcom/yanzhenjie/andserver/framework/config/Multipart;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/framework/config/Multipart;-><init>(Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;Lcom/yanzhenjie/andserver/framework/config/Multipart$1;)V

    return-object v0
.end method

.method public fileMaxSize(J)Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;
    .locals 0

    .line 90
    iput-wide p1, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->fileMaxSize:J

    return-object p0
.end method

.method public maxInMemorySize(I)Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;
    .locals 0

    .line 102
    iput p1, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->maxInMemorySize:I

    return-object p0
.end method

.method public uploadTempDir(Ljava/io/File;)Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/config/Multipart$Builder;->uploadTempDir:Ljava/io/File;

    return-object p0
.end method
