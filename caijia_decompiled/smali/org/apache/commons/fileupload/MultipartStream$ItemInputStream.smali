.class public Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;
.super Ljava/io/InputStream;
.source "MultipartStream.java"

# interfaces
.implements Lorg/apache/commons/fileupload/util/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/fileupload/MultipartStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ItemInputStream"
.end annotation


# static fields
.field private static final BYTE_POSITIVE_OFFSET:I = 0x100


# instance fields
.field private closed:Z

.field private pad:I

.field private pos:I

.field final synthetic this$0:Lorg/apache/commons/fileupload/MultipartStream;

.field private total:J


# direct methods
.method constructor <init>(Lorg/apache/commons/fileupload/MultipartStream;)V
    .locals 0

    .line 840
    iput-object p1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 841
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->findSeparator()V

    return-void
.end method

.method private findSeparator()V
    .locals 2

    .line 848
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-virtual {v0}, Lorg/apache/commons/fileupload/MultipartStream;->findSeparator()I

    move-result v0

    iput v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pos:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 850
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$000(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v0

    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$100(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$200(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v1

    if-le v0, v1, :cond_0

    .line 851
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$200(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pad:I

    goto :goto_0

    .line 853
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$000(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v0

    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$100(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pad:I

    :cond_1
    :goto_0
    return-void
.end method

.method private makeAvailable()I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1014
    iget v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pos:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    return v1

    .line 1019
    :cond_0
    iget-wide v3, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->total:J

    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$000(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v0

    iget-object v5, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v5}, Lorg/apache/commons/fileupload/MultipartStream;->access$100(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v5

    sub-int/2addr v0, v5

    iget v5, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pad:I

    sub-int/2addr v0, v5

    int-to-long v5, v0

    add-long/2addr v3, v5

    iput-wide v3, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->total:J

    .line 1020
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$300(Lorg/apache/commons/fileupload/MultipartStream;)[B

    move-result-object v0

    iget-object v3, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v3}, Lorg/apache/commons/fileupload/MultipartStream;->access$000(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v3

    iget v4, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pad:I

    sub-int/2addr v3, v4

    iget-object v4, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v4}, Lorg/apache/commons/fileupload/MultipartStream;->access$300(Lorg/apache/commons/fileupload/MultipartStream;)[B

    move-result-object v4

    iget v5, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pad:I

    invoke-static {v0, v3, v4, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1023
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0, v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$102(Lorg/apache/commons/fileupload/MultipartStream;I)I

    .line 1024
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    iget v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pad:I

    invoke-static {v0, v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$002(Lorg/apache/commons/fileupload/MultipartStream;I)I

    .line 1027
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$400(Lorg/apache/commons/fileupload/MultipartStream;)Ljava/io/InputStream;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$300(Lorg/apache/commons/fileupload/MultipartStream;)[B

    move-result-object v1

    iget-object v3, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v3}, Lorg/apache/commons/fileupload/MultipartStream;->access$000(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v3

    iget-object v4, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v4}, Lorg/apache/commons/fileupload/MultipartStream;->access$500(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v4

    iget-object v5, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v5}, Lorg/apache/commons/fileupload/MultipartStream;->access$000(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v0, v1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    if-eq v0, v2, :cond_4

    .line 1035
    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$600(Lorg/apache/commons/fileupload/MultipartStream;)Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1036
    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$600(Lorg/apache/commons/fileupload/MultipartStream;)Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/fileupload/MultipartStream$ProgressNotifier;->noteBytesRead(I)V

    .line 1038
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$000(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v3

    add-int/2addr v3, v0

    invoke-static {v1, v3}, Lorg/apache/commons/fileupload/MultipartStream;->access$002(Lorg/apache/commons/fileupload/MultipartStream;I)I

    .line 1040
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->findSeparator()V

    .line 1041
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->available()I

    move-result v0

    if-gtz v0, :cond_3

    .line 1043
    iget v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pos:I

    if-eq v1, v2, :cond_1

    :cond_3
    return v0

    .line 1033
    :cond_4
    new-instance v0, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;

    const-string v1, "Stream ended unexpectedly"

    invoke-direct {v0, v1}, Lorg/apache/commons/fileupload/MultipartStream$MalformedStreamException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :goto_0
    throw v0

    :goto_1
    goto :goto_0
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 877
    iget v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pos:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 878
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$000(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v0

    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$100(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v1

    sub-int/2addr v0, v1

    iget v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->pad:I

    :goto_0
    sub-int/2addr v0, v1

    return v0

    .line 880
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$100(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v1

    goto :goto_0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 950
    invoke-virtual {p0, v0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->close(Z)V

    return-void
.end method

.method public close(Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 961
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->closed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    if-eqz p1, :cond_1

    .line 965
    iput-boolean v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->closed:Z

    .line 966
    iget-object p1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {p1}, Lorg/apache/commons/fileupload/MultipartStream;->access$400(Lorg/apache/commons/fileupload/MultipartStream;)Ljava/io/InputStream;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    goto :goto_1

    .line 969
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->available()I

    move-result p1

    if-nez p1, :cond_2

    .line 971
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->makeAvailable()I

    move-result p1

    if-nez p1, :cond_2

    .line 979
    :goto_1
    iput-boolean v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->closed:Z

    return-void

    :cond_2
    int-to-long v1, p1

    .line 976
    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->skip(J)J

    goto :goto_0
.end method

.method public getBytesRead()J
    .locals 2

    .line 865
    iget-wide v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->total:J

    return-wide v0
.end method

.method public isClosed()Z
    .locals 1

    .line 1056
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->closed:Z

    return v0
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 897
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->closed:Z

    if-nez v0, :cond_2

    .line 900
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->available()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->makeAvailable()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    .line 903
    :cond_0
    iget-wide v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->total:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->total:J

    .line 904
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$300(Lorg/apache/commons/fileupload/MultipartStream;)[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$108(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v1

    aget-byte v0, v0, v1

    if-ltz v0, :cond_1

    return v0

    :cond_1
    add-int/lit16 v0, v0, 0x100

    return v0

    .line 898
    :cond_2
    new-instance v0, Lorg/apache/commons/fileupload/FileItemStream$ItemSkippedException;

    invoke-direct {v0}, Lorg/apache/commons/fileupload/FileItemStream$ItemSkippedException;-><init>()V

    throw v0
.end method

.method public read([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 923
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->closed:Z

    if-nez v0, :cond_2

    if-nez p3, :cond_0

    const/4 p1, 0x0

    return p1

    .line 929
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->available()I

    move-result v0

    if-nez v0, :cond_1

    .line 931
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->makeAvailable()I

    move-result v0

    if-nez v0, :cond_1

    const/4 p1, -0x1

    return p1

    .line 936
    :cond_1
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 937
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$300(Lorg/apache/commons/fileupload/MultipartStream;)[B

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v1}, Lorg/apache/commons/fileupload/MultipartStream;->access$100(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v1

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 938
    iget-object p1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {p1}, Lorg/apache/commons/fileupload/MultipartStream;->access$100(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result p2

    add-int/2addr p2, p3

    invoke-static {p1, p2}, Lorg/apache/commons/fileupload/MultipartStream;->access$102(Lorg/apache/commons/fileupload/MultipartStream;I)I

    .line 939
    iget-wide p1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->total:J

    int-to-long v0, p3

    add-long/2addr p1, v0

    iput-wide p1, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->total:J

    return p3

    .line 924
    :cond_2
    new-instance p1, Lorg/apache/commons/fileupload/FileItemStream$ItemSkippedException;

    invoke-direct {p1}, Lorg/apache/commons/fileupload/FileItemStream$ItemSkippedException;-><init>()V

    throw p1
.end method

.method public skip(J)J
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 992
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->closed:Z

    if-nez v0, :cond_1

    .line 995
    invoke-virtual {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->available()I

    move-result v0

    if-nez v0, :cond_0

    .line 997
    invoke-direct {p0}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->makeAvailable()I

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 p1, 0x0

    return-wide p1

    :cond_0
    int-to-long v0, v0

    .line 1002
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    .line 1003
    iget-object v0, p0, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->this$0:Lorg/apache/commons/fileupload/MultipartStream;

    invoke-static {v0}, Lorg/apache/commons/fileupload/MultipartStream;->access$100(Lorg/apache/commons/fileupload/MultipartStream;)I

    move-result v1

    int-to-long v1, v1

    add-long/2addr v1, p1

    long-to-int v2, v1

    invoke-static {v0, v2}, Lorg/apache/commons/fileupload/MultipartStream;->access$102(Lorg/apache/commons/fileupload/MultipartStream;I)I

    return-wide p1

    .line 993
    :cond_1
    new-instance p1, Lorg/apache/commons/fileupload/FileItemStream$ItemSkippedException;

    invoke-direct {p1}, Lorg/apache/commons/fileupload/FileItemStream$ItemSkippedException;-><init>()V

    throw p1
.end method
