.class public Les/dmoral/toasty/Toasty;
.super Ljava/lang/Object;
.source "Toasty.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Les/dmoral/toasty/Toasty$Config;
    }
.end annotation


# static fields
.field private static DEFAULT_TEXT_COLOR:I

.field private static ERROR_COLOR:I

.field private static INFO_COLOR:I

.field private static final LOADED_TOAST_TYPEFACE:Landroid/graphics/Typeface;

.field private static SUCCESS_COLOR:I

.field private static WARNING_COLOR:I

.field private static currentTypeface:Landroid/graphics/Typeface;

.field private static tintIcon:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "#FFFFFF"

    .line 38
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Les/dmoral/toasty/Toasty;->DEFAULT_TEXT_COLOR:I

    const-string v0, "#D50000"

    .line 40
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Les/dmoral/toasty/Toasty;->ERROR_COLOR:I

    const-string v0, "#3F51B5"

    .line 42
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Les/dmoral/toasty/Toasty;->INFO_COLOR:I

    const-string v0, "#388E3C"

    .line 44
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Les/dmoral/toasty/Toasty;->SUCCESS_COLOR:I

    const-string v0, "#FFA900"

    .line 46
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    sput v0, Les/dmoral/toasty/Toasty;->WARNING_COLOR:I

    const-string v0, "sans-serif-condensed"

    const/4 v1, 0x0

    .line 48
    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    sput-object v0, Les/dmoral/toasty/Toasty;->LOADED_TOAST_TYPEFACE:Landroid/graphics/Typeface;

    .line 49
    sput-object v0, Les/dmoral/toasty/Toasty;->currentTypeface:Landroid/graphics/Typeface;

    const/4 v0, 0x1

    .line 51
    sput-boolean v0, Les/dmoral/toasty/Toasty;->tintIcon:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    .line 36
    sget v0, Les/dmoral/toasty/Toasty;->DEFAULT_TEXT_COLOR:I

    return v0
.end method

.method static synthetic access$002(I)I
    .locals 0

    .line 36
    sput p0, Les/dmoral/toasty/Toasty;->DEFAULT_TEXT_COLOR:I

    return p0
.end method

.method static synthetic access$100()I
    .locals 1

    .line 36
    sget v0, Les/dmoral/toasty/Toasty;->ERROR_COLOR:I

    return v0
.end method

.method static synthetic access$102(I)I
    .locals 0

    .line 36
    sput p0, Les/dmoral/toasty/Toasty;->ERROR_COLOR:I

    return p0
.end method

.method static synthetic access$200()I
    .locals 1

    .line 36
    sget v0, Les/dmoral/toasty/Toasty;->INFO_COLOR:I

    return v0
.end method

.method static synthetic access$202(I)I
    .locals 0

    .line 36
    sput p0, Les/dmoral/toasty/Toasty;->INFO_COLOR:I

    return p0
.end method

.method static synthetic access$300()I
    .locals 1

    .line 36
    sget v0, Les/dmoral/toasty/Toasty;->SUCCESS_COLOR:I

    return v0
.end method

.method static synthetic access$302(I)I
    .locals 0

    .line 36
    sput p0, Les/dmoral/toasty/Toasty;->SUCCESS_COLOR:I

    return p0
.end method

.method static synthetic access$400()I
    .locals 1

    .line 36
    sget v0, Les/dmoral/toasty/Toasty;->WARNING_COLOR:I

    return v0
.end method

.method static synthetic access$402(I)I
    .locals 0

    .line 36
    sput p0, Les/dmoral/toasty/Toasty;->WARNING_COLOR:I

    return p0
.end method

