.class final enum Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;
.super Ljava/lang/Enum;
.source "HttpServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/httpcore/impl/bootstrap/HttpServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

.field public static final enum ACTIVE:Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

.field public static final enum READY:Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

.field public static final enum STOPPING:Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 54
    new-instance v0, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    const/4 v1, 0x0

    const-string v2, "READY"

    invoke-direct {v0, v2, v1}, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;->READY:Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    new-instance v0, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    const/4 v2, 0x1

    const-string v3, "ACTIVE"

    invoke-direct {v0, v3, v2}, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;->ACTIVE:Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    new-instance v0, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    const/4 v3, 0x2

    const-string v4, "STOPPING"

    invoke-direct {v0, v4, v3}, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;->STOPPING:Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    const/4 v4, 0x3

    new-array v4, v4, [Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    sget-object v5, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;->READY:Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    aput-object v5, v4, v1

    sget-object v1, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;->ACTIVE:Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    aput-object v1, v4, v2

    aput-object v0, v4, v3

    sput-object v4, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;->$VALUES:[Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;
    .locals 1

    .line 54
    const-class v0, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    return-object p0
.end method

.method public static values()[Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;
    .locals 1

    .line 54
    sget-object v0, Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;->$VALUES:[Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    invoke-virtual {v0}, [Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/httpcore/impl/bootstrap/HttpServer$Status;

    return-object v0
.end method
