.class public Lcom/dnake/desktop/utils/PreferencesUtils;
.super Ljava/lang/Object;
.source "PreferencesUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dnake/desktop/utils/PreferencesUtils$ViewHolder;
    }
.end annotation


# static fields
.field private static final DEFAULT_BOOLEAN_VALUE:Z = false

.field private static final DEFAULT_DOUBLE_VALUE:D = -1.0

.field private static final DEFAULT_FLOAT_VALUE:F = -1.0f

.field private static final DEFAULT_INT_VALUE:I = -0x1

.field private static final DEFAULT_LONG_VALUE:J = -0x1L

.field public static final DEFAULT_STRING_VALUE:Ljava/lang/String; = ""

.field private static FILE_NAME:Ljava/lang/String; = "sp_config"

.field private static sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/dnake/desktop/utils/PreferencesUtils;
    .locals 2

    .line 18
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    .line 19
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->FILE_NAME:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    sput-object p0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 21
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/utils/PreferencesUtils$ViewHolder;->access$000()Lcom/dnake/desktop/utils/PreferencesUtils;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 87
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public read(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 29
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 33
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public readBoolean(Ljava/lang/String;)Z
    .locals 2

    .line 65
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public readBoolean(Ljava/lang/String;Z)Z
    .locals 1

    .line 69
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public readFloat(Ljava/lang/String;)F
    .locals 2

    .line 53
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p1

    return p1
.end method

.method public readFloat(Ljava/lang/String;F)F
    .locals 1

    .line 57
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p1

    return p1
.end method

.method public readInt(Ljava/lang/String;)I
    .locals 2

    .line 41
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    const/4 v1, -0x1

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public readInt(Ljava/lang/String;I)I
    .locals 1

    .line 45
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public removeByKey(Ljava/lang/String;)V
    .locals 1

    .line 80
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public write(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 37
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public writeBoolean(Ljava/lang/String;Z)V
    .locals 1

    .line 73
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public writeFloat(Ljava/lang/String;F)V
    .locals 1

    .line 61
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public writeInt(Ljava/lang/String;I)V
    .locals 1

    .line 49
    sget-object v0, Lcom/dnake/desktop/utils/PreferencesUtils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
