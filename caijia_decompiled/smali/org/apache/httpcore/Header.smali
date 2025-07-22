.class public interface abstract Lorg/apache/httpcore/Header;
.super Ljava/lang/Object;
.source "Header.java"

# interfaces
.implements Lorg/apache/httpcore/NameValuePair;


# virtual methods
.method public abstract getElements()[Lorg/apache/httpcore/HeaderElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/httpcore/ParseException;
        }
    .end annotation
.end method
