.class public Lorg/apache/httpcore/impl/NoConnectionReuseStrategy;
.super Ljava/lang/Object;
.source "NoConnectionReuseStrategy.java"

# interfaces
.implements Lorg/apache/httpcore/ConnectionReuseStrategy;


# static fields
.field public static final INSTANCE:Lorg/apache/httpcore/impl/NoConnectionReuseStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    new-instance v0, Lorg/apache/httpcore/impl/NoConnectionReuseStrategy;

    invoke-direct {v0}, Lorg/apache/httpcore/impl/NoConnectionReuseStrategy;-><init>()V

    sput-object v0, Lorg/apache/httpcore/impl/NoConnectionReuseStrategy;->INSTANCE:Lorg/apache/httpcore/impl/NoConnectionReuseStrategy;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public keepAlive(Lorg/apache/httpcore/HttpResponse;Lorg/apache/httpcore/protocol/HttpContext;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
