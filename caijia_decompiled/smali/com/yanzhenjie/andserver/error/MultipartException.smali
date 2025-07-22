.class public Lcom/yanzhenjie/andserver/error/MultipartException;
.super Lcom/yanzhenjie/andserver/error/BasicException;
.source "MultipartException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x190

    .line 31
    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const/16 v0, 0x190

    .line 41
    invoke-direct {p0, v0, p1, p2}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
