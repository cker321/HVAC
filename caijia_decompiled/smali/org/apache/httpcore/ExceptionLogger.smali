.class public interface abstract Lorg/apache/httpcore/ExceptionLogger;
.super Ljava/lang/Object;
.source "ExceptionLogger.java"


# static fields
.field public static final NO_OP:Lorg/apache/httpcore/ExceptionLogger;

.field public static final STD_ERR:Lorg/apache/httpcore/ExceptionLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Lorg/apache/httpcore/ExceptionLogger$1;

    invoke-direct {v0}, Lorg/apache/httpcore/ExceptionLogger$1;-><init>()V

    sput-object v0, Lorg/apache/httpcore/ExceptionLogger;->NO_OP:Lorg/apache/httpcore/ExceptionLogger;

    .line 43
    new-instance v0, Lorg/apache/httpcore/ExceptionLogger$2;

    invoke-direct {v0}, Lorg/apache/httpcore/ExceptionLogger$2;-><init>()V

    sput-object v0, Lorg/apache/httpcore/ExceptionLogger;->STD_ERR:Lorg/apache/httpcore/ExceptionLogger;

    return-void
.end method


# virtual methods
.method public abstract log(Ljava/lang/Exception;)V
.end method
