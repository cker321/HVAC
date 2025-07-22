.class public Lcom/yanzhenjie/andserver/framework/mapping/Pair;
.super Ljava/lang/Object;
.source "Pair.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/util/Patterns;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;
    }
.end annotation


# instance fields
.field private mRuleList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->mRuleList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addRule(Ljava/lang/String;)V
    .locals 5

    .line 41
    sget-object v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->PAIR_NO_VALUE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "="

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    .line 42
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 43
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;-><init>()V

    .line 44
    aget-object v1, p1, v2

    .line 45
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->setKey(Ljava/lang/String;)V

    .line 46
    aget-object p1, p1, v3

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->setValue(Ljava/lang/String;)V

    .line 47
    invoke-virtual {v0, v3}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->setNoValue(Z)V

    .line 48
    iget-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->mRuleList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 49
    :cond_0
    sget-object v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->PAIR_KEY_VALUE:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 50
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 52
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;-><init>()V

    .line 53
    aget-object v1, p1, v2

    invoke-virtual {v0, v1}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->setKey(Ljava/lang/String;)V

    .line 54
    aget-object p1, p1, v3

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->setValue(Ljava/lang/String;)V

    .line 55
    iget-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->mRuleList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 56
    :cond_1
    sget-object v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->PAIR_NO_KEY:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 57
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;-><init>()V

    .line 58
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->setKey(Ljava/lang/String;)V

    .line 59
    invoke-virtual {v0, v3}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->setNoKey(Z)V

    .line 60
    iget-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->mRuleList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 61
    :cond_2
    sget-object v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->PAIR_KEY:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 62
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;-><init>()V

    .line 63
    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;->setKey(Ljava/lang/String;)V

    .line 64
    iget-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->mRuleList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_0
    return-void
.end method

.method public getRuleList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Pair$Rule;",
            ">;"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Pair;->mRuleList:Ljava/util/List;

    return-object v0
.end method
