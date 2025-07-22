.class public interface abstract Lcom/yanzhenjie/andserver/util/Patterns;
.super Ljava/lang/Object;
.source "Patterns.java"


# static fields
.field public static final FORWARD:Ljava/lang/String; = "forward:(.)*"

.field public static final PAIR_KEY:Ljava/lang/String;

.field public static final PAIR_KEY_VALUE:Ljava/lang/String;

.field public static final PAIR_NO_KEY:Ljava/lang/String;

.field public static final PAIR_NO_VALUE:Ljava/lang/String;

.field public static final PAIR_VALUE:Ljava/lang/String; = "(.)*"

.field public static final PATH:Ljava/lang/String;

.field public static final PATH_0:Ljava/lang/String;

.field public static final PATH_1:Ljava/lang/String;

.field public static final REDIRECT:Ljava/lang/String; = "redirect:(.)*"

.field public static final WORD:Ljava/lang/String; = "[a-zA-Z0-9_\\-\\.]%s"


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const-string v2, "*"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "[a-zA-Z0-9_\\-\\.]%s"

    .line 25
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/yanzhenjie/andserver/util/Patterns;->PATH_0:Ljava/lang/String;

    new-array v1, v0, [Ljava/lang/Object;

    const-string v4, "+"

    aput-object v4, v1, v3

    .line 26
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/yanzhenjie/andserver/util/Patterns;->PATH_1:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Object;

    .line 27
    sget-object v7, Lcom/yanzhenjie/andserver/util/Patterns;->PATH_0:Ljava/lang/String;

    aput-object v7, v6, v3

    aput-object v1, v6, v0

    const-string v1, "(/%s)|((/%s)+)"

    invoke-static {v1, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/yanzhenjie/andserver/util/Patterns;->PATH:Ljava/lang/String;

    new-array v1, v0, [Ljava/lang/Object;

    aput-object v4, v1, v3

    .line 29
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/yanzhenjie/andserver/util/Patterns;->PAIR_KEY:Ljava/lang/String;

    new-array v2, v5, [Ljava/lang/Object;

    aput-object v1, v2, v3

    const-string v1, "(.)*"

    aput-object v1, v2, v0

    const-string v1, "(%s)(=)(%s)"

    .line 31
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/yanzhenjie/andserver/util/Patterns;->PAIR_KEY_VALUE:Ljava/lang/String;

    new-array v1, v0, [Ljava/lang/Object;

    .line 32
    sget-object v2, Lcom/yanzhenjie/andserver/util/Patterns;->PAIR_KEY:Ljava/lang/String;

    aput-object v2, v1, v3

    const-string v2, "!%s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/yanzhenjie/andserver/util/Patterns;->PAIR_NO_KEY:Ljava/lang/String;

    new-array v1, v5, [Ljava/lang/Object;

    .line 33
    sget-object v2, Lcom/yanzhenjie/andserver/util/Patterns;->PAIR_KEY:Ljava/lang/String;

    aput-object v2, v1, v3

    sget-object v2, Lcom/yanzhenjie/andserver/util/Patterns;->PATH_1:Ljava/lang/String;

    aput-object v2, v1, v0

    const-string v0, "(%s)(!=)(%s)"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/Patterns;->PAIR_NO_VALUE:Ljava/lang/String;

    return-void
.end method
