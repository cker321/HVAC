.class public Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;
.super Ljava/lang/Object;
.source "DefaultHttpResponseWriterFactory.java"

# interfaces
.implements Lorg/apache/httpcore/io/HttpMessageWriterFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/httpcore/io/HttpMessageWriterFactory<",
        "Lorg/apache/httpcore/HttpResponse;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;


# instance fields
.field private final lineFormatter:Lorg/apache/httpcore/message/LineFormatter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    new-instance v0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;

    invoke-direct {v0}, Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;-><init>()V

    sput-object v0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;->INSTANCE:Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, v0}, Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;-><init>(Lorg/apache/httpcore/message/LineFormatter;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/httpcore/message/LineFormatter;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    goto :goto_0

    .line 53
    :cond_0
    sget-object p1, Lorg/apache/httpcore/message/BasicLineFormatter;->INSTANCE:Lorg/apache/httpcore/message/BasicLineFormatter;

    :goto_0
    iput-object p1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;->lineFormatter:Lorg/apache/httpcore/message/LineFormatter;

    return-void
.end method


# virtual methods
.method public create(Lorg/apache/httpcore/io/SessionOutputBuffer;)Lorg/apache/httpcore/io/HttpMessageWriter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/httpcore/io/SessionOutputBuffer;",
            ")",
            "Lorg/apache/httpcore/io/HttpMessageWriter<",
            "Lorg/apache/httpcore/HttpResponse;",
            ">;"
        }
    .end annotation

    .line 62
    new-instance v0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriter;

    iget-object v1, p0, Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriterFactory;->lineFormatter:Lorg/apache/httpcore/message/LineFormatter;

    invoke-direct {v0, p1, v1}, Lorg/apache/httpcore/impl/io/DefaultHttpResponseWriter;-><init>(Lorg/apache/httpcore/io/SessionOutputBuffer;Lorg/apache/httpcore/message/LineFormatter;)V

    return-object v0
.end method
