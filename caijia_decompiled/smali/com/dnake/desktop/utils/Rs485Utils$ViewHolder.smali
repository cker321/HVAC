.class Lcom/dnake/desktop/utils/Rs485Utils$ViewHolder;
.super Ljava/lang/Object;
.source "Rs485Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/utils/Rs485Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolder"
.end annotation


# static fields
.field static instance:Lcom/dnake/desktop/utils/Rs485Utils;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 328
    new-instance v0, Lcom/dnake/desktop/utils/Rs485Utils;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dnake/desktop/utils/Rs485Utils;-><init>(Lcom/dnake/desktop/utils/Rs485Utils$1;)V

    sput-object v0, Lcom/dnake/desktop/utils/Rs485Utils$ViewHolder;->instance:Lcom/dnake/desktop/utils/Rs485Utils;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 327
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
