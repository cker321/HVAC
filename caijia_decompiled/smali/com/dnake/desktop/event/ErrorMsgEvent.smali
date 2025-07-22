.class public Lcom/dnake/desktop/event/ErrorMsgEvent;
.super Ljava/lang/Object;
.source "ErrorMsgEvent.java"


# instance fields
.field private msg:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/dnake/desktop/event/ErrorMsgEvent;->msg:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getMsg()Ljava/lang/String;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/dnake/desktop/event/ErrorMsgEvent;->msg:Ljava/lang/String;

    return-object v0
.end method

.method public setMsg(Ljava/lang/String;)V
    .locals 0

    .line 18
    iput-object p1, p0, Lcom/dnake/desktop/event/ErrorMsgEvent;->msg:Ljava/lang/String;

    return-void
.end method
