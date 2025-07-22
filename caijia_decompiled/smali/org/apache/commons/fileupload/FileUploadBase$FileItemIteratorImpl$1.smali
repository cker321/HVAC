.class Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$1;
.super Lorg/apache/commons/fileupload/util/LimitedInputStream;
.source "FileUploadBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;-><init>(Lorg/apache/commons/fileupload/FileUploadBase;Lorg/apache/commons/fileupload/RequestContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;

.field final synthetic val$this$0:Lorg/apache/commons/fileupload/FileUploadBase;


# direct methods
.method constructor <init>(Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;Ljava/io/InputStream;JLorg/apache/commons/fileupload/FileUploadBase;)V
    .locals 0

    .line 940
    iput-object p1, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$1;->this$1:Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl;

    iput-object p5, p0, Lorg/apache/commons/fileupload/FileUploadBase$FileItemIteratorImpl$1;->val$this$0:Lorg/apache/commons/fileupload/FileUploadBase;

    invoke-direct {p0, p2, p3, p4}, Lorg/apache/commons/fileupload/util/LimitedInputStream;-><init>(Ljava/io/InputStream;J)V

    return-void
.end method


# virtual methods
.method protected raiseError(JJ)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 944
    new-instance v6, Lorg/apache/commons/fileupload/FileUploadBase$SizeLimitExceededException;

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 946
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "the request was rejected because its size (%s) exceeds the configured maximum (%s)"

    .line 945
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    move-object v0, v6

    move-wide v2, p3

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/fileupload/FileUploadBase$SizeLimitExceededException;-><init>(Ljava/lang/String;JJ)V

    .line 948
    new-instance p1, Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;

    invoke-direct {p1, v6}, Lorg/apache/commons/fileupload/FileUploadBase$FileUploadIOException;-><init>(Lorg/apache/commons/fileupload/FileUploadException;)V

    throw p1
.end method
