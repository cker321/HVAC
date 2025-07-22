.class public Lcom/yanzhenjie/andserver/framework/mapping/Method;
.super Ljava/lang/Object;
.source "Method.java"


# instance fields
.field private mRuleList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/HttpMethod;",
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

    iput-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Method;->mRuleList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addRule(Ljava/lang/String;)V
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Method;->mRuleList:Ljava/util/List;

    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/HttpMethod;->reverse(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/HttpMethod;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getRuleList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/HttpMethod;",
            ">;"
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Method;->mRuleList:Ljava/util/List;

    return-object v0
.end method
