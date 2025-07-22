.class Lcom/dnake/desktop/utils/PreferencesUtils$ViewHolder;
.super Ljava/lang/Object;
.source "PreferencesUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/utils/PreferencesUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolder"
.end annotation


# static fields
.field private static instance:Lcom/dnake/desktop/utils/PreferencesUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    new-instance v0, Lcom/dnake/desktop/utils/PreferencesUtils;

    invoke-direct {v0}, Lcom/dnake/desktop/utils/PreferencesUtils;-><init>()V

    sput-object v0, Lcom/dnake/desktop/utils/PreferencesUtils$ViewHolder;->instance:Lcom/dnake/desktop/utils/PreferencesUtils;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/dnake/desktop/utils/PreferencesUtils;
    .locals 1

    .line 24
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils$ViewHolder;->instance:Lcom/dnake/desktop/utils/PreferencesUtils;

    return-object v0
.end method
