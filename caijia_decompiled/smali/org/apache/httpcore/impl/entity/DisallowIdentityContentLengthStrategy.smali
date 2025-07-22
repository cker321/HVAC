.class public Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;
.super Ljava/lang/Object;
.source "DisallowIdentityContentLengthStrategy.java"

# interfaces
.implements Lorg/apache/httpcore/entity/ContentLengthStrategy;


# static fields
.field public static final INSTANCE:Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;


# instance fields
.field private final contentLengthStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 46
    new-instance v0, Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;

    new-instance v1, Lorg/apache/httpcore/impl/entity/LaxContentLengthStrategy;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lorg/apache/httpcore/impl/entity/LaxContentLengthStrategy;-><init>(I)V

    invoke-direct {v0, v1}, Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;-><init>(Lorg/apache/httpcore/entity/ContentLengthStrategy;)V

    sput-object v0, Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;->INSTANCE:Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/entity/ContentLengthStrategy;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;->contentLengthStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    return-void
.end method


# virtual methods
.method public determineLength(Lorg/apache/httpcore/HttpMessage;)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lorg/apache/httpcore/impl/entity/DisallowIdentityContentLengthStrategy;->contentLengthStrategy:Lorg/apache/httpcore/entity/ContentLengthStrategy;

    invoke-interface {v0, p1}, Lorg/apache/httpcore/entity/ContentLengthStrategy;->determineLength(Lorg/apache/httpcore/HttpMessage;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    return-wide v0

    .line 60
    :cond_0
    new-instance p1, Lorg/apache/httpcore/ProtocolException;

    const-string v0, "Identity transfer encoding cannot be used"

    invoke-direct {p1, v0}, Lorg/apache/httpcore/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
