.class public Lcom/yanzhenjie/andserver/http/session/StandardIdGenerator;
.super Ljava/lang/Object;
.source "StandardIdGenerator.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/session/IdGenerator;


# static fields
.field private static final ID_LENGTH:I = 0x1e


# instance fields
.field private mRandom:Ljava/security/SecureRandom;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-direct {p0}, Lcom/yanzhenjie/andserver/http/session/StandardIdGenerator;->createSecureRandom()Ljava/security/SecureRandom;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/session/StandardIdGenerator;->mRandom:Ljava/security/SecureRandom;

    return-void
.end method

.method private createSecureRandom()Ljava/security/SecureRandom;
    .locals 1

    :try_start_0
    const-string v0, "SHA1PRNG"

    .line 72
    invoke-static {v0}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 74
    :catch_0
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    .line 78
    :goto_0
    invoke-virtual {v0}, Ljava/security/SecureRandom;->nextInt()I

    return-object v0
.end method


# virtual methods
.method public generateId()Ljava/lang/String;
    .locals 10

    const/16 v0, 0x10

    new-array v1, v0, [B

    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x50

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    :cond_0
    const/16 v5, 0x1e

    if-ge v4, v5, :cond_3

    .line 46
    iget-object v6, p0, Lcom/yanzhenjie/andserver/http/session/StandardIdGenerator;->mRandom:Ljava/security/SecureRandom;

    invoke-virtual {v6, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v0, :cond_0

    if-ge v4, v5, :cond_0

    .line 48
    aget-byte v7, v1, v6

    and-int/lit16 v7, v7, 0xf0

    shr-int/lit8 v7, v7, 0x4

    int-to-byte v7, v7

    .line 49
    aget-byte v8, v1, v6

    and-int/lit8 v8, v8, 0xf

    int-to-byte v8, v8

    const/16 v9, 0xa

    if-ge v7, v9, :cond_1

    add-int/lit8 v7, v7, 0x30

    int-to-char v7, v7

    .line 51
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_1
    add-int/lit8 v7, v7, -0xa

    add-int/lit8 v7, v7, 0x41

    int-to-char v7, v7

    .line 53
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1
    if-ge v8, v9, :cond_2

    add-int/lit8 v8, v8, 0x30

    int-to-char v7, v8

    .line 56
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_2
    add-int/lit8 v8, v8, -0xa

    add-int/lit8 v8, v8, 0x41

    int-to-char v7, v8

    .line 58
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_2
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 63
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
