.class public Lorg/apache/httpcore/config/MessageConstraints$Builder;
.super Ljava/lang/Object;
.source "MessageConstraints.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/httpcore/config/MessageConstraints;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private maxHeaderCount:I

.field private maxLineLength:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 98
    iput v0, p0, Lorg/apache/httpcore/config/MessageConstraints$Builder;->maxLineLength:I

    .line 99
    iput v0, p0, Lorg/apache/httpcore/config/MessageConstraints$Builder;->maxHeaderCount:I

    return-void
.end method


# virtual methods
.method public build()Lorg/apache/httpcore/config/MessageConstraints;
    .locals 3

    .line 113
    new-instance v0, Lorg/apache/httpcore/config/MessageConstraints;

    iget v1, p0, Lorg/apache/httpcore/config/MessageConstraints$Builder;->maxLineLength:I

    iget v2, p0, Lorg/apache/httpcore/config/MessageConstraints$Builder;->maxHeaderCount:I

    invoke-direct {v0, v1, v2}, Lorg/apache/httpcore/config/MessageConstraints;-><init>(II)V

    return-object v0
.end method

.method public setMaxHeaderCount(I)Lorg/apache/httpcore/config/MessageConstraints$Builder;
    .locals 0

    .line 108
    iput p1, p0, Lorg/apache/httpcore/config/MessageConstraints$Builder;->maxHeaderCount:I

    return-object p0
.end method

.method public setMaxLineLength(I)Lorg/apache/httpcore/config/MessageConstraints$Builder;
    .locals 0

    .line 103
    iput p1, p0, Lorg/apache/httpcore/config/MessageConstraints$Builder;->maxLineLength:I

    return-object p0
.end method
