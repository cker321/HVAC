.class final Lorg/apache/httpcore/ExceptionLogger$2;
.super Ljava/lang/Object;
.source "ExceptionLogger.java"

# interfaces
.implements Lorg/apache/httpcore/ExceptionLogger;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/httpcore/ExceptionLogger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public log(Ljava/lang/Exception;)V
    .locals 0

    .line 47
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-void
.end method
