.class public Lcom/bigkoo/pickerview/utils/ChinaDate;
.super Ljava/lang/Object;
.source "ChinaDate.java"


# static fields
.field private static final Animals:[Ljava/lang/String;

.field private static final Gan:[Ljava/lang/String;

.field private static final Zhi:[Ljava/lang/String;

.field private static final lunarInfo:[J

.field public static final nStr1:[Ljava/lang/String;

.field private static sdf:Ljava/text/SimpleDateFormat;

.field private static final year19:[I

.field private static final year20:[I

.field private static final year2000:[I


# direct methods
.method static constructor <clinit>()V
    .locals 14

    const/16 v0, 0xc9

    new-array v0, v0, [J

    .line 23
    fill-array-data v0, :array_0

    sput-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->lunarInfo:[J

    const/16 v0, 0xc

    new-array v1, v0, [I

    .line 46
    fill-array-data v1, :array_1

    sput-object v1, Lcom/bigkoo/pickerview/utils/ChinaDate;->year20:[I

    new-array v1, v0, [I

    .line 47
    fill-array-data v1, :array_2

    sput-object v1, Lcom/bigkoo/pickerview/utils/ChinaDate;->year19:[I

    new-array v0, v0, [I

    .line 48
    fill-array-data v0, :array_3

    sput-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->year2000:[I

    const-string v1, ""

    const-string v2, "\u6b63"

    const-string v3, "\u4e8c"

    const-string v4, "\u4e09"

    const-string v5, "\u56db"

    const-string v6, "\u4e94"

    const-string v7, "\u516d"

    const-string v8, "\u4e03"

    const-string v9, "\u516b"

    const-string v10, "\u4e5d"

    const-string v11, "\u5341"

    const-string v12, "\u51ac"

    const-string v13, "\u814a"

    .line 49
    filled-new-array/range {v1 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->nStr1:[Ljava/lang/String;

    const-string v1, "\u7532"

    const-string v2, "\u4e59"

    const-string v3, "\u4e19"

    const-string v4, "\u4e01"

    const-string v5, "\u620a"

    const-string v6, "\u5df1"

    const-string v7, "\u5e9a"

    const-string v8, "\u8f9b"

    const-string v9, "\u58ec"

    const-string v10, "\u7678"

    .line 51
    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->Gan:[Ljava/lang/String;

    const-string v1, "\u5b50"

    const-string v2, "\u4e11"

    const-string v3, "\u5bc5"

    const-string v4, "\u536f"

    const-string v5, "\u8fb0"

    const-string v6, "\u5df3"

    const-string v7, "\u5348"

    const-string v8, "\u672a"

    const-string v9, "\u7533"

    const-string v10, "\u9149"

    const-string v11, "\u620c"

    const-string v12, "\u4ea5"

    .line 53
    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->Zhi:[Ljava/lang/String;

    const-string v1, "\u9f20"

    const-string v2, "\u725b"

    const-string v3, "\u864e"

    const-string v4, "\u5154"

    const-string v5, "\u9f99"

    const-string v6, "\u86c7"

    const-string v7, "\u9a6c"

    const-string v8, "\u7f8a"

    const-string v9, "\u7334"

    const-string v10, "\u9e21"

    const-string v11, "\u72d7"

    const-string v12, "\u732a"

    .line 55
    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->Animals:[Ljava/lang/String;

    .line 372
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy\u5e74M\u6708d\u65e5 EEEEE"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->sdf:Ljava/text/SimpleDateFormat;

    return-void

    :array_0
    .array-data 8
        0x4bd8
        0x4ae0
        0xa570
        0x54d5
        0xd260
        0xd950
        0x16554
        0x56a0
        0x9ad0
        0x55d2
        0x4ae0
        0xa5b6
        0xa4d0
        0xd250
        0x1d255
        0xb540
        0xd6a0
        0xada2
        0x95b0
        0x14977
        0x4970
        0xa4b0
        0xb4b5
        0x6a50
        0x6d40
        0x1ab54
        0x2b60
        0x9570
        0x52f2
        0x4970
        0x6566
        0xd4a0
        0xea50
        0x6e95
        0x5ad0
        0x2b60
        0x186e3
        0x92e0
        0x1c8d7
        0xc950
        0xd4a0
        0x1d8a6
        0xb550
        0x56a0
        0x1a5b4
        0x25d0
        0x92d0
        0xd2b2
        0xa950
        0xb557
        0x6ca0
        0xb550
        0x15355
        0x4da0
        0xa5b0
        0x14573
        0x52b0
        0xa9a8
        0xe950
        0x6aa0
        0xaea6
        0xab50
        0x4b60
        0xaae4
        0xa570
        0x5260
        0xf263
        0xd950
        0x5b57
        0x56a0
        0x96d0
        0x4dd5
        0x4ad0
        0xa4d0
        0xd4d4
        0xd250
        0xd558
        0xb540
        0xb6a0
        0x195a6
        0x95b0
        0x49b0
        0xa974
        0xa4b0
        0xb27a
        0x6a50
        0x6d40
        0xaf46
        0xab60
        0x9570
        0x4af5
        0x4970
        0x64b0
        0x74a3
        0xea50
        0x6b58
        0x55c0
        0xab60
        0x96d5
        0x92e0
        0xc960
        0xd954
        0xd4a0
        0xda50
        0x7552
        0x56a0
        0xabb7
        0x25d0
        0x92d0
        0xcab5
        0xa950
        0xb4a0
        0xbaa4
        0xad50
        0x55d9
        0x4ba0
        0xa5b0
        0x15176
        0x52b0
        0xa930
        0x7954
        0x6aa0
        0xad50
        0x5b52
        0x4b60
        0xa6e6
        0xa4e0
        0xd260
        0xea65
        0xd530
        0x5aa0
        0x76a3
        0x96d0
        0x4afb
        0x4ad0
        0xa4d0
        0x1d0b6
        0xd250
        0xd520
        0xdd45
        0xb5a0
        0x56d0
        0x55b2
        0x49b0
        0xa577
        0xa4b0
        0xaa50
        0x1b255
        0x6d20
        0xada0
        0x14b63
        0x9370
        0x49f8
        0x4970
        0x64b0
        0x168a6
        0xea50
        0x6b20
        0x1a6c4
        0xaae0
        0xa2e0
        0xd2e3
        0xc960
        0xd557
        0xd4a0
        0xda50
        0x5d55
        0x56a0
        0xa6d0
        0x55d4
        0x52d0
        0xa9b8
        0xa950
        0xb4a0
        0xb6a6
        0xad50
        0x55a0
        0xaba4
        0xa5b0
        0x52b0
        0xb273
        0x6930
        0x7337
        0x6aa0
        0xad50
        0x14b55
        0x4b60
        0xa570
        0x54e4
        0xd160
        0xe968
        0xd520
        0xdaa0
        0x16aa6
        0x56d0
        0x4ae0
        0xa9d4
        0xa2d0
        0xd150
        0xf252
        0xd520
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x4
        0x1
        0x2
        0x1
        0x2
        0x1
        0x1
        0x2
        0x1
        0x2
        0x1
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x3
        0x0
        0x1
        0x0
        0x1
        0x0
        0x0
        0x1
        0x0
        0x1
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x3
        0x1
        0x2
        0x1
        0x2
        0x1
        0x1
        0x2
        0x1
        0x2
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final AnimalsYear(I)Ljava/lang/String;
    .locals 1

    .line 120
    sget-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->Animals:[Ljava/lang/String;

    add-int/lit8 p0, p0, -0x4

    rem-int/lit8 p0, p0, 0xc

    aget-object p0, v0, p0

    return-object p0
.end method

.method private final Lunar(II)[J
    .locals 17

    move/from16 v0, p1

    move/from16 v1, p2

    const/4 v2, 0x7

    new-array v2, v2, [J

    .line 154
    new-instance v3, Ljava/util/GregorianCalendar;

    const/4 v4, 0x1

    const/16 v5, 0xed8

    const/16 v6, 0x1f

    invoke-direct {v3, v5, v4, v6}, Ljava/util/GregorianCalendar;-><init>(III)V

    invoke-virtual {v3}, Ljava/util/GregorianCalendar;->getTime()Ljava/util/Date;

    move-result-object v3

    .line 155
    new-instance v5, Ljava/util/GregorianCalendar;

    add-int/lit16 v6, v0, 0x76c

    invoke-direct {v5, v6, v1, v4}, Ljava/util/GregorianCalendar;-><init>(III)V

    invoke-virtual {v5}, Ljava/util/GregorianCalendar;->getTime()Ljava/util/Date;

    move-result-object v5

    .line 156
    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    sub-long/2addr v5, v7

    const-wide/32 v7, 0x5265c00

    div-long/2addr v5, v7

    const/16 v3, 0x7d0

    if-ge v0, v3, :cond_0

    .line 158
    sget-object v7, Lcom/bigkoo/pickerview/utils/ChinaDate;->year19:[I

    add-int/lit8 v8, v1, -0x1

    aget v7, v7, v8

    int-to-long v7, v7

    add-long/2addr v5, v7

    :cond_0
    if-le v0, v3, :cond_1

    .line 160
    sget-object v7, Lcom/bigkoo/pickerview/utils/ChinaDate;->year20:[I

    add-int/lit8 v8, v1, -0x1

    aget v7, v7, v8

    int-to-long v7, v7

    add-long/2addr v5, v7

    :cond_1
    if-ne v0, v3, :cond_2

    .line 162
    sget-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->year2000:[I

    sub-int/2addr v1, v4

    aget v0, v0, v1

    int-to-long v0, v0

    add-long/2addr v5, v0

    :cond_2
    const/4 v0, 0x5

    const-wide/16 v7, 0x28

    add-long/2addr v7, v5

    aput-wide v7, v2, v0

    const-wide/16 v0, 0xe

    const/4 v3, 0x4

    aput-wide v0, v2, v3

    const/16 v0, 0x76c

    const/4 v1, 0x0

    const/4 v7, 0x0

    :goto_0
    const/16 v8, 0x802

    const-wide/16 v9, 0xc

    const-wide/16 v11, 0x0

    if-ge v0, v8, :cond_3

    cmp-long v8, v5, v11

    if-lez v8, :cond_3

    .line 166
    invoke-static {v0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->lYearDays(I)I

    move-result v7

    int-to-long v11, v7

    sub-long/2addr v5, v11

    .line 168
    aget-wide v11, v2, v3

    add-long/2addr v11, v9

    aput-wide v11, v2, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    cmp-long v8, v5, v11

    if-gez v8, :cond_4

    int-to-long v13, v7

    add-long/2addr v5, v13

    add-int/lit8 v0, v0, -0x1

    .line 173
    aget-wide v13, v2, v3

    sub-long/2addr v13, v9

    aput-wide v13, v2, v3

    :cond_4
    int-to-long v8, v0

    aput-wide v8, v2, v1

    const/4 v8, 0x3

    add-int/lit16 v9, v0, -0x748

    int-to-long v9, v9

    aput-wide v9, v2, v8

    .line 177
    invoke-static {v0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result v0

    const/4 v8, 0x6

    aput-wide v11, v2, v8

    const/4 v9, 0x1

    :goto_1
    const/16 v10, 0xd

    const-wide/16 v13, 0x1

    if-ge v9, v10, :cond_8

    cmp-long v10, v5, v11

    if-lez v10, :cond_8

    if-lez v0, :cond_5

    add-int/lit8 v7, v0, 0x1

    if-ne v9, v7, :cond_5

    .line 181
    aget-wide v15, v2, v8

    cmp-long v7, v15, v11

    if-nez v7, :cond_5

    add-int/lit8 v9, v9, -0x1

    aput-wide v13, v2, v8

    .line 184
    aget-wide v3, v2, v1

    long-to-int v4, v3

    invoke-static {v4}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapDays(I)I

    move-result v3

    goto :goto_2

    .line 186
    :cond_5
    aget-wide v3, v2, v1

    long-to-int v4, v3

    invoke-static {v4, v9}, Lcom/bigkoo/pickerview/utils/ChinaDate;->monthDays(II)I

    move-result v3

    :goto_2
    move v7, v3

    .line 189
    aget-wide v3, v2, v8

    cmp-long v15, v3, v13

    if-nez v15, :cond_6

    add-int/lit8 v3, v0, 0x1

    if-ne v9, v3, :cond_6

    aput-wide v11, v2, v8

    :cond_6
    int-to-long v3, v7

    sub-long/2addr v5, v3

    .line 192
    aget-wide v3, v2, v8

    cmp-long v15, v3, v11

    if-nez v15, :cond_7

    const/4 v3, 0x4

    .line 193
    aget-wide v15, v2, v3

    add-long/2addr v15, v13

    aput-wide v15, v2, v3

    :cond_7
    add-int/lit8 v9, v9, 0x1

    const/4 v3, 0x4

    const/4 v4, 0x1

    goto :goto_1

    :cond_8
    cmp-long v1, v5, v11

    if-nez v1, :cond_a

    if-lez v0, :cond_a

    const/4 v1, 0x1

    add-int/2addr v0, v1

    if-ne v9, v0, :cond_a

    .line 196
    aget-wide v0, v2, v8

    cmp-long v3, v0, v13

    if-nez v3, :cond_9

    aput-wide v11, v2, v8

    goto :goto_3

    :cond_9
    aput-wide v13, v2, v8

    add-int/lit8 v9, v9, -0x1

    const/4 v0, 0x4

    .line 201
    aget-wide v3, v2, v0

    sub-long/2addr v3, v13

    aput-wide v3, v2, v0

    :cond_a
    :goto_3
    cmp-long v0, v5, v11

    if-gez v0, :cond_b

    int-to-long v0, v7

    add-long/2addr v5, v0

    add-int/lit8 v9, v9, -0x1

    const/4 v0, 0x4

    .line 207
    aget-wide v3, v2, v0

    sub-long/2addr v3, v13

    aput-wide v3, v2, v0

    :cond_b
    int-to-long v0, v9

    const/4 v3, 0x1

    aput-wide v0, v2, v3

    const/4 v0, 0x2

    add-long/2addr v5, v13

    aput-wide v5, v2, v0

    return-object v2
.end method

.method public static final calElement(III)[J
    .locals 17

    const/4 v0, 0x7

    new-array v0, v0, [J

    .line 225
    new-instance v1, Ljava/util/GregorianCalendar;

    const/16 v2, 0x76c

    const/4 v3, 0x0

    const/16 v4, 0x1f

    invoke-direct {v1, v2, v3, v4}, Ljava/util/GregorianCalendar;-><init>(III)V

    invoke-virtual {v1}, Ljava/util/GregorianCalendar;->getTime()Ljava/util/Date;

    move-result-object v1

    .line 226
    new-instance v4, Ljava/util/GregorianCalendar;

    const/4 v5, 0x1

    add-int/lit8 v6, p1, -0x1

    move/from16 v7, p0

    move/from16 v8, p2

    invoke-direct {v4, v7, v6, v8}, Ljava/util/GregorianCalendar;-><init>(III)V

    invoke-virtual {v4}, Ljava/util/GregorianCalendar;->getTime()Ljava/util/Date;

    move-result-object v4

    .line 227
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long/2addr v6, v8

    const-wide/32 v8, 0x5265c00

    div-long/2addr v6, v8

    const-wide/16 v8, 0x28

    add-long/2addr v8, v6

    const/4 v1, 0x5

    aput-wide v8, v0, v1

    const-wide/16 v8, 0xe

    const/4 v1, 0x4

    aput-wide v8, v0, v1

    const/4 v4, 0x0

    :goto_0
    const/16 v8, 0x802

    const-wide/16 v9, 0xc

    const-wide/16 v11, 0x0

    if-ge v2, v8, :cond_0

    cmp-long v8, v6, v11

    if-lez v8, :cond_0

    .line 231
    invoke-static {v2}, Lcom/bigkoo/pickerview/utils/ChinaDate;->lYearDays(I)I

    move-result v4

    int-to-long v11, v4

    sub-long/2addr v6, v11

    .line 233
    aget-wide v11, v0, v1

    add-long/2addr v11, v9

    aput-wide v11, v0, v1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    cmp-long v8, v6, v11

    if-gez v8, :cond_1

    int-to-long v13, v4

    add-long/2addr v6, v13

    add-int/lit8 v2, v2, -0x1

    .line 238
    aget-wide v13, v0, v1

    sub-long/2addr v13, v9

    aput-wide v13, v0, v1

    :cond_1
    int-to-long v8, v2

    aput-wide v8, v0, v3

    const/4 v8, 0x3

    add-int/lit16 v9, v2, -0x748

    int-to-long v9, v9

    aput-wide v9, v0, v8

    .line 242
    invoke-static {v2}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result v2

    const/4 v8, 0x6

    aput-wide v11, v0, v8

    const/4 v9, 0x1

    :goto_1
    const/16 v10, 0xd

    const-wide/16 v13, 0x1

    if-ge v9, v10, :cond_5

    cmp-long v10, v6, v11

    if-lez v10, :cond_5

    if-lez v2, :cond_2

    add-int/lit8 v4, v2, 0x1

    if-ne v9, v4, :cond_2

    .line 246
    aget-wide v15, v0, v8

    cmp-long v4, v15, v11

    if-nez v4, :cond_2

    add-int/lit8 v9, v9, -0x1

    aput-wide v13, v0, v8

    move-wide/from16 p0, v6

    .line 249
    aget-wide v5, v0, v3

    long-to-int v4, v5

    invoke-static {v4}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapDays(I)I

    move-result v4

    goto :goto_2

    :cond_2
    move-wide/from16 p0, v6

    .line 251
    aget-wide v4, v0, v3

    long-to-int v5, v4

    invoke-static {v5, v9}, Lcom/bigkoo/pickerview/utils/ChinaDate;->monthDays(II)I

    move-result v4

    .line 254
    :goto_2
    aget-wide v5, v0, v8

    cmp-long v7, v5, v13

    if-nez v7, :cond_3

    add-int/lit8 v5, v2, 0x1

    if-ne v9, v5, :cond_3

    aput-wide v11, v0, v8

    :cond_3
    int-to-long v5, v4

    sub-long v5, p0, v5

    .line 257
    aget-wide v15, v0, v8

    cmp-long v7, v15, v11

    if-nez v7, :cond_4

    .line 258
    aget-wide v15, v0, v1

    add-long/2addr v15, v13

    aput-wide v15, v0, v1

    :cond_4
    add-int/lit8 v9, v9, 0x1

    move-wide v6, v5

    const/4 v5, 0x1

    goto :goto_1

    :cond_5
    move-wide/from16 p0, v6

    cmp-long v3, p0, v11

    if-nez v3, :cond_7

    if-lez v2, :cond_7

    const/4 v3, 0x1

    add-int/2addr v2, v3

    if-ne v9, v2, :cond_7

    .line 261
    aget-wide v2, v0, v8

    cmp-long v5, v2, v13

    if-nez v5, :cond_6

    aput-wide v11, v0, v8

    goto :goto_3

    :cond_6
    aput-wide v13, v0, v8

    add-int/lit8 v9, v9, -0x1

    .line 266
    aget-wide v2, v0, v1

    sub-long/2addr v2, v13

    aput-wide v2, v0, v1

    :cond_7
    :goto_3
    cmp-long v2, p0, v11

    if-gez v2, :cond_8

    int-to-long v2, v4

    add-long v6, p0, v2

    add-int/lit8 v9, v9, -0x1

    .line 272
    aget-wide v2, v0, v1

    sub-long/2addr v2, v13

    aput-wide v2, v0, v1

    goto :goto_4

    :cond_8
    move-wide/from16 v6, p0

    :goto_4
    int-to-long v1, v9

    const/4 v3, 0x1

    aput-wide v1, v0, v3

    const/4 v1, 0x2

    add-long/2addr v6, v13

    aput-wide v6, v0, v1

    return-object v0
.end method

.method public static final cyclical(I)Ljava/lang/String;
    .locals 0

    add-int/lit16 p0, p0, -0x76c

    add-int/lit8 p0, p0, 0x24

    .line 141
    invoke-static {p0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->cyclicalm(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static final cyclicalm(I)Ljava/lang/String;
    .locals 3

    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/bigkoo/pickerview/utils/ChinaDate;->Gan:[Ljava/lang/String;

    rem-int/lit8 v2, p0, 0xa

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/bigkoo/pickerview/utils/ChinaDate;->Zhi:[Ljava/lang/String;

    rem-int/lit8 p0, p0, 0xc

    aget-object p0, v1, p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final getChinaDate(I)Ljava/lang/String;
    .locals 5

    const/16 v0, 0xa

    if-ne p0, v0, :cond_0

    const-string p0, "\u521d\u5341"

    return-object p0

    :cond_0
    const/16 v1, 0x14

    if-ne p0, v1, :cond_1

    const-string p0, "\u4e8c\u5341"

    return-object p0

    :cond_1
    const/16 v1, 0x1e

    if-ne p0, v1, :cond_2

    const-string p0, "\u4e09\u5341"

    return-object p0

    .line 287
    :cond_2
    div-int/lit8 v1, p0, 0xa

    if-nez v1, :cond_3

    const-string v2, "\u521d"

    goto :goto_0

    :cond_3
    const-string v2, ""

    :goto_0
    const/4 v3, 0x1

    if-ne v1, v3, :cond_4

    const-string v2, "\u5341"

    :cond_4
    const/4 v3, 0x2

    if-ne v1, v3, :cond_5

    const-string v2, "\u5eff"

    :cond_5
    const/4 v3, 0x3

    const-string v4, "\u4e09"

    if-ne v1, v3, :cond_6

    move-object v2, v4

    .line 296
    :cond_6
    rem-int/2addr p0, v0

    packed-switch p0, :pswitch_data_0

    goto/16 :goto_1

    .line 323
    :pswitch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u4e5d"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    .line 320
    :pswitch_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u516b"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_1

    .line 317
    :pswitch_2
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u4e03"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 314
    :pswitch_3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u516d"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 311
    :pswitch_4
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u4e94"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 308
    :pswitch_5
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u56db"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 305
    :pswitch_6
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 302
    :pswitch_7
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u4e8c"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 299
    :pswitch_8
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u4e00"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_1
    return-object v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getLunarDays(I)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 418
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x1

    :goto_0
    if-gt v1, p0, :cond_0

    .line 420
    invoke-static {v1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->getChinaDate(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static getLunarYearText(I)Ljava/lang/String;
    .locals 3

    .line 382
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/bigkoo/pickerview/utils/ChinaDate;->Gan:[Ljava/lang/String;

    add-int/lit8 p0, p0, -0x4

    rem-int/lit8 v2, p0, 0xa

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/bigkoo/pickerview/utils/ChinaDate;->Zhi:[Ljava/lang/String;

    rem-int/lit8 p0, p0, 0xc

    aget-object p0, v1, p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\u5e74"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getMonths(I)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 401
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x1

    .line 402
    :goto_0
    sget-object v2, Lcom/bigkoo/pickerview/utils/ChinaDate;->nStr1:[Ljava/lang/String;

    array-length v2, v2

    const-string v3, "\u6708"

    if-ge v1, v2, :cond_0

    .line 403
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/bigkoo/pickerview/utils/ChinaDate;->nStr1:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 405
    :cond_0
    invoke-static {p0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result v1

    if-eqz v1, :cond_1

    .line 406
    invoke-static {p0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u95f0"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Lcom/bigkoo/pickerview/utils/ChinaDate;->nStr1:[Ljava/lang/String;

    invoke-static {p0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result p0

    aget-object p0, v4, p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_1
    return-object v0
.end method

.method public static getYears(II)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 387
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    if-ge p0, p1, :cond_0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 389
    invoke-static {p0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->getLunarYearText(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, "%s(%d)"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static final lYearDays(I)I
    .locals 7

    const/16 v0, 0x15c

    const v1, 0x8000

    :goto_0
    const/16 v2, 0x8

    if-le v1, v2, :cond_1

    .line 67
    sget-object v2, Lcom/bigkoo/pickerview/utils/ChinaDate;->lunarInfo:[J

    add-int/lit16 v3, p0, -0x76c

    aget-wide v3, v2, v3

    int-to-long v5, v1

    and-long/2addr v3, v5

    const-wide/16 v5, 0x0

    cmp-long v2, v3, v5

    if-eqz v2, :cond_0

    add-int/lit8 v0, v0, 0x1

    :cond_0
    shr-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 70
    :cond_1
    invoke-static {p0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapDays(I)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public static final leapDays(I)I
    .locals 5

    .line 80
    invoke-static {p0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->leapMonth(I)I

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    sget-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->lunarInfo:[J

    add-int/lit16 p0, p0, -0x76c

    aget-wide v1, v0, p0

    const-wide/32 v3, 0x10000

    and-long/2addr v1, v3

    const-wide/16 v3, 0x0

    cmp-long p0, v1, v3

    if-eqz p0, :cond_0

    const/16 p0, 0x1e

    return p0

    :cond_0
    const/16 p0, 0x1d

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static final leapMonth(I)I
    .locals 5

    .line 96
    sget-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->lunarInfo:[J

    add-int/lit16 p0, p0, -0x76c

    aget-wide v1, v0, p0

    const-wide/16 v3, 0xf

    and-long/2addr v1, v3

    long-to-int p0, v1

    return p0
.end method

.method public static final monthDays(II)I
    .locals 3

    .line 107
    sget-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->lunarInfo:[J

    add-int/lit16 p0, p0, -0x76c

    aget-wide v1, v0, p0

    const/high16 p0, 0x10000

    shr-int/2addr p0, p1

    int-to-long p0, p0

    and-long/2addr p0, v1

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/16 p0, 0x1d

    return p0

    :cond_0
    const/16 p0, 0x1e

    return p0
.end method

.method public static oneDay(III)Ljava/lang/String;
    .locals 2

    .line 354
    invoke-static {p0, p1, p2}, Lcom/bigkoo/pickerview/utils/ChinaDate;->calElement(III)[J

    move-result-object p1

    .line 355
    new-instance p2, Ljava/lang/StringBuffer;

    invoke-direct {p2}, Ljava/lang/StringBuffer;-><init>()V

    :try_start_0
    const-string v0, " \u519c\u5386"

    .line 358
    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 359
    invoke-static {p0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->cyclical(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v0, 0x28

    .line 360
    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 361
    invoke-static {p0}, Lcom/bigkoo/pickerview/utils/ChinaDate;->AnimalsYear(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p0, ")\u5e74"

    .line 362
    invoke-virtual {p2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 363
    sget-object p0, Lcom/bigkoo/pickerview/utils/ChinaDate;->nStr1:[Ljava/lang/String;

    const/4 v0, 0x1

    aget-wide v0, p1, v0

    long-to-int v1, v0

    aget-object p0, p0, v1

    invoke-virtual {p2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p0, "\u6708"

    .line 364
    invoke-virtual {p2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/4 p0, 0x2

    .line 365
    aget-wide p0, p1, p0

    long-to-int p1, p0

    invoke-static {p1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->getChinaDate(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 366
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 369
    throw p0
.end method

.method public static today()Ljava/lang/String;
    .locals 7

    .line 330
    sget-object v0, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x1

    .line 331
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/4 v3, 0x2

    .line 332
    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/2addr v4, v1

    const/4 v5, 0x5

    .line 333
    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    .line 334
    invoke-static {v2, v4, v5}, Lcom/bigkoo/pickerview/utils/ChinaDate;->calElement(III)[J

    move-result-object v4

    .line 335
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 337
    :try_start_0
    sget-object v6, Lcom/bigkoo/pickerview/utils/ChinaDate;->sdf:Ljava/text/SimpleDateFormat;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, " \u519c\u5386"

    .line 338
    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 339
    invoke-static {v2}, Lcom/bigkoo/pickerview/utils/ChinaDate;->cyclical(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v0, 0x28

    .line 340
    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 341
    invoke-static {v2}, Lcom/bigkoo/pickerview/utils/ChinaDate;->AnimalsYear(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, ")\u5e74"

    .line 342
    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 343
    sget-object v0, Lcom/bigkoo/pickerview/utils/ChinaDate;->nStr1:[Ljava/lang/String;

    aget-wide v1, v4, v1

    long-to-int v2, v1

    aget-object v0, v0, v2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\u6708"

    .line 344
    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 345
    aget-wide v0, v4, v3

    long-to-int v1, v0

    invoke-static {v1}, Lcom/bigkoo/pickerview/utils/ChinaDate;->getChinaDate(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 346
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    .line 349
    throw v0
.end method
