.class public Lcom/dnake/desktop/utils/Rs485Utils;
.super Ljava/lang/Object;
.source "Rs485Utils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dnake/desktop/utils/Rs485Utils$ViewHolder;
    }
.end annotation


# static fields
.field public static final FORCE_SINGLE_COIL:I = 0x5

.field public static final MULTIPLE_WRITE:I = 0x10

.field public static final READ_3:I = 0x3

.field public static final READ_4:I = 0x4

.field public static final READ_COIL:I = 0x1

.field public static final SINGLE_WRITE:I = 0x6


# instance fields
.field private HEXES:Ljava/lang/String;

.field private HEX_INDICATOR:Ljava/lang/String;

.field private SPACE:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "0123456789ABCDEF"

    .line 236
    iput-object v0, p0, Lcom/dnake/desktop/utils/Rs485Utils;->HEXES:Ljava/lang/String;

    const-string v0, "0x"

    .line 237
    iput-object v0, p0, Lcom/dnake/desktop/utils/Rs485Utils;->HEX_INDICATOR:Ljava/lang/String;

    const-string v0, " "

    .line 238
    iput-object v0, p0, Lcom/dnake/desktop/utils/Rs485Utils;->SPACE:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/dnake/desktop/utils/Rs485Utils$1;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/dnake/desktop/utils/Rs485Utils;-><init>()V

    return-void
.end method

