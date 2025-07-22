.class public interface abstract annotation Lcom/yanzhenjie/andserver/annotation/Addition;
.super Ljava/lang/Object;
.source "Addition.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lcom/yanzhenjie/andserver/annotation/Addition;
        booleanType = {}
        byteType = {}
        charType = {}
        doubleType = {}
        floatType = {}
        intTypeType = {}
        longType = {}
        shortType = {}
        stringType = {}
        value = {}
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract booleanType()[Z
.end method

.method public abstract byteType()[B
.end method

.method public abstract charType()[C
.end method

.method public abstract doubleType()[D
.end method

.method public abstract floatType()[F
.end method

.method public abstract intTypeType()[I
.end method

.method public abstract longType()[J
.end method

.method public abstract shortType()[S
.end method

.method public abstract stringType()[Ljava/lang/String;
.end method

.method public abstract value()[Ljava/lang/String;
.end method
