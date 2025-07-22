.class public final enum Lcom/yanzhenjie/andserver/annotation/RequestMethod;
.super Ljava/lang/Enum;
.source "RequestMethod.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/yanzhenjie/andserver/annotation/RequestMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/yanzhenjie/andserver/annotation/RequestMethod;

.field public static final enum DELETE:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

.field public static final enum GET:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

.field public static final enum HEAD:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

.field public static final enum OPTIONS:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

.field public static final enum PATCH:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

.field public static final enum POST:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

.field public static final enum PUT:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

.field public static final enum TRACE:Lcom/yanzhenjie/andserver/annotation/RequestMethod;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 22
    new-instance v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    const/4 v1, 0x0

    const-string v2, "GET"

    invoke-direct {v0, v2, v1, v2}, Lcom/yanzhenjie/andserver/annotation/RequestMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->GET:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    .line 23
    new-instance v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    const/4 v2, 0x1

    const-string v3, "HEAD"

    invoke-direct {v0, v3, v2, v3}, Lcom/yanzhenjie/andserver/annotation/RequestMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->HEAD:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    .line 24
    new-instance v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    const/4 v3, 0x2

    const-string v4, "POST"

    invoke-direct {v0, v4, v3, v4}, Lcom/yanzhenjie/andserver/annotation/RequestMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->POST:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    .line 25
    new-instance v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    const/4 v4, 0x3

    const-string v5, "PUT"

    invoke-direct {v0, v5, v4, v5}, Lcom/yanzhenjie/andserver/annotation/RequestMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->PUT:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    .line 26
    new-instance v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    const/4 v5, 0x4

    const-string v6, "PATCH"

    invoke-direct {v0, v6, v5, v6}, Lcom/yanzhenjie/andserver/annotation/RequestMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->PATCH:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    .line 27
    new-instance v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    const/4 v6, 0x5

    const-string v7, "DELETE"

    invoke-direct {v0, v7, v6, v7}, Lcom/yanzhenjie/andserver/annotation/RequestMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->DELETE:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    .line 28
    new-instance v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    const/4 v7, 0x6

    const-string v8, "OPTIONS"

    invoke-direct {v0, v8, v7, v8}, Lcom/yanzhenjie/andserver/annotation/RequestMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->OPTIONS:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    .line 29
    new-instance v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    const/4 v8, 0x7

    const-string v9, "TRACE"

    invoke-direct {v0, v9, v8, v9}, Lcom/yanzhenjie/andserver/annotation/RequestMethod;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->TRACE:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    const/16 v9, 0x8

    new-array v9, v9, [Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    .line 21
    sget-object v10, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->GET:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    aput-object v10, v9, v1

    sget-object v1, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->HEAD:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    aput-object v1, v9, v2

    sget-object v1, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->POST:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    aput-object v1, v9, v3

    sget-object v1, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->PUT:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    aput-object v1, v9, v4

    sget-object v1, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->PATCH:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    aput-object v1, v9, v5

    sget-object v1, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->DELETE:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    aput-object v1, v9, v6

    sget-object v1, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->OPTIONS:Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    aput-object v1, v9, v7

    aput-object v0, v9, v8

    sput-object v9, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->$VALUES:[Lcom/yanzhenjie/andserver/annotation/RequestMethod;

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

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 34
    iput-object p3, p0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->value:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/annotation/RequestMethod;
    .locals 1

    .line 21
    const-class v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    return-object p0
.end method

.method public static values()[Lcom/yanzhenjie/andserver/annotation/RequestMethod;
    .locals 1

    .line 21
    sget-object v0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->$VALUES:[Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    invoke-virtual {v0}, [Lcom/yanzhenjie/andserver/annotation/RequestMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/yanzhenjie/andserver/annotation/RequestMethod;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->value:Ljava/lang/String;

    return-object v0
.end method

.method public value()Ljava/lang/String;
    .locals 1

    .line 38
    iget-object v0, p0, Lcom/yanzhenjie/andserver/annotation/RequestMethod;->value:Ljava/lang/String;

    return-object v0
.end method
