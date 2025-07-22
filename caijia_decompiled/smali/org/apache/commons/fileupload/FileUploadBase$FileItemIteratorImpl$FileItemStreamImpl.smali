.class Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;
.super Ljava/lang/Object;
.source "FileUploadBase.java"

# interfaces
.implements Lorg/apache/commons/fileupload/FileItemStream;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FileItemStreamImpl"
.end annotation


# instance fields
.field private final contentType:Ljava/lang/String;

.field private final fieldName:Ljava/lang/String;

.field private final formField:Z

.field private headers:Lorg/apache/commons/fileupload/FileItemHeaders;

.field private final name:Ljava/lang/String;

.field private opened:Z

.field private final stream:Ljava/io/InputStream;

.field final synthetic this$1:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;


# direct methods
.method constructor <init>(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object v7, p0

    move-object v5, p1

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    .line 722
    iput-object v5, v7, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->this$1:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 723
    iput-object v0, v7, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->name:Ljava/lang/String;

    .line 724
    iput-object v1, v7, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->fieldName:Ljava/lang/String;

    move-object/from16 v2, p4

    .line 725
    iput-object v2, v7, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->contentType:Ljava/lang/String;

    move/from16 v2, p5

    .line 726
    iput-boolean v2, v7, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->formField:Z

    .line 727
    iget-object v2, v5, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;->this$0:Lorg/apache/commons/fileupload/FileUploadBase;

    invoke-static {v2}, Lorg/apache/commons/fileupload/FileUploadBase;->access$100(Lorg/apache/commons/fileupload/FileUploadBase;)J

    move-result-wide v2

    const-wide/16 v8, -0x1

    cmp-long v4, v2, v8

    if-eqz v4, :cond_1

    cmp-long v2, p6, v8

    if-eqz v2, :cond_1

    .line 728
    iget-object v2, v5, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;->this$0:Lorg/apache/commons/fileupload/FileUploadBase;

    .line 729
    invoke-static {v2}, Lorg/apache/commons/fileupload/FileUploadBase;->access$100(Lorg/apache/commons/fileupload/FileUploadBase;)J

    move-result-wide v2

    cmp-long v4, p6, v2

    if-gtz v4, :cond_0

    goto :goto_0

    .line 730
    :cond_0
    new-instance v2, Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v6, v7, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->fieldName:Ljava/lang/String;

    aput-object v6, v3, v4

    const/4 v4, 0x1

    iget-object v6, v5, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;->this$0:Lorg/apache/commons/fileupload/FileUploadBase;

    .line 733
    invoke-static {v6}, Lorg/apache/commons/fileupload/FileUploadBase;->access$100(Lorg/apache/commons/fileupload/FileUploadBase;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v3, v4

    const-string v4, "The field %s exceeds its maximum permitted size of %s bytes."

    .line 732
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    iget-object v3, v5, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;->this$0:Lorg/apache/commons/fileupload/FileUploadBase;

    .line 734
    invoke-static {v3}, Lorg/apache/commons/fileupload/FileUploadBase;->access$100(Lorg/apache/commons/fileupload/FileUploadBase;)J

    move-result-wide v12

    move-object v8, v2

    move-wide/from16 v10, p6

    invoke-direct/range {v8 .. v13}, Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException;-><init>(Ljava/lang/String;JJ)V

    .line 735
    invoke-virtual {v2, v0}, Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException;->setFileName(Ljava/lang/String;)V

    .line 736
    invoke-virtual {v2, v1}, Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException;->setFieldName(Ljava/lang/String;)V

    .line 737
    new-instance v0, Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;

    invoke-direct {v0, v2}, Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;-><init>(Lorg/apache/commons/fileupload/FileUploadException;)V

    throw v0

    .line 741
    :cond_1
    :goto_0
    invoke-static {p1}, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;->access$200(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;)Lorg/apache/commons/fileupload/MultipartStream;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/fileupload/MultipartStream;->newInputStream()Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;

    move-result-object v6

    .line 743
    iget-object v0, v5, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;->this$0:Lorg/apache/commons/fileupload/FileUploadBase;

    invoke-static {v0}, Lorg/apache/commons/fileupload/FileUploadBase;->access$100(Lorg/apache/commons/fileupload/FileUploadBase;)J

    move-result-wide v0

    cmp-long v2, v0, v8

    if-eqz v2, :cond_2

    .line 744
    new-instance v8, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;

    iget-object v0, v5, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;->this$0:Lorg/apache/commons/fileupload/FileUploadBase;

    invoke-static {v0}, Lorg/apache/commons/fileupload/FileUploadBase;->access$100(Lorg/apache/commons/fileupload/FileUploadBase;)J

    move-result-wide v3

    move-object v0, v8

    move-object v1, p0

    move-object v2, v6

    move-object v5, p1

    invoke-direct/range {v0 .. v6}, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;-><init>(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;Ljava/io/InputStream;JLorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;)V

    move-object v6, v8

    .line 760
    :cond_2
    iput-object v6, v7, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->stream:Ljava/io/InputStream;

    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;)Ljava/lang/String;
    .locals 0

    .line 673
    iget-object p0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->name:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;)Ljava/lang/String;
    .locals 0

    .line 673
    iget-object p0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->fieldName:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 833
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->stream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    return-void
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .line 770
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public getFieldName()Ljava/lang/String;
    .locals 1

    .line 780
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->fieldName:Ljava/lang/String;

    return-object v0
.end method

.method public getHeaders()Lorg/apache/commons/fileupload/FileItemHeaders;
    .locals 1

    .line 843
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->headers:Lorg/apache/commons/fileupload/FileItemHeaders;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 794
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->name:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/fileupload/util/Streams;->checkFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isFormField()Z
    .locals 1

    .line 805
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->formField:Z

    return v0
.end method

.method public openStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 817
    iget-boolean v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->opened:Z

    if-nez v0, :cond_1

    .line 821
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->stream:Ljava/io/InputStream;

    check-cast v0, Lorg/apache/commons/fileupload/util/Closeable;

    invoke-interface {v0}, Lorg/apache/commons/fileupload/util/Closeable;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 824
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->stream:Ljava/io/InputStream;

    return-object v0

    .line 822
    :cond_0
    new-instance v0, Lorg/apache/commons/fileupload/FileItemStream$ItemSkippedException;

    invoke-direct {v0}, Lorg/apache/commons/fileupload/FileItemStream$ItemSkippedException;-><init>()V

    throw v0

    .line 818
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The stream was already opened."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setHeaders(Lorg/apache/commons/fileupload/FileItemHeaders;)V
    .locals 0

    .line 853
    iput-object p1, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->headers:Lorg/apache/commons/fileupload/FileItemHeaders;

    return-void
.end method
