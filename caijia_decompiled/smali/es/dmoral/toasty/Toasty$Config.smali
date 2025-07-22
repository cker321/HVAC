.class public Les/dmoral/toasty/Toasty$Config;
.super Ljava/lang/Object;
.source "Toasty.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Les/dmoral/toasty/Toasty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Config"
.end annotation


# instance fields
.field private DEFAULT_TEXT_COLOR:I

.field private ERROR_COLOR:I

.field private INFO_COLOR:I

.field private SUCCESS_COLOR:I

.field private WARNING_COLOR:I

.field private tintIcon:Z

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$000()I

    move-result v0

    iput v0, p0, Les/dmoral/toasty/Toasty$Config;->DEFAULT_TEXT_COLOR:I

    .line 202
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$100()I

    move-result v0

    iput v0, p0, Les/dmoral/toasty/Toasty$Config;->ERROR_COLOR:I

    .line 204
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$200()I

    move-result v0

    iput v0, p0, Les/dmoral/toasty/Toasty$Config;->INFO_COLOR:I

    .line 206
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$300()I

    move-result v0

    iput v0, p0, Les/dmoral/toasty/Toasty$Config;->SUCCESS_COLOR:I

    .line 208
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$400()I

    move-result v0

    iput v0, p0, Les/dmoral/toasty/Toasty$Config;->WARNING_COLOR:I

    .line 210
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$500()Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Les/dmoral/toasty/Toasty$Config;->typeface:Landroid/graphics/Typeface;

    .line 212
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$600()Z

    move-result v0

    iput-boolean v0, p0, Les/dmoral/toasty/Toasty$Config;->tintIcon:Z

    return-void
.end method

.method public static getInstance()Les/dmoral/toasty/Toasty$Config;
    .locals 1

    .line 220
    new-instance v0, Les/dmoral/toasty/Toasty$Config;

    invoke-direct {v0}, Les/dmoral/toasty/Toasty$Config;-><init>()V

    return-object v0
.end method

.method public static reset()V
    .locals 1

    const-string v0, "#FFFFFF"

    .line 224
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$002(I)I

    const-string v0, "#D50000"

    .line 225
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$102(I)I

    const-string v0, "#3F51B5"

    .line 226
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$202(I)I

    const-string v0, "#388E3C"

    .line 227
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$302(I)I

    const-string v0, "#FFA900"

    .line 228
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$402(I)I

    .line 229
    invoke-static {}, Les/dmoral/toasty/Toasty;->access$700()Landroid/graphics/Typeface;

    move-result-object v0

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$502(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    const/4 v0, 0x1

    .line 230
    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$602(Z)Z

    return-void
.end method


# virtual methods
.method public apply()V
    .locals 1

    .line 276
    iget v0, p0, Les/dmoral/toasty/Toasty$Config;->DEFAULT_TEXT_COLOR:I

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$002(I)I

    .line 277
    iget v0, p0, Les/dmoral/toasty/Toasty$Config;->ERROR_COLOR:I

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$102(I)I

    .line 278
    iget v0, p0, Les/dmoral/toasty/Toasty$Config;->INFO_COLOR:I

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$202(I)I

    .line 279
    iget v0, p0, Les/dmoral/toasty/Toasty$Config;->SUCCESS_COLOR:I

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$302(I)I

    .line 280
    iget v0, p0, Les/dmoral/toasty/Toasty$Config;->WARNING_COLOR:I

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$402(I)I

    .line 281
    iget-object v0, p0, Les/dmoral/toasty/Toasty$Config;->typeface:Landroid/graphics/Typeface;

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$502(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 282
    iget-boolean v0, p0, Les/dmoral/toasty/Toasty$Config;->tintIcon:Z

    invoke-static {v0}, Les/dmoral/toasty/Toasty;->access$602(Z)Z

    return-void
.end method

.method public setErrorColor(I)Les/dmoral/toasty/Toasty$Config;
    .locals 0

    .line 241
    iput p1, p0, Les/dmoral/toasty/Toasty$Config;->ERROR_COLOR:I

    return-object p0
.end method

.method public setInfoColor(I)Les/dmoral/toasty/Toasty$Config;
    .locals 0

    .line 247
    iput p1, p0, Les/dmoral/toasty/Toasty$Config;->INFO_COLOR:I

    return-object p0
.end method

.method public setSuccessColor(I)Les/dmoral/toasty/Toasty$Config;
    .locals 0

    .line 253
    iput p1, p0, Les/dmoral/toasty/Toasty$Config;->SUCCESS_COLOR:I

    return-object p0
.end method

.method public setTextColor(I)Les/dmoral/toasty/Toasty$Config;
    .locals 0

    .line 235
    iput p1, p0, Les/dmoral/toasty/Toasty$Config;->DEFAULT_TEXT_COLOR:I

    return-object p0
.end method

.method public setToastTypeface(Landroid/graphics/Typeface;)Les/dmoral/toasty/Toasty$Config;
    .locals 0

    .line 265
    iput-object p1, p0, Les/dmoral/toasty/Toasty$Config;->typeface:Landroid/graphics/Typeface;

    return-object p0
.end method

.method public setWarningColor(I)Les/dmoral/toasty/Toasty$Config;
    .locals 0

    .line 259
    iput p1, p0, Les/dmoral/toasty/Toasty$Config;->WARNING_COLOR:I

    return-object p0
.end method

.method public tintIcon(Z)Les/dmoral/toasty/Toasty$Config;
    .locals 0

    .line 271
    iput-boolean p1, p0, Les/dmoral/toasty/Toasty$Config;->tintIcon:Z

    return-object p0
.end method
