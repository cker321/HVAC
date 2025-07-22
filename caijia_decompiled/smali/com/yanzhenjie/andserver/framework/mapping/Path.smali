.class public Lcom/yanzhenjie/andserver/framework/mapping/Path;
.super Ljava/lang/Object;
.source "Path.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/util/Patterns;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;,
        Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;
    }
.end annotation


# instance fields
.field private mRuleList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path;->mRuleList:Ljava/util/List;

    return-void
.end method

.method public static listToPath(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 117
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const-string v2, "/"

    if-eqz v1, :cond_0

    .line 119
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;

    .line 122
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 124
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static matches(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    .line 128
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    .line 132
    :cond_0
    invoke-static {p0}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->pathToList(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    .line 133
    invoke-static {p1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->pathToList(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 135
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    if-eq v0, v2, :cond_1

    return v3

    :cond_1
    const/4 v0, 0x0

    .line 140
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 141
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;

    .line 142
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v2}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;->isBlurred()Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return v1
.end method

.method public static pathToList(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;",
            ">;"
        }
    .end annotation

    .line 100
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 101
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    :goto_0
    const-string v1, "/"

    .line 102
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 103
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 104
    :cond_0
    :goto_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    .line 105
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 106
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 107
    array-length v1, p0

    :goto_2
    if-ge v4, v1, :cond_2

    aget-object v2, p0, v4

    .line 108
    new-instance v3, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;

    const-string v5, "{"

    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    invoke-direct {v3, v2, v5}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Segment;-><init>(Ljava/lang/String;Z)V

    .line 109
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 112
    :cond_2
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public addRule(Ljava/lang/String;)V
    .locals 1

    .line 44
    new-instance v0, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;-><init>()V

    .line 45
    invoke-static {p1}, Lcom/yanzhenjie/andserver/framework/mapping/Path;->pathToList(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;->setSegments(Ljava/util/List;)V

    .line 46
    iget-object p1, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path;->mRuleList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getRuleList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/framework/mapping/Path$Rule;",
            ">;"
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/mapping/Path;->mRuleList:Ljava/util/List;

    return-object v0
.end method
