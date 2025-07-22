.class public Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;
.super Ljava/lang/Object;
.source "Pair.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/framework/mapping/Pair;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Rule"
.end annotation


# instance fields
.field private key:Ljava/lang/String;

.field private noKey:Z

.field private noValue:Z

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .locals 1

    .line 79
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->value:Ljava/lang/String;

    return-object v0
.end method

.method public isNoKey()Z
    .locals 1

    .line 95
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->noKey:Z

    return v0
.end method

.method public isNoValue()Z
    .locals 1

    .line 103
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->noValue:Z

    return v0
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->key:Ljava/lang/String;

    return-void
.end method

.method public setNoKey(Z)V
    .locals 0

    .line 99
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->noKey:Z

    return-void
.end method

.method public setNoValue(Z)V
    .locals 0

    .line 107
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->noValue:Z

    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0

    .line 91
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->value:Ljava/lang/String;

    return-void
.end method
