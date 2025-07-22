.class public final Lcom/yanzhenjie/andserver/util/HttpDateFormat;
.super Ljava/lang/Object;
.source "HttpDateFormat.java"


# static fields
.field private static final FORMAT:Ljava/text/SimpleDateFormat;

.field private static final FORMATS_TEMPLATE:[Ljava/text/SimpleDateFormat;

.field private static final GMT_ZONE:Ljava/util/TimeZone;

.field private static final RFC1123_DATE:Ljava/lang/String; = "EEE, dd MMM yyyy HH:mm:ss zzz"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/text/SimpleDateFormat;

    .line 36
    new-instance v1, Ljava/text/SimpleDateFormat;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "EEE, dd MMM yyyy HH:mm:ss zzz"

    invoke-direct {v1, v3, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Ljava/text/SimpleDateFormat;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "EEEEEE, dd-MMM-yy HH:mm:ss zzz"

    invoke-direct {v1, v4, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Ljava/text/SimpleDateFormat;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "EEE MMMM d HH:mm:ss yyyy"

    invoke-direct {v1, v4, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sput-object v0, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->FORMATS_TEMPLATE:[Ljava/text/SimpleDateFormat;

    const-string v0, "GMT"

    .line 40
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->GMT_ZONE:Ljava/util/TimeZone;

    .line 41
    new-instance v0, Ljava/text/SimpleDateFormat;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v3, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->FORMAT:Ljava/text/SimpleDateFormat;

    .line 44
    sget-object v1, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->GMT_ZONE:Ljava/util/TimeZone;

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatDate(J)Ljava/lang/String;
    .locals 2

    .line 67
    const-class v0, Lcom/yanzhenjie/andserver/util/HttpDateFormat;

    monitor-enter v0

    .line 68
    :try_start_0
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 69
    sget-object p0, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->FORMAT:Ljava/text/SimpleDateFormat;

    invoke-virtual {p0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    .line 70
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static getCurrentDate()Ljava/lang/String;
    .locals 5

    .line 53
    sget-object v0, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->FORMAT:Ljava/text/SimpleDateFormat;

    monitor-enter v0

    .line 54
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 55
    sget-object v3, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->FORMAT:Ljava/text/SimpleDateFormat;

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 56
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static parseDate(Ljava/lang/String;)J
    .locals 5

    .line 82
    sget-object v0, Lcom/yanzhenjie/andserver/util/HttpDateFormat;->FORMATS_TEMPLATE:[Ljava/text/SimpleDateFormat;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, v0, v3

    .line 84
    :try_start_0
    invoke-virtual {v4, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    if-nez v2, :cond_1

    const-wide/16 v0, -0x1

    return-wide v0

    .line 93
    :cond_1
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method
