.class public interface abstract Lorg/apache/httpcore/entity/ContentLengthStrategy;
.super Ljava/lang/Object;
.source "ContentLengthStrategy.java"


# static fields
.field public static final CHUNKED:I = -0x2

.field public static final IDENTITY:I = -0x1


# virtual methods
.method public abstract determineLength(Lorg/apache/httpcore/HttpMessage;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/HttpException;
        }
    .end annotation
.end method
