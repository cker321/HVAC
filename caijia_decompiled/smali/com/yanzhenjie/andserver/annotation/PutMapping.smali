.class public interface abstract annotation Lcom/yanzhenjie/andserver/annotation/PutMapping;
.super Ljava/lang/Object;
.source "PutMapping.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lcom/yanzhenjie/andserver/annotation/PutMapping;
        consumes = {}
        headers = {}
        params = {}
        path = {}
        produces = {}
        value = {}
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract consumes()[Ljava/lang/String;
.end method

.method public abstract headers()[Ljava/lang/String;
.end method

.method public abstract params()[Ljava/lang/String;
.end method

.method public abstract path()[Ljava/lang/String;
.end method

.method public abstract produces()[Ljava/lang/String;
.end method

.method public abstract value()[Ljava/lang/String;
.end method
