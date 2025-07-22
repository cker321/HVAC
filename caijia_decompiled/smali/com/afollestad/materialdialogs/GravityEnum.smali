.class public final enum Lcom/afollestad/materialdialogs/GravityEnum;
.super Ljava/lang/Enum;
.source "GravityEnum.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/afollestad/materialdialogs/GravityEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/afollestad/materialdialogs/GravityEnum;

.field public static final enum CENTER:Lcom/afollestad/materialdialogs/GravityEnum;

.field public static final enum END:Lcom/afollestad/materialdialogs/GravityEnum;

.field private static final HAS_RTL:Z

.field public static final enum START:Lcom/afollestad/materialdialogs/GravityEnum;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 10
    new-instance v0, Lcom/afollestad/materialdialogs/GravityEnum;

    const/4 v1, 0x0

    const-string v2, "START"

    invoke-direct {v0, v2, v1}, Lcom/afollestad/materialdialogs/GravityEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 11
    new-instance v0, Lcom/afollestad/materialdialogs/GravityEnum;

    const/4 v2, 0x1

    const-string v3, "CENTER"

    invoke-direct {v0, v3, v2}, Lcom/afollestad/materialdialogs/GravityEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->CENTER:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 12
    new-instance v0, Lcom/afollestad/materialdialogs/GravityEnum;

    const/4 v3, 0x2

    const-string v4, "END"

    invoke-direct {v0, v4, v3}, Lcom/afollestad/materialdialogs/GravityEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    const/4 v4, 0x3

    new-array v4, v4, [Lcom/afollestad/materialdialogs/GravityEnum;

    .line 9
    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    aput-object v5, v4, v1

    sget-object v5, Lcom/afollestad/materialdialogs/GravityEnum;->CENTER:Lcom/afollestad/materialdialogs/GravityEnum;

    aput-object v5, v4, v2

    aput-object v0, v4, v3

    sput-object v4, Lcom/afollestad/materialdialogs/GravityEnum;->$VALUES:[Lcom/afollestad/materialdialogs/GravityEnum;

    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v0, v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    sput-boolean v1, Lcom/afollestad/materialdialogs/GravityEnum;->HAS_RTL:Z

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/afollestad/materialdialogs/GravityEnum;
    .locals 1

    .line 9
    const-class v0, Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/afollestad/materialdialogs/GravityEnum;

    return-object p0
.end method

.method public static values()[Lcom/afollestad/materialdialogs/GravityEnum;
    .locals 1

    .line 9
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->$VALUES:[Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-virtual {v0}, [Lcom/afollestad/materialdialogs/GravityEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/afollestad/materialdialogs/GravityEnum;

    return-object v0
.end method


# virtual methods
.method public getGravityInt()I
    .locals 4

    .line 19
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum$1;->$SwitchMap$com$afollestad$materialdialogs$GravityEnum:[I

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/GravityEnum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-eq v0, v2, :cond_3

    const/4 v3, 0x2

    if-eq v0, v3, :cond_2

    if-ne v0, v1, :cond_1

    .line 25
    sget-boolean v0, Lcom/afollestad/materialdialogs/GravityEnum;->HAS_RTL:Z

    if-eqz v0, :cond_0

    const v0, 0x800005

    goto :goto_0

    :cond_0
    const/4 v0, 0x5

    :goto_0
    return v0

    .line 27
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid gravity constant"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    return v2

    .line 21
    :cond_3
    sget-boolean v0, Lcom/afollestad/materialdialogs/GravityEnum;->HAS_RTL:Z

    if-eqz v0, :cond_4

    const v1, 0x800003

    :cond_4
    return v1
.end method

.method public getTextAlignment()I
    .locals 2

    .line 33
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum$1;->$SwitchMap$com$afollestad$materialdialogs$GravityEnum:[I

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/GravityEnum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v0, 0x5

    return v0

    :cond_0
    const/4 v0, 0x6

    return v0

    :cond_1
    const/4 v0, 0x4

    return v0
.end method