.method static synthetic access$500()Landroid/graphics/Typeface;
    .locals 1

    .line 36
    sget-object v0, Les/dmoral/toasty/Toasty;->currentTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method static synthetic access$502(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    .locals 0

    .line 36
    sput-object p0, Les/dmoral/toasty/Toasty;->currentTypeface:Landroid/graphics/Typeface;

    return-object p0
.end method

.method static synthetic access$600()Z
    .locals 1

    .line 36
    sget-boolean v0, Les/dmoral/toasty/Toasty;->tintIcon:Z

    return v0
.end method

.method static synthetic access$602(Z)Z
    .locals 0

    .line 36
    sput-boolean p0, Les/dmoral/toasty/Toasty;->tintIcon:Z

    return p0
.end method

.method static synthetic access$700()Landroid/graphics/Typeface;
    .locals 1

    .line 36
    sget-object v0, Les/dmoral/toasty/Toasty;->LOADED_TOAST_TYPEFACE:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public static custom(Landroid/content/Context;Ljava/lang/CharSequence;IIIZZ)Landroid/widget/Toast;
    .locals 7

    .line 158
    invoke-static {p0, p2}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-static/range {v0 .. v6}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIZZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIZZ)Landroid/widget/Toast;
    .locals 4

    .line 166
    new-instance v0, Landroid/widget/Toast;

    invoke-direct {v0, p0}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    const-string v1, "layout_inflater"

    .line 167
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    sget v2, Les/dmoral/toasty/R$layout;->toast_layout:I

    const/4 v3, 0x0

    .line 168
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 169
    sget v2, Les/dmoral/toasty/R$id;->toast_icon:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 170
    sget v3, Les/dmoral/toasty/R$id;->toast_text:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz p6, :cond_0

    .line 174
    invoke-static {p0, p3}, Les/dmoral/toasty/ToastyUtils;->tint9PatchDrawableFrame(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    goto :goto_0

    .line 176
    :cond_0
    sget p3, Les/dmoral/toasty/R$drawable;->toast_frame:I

    invoke-static {p0, p3}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 177
    :goto_0
    invoke-static {v1, p0}, Les/dmoral/toasty/ToastyUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    if-eqz p5, :cond_3

    if-eqz p2, :cond_2

    .line 182
    sget-boolean p0, Les/dmoral/toasty/Toasty;->tintIcon:Z

    if-eqz p0, :cond_1

    .line 183
    sget p0, Les/dmoral/toasty/Toasty;->DEFAULT_TEXT_COLOR:I

    invoke-static {p2, p0}, Les/dmoral/toasty/ToastyUtils;->tintIcon(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    .line 184
    :cond_1
    invoke-static {v2, p2}, Les/dmoral/toasty/ToastyUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 181
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Avoid passing \'icon\' as null if \'withIcon\' is set to true"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    const/16 p0, 0x8

    .line 186
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 189
    :goto_1
    sget p0, Les/dmoral/toasty/Toasty;->DEFAULT_TEXT_COLOR:I

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 190
    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    sget-object p0, Les/dmoral/toasty/Toasty;->currentTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 193
    invoke-virtual {v0, v1}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 194
    invoke-virtual {v0, p4}, Landroid/widget/Toast;->setDuration(I)V

    return-object v0
.end method

.method public static custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IZ)Landroid/widget/Toast;
    .locals 7

    const/4 v3, -0x1

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p3

    move v5, p4

    .line 151
    invoke-static/range {v0 .. v6}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIZZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static error(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 134
    invoke-static {p0, p1, v0, v1}, Les/dmoral/toasty/Toasty;->error(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static error(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 1

    const/4 v0, 0x1

    .line 139
    invoke-static {p0, p1, p2, v0}, Les/dmoral/toasty/Toasty;->error(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static error(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;
    .locals 8

    .line 144
    sget v0, Les/dmoral/toasty/R$drawable;->ic_clear_white_48dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget v4, Les/dmoral/toasty/Toasty;->ERROR_COLOR:I

    const/4 v7, 0x1

    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move v6, p3

    invoke-static/range {v1 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIZZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static info(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 102
    invoke-static {p0, p1, v0, v1}, Les/dmoral/toasty/Toasty;->info(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static info(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 1

    const/4 v0, 0x1

    .line 107
    invoke-static {p0, p1, p2, v0}, Les/dmoral/toasty/Toasty;->info(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static info(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;
    .locals 8

    .line 112
    sget v0, Les/dmoral/toasty/R$drawable;->ic_info_outline_white_48dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget v4, Les/dmoral/toasty/Toasty;->INFO_COLOR:I

    const/4 v7, 0x1

    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move v6, p3

    invoke-static/range {v1 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIZZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 59
    invoke-static {p0, p1, v0, v1, v0}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 69
    invoke-static {p0, p1, p2, v0, v1}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;)Landroid/widget/Toast;
    .locals 1

    const/4 v0, 0x1

    .line 75
    invoke-static {p0, p1, p2, p3, v0}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;
    .locals 0

    .line 81
    invoke-static {p0, p1, p3, p2, p4}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static normal(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;)Landroid/widget/Toast;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 64
    invoke-static {p0, p1, v0, p2, v1}, Les/dmoral/toasty/Toasty;->normal(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/graphics/drawable/Drawable;Z)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static success(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 118
    invoke-static {p0, p1, v0, v1}, Les/dmoral/toasty/Toasty;->success(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static success(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 1

    const/4 v0, 0x1

    .line 123
    invoke-static {p0, p1, p2, v0}, Les/dmoral/toasty/Toasty;->success(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static success(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;
    .locals 8

    .line 128
    sget v0, Les/dmoral/toasty/R$drawable;->ic_check_white_48dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget v4, Les/dmoral/toasty/Toasty;->SUCCESS_COLOR:I

    const/4 v7, 0x1

    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move v6, p3

    invoke-static/range {v1 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIZZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static warning(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/widget/Toast;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 86
    invoke-static {p0, p1, v0, v1}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static warning(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    .locals 1

    const/4 v0, 0x1

    .line 91
    invoke-static {p0, p1, p2, v0}, Les/dmoral/toasty/Toasty;->warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method

.method public static warning(Landroid/content/Context;Ljava/lang/CharSequence;IZ)Landroid/widget/Toast;
    .locals 8

    .line 96
    sget v0, Les/dmoral/toasty/R$drawable;->ic_error_outline_white_48dp:I

    invoke-static {p0, v0}, Les/dmoral/toasty/ToastyUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    sget v4, Les/dmoral/toasty/Toasty;->WARNING_COLOR:I

    const/4 v7, 0x1

    move-object v1, p0

    move-object v2, p1

    move v5, p2

    move v6, p3

    invoke-static/range {v1 .. v7}, Les/dmoral/toasty/Toasty;->custom(Landroid/content/Context;Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;IIZZ)Landroid/widget/Toast;

    move-result-object p0

    return-object p0
.end method
