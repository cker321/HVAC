.class Lorg/apache/httpcore/pool/AbstractConnPool$4;
.super Ljava/lang/Object;
.source "AbstractConnPool.java"

# interfaces
.implements Lorg/apache/httpcore/pool/PoolEntryCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/httpcore/pool/AbstractConnPool;->closeExpired()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/httpcore/pool/PoolEntryCallback<",
        "TT;TC;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

.field final synthetic val$now:J


# direct methods
.method constructor <init>(Lorg/apache/httpcore/pool/AbstractConnPool;J)V
    .locals 0

    .line 648
    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$4;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    iput-wide p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool$4;->val$now:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/pool/PoolEntry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/pool/PoolEntry<",
            "TT;TC;>;)V"
        }
    .end annotation

    .line 652
    iget-wide v0, p0, Lorg/apache/httpcore/pool/AbstractConnPool$4;->val$now:J

    invoke-virtual {p1, v0, v1}, Lorg/apache/httpcore/pool/PoolEntry;->isExpired(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 653
    invoke-virtual {p1}, Lorg/apache/httpcore/pool/PoolEntry;->close()V

    :cond_0
    return-void
.end method
