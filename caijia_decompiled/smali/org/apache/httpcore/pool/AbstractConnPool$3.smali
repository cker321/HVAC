.class Lorg/apache/httpcore/pool/AbstractConnPool$3;
.super Ljava/lang/Object;
.source "AbstractConnPool.java"

# interfaces
.implements Lorg/apache/httpcore/pool/PoolEntryCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/httpcore/pool/AbstractConnPool;->closeIdle(JLjava/util/concurrent/TimeUnit;)V
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

.field final synthetic val$deadline:J


# direct methods
.method constructor <init>(Lorg/apache/httpcore/pool/AbstractConnPool;J)V
    .locals 0

    .line 631
    iput-object p1, p0, Lorg/apache/httpcore/pool/AbstractConnPool$3;->this$0:Lorg/apache/httpcore/pool/AbstractConnPool;

    iput-wide p2, p0, Lorg/apache/httpcore/pool/AbstractConnPool$3;->val$deadline:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/httpcore/pool/PoolEntry;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/pool/PoolEntry<",
            "TT;TC;>;)V"
        }
    .end annotation

    .line 635
    invoke-virtual {p1}, Lorg/apache/httpcore/pool/PoolEntry;->getUpdated()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/apache/httpcore/pool/AbstractConnPool$3;->val$deadline:J

    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 636
    invoke-virtual {p1}, Lorg/apache/httpcore/pool/PoolEntry;->close()V

    :cond_0
    return-void
.end method
