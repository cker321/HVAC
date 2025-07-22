.class public Lcom/yanzhenjie/andserver/error/BasicException;
.super Ljava/lang/RuntimeException;
.source "BasicException.java"


# instance fields
.field private mStatusCode:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 29
    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 30
    iput p1, p0, Lcom/yanzhenjie/andserver/error/BasicException;->mStatusCode:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 34
    invoke-direct {p0, p2, p3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    iput p1, p0, Lcom/yanzhenjie/andserver/error/BasicException;->mStatusCode:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/Throwable;)V
    .locals 0

    .line 39
    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 40
    iput p1, p0, Lcom/yanzhenjie/andserver/error/BasicException;->mStatusCode:I

    return-void
.end method


# virtual methods
.method public getStatusCode()I
    .locals 1

    .line 44
    iget v0, p0, Lcom/yanzhenjie/andserver/error/BasicException;->mStatusCode:I

    return v0
.end method
