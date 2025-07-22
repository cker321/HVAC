.class final Lcom/yanzhenjie/andserver/server/BasicServer$SSLSetup;
.super Ljava/lang/Object;
.source "BasicServer.java"

# interfaces
.implements Lorg/apache/httpcore/impl/bootstrap/SSLServerSetupHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/server/BasicServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SSLSetup"
.end annotation


# instance fields
.field private final mInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;


# direct methods
.method public constructor <init>(Lcom/yanzhenjie/andserver/SSLSocketInitializer;)V
    .locals 0

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    iput-object p1, p0, Lcom/yanzhenjie/andserver/server/BasicServer$SSLSetup;->mInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    return-void
.end method


# virtual methods
.method public initialize(Ljavax/net/ssl/SSLServerSocket;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .line 180
    iget-object v0, p0, Lcom/yanzhenjie/andserver/server/BasicServer$SSLSetup;->mInitializer:Lcom/yanzhenjie/andserver/SSLSocketInitializer;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/SSLSocketInitializer;->onCreated(Ljavax/net/ssl/SSLServerSocket;)V

    return-void
.end method
