.class public interface abstract annotation Lcom/yanzhenjie/andserver/annotation/FormPart;
.super Ljava/lang/Object;
.source "FormPart.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lcom/yanzhenjie/andserver/annotation/FormPart;
        name = ""
        required = true
        value = ""
    .end subannotation
.end annotation


# virtual methods
.method public abstract name()Ljava/lang/String;
.end method

.method public abstract required()Z
.end method

.method public abstract value()Ljava/lang/String;
.end method
