.class public interface abstract Lcom/yanzhenjie/andserver/framework/MessageConverter;
.super Ljava/lang/Object;
.source "MessageConverter.java"


# virtual methods
.method public abstract convert(Ljava/lang/Object;Lcom/yanzhenjie/andserver/util/MediaType;)Lcom/yanzhenjie/andserver/http/ResponseBody;
.end method

.method public abstract convert(Ljava/io/InputStream;Lcom/yanzhenjie/andserver/util/MediaType;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            "Lcom/yanzhenjie/andserver/util/MediaType;",
            "Ljava/lang/reflect/Type;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
