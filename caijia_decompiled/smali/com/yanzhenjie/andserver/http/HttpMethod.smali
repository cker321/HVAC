.class public final enum Lcom/yanzhenjie/andserver/http/HttpMethod;
.super Ljava/lang/Enum;
.source "HttpMethod.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/yanzhenjie/andserver/http/HttpMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/yanzhenjie/andserver/http/HttpMethod;

.field public static final enum DELETE:Lcom/yanzhenjie/andserver/http/HttpMethod;

.field public static final enum GET:Lcom/yanzhenjie/andserver/http/HttpMethod;

.field public static final enum HEAD:Lcom/yanzhenjie/andserver/http/HttpMethod;

.field public static final enum OPTIONS:Lcom/yanzhenjie/andserver/http/HttpMethod;

.field public static final enum PATCH:Lcom/yanzhenjie/andserver/http/HttpMethod;

.field public static final enum POST:Lcom/yanzhenjie/andserver/http/HttpMethod;

.field public static final enum PUT:Lcom/yanzhenjie/andserver/http/HttpMethod;

.field public static final enum TRACE:Lcom/yanzhenjie/andserver/http/HttpMethod;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 25
    new-instance v0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    const/4 v1, 0x0

    const-string v2, "GET"

    invoke-direct {v0, v2, v1, v2}, Lcom/yanzhenjie/andserver/http/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod;->GET:Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 26
    new-instance v0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    const/4 v2, 0x1

    const-string v3, "HEAD"

    invoke-direct {v0, v3, v2, v3}, Lcom/yanzhenjie/andserver/http/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod;->HEAD:Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 27
    new-instance v0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    const/4 v3, 0x2

    const-string v4, "POST"

    invoke-direct {v0, v4, v3, v4}, Lcom/yanzhenjie/andserver/http/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod;->POST:Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 28
    new-instance v0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    const/4 v4, 0x3

    const-string v5, "PUT"

    invoke-direct {v0, v5, v4, v5}, Lcom/yanzhenjie/andserver/http/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod;->PUT:Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 29
    new-instance v0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    const/4 v5, 0x4

    const-string v6, "PATCH"

    invoke-direct {v0, v6, v5, v6}, Lcom/yanzhenjie/andserver/http/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod;->PATCH:Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 30
    new-instance v0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    const/4 v6, 0x5

    const-string v7, "DELETE"

    invoke-direct {v0, v7, v6, v7}, Lcom/yanzhenjie/andserver/http/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod;->DELETE:Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 31
    new-instance v0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    const/4 v7, 0x6

    const-string v8, "OPTIONS"

    invoke-direct {v0, v8, v7, v8}, Lcom/yanzhenjie/andserver/http/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod;->OPTIONS:Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 32
    new-instance v0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    const/4 v8, 0x7

    const-string v9, "TRACE"

    invoke-direct {v0, v9, v8, v9}, Lcom/yanzhenjie/andserver/http/HttpMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod;->TRACE:Lcom/yanzhenjie/andserver/http/HttpMethod;

    const/16 v9, 0x8

    new-array v9, v9, [Lcom/yanzhenjie/andserver/http/HttpMethod;

    .line 23
    sget-object v10, Lcom/yanzhenjie/andserver/http/HttpMethod;->GET:Lcom/yanzhenjie/andserver/http/HttpMethod;

    aput-object v10, v9, v1

    sget-object v1, Lcom/yanzhenjie/andserver/http/HttpMethod;->HEAD:Lcom/yanzhenjie/andserver/http/HttpMethod;

    aput-object v1, v9, v2

    sget-object v1, Lcom/yanzhenjie/andserver/http/HttpMethod;->POST:Lcom/yanzhenjie/andserver/http/HttpMethod;

    aput-object v1, v9, v3

    sget-object v1, Lcom/yanzhenjie/andserver/http/HttpMethod;->PUT:Lcom/yanzhenjie/andserver/http/HttpMethod;

    aput-object v1, v9, v4

    sget-object v1, Lcom/yanzhenjie/andserver/http/HttpMethod;->PATCH:Lcom/yanzhenjie/andserver/http/HttpMethod;

    aput-object v1, v9, v5

    sget-object v1, Lcom/yanzhenjie/andserver/http/HttpMethod;->DELETE:Lcom/yanzhenjie/andserver/http/HttpMethod;

    aput-object v1, v9, v6

    sget-object v1, Lcom/yanzhenjie/andserver/http/HttpMethod;->OPTIONS:Lcom/yanzhenjie/andserver/http/HttpMethod;

    aput-object v1, v9, v7

    aput-object v0, v9, v8

    sput-object v9, Lcom/yanzhenjie/andserver/http/HttpMethod;->$VALUES:[Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 37
    iput-object p3, p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->value:Ljava/lang/String;

    return-void
.end method

.method public static reverse(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/HttpMethod;
    .locals 3

    .line 69
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 70
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "DELETE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x5

    goto :goto_1

    :sswitch_1
    const-string v0, "TRACE"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    goto :goto_1

    :sswitch_2
    const-string v0, "PATCH"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_3
    const-string v0, "POST"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    goto :goto_1

    :sswitch_4
    const-string v0, "HEAD"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :sswitch_5
    const-string v0, "PUT"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_6
    const-string v0, "GET"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_1

    :sswitch_7
    const-string v0, "OPTIONS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_0

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p0, v0, v1

    const-string p0, "The value %1$s is not supported."

    .line 96
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 97
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :pswitch_0
    sget-object p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->TRACE:Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object p0

    .line 90
    :pswitch_1
    sget-object p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->OPTIONS:Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object p0

    .line 87
    :pswitch_2
    sget-object p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->DELETE:Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object p0

    .line 84
    :pswitch_3
    sget-object p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->PATCH:Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object p0

    .line 81
    :pswitch_4
    sget-object p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->PUT:Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object p0

    .line 78
    :pswitch_5
    sget-object p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->POST:Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object p0

    .line 75
    :pswitch_6
    sget-object p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->HEAD:Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object p0

    .line 72
    :pswitch_7
    sget-object p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->GET:Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x1faded82 -> :sswitch_7
        0x11336 -> :sswitch_6
        0x136ef -> :sswitch_5
        0x21c5e0 -> :sswitch_4
        0x2590a0 -> :sswitch_3
        0x4862828 -> :sswitch_2
        0x4c5f925 -> :sswitch_1
        0x77f979ab -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/HttpMethod;
    .locals 1

    .line 23
    const-class v0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object p0
.end method

.method public static values()[Lcom/yanzhenjie/andserver/http/HttpMethod;
    .locals 1

    .line 23
    sget-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod;->$VALUES:[Lcom/yanzhenjie/andserver/http/HttpMethod;

    invoke-virtual {v0}, [Lcom/yanzhenjie/andserver/http/HttpMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/yanzhenjie/andserver/http/HttpMethod;

    return-object v0
.end method


# virtual methods
.method public allowBody()Z
    .locals 3

    .line 50
    sget-object v0, Lcom/yanzhenjie/andserver/http/HttpMethod$1;->$SwitchMap$com$yanzhenjie$andserver$http$HttpMethod:[I

    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/HttpMethod;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->value:Ljava/lang/String;

    return-object v0
.end method

.method public value()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/HttpMethod;->value:Ljava/lang/String;

    return-object v0
.end method
