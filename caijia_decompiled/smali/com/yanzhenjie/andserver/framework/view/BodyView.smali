.class public Lcom/yanzhenjie/andserver/framework/view/BodyView;
.super Ljava/lang/Object;
.source "BodyView.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/framework/view/View;


# instance fields
.field private mBody:Lcom/yanzhenjie/andserver/http/ResponseBody;


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/http/ResponseBody;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/yanzhenjie/andserver/framework/view/BodyView;->mBody:Lcom/yanzhenjie/andserver/http/ResponseBody;

    return-void
.end method


# virtual methods
.method public output()Ljava/lang/Object;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/yanzhenjie/andserver/framework/view/BodyView;->mBody:Lcom/yanzhenjie/andserver/http/ResponseBody;

    return-object v0
.end method

.method public rest()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
