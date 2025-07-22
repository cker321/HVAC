.class public Lcom/yanzhenjie/andserver/framework/mapping/Mime;
.super Ljava/lang/Object;
.source "Mime.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;
    }
.end annotation


# instance fields
.field private mRuleList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mime;->mRuleList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addRule(Ljava/lang/String;)V
    .locals 3

    .line 42
    invoke-static {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->valueOf(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MediaType;

    move-result-object p1

    .line 43
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getSubtype()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/util/MediaType;->getParameters()Ljava/util/Map;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 44
    iget-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mime;->mRuleList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getRuleList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Mime$Rule;",
            ">;"
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Mime;->mRuleList:Ljava/util/List;

    return-object v0
.end method
