.class Lorg/apache/httpcore/pool/AbstractConnPool$1;
.super Lorg/apache/httpcore/pool/RouteSpecificPool;
.source "AbstractConnPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/httpcore/pool/AbstractConnPool;->getPool(Ljava/lang/Object;)Lorg/apache/httpcore/pool/RouteSpecificPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/httpcore/pool/RouteSpecificPool<",
        "TT;TC;TE;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

.field final synthetic val$route:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/apache/httpcore/pool/AbstractConnPool;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 168
    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$1;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    iput-object p3, p0, Lorg/apache/httpcore/pool/AbstractConnPool$1;->val$route:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lorg/apache/httpcore/pool/RouteSpecificPool;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected createEntry(Ljava/lang/Object;)Lorg/apache/httpcore/pool/PoolEntry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)TE;"
        }
    .end annotation

    .line 172
    iget-object v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool$1;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    iget-object v1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$1;->val$route:Ljava/lang/Object;

    invoke-virtual {v0, v1, p1}, Lorg/apache/httpcore/pool/AbstractConnPool;->createEntry(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/httpcore/pool/PoolEntry;

    move-result-object p1

    return-object p1
.end method
