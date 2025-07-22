.class public Lcom/yanzhenjie/andserver/error/ParamValidateException;
.super Lcom/yanzhenjie/andserver/error/BasicException;
.source "ParamValidateException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x193

    .line 26
    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const/16 v0, 0x193

    .line 30
    invoke-direct {p0, v0, p1, p2}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1

    const/16 v0, 0x193

    .line 34
    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/Throwable;)V

    return-void
.end method
