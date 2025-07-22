.class public Lcom/yanzhenjie/andserver/framework/view/ObjectView;
.super Ljava/lang/Object;
.source "ObjectView.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/view/View;


# instance fields
.field private final isRest:Z

.field private final output:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ZLjava/lang/Object;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/framework/view/ObjectView;->isRest:Z

    .line 30
    iput-object p2, p0, Lcom/yanzhenjie/andserver/framework/view/ObjectView;->output:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public output()Ljava/lang/Object;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/view/ObjectView;->output:Ljava/lang/Object;

    return-object v0
.end method

.method public rest()Z
    .locals 1

    .line 35
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/framework/view/ObjectView;->isRest:Z

    return v0
.end method
