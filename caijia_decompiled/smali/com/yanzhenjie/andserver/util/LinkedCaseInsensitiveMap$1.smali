.class Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap$1;
.super Ljava/util/LinkedHashMap;
.source "LinkedCaseInsensitiveMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;-><init>(ILjava/util/Locale;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/String;",
        "TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;


# direct methods
.method constructor <init>(Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;I)V
    .locals 0

    .line 73
    iput-object p1, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap$1;->this$0:Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;

    invoke-direct {p0, p2}, Ljava/util/LinkedHashMap;-><init>(I)V

    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/Object;)Z
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap$1;->this$0:Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "TV;>;)Z"
        }
    .end annotation

    .line 81
    iget-object v0, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap$1;->this$0:Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;

    invoke-virtual {v0, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->removeEldestEntry(Ljava/util/Map$Entry;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v1, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap$1;->this$0:Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;

    invoke-static {v1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->access$000(Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;)Ljava/util/HashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap$1;->this$0:Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v2, p1}, Lcom/yanzhenjie/andserver/util/LinkedCaseInsensitiveMap;->convertKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return v0
.end method
