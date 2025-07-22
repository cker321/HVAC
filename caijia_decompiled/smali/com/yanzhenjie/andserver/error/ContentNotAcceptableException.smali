.class public Lcom/yanzhenjie/andserver/error/ContentNotAcceptableException;
.super Lcom/yanzhenjie/andserver/error/BasicException;
.source "ContentNotAcceptableException.java"


# static fields
.field private static final MESSAGE:Ljava/lang/String; = "Could not find acceptable representation."


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x196

    const-string v1, "Could not find acceptable representation."

    .line 28
    invoke-direct {p0, v0, v1}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const/16 v0, 0x196

    .line 32
    invoke-direct {p0, v0, p1, p2}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
