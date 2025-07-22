.class public Lcom/yanzhenjie/andserver/error/BodyMissingException;
.super Lcom/yanzhenjie/andserver/error/BasicException;
.source "BodyMissingException.java"


# static fields
.field private static final MESSAGE:Ljava/lang/String; = "RequestBody is missing."


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x190

    const-string v1, "RequestBody is missing."

    .line 28
    invoke-direct {p0, v0, v1}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 2

    const/16 v0, 0x190

    const-string v1, "RequestBody is missing."

    .line 32
    invoke-direct {p0, v0, v1, p1}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
