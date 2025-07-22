.class public Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;
.super Ljava/lang/Object;
.source "Path.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/framework/mapping/Path;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Rule"
.end annotation


# instance fields
.field private mSegments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getSegments()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;"
        }
    .end annotation

    .line 57
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;->mSegments:Ljava/util/List;

    return-object v0
.end method

.method public setSegments(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;)V"
        }
    .end annotation

    .line 61
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;->mSegments:Ljava/util/List;

    return-void
.end method
