.class public Lcom/bigkoo/pickerview/view/WheelTime;
.super Ljava/lang/Object;
.source "WheelTime.java"


# static fields
.field private static final DEFAULT_END_DAY:I = 0x1f

.field private static final DEFAULT_END_MONTH:I = 0xc

.field private static final DEFAULT_END_YEAR:I = 0x834

.field private static final DEFAULT_START_DAY:I = 0x1

.field private static final DEFAULT_START_MONTH:I = 0x1

.field private static final DEFAULT_START_YEAR:I = 0x76c

.field public static dateFormat:Ljava/text/DateFormat;


# instance fields
.field private currentYear:I

.field private dividerColor:I

.field private dividerType:Lcom/contrarywind/view/WheelView$DividerType;

.field private endDay:I

.field private endMonth:I

.field private endYear:I

.field private gravity:I

.field private isLunarCalendar:Z

.field private lineSpacingMultiplier:F

.field private mSelectChangeCallback:Lcom/bigkoo/pickerview/listener/ISelectTimeCallback;

.field private startDay:I

.field private startMonth:I

.field private startYear:I

.field private textColorCenter:I

.field private textColorOut:I

.field private textSize:I

.field private type:[Z

.field private view:Landroid/view/View;

.field private wv_day:Lcom/contrarywind/view/WheelView;

.field private wv_hours:Lcom/contrarywind/view/WheelView;

.field private wv_minutes:Lcom/contrarywind/view/WheelView;

.field private wv_month:Lcom/contrarywind/view/WheelView;

.field private wv_seconds:Lcom/contrarywind/view/WheelView;

.field private wv_year:Lcom/contrarywind/view/WheelView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 22
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/bigkoo/pickerview/view/WheelTime;->dateFormat:Ljava/text/DateFormat;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;[ZII)V
    .locals 2

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x76c

    .line 40
    iput v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    const/16 v0, 0x834

    .line 41
    iput v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    const/4 v0, 0x1

    .line 42
    iput v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    const/16 v1, 0xc

    .line 43
    iput v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    .line 44
    iput v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    const/16 v0, 0x1f

    .line 45
    iput v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    const/4 v0, 0x0

    .line 57
    iput-boolean v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->isLunarCalendar:Z

    .line 62
    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    .line 63
    iput-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    .line 64
    iput p3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    .line 65
    iput p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textSize:I

    .line 66
    invoke-virtual {p0, p1}, Lcom/bigkoo/pickerview/view/WheelTime;->setView(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$000(Lcom/bigkoo/pickerview/view/WheelTime;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    return p0
.end method

.method static synthetic access$100(Lcom/bigkoo/pickerview/view/WheelTime;)Lcom/contrarywind/view/WheelView;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/bigkoo/pickerview/view/WheelTime;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    return p0
.end method

.method static synthetic access$1100(Lcom/bigkoo/pickerview/view/WheelTime;IIIILjava/util/List;Ljava/util/List;)V
    .locals 0

    .line 21
    invoke-direct/range {p0 .. p6}, Lcom/bigkoo/pickerview/view/WheelTime;->setReDay(IIIILjava/util/List;Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$200(Lcom/bigkoo/pickerview/view/WheelTime;)Lcom/contrarywind/view/WheelView;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/bigkoo/pickerview/view/WheelTime;)Lcom/bigkoo/pickerview/listener/ISelectTimeCallback;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->mSelectChangeCallback:Lcom/bigkoo/pickerview/listener/ISelectTimeCallback;

    return-object p0
.end method

.method static synthetic access$400(Lcom/bigkoo/pickerview/view/WheelTime;)Lcom/contrarywind/view/WheelView;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/bigkoo/pickerview/view/WheelTime;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->currentYear:I

    return p0
.end method

.method static synthetic access$502(Lcom/bigkoo/pickerview/view/WheelTime;I)I
    .locals 0

    .line 21
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->currentYear:I

    return p1
.end method

.method static synthetic access$600(Lcom/bigkoo/pickerview/view/WheelTime;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    return p0
.end method

.method static synthetic access$700(Lcom/bigkoo/pickerview/view/WheelTime;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    return p0
.end method

.method static synthetic access$800(Lcom/bigkoo/pickerview/view/WheelTime;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    return p0
.end method

.method static synthetic access$900(Lcom/bigkoo/pickerview/view/WheelTime;)I
    .locals 0

    .line 21
    iget p0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    return p0
.end method

.method private getLunarTime()Ljava/lang/String;
    .locals 7

    .line 750
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 751
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    add-int/2addr v1, v2

    .line 754
    invoke-static {v1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_0

    .line 755
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v2}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    :goto_0
    add-int/2addr v2, v4

    :goto_1
    const/4 v5, 0x0

    goto :goto_2

    .line 757
    :cond_0
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v2}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    add-int/2addr v2, v4

    invoke-static {v1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result v5

    sub-int/2addr v2, v5

    if-gtz v2, :cond_1

    .line 758
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v2}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    goto :goto_0

    .line 759
    :cond_1
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v2}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    add-int/2addr v2, v4

    invoke-static {v1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result v5

    sub-int/2addr v2, v5

    if-ne v2, v4, :cond_2

    .line 760
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v2}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    const/4 v5, 0x1

    goto :goto_2

    .line 763
    :cond_2
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v2}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    goto :goto_1

    .line 766
    :goto_2
    iget-object v6, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v6}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v6

    add-int/2addr v6, v4

    .line 767
    invoke-static {v1, v2, v6, v5}, Lcom/bigkoo/pickerview/utils/LunarCalendar;->lunarToSolar(IIIZ)[I

    move-result-object v1

    .line 769
    aget v2, v1, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v3, v1, v4

    .line 770
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x2

    aget v1, v1, v2

    .line 771
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    .line 772
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    .line 773
    invoke-virtual {v2}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    .line 774
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 775
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private setChangedListener(Lcom/contrarywind/view/WheelView;)V
    .locals 1

    .line 536
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->mSelectChangeCallback:Lcom/bigkoo/pickerview/listener/ISelectTimeCallback;

    if-eqz v0, :cond_0

    .line 537
    new-instance v0, Lcom/bigkoo/pickerview/view/WheelTime$5;

    invoke-direct {v0, p0}, Lcom/bigkoo/pickerview/view/WheelTime$5;-><init>(Lcom/bigkoo/pickerview/view/WheelTime;)V

    invoke-virtual {p1, v0}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    :cond_0
    return-void
.end method

.method private setContentTextSize()V
    .locals 2

    .line 589
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextSize(F)V

    .line 590
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextSize(F)V

    .line 591
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextSize(F)V

    .line 592
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextSize(F)V

    .line 593
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextSize(F)V

    .line 594
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextSize(F)V

    return-void
.end method

.method private setDividerColor()V
    .locals 2

    .line 616
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerColor:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerColor(I)V

    .line 617
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerColor:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerColor(I)V

    .line 618
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerColor:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerColor(I)V

    .line 619
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerColor:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerColor(I)V

    .line 620
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerColor:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerColor(I)V

    .line 621
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerColor:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerColor(I)V

    return-void
.end method

.method private setDividerType()V
    .locals 2

    .line 626
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V

    .line 627
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V

    .line 628
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V

    .line 629
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V

    .line 630
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V

    .line 631
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V

    return-void
.end method

.method private setLineSpacingMultiplier()V
    .locals 2

    .line 636
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->lineSpacingMultiplier:F

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setLineSpacingMultiplier(F)V

    .line 637
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->lineSpacingMultiplier:F

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setLineSpacingMultiplier(F)V

    .line 638
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->lineSpacingMultiplier:F

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setLineSpacingMultiplier(F)V

    .line 639
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->lineSpacingMultiplier:F

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setLineSpacingMultiplier(F)V

    .line 640
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->lineSpacingMultiplier:F

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setLineSpacingMultiplier(F)V

    .line 641
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->lineSpacingMultiplier:F

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setLineSpacingMultiplier(F)V

    return-void
.end method

.method private setLunar(IIIZIII)V
    .locals 2

    .line 103
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget p7, Lcom/bigkoo/pickerview/R$id;->year:I

    invoke-virtual {p4, p7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    check-cast p4, Lcom/contrarywind/view/WheelView;

    iput-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    .line 104
    new-instance p7, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    invoke-static {v0, v1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->getYears(II)Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {p7, v0}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {p4, p7}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 105
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    const-string p7, ""

    invoke-virtual {p4, p7}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    .line 106
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    sub-int v0, p1, v0

    invoke-virtual {p4, v0}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 107
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p4, v0}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 110
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget v0, Lcom/bigkoo/pickerview/R$id;->month:I

    invoke-virtual {p4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    check-cast p4, Lcom/contrarywind/view/WheelView;

    iput-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    .line 111
    new-instance v0, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-static {p1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->getMonths(I)Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {p4, v0}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 112
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p4, p7}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    .line 113
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p4, p2}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 114
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p4, v0}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 117
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget v0, Lcom/bigkoo/pickerview/R$id;->day:I

    invoke-virtual {p4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    check-cast p4, Lcom/contrarywind/view/WheelView;

    iput-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    .line 119
    invoke-static {p1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result p4

    if-nez p4, :cond_0

    .line 120
    iget-object p4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance v0, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-static {p1, p2}, Lcom/bigkoo/pickerview/utils/ChinaDate;->monthDays(II)I

    move-result p1

    invoke-static {p1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->getLunarDays(I)Ljava/util/ArrayList;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {p4, v0}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_0

    .line 122
    :cond_0
    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p4, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;

    invoke-static {p1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapDays(I)I

    move-result p1

    invoke-static {p1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->getLunarDays(I)Ljava/util/ArrayList;

    move-result-object p1

    invoke-direct {p4, p1}, Lcom/bigkoo/pickerview/adapter/ArrayWheelAdapter;-><init>(Ljava/util/List;)V

    invoke-virtual {p2, p4}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 124
    :goto_0
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p7}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    .line 125
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    const/4 p2, 0x1

    sub-int/2addr p3, p2

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 126
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget p3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 128
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget p3, Lcom/bigkoo/pickerview/R$id;->hour:I

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/contrarywind/view/WheelView;

    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    .line 129
    new-instance p3, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    const/16 p4, 0x17

    const/4 p7, 0x0

    invoke-direct {p3, p7, p4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 131
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p5}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 132
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget p3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 134
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget p3, Lcom/bigkoo/pickerview/R$id;->min:I

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/contrarywind/view/WheelView;

    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    .line 135
    new-instance p3, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    const/16 p4, 0x3b

    invoke-direct {p3, p7, p4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 137
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p6}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 138
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget p3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 140
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget p3, Lcom/bigkoo/pickerview/R$id;->second:I

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/contrarywind/view/WheelView;

    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    .line 141
    new-instance p3, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p3, p7, p4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 143
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p6}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 144
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget p3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 147
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    new-instance p3, Lcom/bigkoo/pickerview/view/WheelTime$1;

    invoke-direct {p3, p0}, Lcom/bigkoo/pickerview/view/WheelTime$1;-><init>(Lcom/bigkoo/pickerview/view/WheelTime;)V

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    .line 184
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    new-instance p3, Lcom/bigkoo/pickerview/view/WheelTime$2;

    invoke-direct {p3, p0}, Lcom/bigkoo/pickerview/view/WheelTime$2;-><init>(Lcom/bigkoo/pickerview/view/WheelTime;)V

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    .line 213
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-direct {p0, p1}, Lcom/bigkoo/pickerview/view/WheelTime;->setChangedListener(Lcom/contrarywind/view/WheelView;)V

    .line 214
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    invoke-direct {p0, p1}, Lcom/bigkoo/pickerview/view/WheelTime;->setChangedListener(Lcom/contrarywind/view/WheelView;)V

    .line 215
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    invoke-direct {p0, p1}, Lcom/bigkoo/pickerview/view/WheelTime;->setChangedListener(Lcom/contrarywind/view/WheelView;)V

    .line 216
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    invoke-direct {p0, p1}, Lcom/bigkoo/pickerview/view/WheelTime;->setChangedListener(Lcom/contrarywind/view/WheelView;)V

    .line 218
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    array-length p3, p1

    const/4 p4, 0x6

    if-ne p3, p4, :cond_7

    .line 221
    iget-object p3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    aget-boolean p1, p1, p7

    const/16 p4, 0x8

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    const/16 p1, 0x8

    :goto_1
    invoke-virtual {p3, p1}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 222
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget-object p3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    aget-boolean p2, p3, p2

    if-eqz p2, :cond_2

    const/4 p2, 0x0

    goto :goto_2

    :cond_2
    const/16 p2, 0x8

    :goto_2
    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 223
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    const/4 p3, 0x2

    aget-boolean p2, p2, p3

    if-eqz p2, :cond_3

    const/4 p2, 0x0

    goto :goto_3

    :cond_3
    const/16 p2, 0x8

    :goto_3
    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 224
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    const/4 p3, 0x3

    aget-boolean p2, p2, p3

    if-eqz p2, :cond_4

    const/4 p2, 0x0

    goto :goto_4

    :cond_4
    const/16 p2, 0x8

    :goto_4
    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 225
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    const/4 p3, 0x4

    aget-boolean p2, p2, p3

    if-eqz p2, :cond_5

    const/4 p2, 0x0

    goto :goto_5

    :cond_5
    const/16 p2, 0x8

    :goto_5
    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 226
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    const/4 p3, 0x5

    aget-boolean p2, p2, p3

    if-eqz p2, :cond_6

    goto :goto_6

    :cond_6
    const/16 p7, 0x8

    :goto_6
    invoke-virtual {p1, p7}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 227
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelTime;->setContentTextSize()V

    return-void

    .line 219
    :cond_7
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "type[] length is not 6"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private setReDay(IIIILjava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 549
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v0

    .line 552
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p5, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_1

    const/16 p1, 0x1f

    if-le p4, p1, :cond_0

    const/16 p4, 0x1f

    .line 556
    :cond_0
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p2, p3, p4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_0

    .line 558
    :cond_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p6, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    const/16 p1, 0x1e

    if-le p4, p1, :cond_2

    const/16 p4, 0x1e

    .line 562
    :cond_2
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p2, p3, p4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_0

    .line 565
    :cond_3
    rem-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_4

    rem-int/lit8 p2, p1, 0x64

    if-nez p2, :cond_5

    :cond_4
    rem-int/lit16 p1, p1, 0x190

    if-nez p1, :cond_7

    :cond_5
    const/16 p1, 0x1d

    if-le p4, p1, :cond_6

    const/16 p4, 0x1d

    .line 570
    :cond_6
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p2, p3, p4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_0

    :cond_7
    const/16 p1, 0x1c

    if-le p4, p1, :cond_8

    const/16 p4, 0x1c

    .line 576
    :cond_8
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p2, p3, p4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 581
    :goto_0
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1}, Lcom/contrarywind/view/WheelView;->getAdapter()Lcom/contrarywind/adapter/WheelAdapter;

    move-result-object p1

    invoke-interface {p1}, Lcom/contrarywind/adapter/WheelAdapter;->getItemsCount()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    if-le v0, p1, :cond_9

    .line 582
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1}, Lcom/contrarywind/view/WheelView;->getAdapter()Lcom/contrarywind/adapter/WheelAdapter;

    move-result-object p1

    invoke-interface {p1}, Lcom/contrarywind/adapter/WheelAdapter;->getItemsCount()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    .line 583
    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p2, p1}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    :cond_9
    return-void
.end method

.method private setSolar(IIIIII)V
    .locals 9

    const-string v0, "1"

    const-string v1, "3"

    const-string v2, "5"

    const-string v3, "7"

    const-string v4, "8"

    const-string v5, "10"

    const-string v6, "12"

    .line 242
    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    const-string v1, "4"

    const-string v2, "6"

    const-string v3, "9"

    const-string v4, "11"

    .line 243
    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v1

    .line 245
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 246
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 248
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->currentYear:I

    .line 250
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget v3, Lcom/bigkoo/pickerview/R$id;->year:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/contrarywind/view/WheelView;

    iput-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    .line 251
    new-instance v3, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    iget v5, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    invoke-direct {v3, v4, v5}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 254
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    sub-int v3, p1, v3

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 255
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 257
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget v3, Lcom/bigkoo/pickerview/R$id;->month:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/contrarywind/view/WheelView;

    iput-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    .line 258
    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    iget v4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    const/4 v5, 0x1

    if-ne v3, v4, :cond_0

    .line 259
    new-instance v3, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    iget v6, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    invoke-direct {v3, v4, v6}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 260
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    add-int/lit8 v3, p2, 0x1

    iget v4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    goto :goto_0

    :cond_0
    const/16 v6, 0xc

    if-ne p1, v3, :cond_1

    .line 263
    new-instance v3, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    invoke-direct {v3, v4, v6}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 264
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    add-int/lit8 v3, p2, 0x1

    iget v4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    goto :goto_0

    :cond_1
    if-ne p1, v4, :cond_2

    .line 267
    new-instance v3, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    invoke-direct {v3, v5, v4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 268
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v2, p2}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    goto :goto_0

    .line 270
    :cond_2
    new-instance v3, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {v3, v5, v6}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 271
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v2, p2}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 273
    :goto_0
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {v2, v3}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 275
    iget-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget v3, Lcom/bigkoo/pickerview/R$id;->day:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/contrarywind/view/WheelView;

    iput-object v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    .line 277
    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    const/16 v4, 0x1c

    const/16 v6, 0x1d

    const/16 v7, 0x1e

    const/16 v8, 0x1f

    if-ne v2, v3, :cond_c

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    if-ne v2, v3, :cond_c

    add-int/2addr p2, v5

    .line 278
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 279
    iget p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    if-le p1, v8, :cond_3

    .line 280
    iput v8, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    .line 282
    :cond_3
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    invoke-direct {p2, v2, v3}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_1

    .line 283
    :cond_4
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 284
    iget p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    if-le p1, v7, :cond_5

    .line 285
    iput v7, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    .line 287
    :cond_5
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    invoke-direct {p2, v2, v3}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_1

    .line 290
    :cond_6
    rem-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_7

    rem-int/lit8 p2, p1, 0x64

    if-nez p2, :cond_8

    :cond_7
    rem-int/lit16 p1, p1, 0x190

    if-nez p1, :cond_a

    .line 291
    :cond_8
    iget p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    if-le p1, v6, :cond_9

    .line 292
    iput v6, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    .line 294
    :cond_9
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    invoke-direct {p2, v2, v3}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_1

    .line 296
    :cond_a
    iget p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    if-le p1, v4, :cond_b

    .line 297
    iput v4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    .line 299
    :cond_b
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    invoke-direct {p2, v2, v3}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 302
    :goto_1
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    sub-int/2addr p3, p2

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    goto/16 :goto_5

    .line 303
    :cond_c
    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    if-ne p1, v2, :cond_12

    add-int/lit8 v2, p2, 0x1

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    if-ne v2, v3, :cond_12

    .line 305
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_d

    .line 307
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    invoke-direct {p2, v2, v8}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_2

    .line 308
    :cond_d
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_e

    .line 310
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    invoke-direct {p2, v2, v7}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_2

    .line 313
    :cond_e
    rem-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_f

    rem-int/lit8 p2, p1, 0x64

    if-nez p2, :cond_10

    :cond_f
    rem-int/lit16 p1, p1, 0x190

    if-nez p1, :cond_11

    .line 315
    :cond_10
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    invoke-direct {p2, v2, v6}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_2

    .line 318
    :cond_11
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    invoke-direct {p2, v2, v4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 321
    :goto_2
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    sub-int/2addr p3, p2

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    goto/16 :goto_5

    .line 322
    :cond_12
    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    if-ne p1, v2, :cond_1c

    add-int/lit8 v2, p2, 0x1

    iget v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    if-ne v2, v3, :cond_1c

    .line 324
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_14

    .line 325
    iget p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    if-le p1, v8, :cond_13

    .line 326
    iput v8, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    .line 328
    :cond_13
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    invoke-direct {p2, v5, v2}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_3

    .line 329
    :cond_14
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_16

    .line 330
    iget p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    if-le p1, v7, :cond_15

    .line 331
    iput v7, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    .line 333
    :cond_15
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    invoke-direct {p2, v5, v2}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_3

    .line 336
    :cond_16
    rem-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_17

    rem-int/lit8 p2, p1, 0x64

    if-nez p2, :cond_18

    :cond_17
    rem-int/lit16 p1, p1, 0x190

    if-nez p1, :cond_1a

    .line 337
    :cond_18
    iget p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    if-le p1, v6, :cond_19

    .line 338
    iput v6, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    .line 340
    :cond_19
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    invoke-direct {p2, v5, v2}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_3

    .line 342
    :cond_1a
    iget p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    if-le p1, v4, :cond_1b

    .line 343
    iput v4, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    .line 345
    :cond_1b
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    invoke-direct {p2, v5, v2}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 348
    :goto_3
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    sub-int/2addr p3, v5

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    goto :goto_5

    :cond_1c
    add-int/2addr p2, v5

    .line 351
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 353
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p2, v5, v8}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_4

    .line 354
    :cond_1d
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1e

    .line 356
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p2, v5, v7}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_4

    .line 359
    :cond_1e
    rem-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_1f

    rem-int/lit8 p2, p1, 0x64

    if-nez p2, :cond_20

    :cond_1f
    rem-int/lit16 p1, p1, 0x190

    if-nez p1, :cond_21

    .line 361
    :cond_20
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p2, v5, v6}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    goto :goto_4

    .line 364
    :cond_21
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p2, v5, v4}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 367
    :goto_4
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    sub-int/2addr p3, v5

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 370
    :goto_5
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 372
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget p2, Lcom/bigkoo/pickerview/R$id;->hour:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/contrarywind/view/WheelView;

    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    .line 373
    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    const/16 p3, 0x17

    const/4 v2, 0x0

    invoke-direct {p2, v2, p3}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 375
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p4}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 376
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 378
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget p2, Lcom/bigkoo/pickerview/R$id;->min:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/contrarywind/view/WheelView;

    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    .line 379
    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    const/16 p3, 0x3b

    invoke-direct {p2, v2, p3}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 381
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p5}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 382
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 384
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    sget p2, Lcom/bigkoo/pickerview/R$id;->second:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/contrarywind/view/WheelView;

    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    .line 385
    new-instance p2, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;

    invoke-direct {p2, v2, p3}, Lcom/bigkoo/pickerview/adapter/NumericWheelAdapter;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setAdapter(Lcom/contrarywind/adapter/WheelAdapter;)V

    .line 387
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p6}, Lcom/contrarywind/view/WheelView;->setCurrentItem(I)V

    .line 388
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->gravity:I

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setGravity(I)V

    .line 391
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/view/WheelTime$3;

    invoke-direct {p2, p0, v0, v1}, Lcom/bigkoo/pickerview/view/WheelTime$3;-><init>(Lcom/bigkoo/pickerview/view/WheelTime;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    .line 470
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    new-instance p2, Lcom/bigkoo/pickerview/view/WheelTime$4;

    invoke-direct {p2, p0, v0, v1}, Lcom/bigkoo/pickerview/view/WheelTime$4;-><init>(Lcom/bigkoo/pickerview/view/WheelTime;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setOnItemSelectedListener(Lcom/contrarywind/listener/OnItemSelectedListener;)V

    .line 518
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-direct {p0, p1}, Lcom/bigkoo/pickerview/view/WheelTime;->setChangedListener(Lcom/contrarywind/view/WheelView;)V

    .line 519
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    invoke-direct {p0, p1}, Lcom/bigkoo/pickerview/view/WheelTime;->setChangedListener(Lcom/contrarywind/view/WheelView;)V

    .line 520
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    invoke-direct {p0, p1}, Lcom/bigkoo/pickerview/view/WheelTime;->setChangedListener(Lcom/contrarywind/view/WheelView;)V

    .line 521
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    invoke-direct {p0, p1}, Lcom/bigkoo/pickerview/view/WheelTime;->setChangedListener(Lcom/contrarywind/view/WheelView;)V

    .line 523
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    array-length p2, p1

    const/4 p3, 0x6

    if-ne p2, p3, :cond_28

    .line 526
    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    aget-boolean p1, p1, v2

    const/16 p3, 0x8

    if-eqz p1, :cond_22

    const/4 p1, 0x0

    goto :goto_6

    :cond_22
    const/16 p1, 0x8

    :goto_6
    invoke-virtual {p2, p1}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 527
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    aget-boolean p2, p2, v5

    if-eqz p2, :cond_23

    const/4 p2, 0x0

    goto :goto_7

    :cond_23
    const/16 p2, 0x8

    :goto_7
    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 528
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    const/4 p4, 0x2

    aget-boolean p2, p2, p4

    if-eqz p2, :cond_24

    const/4 p2, 0x0

    goto :goto_8

    :cond_24
    const/16 p2, 0x8

    :goto_8
    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 529
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    const/4 p4, 0x3

    aget-boolean p2, p2, p4

    if-eqz p2, :cond_25

    const/4 p2, 0x0

    goto :goto_9

    :cond_25
    const/16 p2, 0x8

    :goto_9
    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 530
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    const/4 p4, 0x4

    aget-boolean p2, p2, p4

    if-eqz p2, :cond_26

    const/4 p2, 0x0

    goto :goto_a

    :cond_26
    const/16 p2, 0x8

    :goto_a
    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 531
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->type:[Z

    const/4 p4, 0x5

    aget-boolean p2, p2, p4

    if-eqz p2, :cond_27

    goto :goto_b

    :cond_27
    const/16 v2, 0x8

    :goto_b
    invoke-virtual {p1, v2}, Lcom/contrarywind/view/WheelView;->setVisibility(I)V

    .line 532
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelTime;->setContentTextSize()V

    return-void

    .line 524
    :cond_28
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "type[] length is not 6"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private setTextColorCenter()V
    .locals 2

    .line 607
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorCenter:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorCenter(I)V

    .line 608
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorCenter:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorCenter(I)V

    .line 609
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorCenter:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorCenter(I)V

    .line 610
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorCenter:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorCenter(I)V

    .line 611
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorCenter:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorCenter(I)V

    .line 612
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorCenter:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorCenter(I)V

    return-void
.end method

.method private setTextColorOut()V
    .locals 2

    .line 598
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorOut:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorOut(I)V

    .line 599
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorOut:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorOut(I)V

    .line 600
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorOut:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorOut(I)V

    .line 601
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorOut:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorOut(I)V

    .line 602
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorOut:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorOut(I)V

    .line 603
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorOut:I

    invoke-virtual {v0, v1}, Lcom/contrarywind/view/WheelView;->setTextColorOut(I)V

    return-void
.end method


# virtual methods
.method public getEndYear()I
    .locals 1

    .line 795
    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    return v0
.end method

.method public getStartYear()I
    .locals 1

    .line 787
    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    return v0
.end method

.method public getTime()Ljava/lang/String;
    .locals 6

    .line 707
    iget-boolean v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->isLunarCalendar:Z

    if-eqz v0, :cond_0

    .line 709
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelTime;->getLunarTime()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 711
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 712
    iget v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->currentYear:I

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    const-string v3, " "

    const-string v4, ":"

    const-string v5, "-"

    if-ne v1, v2, :cond_2

    .line 715
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    add-int/2addr v1, v2

    if-ne v1, v2, :cond_1

    .line 716
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    .line 717
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    .line 718
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    .line 719
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    .line 720
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    .line 721
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 723
    :cond_1
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    .line 724
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    .line 725
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    .line 726
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    .line 727
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    .line 728
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 732
    :cond_2
    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    iget v2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    .line 733
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    .line 734
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    .line 735
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    .line 736
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    .line 737
    invoke-virtual {v1}, Lcom/contrarywind/view/WheelView;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 740
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    .line 779
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    return-object v0
.end method

.method public isCenterLabel(Z)V
    .locals 1

    .line 914
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->isCenterLabel(Z)V

    .line 915
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->isCenterLabel(Z)V

    .line 916
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->isCenterLabel(Z)V

    .line 917
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->isCenterLabel(Z)V

    .line 918
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->isCenterLabel(Z)V

    .line 919
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->isCenterLabel(Z)V

    return-void
.end method

.method public isLunarMode()Z
    .locals 1

    .line 75
    iget-boolean v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->isLunarCalendar:Z

    return v0
.end method

.method public setCyclic(Z)V
    .locals 1

    .line 698
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    .line 699
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    .line 700
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    .line 701
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    .line 702
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    .line 703
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setCyclic(Z)V

    return-void
.end method

.method public setDividerColor(I)V
    .locals 0

    .line 876
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerColor:I

    .line 877
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelTime;->setDividerColor()V

    return-void
.end method

.method public setDividerType(Lcom/contrarywind/view/WheelView$DividerType;)V
    .locals 0

    .line 886
    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->dividerType:Lcom/contrarywind/view/WheelView$DividerType;

    .line 887
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelTime;->setDividerType()V

    return-void
.end method

.method public setEndYear(I)V
    .locals 0

    .line 799
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    return-void
.end method

.method public setLabels(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 645
    iget-boolean v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->isLunarCalendar:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 650
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    goto :goto_0

    .line 652
    :cond_1
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/bigkoo/pickerview/R$string;->pickerview_year:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    :goto_0
    if-eqz p2, :cond_2

    .line 655
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    goto :goto_1

    .line 657
    :cond_2
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/bigkoo/pickerview/R$string;->pickerview_month:I

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    :goto_1
    if-eqz p3, :cond_3

    .line 660
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    goto :goto_2

    .line 662
    :cond_3
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lcom/bigkoo/pickerview/R$string;->pickerview_day:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    :goto_2
    if-eqz p4, :cond_4

    .line 665
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p4}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    goto :goto_3

    .line 667
    :cond_4
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lcom/bigkoo/pickerview/R$string;->pickerview_hours:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    :goto_3
    if-eqz p5, :cond_5

    .line 670
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p5}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    goto :goto_4

    .line 672
    :cond_5
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lcom/bigkoo/pickerview/R$string;->pickerview_minutes:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    :goto_4
    if-eqz p6, :cond_6

    .line 675
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p6}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    goto :goto_5

    .line 677
    :cond_6
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    iget-object p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lcom/bigkoo/pickerview/R$string;->pickerview_seconds:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setLabel(Ljava/lang/String;)V

    :goto_5
    return-void
.end method

.method public setLineSpacingMultiplier(F)V
    .locals 0

    .line 866
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->lineSpacingMultiplier:F

    .line 867
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelTime;->setLineSpacingMultiplier()V

    return-void
.end method

.method public setLunarMode(Z)V
    .locals 0

    .line 71
    iput-boolean p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->isLunarCalendar:Z

    return-void
.end method

.method public setPicker(III)V
    .locals 7

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    .line 79
    invoke-virtual/range {v0 .. v6}, Lcom/bigkoo/pickerview/view/WheelTime;->setPicker(IIIIII)V

    return-void
.end method

.method public setPicker(IIIIII)V
    .locals 9

    .line 83
    iget-boolean v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->isLunarCalendar:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    add-int/2addr p2, v0

    .line 84
    invoke-static {p1, p2, p3}, Lcom/bigkoo/pickerview/utils/LunarCalendar;->solarToLunar(III)[I

    move-result-object p1

    const/4 p2, 0x0

    .line 85
    aget v2, p1, p2

    aget p3, p1, v0

    add-int/lit8 v3, p3, -0x1

    const/4 p3, 0x2

    aget v4, p1, p3

    const/4 p3, 0x3

    aget p1, p1, p3

    if-ne p1, v0, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    move-object v1, p0

    move v6, p4

    move v7, p5

    move v8, p6

    invoke-direct/range {v1 .. v8}, Lcom/bigkoo/pickerview/view/WheelTime;->setLunar(IIIZIII)V

    goto :goto_1

    .line 87
    :cond_1
    invoke-direct/range {p0 .. p6}, Lcom/bigkoo/pickerview/view/WheelTime;->setSolar(IIIIII)V

    :goto_1
    return-void
.end method

.method public setRangDate(Ljava/util/Calendar;Ljava/util/Calendar;)V
    .locals 4

    const/4 v0, 0x5

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-nez p1, :cond_2

    if-eqz p2, :cond_2

    .line 806
    invoke-virtual {p2, v2}, Ljava/util/Calendar;->get(I)I

    move-result p1

    .line 807
    invoke-virtual {p2, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/2addr v1, v2

    .line 808
    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    move-result p2

    .line 809
    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    if-le p1, v0, :cond_0

    .line 810
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    .line 811
    iput v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    .line 812
    iput p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    goto/16 :goto_0

    :cond_0
    if-ne p1, v0, :cond_6

    .line 814
    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    if-le v1, v0, :cond_1

    .line 815
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    .line 816
    iput v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    .line 817
    iput p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    goto/16 :goto_0

    :cond_1
    if-ne v1, v0, :cond_6

    .line 819
    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    if-le p2, v0, :cond_6

    .line 820
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    .line 821
    iput v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    .line 822
    iput p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    goto :goto_0

    :cond_2
    if-eqz p1, :cond_5

    if-nez p2, :cond_5

    .line 828
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    move-result p2

    .line 829
    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/2addr v1, v2

    .line 830
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    .line 831
    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    if-ge p2, v0, :cond_3

    .line 832
    iput v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    .line 833
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    .line 834
    iput p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    goto :goto_0

    :cond_3
    if-ne p2, v0, :cond_6

    .line 836
    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    if-ge v1, v0, :cond_4

    .line 837
    iput v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    .line 838
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    .line 839
    iput p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    goto :goto_0

    :cond_4
    if-ne v1, v0, :cond_6

    .line 841
    iget v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    if-ge p1, v0, :cond_6

    .line 842
    iput v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    .line 843
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    .line 844
    iput p2, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    goto :goto_0

    :cond_5
    if-eqz p1, :cond_6

    if-eqz p2, :cond_6

    .line 850
    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    iput v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    .line 851
    invoke-virtual {p2, v2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    iput v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endYear:I

    .line 852
    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/2addr v3, v2

    iput v3, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startMonth:I

    .line 853
    invoke-virtual {p2, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/2addr v1, v2

    iput v1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endMonth:I

    .line 854
    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startDay:I

    .line 855
    invoke-virtual {p2, v0}, Ljava/util/Calendar;->get(I)I

    move-result p1

    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->endDay:I

    :cond_6
    :goto_0
    return-void
.end method

.method public setSelectChangeCallback(Lcom/bigkoo/pickerview/listener/ISelectTimeCallback;)V
    .locals 0

    .line 923
    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->mSelectChangeCallback:Lcom/bigkoo/pickerview/listener/ISelectTimeCallback;

    return-void
.end method

.method public setStartYear(I)V
    .locals 0

    .line 791
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->startYear:I

    return-void
.end method

.method public setTextColorCenter(I)V
    .locals 0

    .line 896
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorCenter:I

    .line 897
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelTime;->setTextColorCenter()V

    return-void
.end method

.method public setTextColorOut(I)V
    .locals 0

    .line 906
    iput p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->textColorOut:I

    .line 907
    invoke-direct {p0}, Lcom/bigkoo/pickerview/view/WheelTime;->setTextColorOut()V

    return-void
.end method

.method public setTextXOffset(IIIIII)V
    .locals 1

    .line 684
    iget-object v0, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_day:Lcom/contrarywind/view/WheelView;

    invoke-virtual {v0, p1}, Lcom/contrarywind/view/WheelView;->setTextXOffset(I)V

    .line 685
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_month:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p2}, Lcom/contrarywind/view/WheelView;->setTextXOffset(I)V

    .line 686
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_year:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p3}, Lcom/contrarywind/view/WheelView;->setTextXOffset(I)V

    .line 687
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_hours:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p4}, Lcom/contrarywind/view/WheelView;->setTextXOffset(I)V

    .line 688
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_minutes:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p5}, Lcom/contrarywind/view/WheelView;->setTextXOffset(I)V

    .line 689
    iget-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->wv_seconds:Lcom/contrarywind/view/WheelView;

    invoke-virtual {p1, p6}, Lcom/contrarywind/view/WheelView;->setTextXOffset(I)V

    return-void
.end method

.method public setView(Landroid/view/View;)V
    .locals 0

    .line 783
    iput-object p1, p0, Lcom/bigkoo/pickerview/view/WheelTime;->view:Landroid/view/View;

    return-void
.end method
