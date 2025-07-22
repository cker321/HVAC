.class final Lcom/ihsanbal/logging/LoggingInterceptor$1;
.super Ljava/lang/Object;
.source "LoggingInterceptor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ihsanbal/logging/LoggingInterceptor;->createPrintJsonRequestRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

.field final synthetic val$request:Lokhttp3/Request;


# direct methods
.method constructor <init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)V
    .locals 0

    .line 152
    iput-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$1;->val$builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    iput-object p2, p0, Lcom/ihsanbal/logging/LoggingInterceptor$1;->val$request:Lokhttp3/Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 155
    iget-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$1;->val$builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    iget-object v1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$1;->val$request:Lokhttp3/Request;

    invoke-static {v0, v1}, Lcom/ihsanbal/logging/Printer;->printJsonRequest(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)V

    return-void
.end method
