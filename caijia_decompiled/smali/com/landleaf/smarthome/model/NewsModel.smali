.class public Lcom/landleaf/smarthome/model/NewsModel;
.super Ljava/lang/Object;
.source "NewsModel.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private content:Ljava/lang/String;

.field private id:Ljava/lang/String;

.field private sender:Ljava/lang/String;

.field private time:Ljava/lang/String;

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/landleaf/smarthome/model/NewsModel;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/landleaf/smarthome/model/NewsModel;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getSender()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/landleaf/smarthome/model/NewsModel;->sender:Ljava/lang/String;

    return-object v0
.end method

.method public getTime()Ljava/lang/String;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/landleaf/smarthome/model/NewsModel;->time:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/landleaf/smarthome/model/NewsModel;->title:Ljava/lang/String;

    return-object v0
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/landleaf/smarthome/model/NewsModel;->content:Ljava/lang/String;

    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/landleaf/smarthome/model/NewsModel;->id:Ljava/lang/String;

    return-void
.end method

.method public setSender(Ljava/lang/String;)V
    .locals 0

    .line 57
    iput-object p1, p0, Lcom/landleaf/smarthome/model/NewsModel;->sender:Ljava/lang/String;

    return-void
.end method

.method public setTime(Ljava/lang/String;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/landleaf/smarthome/model/NewsModel;->time:Ljava/lang/String;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/landleaf/smarthome/model/NewsModel;->title:Ljava/lang/String;

    return-void
.end method
