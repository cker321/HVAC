.class public Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;
.super Ljava/lang/Object;
.source "FlymeOSStatusBarFontUtils.java"


# static fields
.field private static SYSTEM_UI_FLAG_LIGHT_STATUS_BAR:I

.field private static mSetStatusBarColorIcon:Ljava/lang/reflect/Method;

.field private static mSetStatusBarDarkIcon:Ljava/lang/reflect/Method;

.field private static mStatusBarColorFiled:Ljava/lang/reflect/Field;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const-string v0, "setStatusBarDarkIcon"

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 27
    :try_start_0
    const-class v3, Landroid/app/Activity;

    new-array v4, v2, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v3, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    sput-object v3, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->mSetStatusBarColorIcon:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    :catch_0
    :try_start_1
    const-class v3, Landroid/app/Activity;

    new-array v2, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v1

    invoke-virtual {v3, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->mSetStatusBarDarkIcon:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    .line 37
    :catch_1
    :try_start_2
    const-class v0, Landroid/view/WindowManager$LayoutParams;

    const-string v1, "statusBarColor"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->mStatusBarColorFiled:Ljava/lang/reflect/Field;
    :try_end_2
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_2

    .line 42
    :catch_2
    :try_start_3
    const-class v0, Landroid/view/View;

    const-string v1, "SYSTEM_UI_FLAG_LIGHT_STATUS_BAR"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    sput v0, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->SYSTEM_UI_FLAG_LIGHT_STATUS_BAR:I
    :try_end_3
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static changeMeizuFlag(Landroid/view/WindowManager$LayoutParams;Ljava/lang/String;Z)Z
    .locals 3

    .line 132
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v0, 0x1

    .line 133
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 134
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    .line 135
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "meizuFlags"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 136
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 137
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    if-eqz p2, :cond_0

    or-int/2addr p1, v2

    goto :goto_0

    :cond_0
    xor-int/lit8 p1, p1, -0x1

    and-int/2addr p1, v2

    :goto_0
    if-eq v2, p1, :cond_1

    .line 145
    invoke-virtual {v1, p0, p1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    :catchall_0
    move-exception p0

    .line 155
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    :catch_0
    move-exception p0

    .line 153
    invoke-virtual {p0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception p0

    .line 151
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_1

    :catch_2
    move-exception p0

    .line 149
    invoke-virtual {p0}, Ljava/lang/NoSuchFieldException;->printStackTrace()V

    :cond_1
    :goto_1
    const/4 p0, 0x0

    return p0
.end method

.method public static isBlackColor(II)Z
    .locals 0

    .line 59
    invoke-static {p0}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->toGrey(I)I

    move-result p0

    if-ge p0, p1, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static setStatusBarColor(Landroid/view/Window;I)V
    .locals 2

    .line 186
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 187
    sget-object v1, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->mStatusBarColorFiled:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_0

    .line 189
    :try_start_0
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    if-eq v1, p1, :cond_0

    .line 191
    sget-object v1, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->mStatusBarColorFiled:Ljava/lang/reflect/Field;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 192
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 195
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public static setStatusBarDarkIcon(Landroid/app/Activity;I)V
    .locals 3

    .line 84
    sget-object v0, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->mSetStatusBarColorIcon:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :try_start_0
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 86
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v2

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 90
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p0

    .line 88
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    :cond_0
    const/16 v0, 0x32

    .line 93
    invoke-static {p1, v0}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->isBlackColor(II)Z

    move-result v0

    .line 94
    sget-object v1, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->mStatusBarColorFiled:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_1

    .line 95
    invoke-static {p0, v0, v0}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarDarkIcon(Landroid/app/Activity;ZZ)V

    .line 96
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarDarkIcon(Landroid/view/Window;I)V

    goto :goto_0

    .line 98
    :cond_1
    invoke-static {p0, v0}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarDarkIcon(Landroid/app/Activity;Z)V

    :goto_0
    return-void
.end method

.method public static setStatusBarDarkIcon(Landroid/app/Activity;Z)V
    .locals 1

    const/4 v0, 0x1

    .line 127
    invoke-static {p0, p1, v0}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarDarkIcon(Landroid/app/Activity;ZZ)V

    return-void
.end method

.method private static setStatusBarDarkIcon(Landroid/app/Activity;ZZ)V
    .locals 2

    .line 217
    sget-object v0, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->mSetStatusBarDarkIcon:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 p2, 0x1

    :try_start_0
    new-array p2, p2, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 219
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, p2, v1

    invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 223
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p0

    .line 221
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 227
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarDarkIcon(Landroid/view/Window;Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method private static setStatusBarDarkIcon(Landroid/view/View;Z)V
    .locals 1

    .line 167
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    if-eqz p1, :cond_0

    .line 170
    sget p1, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->SYSTEM_UI_FLAG_LIGHT_STATUS_BAR:I

    or-int/2addr p1, v0

    goto :goto_0

    .line 172
    :cond_0
    sget p1, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->SYSTEM_UI_FLAG_LIGHT_STATUS_BAR:I

    xor-int/lit8 p1, p1, -0x1

    and-int/2addr p1, v0

    :goto_0
    if-eq p1, v0, :cond_1

    .line 175
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_1
    return-void
.end method

.method public static setStatusBarDarkIcon(Landroid/view/Window;I)V
    .locals 1

    .line 111
    :try_start_0
    invoke-static {p0, p1}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarColor(Landroid/view/Window;I)V

    .line 112
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x16

    if-le p1, v0, :cond_0

    .line 113
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const/4 p1, 0x1

    invoke-static {p0, p1}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarDarkIcon(Landroid/view/View;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 116
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public static setStatusBarDarkIcon(Landroid/view/Window;Z)V
    .locals 2

    .line 207
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    .line 208
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p0

    const-string v0, "MEIZU_FLAG_DARK_STATUS_BAR_ICON"

    invoke-static {p0, v0, p1}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->changeMeizuFlag(Landroid/view/WindowManager$LayoutParams;Ljava/lang/String;Z)Z

    goto :goto_0

    .line 210
    :cond_0
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 211
    invoke-static {v0, p1}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarDarkIcon(Landroid/view/View;Z)V

    const/4 p1, 0x0

    .line 212
    invoke-static {p0, p1}, Lcom/gyf/barlibrary/FlymeOSStatusBarFontUtils;->setStatusBarColor(Landroid/view/Window;I)V

    :goto_0
    return-void
.end method

.method public static toGrey(I)I
    .locals 3

    and-int/lit16 v0, p0, 0xff

    const v1, 0xff00

    and-int/2addr v1, p0

    shr-int/lit8 v1, v1, 0x8

    const/high16 v2, 0xff0000

    and-int/2addr p0, v2

    shr-int/lit8 p0, p0, 0x10

    mul-int/lit8 p0, p0, 0x26

    mul-int/lit8 v1, v1, 0x4b

    add-int/2addr p0, v1

    mul-int/lit8 v0, v0, 0xf

    add-int/2addr p0, v0

    shr-int/lit8 p0, p0, 0x7

    return p0
.end method
