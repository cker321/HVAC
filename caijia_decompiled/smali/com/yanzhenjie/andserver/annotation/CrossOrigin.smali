.class public interface abstract annotation Lcom/yanzhenjie/andserver/annotation/CrossOrigin;
.super Ljava/lang/Object;
.source "CrossOrigin.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lcom/yanzhenjie/andserver/annotation/CrossOrigin;
        allowCredentials = ""
        allowedHeaders = {}
        exposedHeaders = {}
        maxAge = -0x1L
        methods = {}
        origins = {}
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
.method public abstract allowCredentials()Ljava/lang/String;
.end method

.method public abstract allowedHeaders()[Ljava/lang/String;
.end method

.method public abstract exposedHeaders()[Ljava/lang/String;
.end method

.method public abstract maxAge()J
.end method

.method public abstract methods()[Lcom/yanzhenjie/andserver/annotation/RequestMethod;
.end method

.method public abstract origins()[Ljava/lang/String;
.end method

.method public abstract value()[Ljava/lang/String;
.end method
