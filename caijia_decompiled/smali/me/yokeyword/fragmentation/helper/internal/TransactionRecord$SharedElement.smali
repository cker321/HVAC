.class public Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;
.super Ljava/lang/Object;
.source "TransactionRecord.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SharedElement"
.end annotation


# instance fields
.field public sharedElement:Landroid/view/View;

.field public sharedName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;->sharedElement:Landroid/view/View;

    .line 25
    iput-object p2, p0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;->sharedName:Ljava/lang/String;

    return-void
.end method
