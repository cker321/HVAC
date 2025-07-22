.class public interface abstract annotation Lorg/apache/httpcore/annotation/Contract;
.super Ljava/lang/Object;
.source "Contract.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lorg/apache/httpcore/annotation/Contract;
        threading = .enum Lorg/apache/httpcore/annotation/ThreadingBehavior;->UNSAFE:Lorg/apache/httpcore/annotation/ThreadingBehavior;
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Documented;
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->CLASS:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract threading()Lorg/apache/httpcore/annotation/ThreadingBehavior;
.end method
