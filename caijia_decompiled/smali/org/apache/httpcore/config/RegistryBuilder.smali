.class public final Lorg/apache/httpcore/config/RegistryBuilder;
.super Ljava/lang/Object;
.source "RegistryBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<I:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final items:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "TI;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/httpcore/config/RegistryBuilder;->items:Ljava/util/Map;

    return-void
.end method

.method public static create()Lorg/apache/httpcore/config/RegistryBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I:",
            "Ljava/lang/Object;",
            ">()",
            "Lorg/apache/httpcore/config/RegistryBuilder<",
            "TI;>;"
        }
    .end annotation

    .line 46
    new-instance v0, Lorg/apache/httpcore/config/RegistryBuilder;

    invoke-direct {v0}, Lorg/apache/httpcore/config/RegistryBuilder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public build()Lorg/apache/httpcore/config/Registry;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/httpcore/config/Registry<",
            "TI;>;"
        }
    .end annotation

    .line 62
    new-instance v0, Lorg/apache/httpcore/config/Registry;

    iget-object v1, p0, Lorg/apache/httpcore/config/RegistryBuilder;->items:Ljava/util/Map;

    invoke-direct {v0, v1}, Lorg/apache/httpcore/config/Registry;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public register(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/httpcore/config/RegistryBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TI;)",
            "Lorg/apache/httpcore/config/RegistryBuilder<",
            "TI;>;"
        }
    .end annotation

    const-string v0, "ID"

    .line 55
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notEmpty(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;

    const-string v0, "Item"

    .line 56
    invoke-static {p2, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 57
    iget-object v0, p0, Lorg/apache/httpcore/config/RegistryBuilder;->items:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lorg/apache/httpcore/config/RegistryBuilder;->items:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
