.class public Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;
.super Ljava/lang/Object;
.source "Path.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/framework/mapping/Path;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Segment"
.end annotation


# instance fields
.field private final isBlurred:Z

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->value:Ljava/lang/String;

    .line 72
    iput-boolean p2, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->isBlurred:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 85
    instance-of v0, p1, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->value:Ljava/lang/String;

    check-cast p1, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;

    iget-object p1, p1, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->value:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->value:Ljava/lang/String;

    return-object v0
.end method

.method public isBlurred()Z
    .locals 1

    .line 80
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->isBlurred:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->value:Ljava/lang/String;

    return-object v0
.end method
