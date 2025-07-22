.class Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;
.super Lorg/apache/commons/fileupload/util/LimitedInputStream;
.source "FileUploadBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;-><init>(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;

.field final synthetic val$itemStream:Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;

.field final synthetic val$this$1:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;


# direct methods
.method constructor <init>(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;Ljava/io/InputStream;JLorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;)V
    .locals 0

    .line 744
    iput-object p1, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;->this$2:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;

    iput-object p5, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;->val$this$1:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;

    iput-object p6, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;->val$itemStream:Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;

    invoke-direct {p0, p2, p3, p4}, Lorg/apache/commons/fileupload/util/LimitedInputStream;-><init>(Ljava/io/InputStream;J)V

    return-void
.end method


# virtual methods
.method protected raiseError(JJ)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 748
    iget-object v0, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;->val$itemStream:Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/commons/fileupload/MultipartStream$ItemInputStream;->close(Z)V

    .line 749
    new-instance v0, Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;->this$2:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;

    .line 752
    invoke-static {v3}, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->access$300(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v1

    const-string v1, "The field %s exceeds its maximum permitted size of %s bytes."

    .line 751
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    move-object v2, v0

    move-wide v4, p3

    move-wide v6, p1

    invoke-direct/range {v2 .. v7}, Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException;-><init>(Ljava/lang/String;JJ)V

    .line 754
    iget-object p1, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;->this$2:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;

    invoke-static {p1}, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->access$300(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException;->setFieldName(Ljava/lang/String;)V

    .line 755
    iget-object p1, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl$1;->this$2:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;

    invoke-static {p1}, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;->access$000(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$FileItemStreamImpl;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/commons/fileupload/FileUploadBase$FileSizeLimitExceededException;->setFileName(Ljava/lang/String;)V

    .line 756
    new-instance p1, Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;

    invoke-direct {p1, v0}, Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;-><init>(Lorg/apache/commons/fileupload/FileUploadException;)V

    throw p1
.end method
