.class public Lcom/dnake/desktop/widget/TimeView;
.super Landroid/widget/LinearLayout;
.source "TimeView.java"


# static fields
.field private static final REFRESH_DELAY:I = 0x3e8


# instance fields
.field private HOUR_FORMAT:Ljava/text/SimpleDateFormat;

.field private MONTH_FORMAT:Ljava/text/SimpleDateFormat;

.field private hourView:Landroid/widget/TextView;

.field private final mTimeRefresher:Ljava/lang/Runnable;

.field private monthView:Landroid/widget/TextView;

.field private weekView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 44
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 25
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    const-string v2, "HH:mm"

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/TimeView;->HOUR_FORMAT:Ljava/text/SimpleDateFormat;

    .line 27
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    const-string v2, "MM\u6708dd\u65e5 "

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/TimeView;->MONTH_FORMAT:Ljava/text/SimpleDateFormat;

    .line 49
    new-instance v0, Lcom/dnake/desktop/widget/TimeView$1;

    invoke-direct {v0, p0}, Lcom/dnake/desktop/widget/TimeView$1;-><init>(Lcom/dnake/desktop/widget/TimeView;)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/TimeView;->mTimeRefresher:Ljava/lang/Runnable;

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0, p1, v0}, Lcom/dnake/desktop/widget/TimeView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 39
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    const-string v2, "HH:mm"

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/TimeView;->HOUR_FORMAT:Ljava/text/SimpleDateFormat;

    .line 27
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    const-string v2, "MM\u6708dd\u65e5 "

    invoke-direct {v0, v2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/TimeView;->MONTH_FORMAT:Ljava/text/SimpleDateFormat;

    .line 49
    new-instance v0, Lcom/dnake/desktop/widget/TimeView$1;

    invoke-direct {v0, p0}, Lcom/dnake/desktop/widget/TimeView$1;-><init>(Lcom/dnake/desktop/widget/TimeView;)V

    iput-object v0, p0, Lcom/dnake/desktop/widget/TimeView;->mTimeRefresher:Ljava/lang/Runnable;

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/dnake/desktop/widget/TimeView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    new-instance p3, Ljava/text/SimpleDateFormat;

    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    const-string v1, "HH:mm"

    invoke-direct {p3, v1, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object p3, p0, Lcom/dnake/desktop/widget/TimeView;->HOUR_FORMAT:Ljava/text/SimpleDateFormat;

    .line 27
    new-instance p3, Ljava/text/SimpleDateFormat;

    sget-object v0, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    const-string v1, "MM\u6708dd\u65e5 "

    invoke-direct {p3, v1, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object p3, p0, Lcom/dnake/desktop/widget/TimeView;->MONTH_FORMAT:Ljava/text/SimpleDateFormat;

    .line 49
    new-instance p3, Lcom/dnake/desktop/widget/TimeView$1;

    invoke-direct {p3, p0}, Lcom/dnake/desktop/widget/TimeView$1;-><init>(Lcom/dnake/desktop/widget/TimeView;)V

    iput-object p3, p0, Lcom/dnake/desktop/widget/TimeView;->mTimeRefresher:Ljava/lang/Runnable;

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/dnake/desktop/widget/TimeView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method static synthetic access$000(Lcom/dnake/desktop/widget/TimeView;)Ljava/text/SimpleDateFormat;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/dnake/desktop/widget/TimeView;->HOUR_FORMAT:Ljava/text/SimpleDateFormat;

    return-object p0
.end method

.method static synthetic access$100(Lcom/dnake/desktop/widget/TimeView;)Landroid/widget/TextView;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/dnake/desktop/widget/TimeView;->hourView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/dnake/desktop/widget/TimeView;)Ljava/text/SimpleDateFormat;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/dnake/desktop/widget/TimeView;->MONTH_FORMAT:Ljava/text/SimpleDateFormat;

    return-object p0
.end method

.method static synthetic access$300(Lcom/dnake/desktop/widget/TimeView;)Landroid/widget/TextView;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/dnake/desktop/widget/TimeView;->monthView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/dnake/desktop/widget/TimeView;)Landroid/widget/TextView;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/dnake/desktop/widget/TimeView;->weekView:Landroid/widget/TextView;

    return-object p0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 61
    invoke-virtual {p0}, Lcom/dnake/desktop/widget/TimeView;->isInEditMode()Z

    move-result p2

    if-nez p2, :cond_0

    .line 63
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b001e

    .line 64
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0800d7

    .line 65
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/dnake/desktop/widget/TimeView;->hourView:Landroid/widget/TextView;

    const p2, 0x7f0800d8

    .line 66
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/dnake/desktop/widget/TimeView;->monthView:Landroid/widget/TextView;

    const p2, 0x7f0800d9

    .line 67
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/dnake/desktop/widget/TimeView;->weekView:Landroid/widget/TextView;

    :cond_0
    return-void
.end method


# virtual methods
.method public start()V
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/dnake/desktop/widget/TimeView;->mTimeRefresher:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/widget/TimeView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public stop()V
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/dnake/desktop/widget/TimeView;->mTimeRefresher:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/widget/TimeView;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method
