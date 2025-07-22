.class public Lcom/yanzhenjie/andserver/util/DigestUtils;
.super Ljava/lang/Object;
.source "DigestUtils.java"


# static fields
.field private static final HEX_CHARS:[C

.field private static final MD5_ALGORITHM_NAME:Ljava/lang/String; = "MD5"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x10

    new-array v0, v0, [C

    .line 30
    fill-array-data v0, :array_0

    sput-object v0, Lcom/yanzhenjie/andserver/util/DigestUtils;->HEX_CHARS:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendDigestAsHex(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    invoke-static {p0, p1}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digestAsHexChars(Ljava/lang/String;Ljava/io/InputStream;)[C

    move-result-object p0

    .line 172
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    return-object p2
.end method

.method private static appendDigestAsHex(Ljava/lang/String;[BLjava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 0

    .line 164
    invoke-static {p0, p1}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digestAsHexChars(Ljava/lang/String;[B)[C

    move-result-object p0

    .line 165
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    return-object p2
.end method

.method public static appendMd5DigestAsHex(Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "MD5"

    .line 123
    invoke-static {v0, p0, p1}, Lcom/yanzhenjie/andserver/util/DigestUtils;->appendDigestAsHex(Ljava/lang/String;Ljava/io/InputStream;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static appendMd5DigestAsHex([BLjava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1

    const-string v0, "MD5"

    .line 109
    invoke-static {v0, p0, p1}, Lcom/yanzhenjie/andserver/util/DigestUtils;->appendDigestAsHex(Ljava/lang/String;[BLjava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object p0

    return-object p0
.end method

.method private static digest(Ljava/lang/String;Ljava/io/InputStream;)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 144
    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->getDigest(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p0

    const/16 v0, 0x800

    new-array v0, v0, [B

    .line 147
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    const/4 v2, 0x0

    .line 148
    invoke-virtual {p0, v0, v2, v1}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 150
    :cond_0
    invoke-virtual {p0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    return-object p0
.end method

.method private static digest(Ljava/lang/String;[B)[B
    .locals 0

    .line 140
    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->getDigest(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    return-object p0
.end method

.method private static digestAsHexChars(Ljava/lang/String;Ljava/io/InputStream;)[C
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 181
    invoke-static {p0, p1}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digest(Ljava/lang/String;Ljava/io/InputStream;)[B

    move-result-object p0

    .line 182
    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->encodeHex([B)[C

    move-result-object p0

    return-object p0
.end method

.method private static digestAsHexChars(Ljava/lang/String;[B)[C
    .locals 0

    .line 176
    invoke-static {p0, p1}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digest(Ljava/lang/String;[B)[B

    move-result-object p0

    .line 177
    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->encodeHex([B)[C

    move-result-object p0

    return-object p0
.end method

.method private static digestAsHexString(Ljava/lang/String;Ljava/io/InputStream;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 159
    invoke-static {p0, p1}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digestAsHexChars(Ljava/lang/String;Ljava/io/InputStream;)[C

    move-result-object p0

    .line 160
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([C)V

    return-object p1
.end method

.method private static digestAsHexString(Ljava/lang/String;[B)Ljava/lang/String;
    .locals 0

    .line 154
    invoke-static {p0, p1}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digestAsHexChars(Ljava/lang/String;[B)[C

    move-result-object p0

    .line 155
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([C)V

    return-object p1
.end method

.method private static encodeHex([B)[C
    .locals 6

    const/16 v0, 0x20

    new-array v1, v0, [C

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 188
    div-int/lit8 v3, v2, 0x2

    aget-byte v3, p0, v3

    .line 189
    sget-object v4, Lcom/yanzhenjie/andserver/util/DigestUtils;->HEX_CHARS:[C

    ushr-int/lit8 v5, v3, 0x4

    and-int/lit8 v5, v5, 0xf

    aget-char v5, v4, v5

    aput-char v5, v1, v2

    add-int/lit8 v5, v2, 0x1

    and-int/lit8 v3, v3, 0xf

    .line 190
    aget-char v3, v4, v3

    aput-char v3, v1, v5

    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method private static getDigest(Ljava/lang/String;)Ljava/security/MessageDigest;
    .locals 4

    .line 133
    :try_start_0
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    .line 135
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not find MessageDigest with algorithm \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\""

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static md5Digest(Ljava/io/InputStream;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "MD5"

    .line 63
    invoke-static {v0, p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digest(Ljava/lang/String;Ljava/io/InputStream;)[B

    move-result-object p0

    return-object p0
.end method

.method public static md5Digest(Ljava/lang/String;)[B
    .locals 0

    .line 41
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->md5Digest([B)[B

    move-result-object p0

    return-object p0
.end method

.method public static md5Digest([B)[B
    .locals 1

    const-string v0, "MD5"

    .line 52
    invoke-static {v0, p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digest(Ljava/lang/String;[B)[B

    move-result-object p0

    return-object p0
.end method

.method public static md5DigestAsHex(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "MD5"

    .line 96
    invoke-static {v0, p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digestAsHexString(Ljava/lang/String;Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static md5DigestAsHex(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 74
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-static {p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->md5DigestAsHex([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static md5DigestAsHex([B)Ljava/lang/String;
    .locals 1

    const-string v0, "MD5"

    .line 85
    invoke-static {v0, p0}, Lcom/yanzhenjie/andserver/util/DigestUtils;->digestAsHexString(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
