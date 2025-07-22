.class public Lcom/dnake/desktop/dnake/v700/devent;
.super Ljava/lang/Object;
.source "devent.java"


# static fields
.field public static boot:Ljava/lang/Boolean;

.field private static elist:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dnake/desktop/dnake/v700/devent;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/dnake/desktop/dnake/v700/devent;->boot:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/dnake/desktop/dnake/v700/devent;->url:Ljava/lang/String;

    return-void
.end method

.method public static event(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    const/4 v0, 0x1

    .line 20
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 21
    sget-object v1, Lcom/dnake/desktop/dnake/v700/devent;->boot:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/dnake/desktop/dnake/v700/devent;->elist:Ljava/util/List;

    if-eqz v1, :cond_1

    .line 24
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/dnake/desktop/dnake/v700/devent;

    .line 26
    iget-object v3, v2, Lcom/dnake/desktop/dnake/v700/devent;->url:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 27
    invoke-virtual {v2, p1}, Lcom/dnake/desktop/dnake/v700/devent;->process(Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 28
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 33
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_2

    const/16 p0, 0x1e0

    const/4 p1, 0x0

    .line 34
    invoke-static {p0, p1}, Lcom/dnake/desktop/dnake/v700/dmsg;->ack(ILjava/lang/String;)V

    :cond_2
    return-void
.end method

.method public static setup()V
    .locals 2

    .line 39
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/dnake/desktop/dnake/v700/devent;->elist:Ljava/util/List;

    .line 43
    new-instance v0, Lcom/dnake/desktop/dnake/v700/devent$1;

    const-string v1, "/exApp/io"

    invoke-direct {v0, v1}, Lcom/dnake/desktop/dnake/v700/devent$1;-><init>(Ljava/lang/String;)V

    .line 60
    sget-object v1, Lcom/dnake/desktop/dnake/v700/devent;->elist:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public process(Ljava/lang/String;)V
    .locals 0

    return-void
.end method
