.class public Lcom/yanzhenjie/andserver/error/MaxUploadSizeExceededException;
.super Lcom/yanzhenjie/andserver/error/BasicException;
.source "MaxUploadSizeExceededException.java"


# instance fields
.field private final mMaxSize:J


# direct methods
.method public constructor <init>(J)V
    .locals 1

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, p2, v0}, Lcom/yanzhenjie/andserver/error/MaxUploadSizeExceededException;-><init>(JLjava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(JLjava/lang/Throwable;)V
    .locals 2

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Maximum upload size of "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " bytes exceeded"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x19d

    invoke-direct {p0, v1, v0, p3}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    iput-wide p1, p0, Lcom/yanzhenjie/andserver/error/MaxUploadSizeExceededException;->mMaxSize:J

    return-void
.end method


# virtual methods
.method public getMaxSize()J
    .locals 2

    .line 51
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/error/MaxUploadSizeExceededException;->mMaxSize:J

    return-wide v0
.end method
