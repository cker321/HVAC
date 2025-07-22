.class public Lcom/yanzhenjie/andserver/http/session/StandardSession;
.super Ljava/lang/Object;
.source "StandardSession.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/session/Session;


# static fields
.field private static final EMPTY_ARRAY:[Ljava/lang/String;


# instance fields
.field private createdTime:J

.field private id:Ljava/lang/String;

.field private isNew:Z

.field private isValid:Z

.field private lastAccessedTime:J

.field private mAttributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private maxInactiveInterval:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    .line 40
    sput-object v0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->EMPTY_ARRAY:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 45
    iput v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->maxInactiveInterval:I

    .line 46
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->mAttributes:Ljava/util/Map;

    return-void
.end method

.method private validate()V
    .locals 2

    .line 155
    invoke-virtual {p0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 156
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "This session is invalid."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 98
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->validate()V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->mAttributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getAttributeNames()Ljava/util/Enumeration;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 109
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->validate()V

    .line 111
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->mAttributes:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getCreatedTime()J
    .locals 2

    .line 72
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->createdTime:J

    return-wide v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getLastAccessedTime()J
    .locals 2

    .line 81
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->validate()V

    .line 83
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->lastAccessedTime:J

    return-wide v0
.end method

.method public getMaxInactiveInterval()I
    .locals 1

    .line 93
    iget v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->maxInactiveInterval:I

    return v0
.end method

.method public invalidate()V
    .locals 1

    .line 138
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->validate()V

    const/4 v0, 0x0

    .line 140
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isValid:Z

    return-void
.end method

.method public isNew()Z
    .locals 1

    .line 149
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->validate()V

    .line 151
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isNew:Z

    return v0
.end method

.method public isValid()Z
    .locals 6

    .line 166
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isValid:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 170
    :cond_0
    iget v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->maxInactiveInterval:I

    if-lez v0, :cond_1

    .line 171
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->lastAccessedTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    .line 172
    div-long/2addr v2, v4

    long-to-int v0, v2

    .line 173
    iget v2, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->maxInactiveInterval:I

    if-lt v0, v2, :cond_2

    .line 174
    iput-boolean v1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isValid:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    .line 177
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isValid:Z

    .line 180
    :cond_2
    :goto_0
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isValid:Z

    return v0
.end method

.method public readObject(Ljava/io/ObjectInputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 217
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->id:Ljava/lang/String;

    .line 218
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->createdTime:J

    .line 219
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->lastAccessedTime:J

    .line 220
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    iput v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->maxInactiveInterval:I

    .line 221
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isNew:Z

    .line 222
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isValid:Z

    .line 225
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 227
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 228
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    .line 229
    iget-object v4, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->mAttributes:Ljava/util/Map;

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 1

    .line 128
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->validate()V

    if-nez p1, :cond_0

    return-void

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->mAttributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 116
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/session/StandardSession;->validate()V

    const-string v0, "The name cannot be null."

    .line 118
    invoke-static {p1, v0}, Lcom/yanzhenjie/andserver/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p2, :cond_0

    return-void

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->mAttributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setCreatedTime(J)V
    .locals 0

    .line 67
    iput-wide p1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->createdTime:J

    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 1

    .line 54
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 57
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->id:Ljava/lang/String;

    return-void

    .line 55
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The id can not be empty or null."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setLastAccessedTime(J)V
    .locals 0

    .line 76
    iput-wide p1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->lastAccessedTime:J

    return-void
.end method

.method public setMaxInactiveInterval(I)V
    .locals 0

    .line 88
    iput p1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->maxInactiveInterval:I

    return-void
.end method

.method public setNew(Z)V
    .locals 0

    .line 144
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isNew:Z

    return-void
.end method

.method public setValid(Z)V
    .locals 0

    .line 161
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isValid:Z

    return-void
.end method

.method public writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 191
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->id:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 192
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->createdTime:J

    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    .line 193
    iget-wide v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->lastAccessedTime:J

    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    .line 194
    iget v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->maxInactiveInterval:I

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 195
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isNew:Z

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 196
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->isValid:Z

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 197
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->mAttributes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 198
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->mAttributes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    sget-object v1, Lcom/yanzhenjie/andserver/http/session/StandardSession;->EMPTY_ARRAY:[Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 199
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 200
    iget-object v4, p0, Lcom/yanzhenjie/andserver/http/session/StandardSession;->mAttributes:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 201
    instance-of v5, v4, Ljava/io/Serializable;

    if-eqz v5, :cond_0

    .line 202
    invoke-virtual {p1, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 203
    invoke-virtual {p1, v4}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
