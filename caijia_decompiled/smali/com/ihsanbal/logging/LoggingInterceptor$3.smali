.class final Lcom/ihsanbal/logging/LoggingInterceptor$3;
.super Ljava/lang/Object;
.source "LoggingInterceptor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ihsanbal/logging/LoggingInterceptor;->createPrintJsonResponseRunnable(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$bodyString:Ljava/lang/String;

.field final synthetic val$builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

.field final synthetic val$chainMs:J

.field final synthetic val$code:I

.field final synthetic val$headers:Ljava/lang/String;

.field final synthetic val$isSuccessful:Z

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$responseUrl:Ljava/lang/String;

.field final synthetic val$segments:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 171
    iput-object p1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    iput-wide p2, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$chainMs:J

    iput-boolean p4, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$isSuccessful:Z

    iput p5, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$code:I

    iput-object p6, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$headers:Ljava/lang/String;

    iput-object p7, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$bodyString:Ljava/lang/String;

    iput-object p8, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$segments:Ljava/util/List;

    iput-object p9, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$message:Ljava/lang/String;

    iput-object p10, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$responseUrl:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 174
    iget-object v0, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$builder:Lcom/ihsanbal/logging/LoggingInterceptor$Builder;

    iget-wide v1, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$chainMs:J

    iget-boolean v3, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$isSuccessful:Z

    iget v4, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$code:I

    iget-object v5, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$headers:Ljava/lang/String;

    iget-object v6, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$bodyString:Ljava/lang/String;

    iget-object v7, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$segments:Ljava/util/List;

    iget-object v8, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$message:Ljava/lang/String;

    iget-object v9, p0, Lcom/ihsanbal/logging/LoggingInterceptor$3;->val$responseUrl:Ljava/lang/String;

    invoke-static/range {v0 .. v9}, Lcom/ihsanbal/logging/Printer;->printJsonResponse(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
