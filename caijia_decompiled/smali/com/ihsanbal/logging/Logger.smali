.class public interface abstract Lcom/ihsanbal/logging/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field public static final DEFAULT:Lcom/ihsanbal/logging/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    new-instance v0, Lcom/ihsanbal/logging/Logger$1;

    invoke-direct {v0}, Lcom/ihsanbal/logging/Logger$1;-><init>()V

    sput-object v0, Lcom/ihsanbal/logging/Logger;->DEFAULT:Lcom/ihsanbal/logging/Logger;

    return-void
.end method


# virtual methods
.method public abstract log(ILjava/lang/String;Ljava/lang/String;)V
.end method
