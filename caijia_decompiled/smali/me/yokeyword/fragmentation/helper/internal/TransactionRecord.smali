.class public final Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;
.super Ljava/lang/Object;
.source "TransactionRecord.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;
    }
.end annotation


# instance fields
.field public currentFragmentPopEnter:I

.field public currentFragmentPopExit:I

.field public dontAddToBackStack:Z

.field public sharedElementList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lme/yokeyword/fragmentation/helper/internal/TransactionRecord$SharedElement;",
            ">;"
        }
    .end annotation
.end field

.field public tag:Ljava/lang/String;

.field public targetFragmentEnter:I

.field public targetFragmentExit:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x80000000

    .line 12
    iput v0, p0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentEnter:I

    .line 13
    iput v0, p0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->currentFragmentPopExit:I

    .line 14
    iput v0, p0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->currentFragmentPopEnter:I

    .line 15
    iput v0, p0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->targetFragmentExit:I

    const/4 v0, 0x0

    .line 16
    iput-boolean v0, p0, Lme/yokeyword/fragmentation/helper/internal/TransactionRecord;->dontAddToBackStack:Z

    return-void
.end method
