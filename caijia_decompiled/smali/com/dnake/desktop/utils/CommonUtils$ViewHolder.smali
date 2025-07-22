.class Lcom/dnake/desktop/utils/CommonUtils$ViewHolder;
.super Ljava/lang/Object;
.source "CommonUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/utils/CommonUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolder"
.end annotation


# static fields
.field private static instance:Lcom/dnake/desktop/utils/CommonUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 57
    new-instance v0, Lcom/dnake/desktop/utils/CommonUtils;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;-><init>(Lcom/dnake/desktop/utils/CommonUtils$1;)V

    sput-object v0, Lcom/dnake/desktop/utils/CommonUtils$ViewHolder;->instance:Lcom/dnake/desktop/utils/CommonUtils;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/dnake/desktop/utils/CommonUtils;
    .locals 1

    .line 56
    sget-object v0, Lcom/dnake/desktop/utils/CommonUtils$ViewHolder;->instance:Lcom/dnake/desktop/utils/CommonUtils;

    return-object v0
.end method
