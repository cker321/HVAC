.class public Lorg/apache/httpcore/message/BasicHeaderElement;
.super Ljava/lang/Object;
.source "BasicHeaderElement.java"

# interfaces
.implements Lorg/apache/httpcore/HeaderElement;
.implements Ljava/lang/Cloneable;


# instance fields
.field private final name:Ljava/lang/String;

.field private final parameters:[Lorg/apache/httpcore/NameValuePair;

.field private final value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 75
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/httpcore/message/BasicHeaderElement;-><init>(Ljava/lang/String;Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[Lorg/apache/httpcore/NameValuePair;)V
    .locals 1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Name"

    .line 59
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->name:Ljava/lang/String;

    .line 60
    iput-object p2, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->value:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 62
    iput-object p3, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    new-array p1, p1, [Lorg/apache/httpcore/NameValuePair;

    .line 64
    iput-object p1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    :goto_0
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 161
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 122
    :cond_0
    instance-of v1, p1, Lorg/apache/httpcore/HeaderElement;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 123
    check-cast p1, Lorg/apache/httpcore/message/BasicHeaderElement;

    .line 124
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->name:Ljava/lang/String;

    iget-object v3, p1, Lorg/apache/httpcore/message/BasicHeaderElement;->name:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->value:Ljava/lang/String;

    iget-object v3, p1, Lorg/apache/httpcore/message/BasicHeaderElement;->value:Ljava/lang/String;

    .line 125
    invoke-static {v1, v3}, Lorg/apache/httpcore/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    iget-object p1, p1, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    .line 126
    invoke-static {v1, p1}, Lorg/apache/httpcore/util/LangUtils;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 80
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getParameter(I)Lorg/apache/httpcore/NameValuePair;
    .locals 1

    .line 101
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getParameterByName(Ljava/lang/String;)Lorg/apache/httpcore/NameValuePair;
    .locals 5

    const-string v0, "Name"

    .line 106
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 108
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 109
    invoke-interface {v3}, Lorg/apache/httpcore/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_1
    return-object v3
.end method

.method public getParameterCount()I
    .locals 1

    .line 95
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    array-length v0, v0

    return v0
.end method

.method public getParameters()[Lorg/apache/httpcore/NameValuePair;
    .locals 1

    .line 90
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    invoke-virtual {v0}, [Lorg/apache/httpcore/NameValuePair;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/httpcore/NameValuePair;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 85
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 134
    iget-object v0, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->name:Ljava/lang/String;

    const/16 v1, 0x11

    invoke-static {v1, v0}, Lorg/apache/httpcore/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    .line 135
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->value:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/apache/httpcore/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    .line 136
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 137
    invoke-static {v0, v4}, Lorg/apache/httpcore/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 145
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->value:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v1, "="

    .line 147
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    :cond_0
    iget-object v1, p0, Lorg/apache/httpcore/message/BasicHeaderElement;->parameters:[Lorg/apache/httpcore/NameValuePair;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    const-string v5, "; "

    .line 151
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 154
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
