.class public Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;
.super Ljava/lang/Object;
.source "StandardCookieProcessor.java"

# interfaces
.implements Lcom/yanzhenjie/andserver/http/cookie/CookieProcessor;


# static fields
.field private static final ANCIENT_DATE:Ljava/lang/String;

.field private static final COOKIE_DATE_FORMAT:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/text/DateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final COOKIE_DATE_PATTERN:Ljava/lang/String; = "EEE, dd-MMM-yyyy HH:mm:ss z"

.field private static final DOMAIN_VALID:Ljava/util/BitSet;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 44
    new-instance v0, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor$1;

    invoke-direct {v0}, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor$1;-><init>()V

    sput-object v0, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->COOKIE_DATE_FORMAT:Ljava/lang/ThreadLocal;

    .line 53
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/DateFormat;

    new-instance v1, Ljava/util/Date;

    const-wide/16 v2, 0x2710

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->ANCIENT_DATE:Ljava/lang/String;

    .line 54
    new-instance v0, Ljava/util/BitSet;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    sput-object v0, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->DOMAIN_VALID:Ljava/util/BitSet;

    const/16 v0, 0x30

    :goto_0
    const/16 v1, 0x39

    if-gt v0, v1, :cond_0

    .line 58
    sget-object v1, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->DOMAIN_VALID:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    add-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    goto :goto_0

    :cond_0
    const/16 v0, 0x61

    :goto_1
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_1

    .line 61
    sget-object v1, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->DOMAIN_VALID:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    add-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    goto :goto_1

    :cond_1
    const/16 v0, 0x41

    :goto_2
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_2

    .line 64
    sget-object v1, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->DOMAIN_VALID:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    add-int/lit8 v0, v0, 0x1

    int-to-char v0, v0

    goto :goto_2

    .line 66
    :cond_2
    sget-object v0, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->DOMAIN_VALID:Ljava/util/BitSet;

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    .line 67
    sget-object v0, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->DOMAIN_VALID:Ljava/util/BitSet;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private parserCookieValue(Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/cookie/Cookie;",
            ">;)V"
        }
    .end annotation

    .line 89
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v1, ";"

    invoke-direct {v0, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 91
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p1

    const-string v1, "="

    .line 92
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    if-lez v1, :cond_0

    .line 94
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    const/4 v3, 0x0

    .line 95
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 96
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 97
    new-instance v2, Lcom/yanzhenjie/andserver/http/cookie/Cookie;

    invoke-direct {v2, v1, p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-void
.end method

.method private validateCookieValue(Ljava/lang/String;)V
    .locals 8

    .line 165
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x22

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-le v0, v3, :cond_0

    .line 167
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v1, :cond_0

    add-int/lit8 v4, v0, -0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 172
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    :goto_1
    if-ge v4, v0, :cond_2

    .line 174
    aget-char v6, v5, v4

    const/16 v7, 0x21

    if-lt v6, v7, :cond_1

    if-eq v6, v1, :cond_1

    const/16 v7, 0x2c

    if-eq v6, v7, :cond_1

    const/16 v7, 0x3b

    if-eq v6, v7, :cond_1

    const/16 v7, 0x5c

    if-eq v6, v7, :cond_1

    const/16 v7, 0x7f

    if-eq v6, v7, :cond_1

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_1
    new-array v0, v3, [Ljava/lang/Object;

    aput-object p1, v0, v2

    const-string p1, "The cookie\'s value [%1$s] is invalid."

    .line 176
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 177
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    return-void
.end method

.method private validateDomain(Ljava/lang/String;)V
    .locals 11

    .line 187
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, -0x1

    .line 188
    :goto_0
    array-length v5, v0

    const/16 v6, 0x2d

    const-string v7, "The cookie\'s domain [%1$s] is invalid."

    const/16 v8, 0x2e

    const/4 v9, 0x1

    if-ge v3, v5, :cond_6

    .line 190
    aget-char v5, v0, v3

    .line 191
    sget-object v10, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->DOMAIN_VALID:Ljava/util/BitSet;

    invoke-virtual {v10, v5}, Ljava/util/BitSet;->get(I)Z

    move-result v10

    if-eqz v10, :cond_5

    if-eq v4, v8, :cond_0

    if-ne v4, v1, :cond_1

    :cond_0
    if-eq v5, v8, :cond_4

    if-eq v5, v6, :cond_4

    :cond_1
    if-ne v4, v6, :cond_3

    if-eq v5, v8, :cond_2

    goto :goto_1

    :cond_2
    new-array v0, v9, [Ljava/lang/Object;

    aput-object p1, v0, v2

    .line 202
    invoke-static {v7, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 203
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    :goto_1
    add-int/lit8 v3, v3, 0x1

    move v4, v5

    goto :goto_0

    :cond_4
    new-array v0, v9, [Ljava/lang/Object;

    aput-object p1, v0, v2

    .line 197
    invoke-static {v7, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 198
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    new-array v0, v9, [Ljava/lang/Object;

    aput-object p1, v0, v2

    .line 192
    invoke-static {v7, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 193
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    if-eq v4, v8, :cond_7

    if-eq v4, v6, :cond_7

    return-void

    :cond_7
    new-array v0, v9, [Ljava/lang/Object;

    aput-object p1, v0, v2

    .line 209
    invoke-static {v7, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 210
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method

.method private validatePath(Ljava/lang/String;)V
    .locals 5

    .line 216
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 218
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_1

    .line 219
    aget-char v3, v0, v2

    const/16 v4, 0x20

    if-lt v3, v4, :cond_0

    const/16 v4, 0x7e

    if-gt v3, v4, :cond_0

    const/16 v4, 0x3b

    if-eq v3, v4, :cond_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p1, v0, v1

    const-string p1, "The cookie\'s path [%1$s] is invalid."

    .line 221
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 222
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method


# virtual methods
.method public generateHeader(Lcom/yanzhenjie/andserver/http/cookie/Cookie;)Ljava/lang/String;
    .locals 9

    .line 106
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 107
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v1, 0x3d

    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 109
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 110
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 111
    invoke-direct {p0, v1}, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->validateCookieValue(Ljava/lang/String;)V

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 116
    :cond_0
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getMaxAge()I

    move-result v1

    const/4 v2, -0x1

    if-le v1, v2, :cond_2

    const-string v2, "; Max-Age="

    .line 119
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v2, "; Expires="

    .line 127
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    if-nez v1, :cond_1

    .line 130
    sget-object v1, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->ANCIENT_DATE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 132
    :cond_1
    new-instance v2, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    int-to-long v5, v1

    const-wide/16 v7, 0x3e8

    mul-long v5, v5, v7

    add-long/2addr v3, v5

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 133
    sget-object v1, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->COOKIE_DATE_FORMAT:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/text/DateFormat;

    new-instance v3, Ljava/text/FieldPosition;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Ljava/text/FieldPosition;-><init>(I)V

    invoke-virtual {v1, v2, v0, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;

    .line 137
    :cond_2
    :goto_0
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getDomain()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 138
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 139
    invoke-direct {p0, v1}, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->validateDomain(Ljava/lang/String;)V

    const-string v2, "; Domain="

    .line 140
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 144
    :cond_3
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 145
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_4

    .line 146
    invoke-direct {p0, v1}, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->validatePath(Ljava/lang/String;)V

    const-string v2, "; Path="

    .line 147
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 148
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 151
    :cond_4
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->getSecure()Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "; Secure"

    .line 152
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 155
    :cond_5
    invoke-virtual {p1}, Lcom/yanzhenjie/andserver/http/cookie/Cookie;->isHttpOnly()Z

    move-result p1

    if-eqz p1, :cond_6

    const-string p1, "; HttpOnly"

    .line 156
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 159
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public parseCookieHeader([Lorg/apache/httpcore/Header;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/apache/httpcore/Header;",
            ")",
            "Ljava/util/List<",
            "Lcom/yanzhenjie/andserver/http/cookie/Cookie;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_3

    .line 73
    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_1

    .line 77
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 78
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p1, v2

    .line 79
    invoke-interface {v3}, Lorg/apache/httpcore/Header;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Cookie"

    .line 80
    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 81
    invoke-interface {v3}, Lorg/apache/httpcore/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 82
    invoke-direct {p0, v3, v0}, Lcom/yanzhenjie/andserver/http/cookie/StandardCookieProcessor;->parserCookieValue(Ljava/lang/String;Ljava/util/List;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0

    .line 74
    :cond_3
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