.method private GetDIntAt([BI)I
    .locals 2

    .line 124
    aget-byte v0, p1, p2

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p2, 0x1

    .line 126
    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 v1, p2, 0x2

    .line 128
    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v1

    shl-int/lit8 v0, v0, 0x8

    add-int/lit8 p2, p2, 0x3

    .line 130
    aget-byte p1, p1, p2

    and-int/lit16 p1, p1, 0xff

    add-int/2addr v0, p1

    return v0
.end method

.method private alex_crc16([BI)I
    .locals 5

    const/4 v0, 0x0

    const v1, 0xffff

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p2, :cond_2

    .line 164
    aget-byte v3, p1, v2

    and-int/lit16 v3, v3, 0xff

    xor-int/2addr v1, v3

    const/4 v3, 0x0

    :goto_1
    const/16 v4, 0x8

    if-ge v3, v4, :cond_1

    and-int/lit8 v4, v1, 0x1

    if-eqz v4, :cond_0

    shr-int/lit8 v1, v1, 0x1

    const v4, 0xa001

    xor-int/2addr v1, v4

    goto :goto_2

    :cond_0
    shr-int/lit8 v1, v1, 0x1

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method private copyTwoBytesFromData([BI)[B
    .locals 3

    const/4 v0, 0x2

    new-array v1, v0, [B

    mul-int/lit8 p2, p2, 0x2

    const/4 v2, 0x0

    .line 323
    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method

.method public static getInstance()Lcom/dnake/desktop/utils/Rs485Utils;
    .locals 1

    .line 20
    sget-object v0, Lcom/dnake/desktop/utils/Rs485Utils$ViewHolder;->instance:Lcom/dnake/desktop/utils/Rs485Utils;

    return-object v0
.end method

.method public static setBitToZero(II)I
    .locals 1

    const/4 v0, 0x1

    shl-int p1, v0, p1

    xor-int/lit8 p1, p1, -0x1

    and-int/2addr p0, p1

    return p0
.end method


# virtual methods
.method public GetShortAt([BI)I
    .locals 1

    .line 135
    aget-byte v0, p1, p2

    add-int/lit8 p2, p2, 0x1

    .line 136
    aget-byte p1, p1, p2

    and-int/lit16 p1, p1, 0xff

    and-int/lit16 p2, v0, 0x80

    if-eqz p2, :cond_0

    and-int/lit8 p2, v0, 0x7f

    shl-int/lit8 p2, p2, 0x8

    add-int/2addr p2, p1

    neg-int p1, p2

    return p1

    :cond_0
    shl-int/lit8 p2, v0, 0x8

    add-int/2addr p2, p1

    return p2
.end method

.method public byte2ToInt([BI)I
    .locals 1

    .line 311
    aget-byte v0, p1, p2

    add-int/lit8 p2, p2, 0x1

    .line 312
    aget-byte p1, p1, p2

    and-int/lit16 p1, p1, 0xff

    shl-int/lit8 p2, v0, 0x8

    add-int/2addr p2, p1

    return p2
.end method

.method public calReadDataArray([B)[B
    .locals 4

    const/4 v0, 0x2

    .line 68
    aget-byte v0, p1, v0

    and-int/lit16 v0, v0, 0xff

    .line 69
    new-array v1, v0, [B

    const/4 v2, 0x3

    const/4 v3, 0x0

    .line 70
    invoke-static {p1, v2, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method

.method public checkBuf([B)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 187
    :cond_0
    array-length v1, p1

    add-int/lit8 v1, v1, -0x2

    invoke-direct {p0, p1, v1}, Lcom/dnake/desktop/utils/Rs485Utils;->alex_crc16([BI)I

    move-result v1

    .line 188
    array-length v2, p1

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    aget-byte v2, p1, v2

    const v4, 0xff00

    and-int/2addr v4, v1

    shr-int/lit8 v4, v4, 0x8

    int-to-byte v4, v4

    if-ne v2, v4, :cond_1

    array-length v2, p1

    add-int/lit8 v2, v2, -0x2

    aget-byte p1, p1, v2

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    if-ne p1, v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public getBit(II)B
    .locals 0

    shr-int/2addr p1, p2

    and-int/lit8 p1, p1, 0x1

    int-to-byte p1, p1

    return p1
.end method

.method public getIntFromBit2([BII)I
    .locals 3

    const/4 v0, 0x1

    .line 264
    aget-byte v1, p1, v0

    and-int/lit16 v1, v1, 0xff

    const/4 v2, 0x0

    .line 265
    aget-byte p1, p1, v2

    and-int/lit16 p1, p1, 0xff

    shl-int/lit8 p1, p1, 0x8

    or-int/2addr p1, v1

    sub-int/2addr p3, p2

    add-int/2addr p3, v0

    const/4 v0, 0x0

    :goto_0
    if-ge v2, p3, :cond_0

    .line 270
    invoke-virtual {p0, v0, v2}, Lcom/dnake/desktop/utils/Rs485Utils;->setBitToOne(II)I

    move-result v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    shr-int/2addr p1, p2

    and-int/2addr p1, v0

    return p1
.end method

.method public getIntFromByteArray([BIII)I
    .locals 0

    .line 259
    invoke-direct {p0, p1, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->copyTwoBytesFromData([BI)[B

    move-result-object p1

    invoke-virtual {p0, p1, p3, p4}, Lcom/dnake/desktop/utils/Rs485Utils;->getIntFromBit2([BII)I

    move-result p1

    return p1
.end method

.method public getReadSendBytes(IIII)[B
    .locals 2

    const/4 v0, 0x6

    new-array v0, v0, [B

    int-to-byte p1, p1

    const/4 v1, 0x0

    aput-byte p1, v0, v1

    int-to-byte p1, p2

    const/4 p2, 0x1

    aput-byte p1, v0, p2

    shr-int/lit8 p1, p3, 0x8

    int-to-byte p1, p1

    const/4 p2, 0x2

    aput-byte p1, v0, p2

    and-int/lit16 p1, p3, 0xff

    int-to-byte p1, p1

    const/4 p2, 0x3

    aput-byte p1, v0, p2

    shr-int/lit8 p1, p4, 0x8

    int-to-byte p1, p1

    const/4 p2, 0x4

    aput-byte p1, v0, p2

    and-int/lit16 p1, p4, 0xff

    int-to-byte p1, p1

    const/4 p2, 0x5

    aput-byte p1, v0, p2

    .line 40
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->getSendBuf([B)[B

    move-result-object p1

    return-object p1
.end method

.method public getReceiveLen([B)I
    .locals 5

    const/4 v0, 0x1

    .line 203
    aget-byte v1, p1, v0

    const/4 v2, 0x4

    .line 204
    invoke-virtual {p0, p1, v2}, Lcom/dnake/desktop/utils/Rs485Utils;->GetShortAt([BI)I

    move-result p1

    const/4 v3, 0x5

    const/16 v4, 0x8

    if-eq v1, v0, :cond_1

    const/16 v0, 0x10

    if-eq v1, v0, :cond_3

    const/4 v0, 0x3

    if-eq v1, v0, :cond_0

    if-eq v1, v2, :cond_0

    if-eq v1, v3, :cond_3

    const/4 p1, 0x6

    if-eq v1, p1, :cond_3

    const/4 v4, 0x0

    goto :goto_1

    :cond_0
    mul-int/lit8 p1, p1, 0x2

    :goto_0
    add-int/lit8 v4, p1, 0x5

    goto :goto_1

    .line 209
    :cond_1
    rem-int/lit8 v1, p1, 0x8

    if-eqz v1, :cond_2

    .line 210
    div-int/2addr p1, v4

    add-int/2addr p1, v3

    add-int/lit8 v4, p1, 0x1

    goto :goto_1

    .line 212
    :cond_2
    div-int/2addr p1, v4

    goto :goto_0

    :cond_3
    :goto_1
    return v4
.end method

.method public getSendBuf([B)[B
    .locals 4

    .line 152
    array-length v0, p1

    add-int/lit8 v0, v0, 0x2

    new-array v1, v0, [B

    .line 153
    array-length v2, p1

    const/4 v3, 0x0

    invoke-static {p1, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 p1, v0, -0x2

    .line 154
    invoke-direct {p0, v1, p1}, Lcom/dnake/desktop/utils/Rs485Utils;->alex_crc16([BI)I

    move-result v2

    and-int/lit16 v3, v2, 0xff

    int-to-byte v3, v3

    .line 155
    aput-byte v3, v1, p1

    add-int/lit8 v0, v0, -0x1

    const p1, 0xff00

    and-int/2addr p1, v2

    shr-int/lit8 p1, p1, 0x8

    int-to-byte p1, p1

    .line 156
    aput-byte p1, v1, v0

    return-object v1
.end method

.method public getWriteSendBytes(IIII)[B
    .locals 2

    const/4 v0, 0x6

    new-array v0, v0, [B

    int-to-byte p1, p1

    const/4 v1, 0x0

    aput-byte p1, v0, v1

    int-to-byte p1, p2

    const/4 p2, 0x1

    aput-byte p1, v0, p2

    shr-int/lit8 p1, p3, 0x8

    int-to-byte p1, p1

    const/4 p2, 0x2

    aput-byte p1, v0, p2

    and-int/lit16 p1, p3, 0xff

    int-to-byte p1, p1

    const/4 p2, 0x3

    aput-byte p1, v0, p2

    shr-int/lit8 p1, p4, 0x8

    int-to-byte p1, p1

    const/4 p2, 0x4

    aput-byte p1, v0, p2

    and-int/lit16 p1, p4, 0xff

    int-to-byte p1, p1

    const/4 p2, 0x5

    aput-byte p1, v0, p2

    .line 58
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/utils/Rs485Utils;->getSendBuf([B)[B

    move-result-object p1

    return-object p1
.end method

.method public hexToString([B)Ljava/lang/String;
    .locals 5

    if-eqz p1, :cond_1

    .line 244
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p1

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    .line 245
    :goto_0
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    if-gt v1, v2, :cond_0

    .line 246
    aget-byte v2, p1, v1

    .line 247
    iget-object v3, p0, Lcom/dnake/desktop/utils/Rs485Utils;->HEX_INDICATOR:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    iget-object v3, p0, Lcom/dnake/desktop/utils/Rs485Utils;->HEXES:Ljava/lang/String;

    and-int/lit16 v4, v2, 0xf0

    shr-int/lit8 v4, v4, 0x4

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/dnake/desktop/utils/Rs485Utils;->HEXES:Ljava/lang/String;

    and-int/lit8 v2, v2, 0xf

    .line 249
    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 250
    iget-object v2, p0, Lcom/dnake/desktop/utils/Rs485Utils;->SPACE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 252
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    const-string p1, ""

    return-object p1
.end method

.method public int2Bytes([BII)V
    .locals 1

    shr-int/lit8 v0, p3, 0x8

    int-to-byte v0, v0

    .line 317
    aput-byte v0, p1, p2

    add-int/lit8 p2, p2, 0x1

    and-int/lit16 p3, p3, 0xff

    int-to-byte p3, p3

    .line 318
    aput-byte p3, p1, p2

    return-void
.end method

.method public returnCheck([B[B)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 193
    array-length v2, p1

    .line 194
    invoke-virtual {p0, p2}, Lcom/dnake/desktop/utils/Rs485Utils;->getReceiveLen([B)I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 195
    invoke-virtual {p0, p1}, Lcom/dnake/desktop/utils/Rs485Utils;->checkBuf([B)Z

    move-result v2

    if-eqz v2, :cond_0

    aget-byte v2, p1, v1

    aget-byte v3, p2, v1

    if-ne v2, v3, :cond_0

    aget-byte p1, p1, v0

    aget-byte p2, p2, v0

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setBitToOne(II)I
    .locals 1

    const/4 v0, 0x1

    shl-int p2, v0, p2

    or-int/2addr p1, p2

    return p1
.end method

.method public toFloatArray([B)[F
    .locals 8

    .line 105
    array-length v0, p1

    const/4 v1, 0x4

    .line 106
    rem-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 109
    :cond_0
    array-length v0, p1

    div-int/2addr v0, v1

    .line 111
    new-array v2, v0, [F

    new-array v3, v1, [B

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v5, v0, :cond_1

    .line 114
    invoke-static {p1, v6, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 115
    invoke-direct {p0, v3, v4}, Lcom/dnake/desktop/utils/Rs485Utils;->GetDIntAt([BI)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v7

    aput v7, v2, v5

    add-int/2addr v6, v1

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    return-object v2
.end method

.method public toIntArray([B)[I
    .locals 8

    .line 81
    array-length v0, p1

    const/4 v1, 0x2

    .line 82
    rem-int/2addr v0, v1

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 85
    :cond_0
    array-length v0, p1

    div-int/2addr v0, v1

    .line 87
    new-array v2, v0, [I

    new-array v3, v1, [B

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v5, v0, :cond_1

    .line 90
    invoke-static {p1, v6, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    invoke-virtual {p0, v3, v4}, Lcom/dnake/desktop/utils/Rs485Utils;->GetShortAt([BI)I

    move-result v7

    aput v7, v2, v5

    add-int/2addr v6, v1

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    return-object v2
.end method
