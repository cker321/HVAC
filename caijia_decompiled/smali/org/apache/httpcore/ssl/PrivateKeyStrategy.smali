.class public interface abstract Lorg/apache/httpcore/ssl/PrivateKeyStrategy;
.super Ljava/lang/Object;
.source "PrivateKeyStrategy.java"


# virtual methods
.method public abstract chooseAlias(Ljava/util/Map;Ljava/net/Socket;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/apache/httpcore/ssl/PrivateKeyDetails;",
            ">;",
            "Ljava/net/Socket;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation
.end method
