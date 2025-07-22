.class Lcom/ihsanbal/logging/I;
.super Ljava/lang/Object;
.source "I.java"


# static fields
.field private static index:I

.field private static prefix:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, ". "

    const-string v1, " ."

    .line 12
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ihsanbal/logging/I;->prefix:[Ljava/lang/String;

    const/4 v0, 0x0

    .line 13
    sput v0, Lcom/ihsanbal/logging/I;->index:I

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method private static getFinalTag(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    if-eqz p1, :cond_0

    .line 34
    sget p1, Lcom/ihsanbal/logging/I;->index:I

    xor-int/lit8 p1, p1, 0x1

    sput p1, Lcom/ihsanbal/logging/I;->index:I

    .line 35
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/ihsanbal/logging/I;->prefix:[Ljava/lang/String;

    sget v1, Lcom/ihsanbal/logging/I;->index:I

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method static log(ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 20
    invoke-static {p1, p3}, Lcom/ihsanbal/logging/I;->getFinalTag(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz p3, :cond_0

    move-object p1, v0

    .line 21
    :cond_0
    invoke-static {p1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object p1

    const/4 p3, 0x4

    if-eq p0, p3, :cond_1

    .line 27
    sget-object p0, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {p1, p0, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    goto :goto_0

    .line 24
    :cond_1
    sget-object p0, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    invoke-virtual {p1, p0, p2}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
