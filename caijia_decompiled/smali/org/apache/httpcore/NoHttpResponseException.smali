.class public Lorg/apache/httpcore/NoHttpResponseException;
.super Ljava/io/IOException;
.source "NoHttpResponseException.java"


# static fields
.field private static final serialVersionUID:J = -0x6a4a05b41a0a362eL


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 47
    invoke-static {p1}, Lorg/apache/httpcore/HttpException;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    return-void
.end method
