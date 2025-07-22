.class final Lcom/dnake/desktop/dnake/v700/devent$1;
.super Lcom/dnake/desktop/dnake/v700/devent;
.source "devent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/dnake/desktop/dnake/v700/devent;->setup()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/dnake/desktop/dnake/v700/devent;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public process(Ljava/lang/String;)V
    .locals 7

    const/16 v0, 0xc8

    const/4 v1, 0x0

    .line 46
    invoke-static {v0, v1}, Lcom/dnake/desktop/dnake/v700/dmsg;->ack(ILjava/lang/String;)V

    .line 48
    new-instance v0, Lcom/dnake/desktop/dnake/v700/dxml;

    invoke-direct {v0}, Lcom/dnake/desktop/dnake/v700/dxml;-><init>()V

    .line 49
    invoke-virtual {v0, p1}, Lcom/dnake/desktop/dnake/v700/dxml;->parse(Ljava/lang/String;)Z

    const/16 p1, 0x8

    new-array v1, p1, [I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, p1, :cond_0

    .line 54
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/params/io"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v2}, Lcom/dnake/desktop/dnake/v700/dxml;->getInt(Ljava/lang/String;I)I

    move-result v4

    aput v4, v1, v3

    .line 56
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " = "

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v5, v1, v3

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
