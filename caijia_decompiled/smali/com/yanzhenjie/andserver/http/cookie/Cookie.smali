.class public Lcom/yanzhenjie/andserver/http/cookie/Cookie;
.super Ljava/lang/Object;
.source "Cookie.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field private static final TSPECIALS:Ljava/lang/String; = "/()<>@,;:\\\"[]?={} \t"


# instance fields
.field private comment:Ljava/lang/String;

.field private domain:Ljava/lang/String;

.field private isHttpOnly:Z

.field private maxAge:I

.field private name:Ljava/lang/String;

.field private path:Ljava/lang/String;

.field private secure:Z

.field private value:Ljava/lang/String;

.field private version:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 39
    iput v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->maxAge:I

    const/4 v0, 0x0

    .line 42
    iput v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->version:I

    .line 43
    iput-boolean v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->isHttpOnly:Z

    .line 66
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 69
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->isToken(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Comment"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Discard"

    .line 70
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Domain"

    .line 71
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Expires"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Max-Age"

    .line 72
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Path"

    .line 73
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Secure"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Version"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "$"

    .line 74
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 79
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->name:Ljava/lang/String;

    .line 80
    iput-object p2, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->value:Ljava/lang/String;

    return-void

    :cond_0
    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    aput-object p1, p2, v0

    const-string p1, "This name [%1$s] is a reserved character."

    .line 75
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 76
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 67
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The name of the cookie cannot be empty or null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private isToken(Ljava/lang/String;)Z
    .locals 5

    .line 298
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 300
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-lt v3, v4, :cond_1

    const/16 v4, 0x7f

    if-ge v3, v4, :cond_1

    const-string v4, "/()<>@,;:\\\"[]?={} \t"

    .line 301
    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v1

    :cond_2
    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .line 312
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 314
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getDomain()Ljava/lang/String;
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->domain:Ljava/lang/String;

    return-object v0
.end method

.method public getMaxAge()I
    .locals 1

    .line 167
    iget v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->maxAge:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getSecure()Z
    .locals 1

    .line 220
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->secure:Z

    return v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 259
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->value:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()I
    .locals 1

    .line 270
    iget v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->version:I

    return v0
.end method

.method public isHttpOnly()Z
    .locals 1

    .line 339
    iget-boolean v0, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->isHttpOnly:Z

    return v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->comment:Ljava/lang/String;

    return-void
.end method

.method public setDomain(Ljava/lang/String;)V
    .locals 1

    .line 120
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 121
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->domain:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 123
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->domain:Ljava/lang/String;

    :goto_0
    return-void
.end method

.method public setHttpOnly(Z)V
    .locals 0

    .line 330
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->isHttpOnly:Z

    return-void
.end method

.method public setMaxAge(I)V
    .locals 0

    .line 156
    iput p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->maxAge:I

    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0

    .line 183
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->path:Ljava/lang/String;

    return-void
.end method

.method public setSecure(Z)V
    .locals 0

    .line 208
    iput-boolean p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->secure:Z

    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0

    .line 247
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->value:Ljava/lang/String;

    return-void
.end method

.method public setVersion(I)V
    .locals 0

    .line 287
    iput p1, p0, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->version:I

    return-void
.end method
