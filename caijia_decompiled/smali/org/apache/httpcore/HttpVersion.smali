.class public final Lorg/apache/httpcore/HttpVersion;
.super Lorg/apache/httpcore/ProtocolVersion;
.source "HttpVersion.java"


# static fields
.field public static final HTTP:Ljava/lang/String; = "HTTP"

.field public static final HTTP_0_9:Lorg/apache/httpcore/HttpVersion;

.field public static final HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

.field public static final HTTP_1_1:Lorg/apache/httpcore/HttpVersion;

.field private static final serialVersionUID:J = -0x514703574c384bf0L


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 55
    new-instance v0, Lorg/apache/httpcore/HttpVersion;

    const/4 v1, 0x0

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lorg/apache/httpcore/HttpVersion;-><init>(II)V

    sput-object v0, Lorg/apache/httpcore/HttpVersion;->HTTP_0_9:Lorg/apache/httpcore/HttpVersion;

    .line 58
    new-instance v0, Lorg/apache/httpcore/HttpVersion;

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lorg/apache/httpcore/HttpVersion;-><init>(II)V

    sput-object v0, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    .line 61
    new-instance v0, Lorg/apache/httpcore/HttpVersion;

    invoke-direct {v0, v2, v2}, Lorg/apache/httpcore/HttpVersion;-><init>(II)V

    sput-object v0, Lorg/apache/httpcore/HttpVersion;->HTTP_1_1:Lorg/apache/httpcore/HttpVersion;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    const-string v0, "HTTP"

    .line 73
    invoke-direct {p0, v0, p1, p2}, Lorg/apache/httpcore/ProtocolVersion;-><init>(Ljava/lang/String;II)V

    return-void
.end method


# virtual methods
.method public forVersion(II)Lorg/apache/httpcore/ProtocolVersion;
    .locals 1

    .line 88
    iget v0, p0, Lorg/apache/httpcore/HttpVersion;->major:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Lorg/apache/httpcore/HttpVersion;->minor:I

    if-ne p2, v0, :cond_0

    return-object p0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    if-nez p2, :cond_1

    .line 94
    sget-object p1, Lorg/apache/httpcore/HttpVersion;->HTTP_1_0:Lorg/apache/httpcore/HttpVersion;

    return-object p1

    :cond_1
    if-ne p2, v0, :cond_2

    .line 97
    sget-object p1, Lorg/apache/httpcore/HttpVersion;->HTTP_1_1:Lorg/apache/httpcore/HttpVersion;

    return-object p1

    :cond_2
    if-nez p1, :cond_3

    const/16 v0, 0x9

    if-ne p2, v0, :cond_3

    .line 101
    sget-object p1, Lorg/apache/httpcore/HttpVersion;->HTTP_0_9:Lorg/apache/httpcore/HttpVersion;

    return-object p1

    .line 105
    :cond_3
    new-instance v0, Lorg/apache/httpcore/HttpVersion;

    invoke-direct {v0, p1, p2}, Lorg/apache/httpcore/HttpVersion;-><init>(II)V

    return-object v0
.end method
