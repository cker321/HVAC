.class public Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;
.super Ljava/lang/Object;
.source "DebugFragmentRecord.java"


# instance fields
.field public childFragmentRecord:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;",
            ">;"
        }
    .end annotation
.end field

.field public fragmentName:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/List<",
            "Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;",
            ">;)V"
        }
    .end annotation

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;->fragmentName:Ljava/lang/CharSequence;

    .line 15
    iput-object p2, p0, Lme/yokeyword/fragmentation/debug/DebugFragmentRecord;->childFragmentRecord:Ljava/util/List;

    return-void
.end method
