.class Lcom/ihsanbal/logging/Printer;
.super Ljava/lang/Object;
.source "Printer.java"


# static fields
.field private static final BODY_TAG:Ljava/lang/String; = "Body:"

.field private static final CENTER_LINE:Ljava/lang/String; = "\u251c "

.field private static final CORNER_BOTTOM:Ljava/lang/String; = "\u2514 "

.field private static final CORNER_UP:Ljava/lang/String; = "\u250c "

.field private static final DEFAULT_LINE:Ljava/lang/String; = "\u2502 "

.field private static final DOUBLE_SEPARATOR:Ljava/lang/String;

.field private static final END_LINE:Ljava/lang/String; = "\u2514\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

.field private static final HEADERS_TAG:Ljava/lang/String; = "Headers:"

.field private static final JSON_INDENT:I = 0x3

.field private static final LINE_SEPARATOR:Ljava/lang/String;

.field private static final METHOD_TAG:Ljava/lang/String; = "Method: @"

.field private static final N:Ljava/lang/String; = "\n"

.field private static final OMITTED_REQUEST:[Ljava/lang/String;

.field private static final OMITTED_RESPONSE:[Ljava/lang/String;

.field private static final OOM_OMITTED:Ljava/lang/String;

.field private static final RECEIVED_TAG:Ljava/lang/String; = "Received in: "

.field private static final REQUEST_UP_LINE:Ljava/lang/String; = "\u250c\u2500\u2500\u2500\u2500\u2500\u2500 Request \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

.field private static final RESPONSE_UP_LINE:Ljava/lang/String; = "\u250c\u2500\u2500\u2500\u2500\u2500\u2500 Response \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

.field private static final STATUS_CODE_TAG:Ljava/lang/String; = "Status Code: "

.field private static final T:Ljava/lang/String; = "\t"

.field private static final URL_TAG:Ljava/lang/String; = "URL: "


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const-string v0, "line.separator"

    .line 22
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ihsanbal/logging/Printer;->DOUBLE_SEPARATOR:Ljava/lang/String;

    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/String;

    .line 25
    sget-object v2, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v4, "Omitted response body"

    const/4 v5, 0x1

    aput-object v4, v1, v5

    sput-object v1, Lcom/ihsanbal/logging/Printer;->OMITTED_RESPONSE:[Ljava/lang/String;

    new-array v0, v0, [Ljava/lang/String;

    aput-object v2, v0, v3

    const-string v1, "Omitted request body"

    aput-object v1, v0, v5

    .line 26
    sput-object v0, Lcom/ihsanbal/logging/Printer;->OMITTED_REQUEST:[Ljava/lang/String;

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Output omitted because of Object size."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ihsanbal/logging/Printer;->OOM_OMITTED:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method private static bodyToString(Lokhttp3/Request;)Ljava/lang/String;
    .locals 2

    .line 190
    :try_start_0
    invoke-virtual {p0}, Lokhttp3/Request;->newBuilder()Lokhttp3/Request$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p0

    .line 191
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 192
    invoke-virtual {p0}, Lokhttp3/Request;->body()Lokhttp3/RequestBody;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, ""

    return-object p0

    .line 195
    :cond_0
    invoke-virtual {p0, v0}, Lokhttp3/RequestBody;->writeTo(Lokio/BufferedSink;)V

    .line 196
    invoke-virtual {v0}, Lokio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/ihsanbal/logging/Printer;->getJsonString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{\"err\": \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\"}"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static dotHeaders(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 148
    sget-object v0, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    array-length v1, p0

    const-string v2, "\n"

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-le v1, v4, :cond_2

    .line 152
    :goto_0
    array-length v1, p0

    if-ge v3, v1, :cond_3

    if-nez v3, :cond_0

    const-string v1, "\u250c "

    goto :goto_1

    .line 155
    :cond_0
    array-length v1, p0

    sub-int/2addr v1, v4

    if-ne v3, v1, :cond_1

    const-string v1, "\u2514 "

    goto :goto_1

    :cond_1
    const-string v1, "\u251c "

    .line 160
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v1, p0, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 163
    :cond_2
    array-length v1, p0

    :goto_2
    if-ge v3, v1, :cond_3

    aget-object v4, p0, v3

    const-string v5, "\u2500 "

    .line 164
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 167
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static getJsonString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    :try_start_0
    const-string v0, "{"

    .line 205
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x3

    if-eqz v0, :cond_0

    .line 206
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 207
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string v0, "["

    .line 208
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 209
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 210
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 217
    :catch_0
    sget-object p0, Lcom/ihsanbal/logging/Printer;->OOM_OMITTED:Ljava/lang/String;

    :catch_1
    :cond_1
    :goto_0
    return-object p0
.end method

.method private static getRequest(Lokhttp3/Request;Lcom/ihsanbal/logging/Level;)[Ljava/lang/String;
    .locals 3

    .line 120
    invoke-virtual {p0}, Lokhttp3/Request;->headers()Lokhttp3/Headers;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Headers;->toString()Ljava/lang/String;

    move-result-object v0

    .line 121
    sget-object v1, Lcom/ihsanbal/logging/Level;->HEADERS:Lcom/ihsanbal/logging/Level;

    if-eq p1, v1, :cond_1

    sget-object v1, Lcom/ihsanbal/logging/Level;->BASIC:Lcom/ihsanbal/logging/Level;

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 122
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Method: @"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lokhttp3/Request;->method()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Lcom/ihsanbal/logging/Printer;->DOUBLE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    invoke-static {v0}, Lcom/ihsanbal/logging/Printer;->isEmpty(Ljava/lang/String;)Z

    move-result p0

    const-string v2, ""

    if-eqz p0, :cond_2

    goto :goto_2

    :cond_2
    if-eqz p1, :cond_3

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Headers:"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/ihsanbal/logging/Printer;->dotHeaders(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_3
    :goto_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 124
    sget-object p1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getResponse(Ljava/lang/String;JIZLcom/ihsanbal/logging/Level;Ljava/util/List;Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "JIZ",
            "Lcom/ihsanbal/logging/Level;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 130
    sget-object v0, Lcom/ihsanbal/logging/Level;->HEADERS:Lcom/ihsanbal/logging/Level;

    if-eq p5, v0, :cond_1

    sget-object v0, Lcom/ihsanbal/logging/Level;->BASIC:Lcom/ihsanbal/logging/Level;

    if-ne p5, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p5, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p5, 0x1

    .line 131
    :goto_1
    invoke-static {p6}, Lcom/ihsanbal/logging/Printer;->slashSegments(Ljava/util/List;)Ljava/lang/String;

    move-result-object p6

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p6}, Lcom/ihsanbal/logging/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, " - "

    const-string v3, ""

    if-nez v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p6

    goto :goto_2

    :cond_2
    move-object p6, v3

    :goto_2
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p6, "is success : "

    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "Received in: "

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, "ms"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Lcom/ihsanbal/logging/Printer;->DOUBLE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "Status Code: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " / "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p1, Lcom/ihsanbal/logging/Printer;->DOUBLE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    invoke-static {p0}, Lcom/ihsanbal/logging/Printer;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_3

    :cond_3
    if-eqz p5, :cond_4

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Headers:"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    invoke-static {p0}, Lcom/ihsanbal/logging/Printer;->dotHeaders(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_4
    :goto_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 136
    sget-object p1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static isEmpty(Ljava/lang/String;)Z
    .locals 1

    .line 50
    invoke-static {p0}, Lcom/ihsanbal/logging/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\n"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\t"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/ihsanbal/logging/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V
    .locals 15

    move v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    .line 172
    array-length v4, v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v4, :cond_4

    aget-object v7, v2, v6

    .line 173
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz p4, :cond_0

    const/16 v9, 0x6e

    goto :goto_1

    :cond_0
    move v9, v8

    :goto_1
    const/4 v10, 0x0

    .line 175
    :goto_2
    div-int v11, v8, v9

    if-gt v10, v11, :cond_3

    mul-int v11, v10, v9

    add-int/lit8 v10, v10, 0x1

    mul-int v12, v10, v9

    .line 178
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v13

    if-le v12, v13, :cond_1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v12

    :cond_1
    if-nez v3, :cond_2

    .line 180
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "\u2502 "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    move/from16 v13, p5

    invoke-static {p0, v1, v11, v13}, Lcom/ihsanbal/logging/I;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    goto :goto_2

    :cond_2
    move/from16 v13, p5

    .line 182
    invoke-virtual {v7, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v3, p0, v1, v11}, Lcom/ihsanbal/logging/Logger;->log(ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    move/from16 v13, p5

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method static printFileRequest(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)V
    .locals 8

    const/4 v0, 0x1

    .line 92
    invoke-virtual {p0, v0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getTag(Z)Ljava/lang/String;

    move-result-object v7

    .line 93
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v1

    if-nez v1, :cond_0

    .line 94
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v2

    const-string v3, "\u250c\u2500\u2500\u2500\u2500\u2500\u2500 Request \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-static {v1, v7, v3, v2}, Lcom/ihsanbal/logging/I;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 95
    :cond_0
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v1

    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "URL: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v0

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v4

    const/4 v5, 0x0

    .line 96
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v6

    move-object v2, v7

    .line 95
    invoke-static/range {v1 .. v6}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 97
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ihsanbal/logging/Printer;->getRequest(Lokhttp3/Request;Lcom/ihsanbal/logging/Level;)[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v4

    const/4 v5, 0x1

    .line 98
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v6

    .line 97
    invoke-static/range {v1 .. v6}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 99
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object p1

    sget-object v0, Lcom/ihsanbal/logging/Level;->BASIC:Lcom/ihsanbal/logging/Level;

    if-eq p1, v0, :cond_1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object p1

    sget-object v0, Lcom/ihsanbal/logging/Level;->BODY:Lcom/ihsanbal/logging/Level;

    if-ne p1, v0, :cond_2

    .line 100
    :cond_1
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v1

    sget-object v3, Lcom/ihsanbal/logging/Printer;->OMITTED_REQUEST:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v6

    move-object v2, v7

    invoke-static/range {v1 .. v6}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 102
    :cond_2
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object p1

    if-nez p1, :cond_3

    .line 103
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result p1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result p0

    const-string v0, "\u2514\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-static {p1, v7, v0, p0}, Lcom/ihsanbal/logging/I;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    :cond_3
    return-void
.end method

.method static printFileResponse(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ihsanbal/logging/LoggingInterceptor$Builder;",
            "JZI",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    move-object v1, p0

    .line 108
    invoke-virtual {p0, v0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getTag(Z)Ljava/lang/String;

    move-result-object v0

    .line 109
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v2

    if-nez v2, :cond_0

    .line 110
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v2

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v3

    const-string v4, "\u250c\u2500\u2500\u2500\u2500\u2500\u2500 Response \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-static {v2, v0, v4, v3}, Lcom/ihsanbal/logging/I;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 111
    :cond_0
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v2

    .line 112
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object v8

    move-object/from16 v3, p5

    move-wide v4, p1

    move v6, p4

    move v7, p3

    move-object/from16 v9, p6

    move-object/from16 v10, p7

    .line 111
    invoke-static/range {v3 .. v10}, Lcom/ihsanbal/logging/Printer;->getResponse(Ljava/lang/String;JIZLcom/ihsanbal/logging/Level;Ljava/util/List;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 112
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v6

    move p1, v2

    move-object p2, v0

    move-object p3, v3

    move-object p4, v4

    move/from16 p5, v5

    move/from16 p6, v6

    .line 111
    invoke-static/range {p1 .. p6}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 113
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v2

    sget-object v3, Lcom/ihsanbal/logging/Printer;->OMITTED_RESPONSE:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v4

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v6

    move p1, v2

    move-object p3, v3

    move-object p4, v4

    move/from16 p6, v6

    invoke-static/range {p1 .. p6}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 114
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v2

    if-nez v2, :cond_1

    .line 115
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v2

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v1

    const-string v3, "\u2514\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-static {v2, v0, v3, v1}, Lcom/ihsanbal/logging/I;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    :cond_1
    return-void
.end method

.method static printJsonRequest(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;Lokhttp3/Request;)V
    .locals 9

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Body:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/ihsanbal/logging/Printer;->bodyToString(Lokhttp3/Request;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    .line 55
    invoke-virtual {p0, v1}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getTag(Z)Ljava/lang/String;

    move-result-object v8

    .line 56
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v2

    if-nez v2, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v2

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v3

    const-string v4, "\u250c\u2500\u2500\u2500\u2500\u2500\u2500 Request \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-static {v2, v8, v4, v3}, Lcom/ihsanbal/logging/I;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 58
    :cond_0
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v2

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "URL: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lokhttp3/Request;->url()Lokhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v4, v1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v7

    move-object v3, v8

    invoke-static/range {v2 .. v7}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 59
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v2

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/ihsanbal/logging/Printer;->getRequest(Lokhttp3/Request;Lcom/ihsanbal/logging/Level;)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v7

    invoke-static/range {v2 .. v7}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 60
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object p1

    sget-object v1, Lcom/ihsanbal/logging/Level;->BASIC:Lcom/ihsanbal/logging/Level;

    if-eq p1, v1, :cond_1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object p1

    sget-object v1, Lcom/ihsanbal/logging/Level;->BODY:Lcom/ihsanbal/logging/Level;

    if-ne p1, v1, :cond_2

    .line 61
    :cond_1
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v2

    sget-object p1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v7

    move-object v3, v8

    invoke-static/range {v2 .. v7}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 63
    :cond_2
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object p1

    if-nez p1, :cond_3

    .line 64
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result p1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result p0

    const-string v0, "\u2514\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-static {p1, v8, v0, p0}, Lcom/ihsanbal/logging/I;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    :cond_3
    return-void
.end method

.method static printJsonResponse(Lcom/ihsanbal/logging/LoggingInterceptor$Builder;JZILjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ihsanbal/logging/LoggingInterceptor$Builder;",
            "JZI",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Body:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static/range {p6 .. p6}, Lcom/ihsanbal/logging/Printer;->getJsonString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, p0

    .line 70
    invoke-virtual {p0, v1}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getTag(Z)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    .line 71
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "URL: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v6, p9

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    const/4 v1, 0x1

    const-string v5, "\n"

    aput-object v5, v4, v1

    .line 73
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object v11

    move-object/from16 v6, p5

    move-wide v7, p1

    move/from16 v9, p4

    move/from16 v10, p3

    move-object/from16 v12, p7

    move-object/from16 v13, p8

    .line 72
    invoke-static/range {v6 .. v13}, Lcom/ihsanbal/logging/Printer;->getResponse(Ljava/lang/String;JIZLcom/ihsanbal/logging/Level;Ljava/util/List;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 75
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v5

    if-nez v5, :cond_0

    .line 76
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v5

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v6

    const-string v7, "\u250c\u2500\u2500\u2500\u2500\u2500\u2500 Response \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-static {v5, v3, v7, v6}, Lcom/ihsanbal/logging/I;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    .line 79
    :cond_0
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v5

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v8

    move p1, v5

    move-object/from16 p2, v3

    move-object/from16 p3, v4

    move-object/from16 p4, v6

    move/from16 p5, v7

    move/from16 p6, v8

    invoke-static/range {p1 .. p6}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 80
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v4

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v7

    move p1, v4

    move-object/from16 p3, v1

    move-object/from16 p4, v5

    move/from16 p5, v6

    move/from16 p6, v7

    invoke-static/range {p1 .. p6}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 82
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object v1

    sget-object v4, Lcom/ihsanbal/logging/Level;->BASIC:Lcom/ihsanbal/logging/Level;

    if-eq v1, v4, :cond_1

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLevel()Lcom/ihsanbal/logging/Level;

    move-result-object v1

    sget-object v4, Lcom/ihsanbal/logging/Level;->BODY:Lcom/ihsanbal/logging/Level;

    if-ne v1, v4, :cond_2

    .line 83
    :cond_1
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v1

    sget-object v4, Lcom/ihsanbal/logging/Printer;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v4

    const/4 v5, 0x1

    .line 84
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v6

    move p1, v1

    move-object/from16 p2, v3

    move-object/from16 p3, v0

    move-object/from16 p4, v4

    move/from16 p5, v5

    move/from16 p6, v6

    .line 83
    invoke-static/range {p1 .. p6}, Lcom/ihsanbal/logging/Printer;->logLines(ILjava/lang/String;[Ljava/lang/String;Lcom/ihsanbal/logging/Logger;ZZ)V

    .line 86
    :cond_2
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getLogger()Lcom/ihsanbal/logging/Logger;

    move-result-object v0

    if-nez v0, :cond_3

    .line 87
    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->getType()I

    move-result v0

    invoke-virtual {p0}, Lcom/ihsanbal/logging/LoggingInterceptor$Builder;->isLogHackEnable()Z

    move-result v1

    const-string v2, "\u2514\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500"

    invoke-static {v0, v3, v2, v1}, Lcom/ihsanbal/logging/I;->log(ILjava/lang/String;Ljava/lang/String;Z)V

    :cond_3
    return-void
.end method

.method private static slashSegments(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "/"

    .line 142
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 144
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
