.class public Lorg/apache/commons/fileupload/MultipartStream$IllegalBoundaryException;
.super Ljava/io/IOException;
.source "MultipartStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/fileupload/MultipartStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IllegalBoundaryException"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x23de18ecd630fd6L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 796
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 806
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    return-void
.end method
