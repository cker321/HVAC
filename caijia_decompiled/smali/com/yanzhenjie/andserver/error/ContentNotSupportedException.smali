.class public Lcom/yanzhenjie/andserver/error/ContentNotSupportedException;
.super Lcom/yanzhenjie/andserver/error/BasicException;
.source "ContentNotSupportedException.java"


# static fields
.field private static final MESSAGE:Ljava/lang/String; = "The content type [%s] is not supported."


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/util/MediaType;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "The content type [%s] is not supported."

    .line 29
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x19f

    invoke-direct {p0, v0, p1}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/yanzhenjie/andserver/util/MediaType;Ljava/lang/Throwable;)V
    .locals 2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "The content type [%s] is not supported."

    .line 33
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x19f

    invoke-direct {p0, v0, p1, p2}, Lcom/yanzhenjie/andserver/error/BasicException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
