.class public final Lorg/apache/httpcore/ssl/PrivateKeyDetails;
.super Ljava/lang/Object;
.source "PrivateKeyDetails.java"


# instance fields
.field private final certChain:[Ljava/security/cert/X509Certificate;

.field private final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[Ljava/security/cert/X509Certificate;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Private key type"

    .line 46
    invoke-static {p1, v0}, Lorg/apache/httpcore/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lorg/apache/httpcore/ssl/PrivateKeyDetails;->type:Ljava/lang/String;

    .line 47
    iput-object p2, p0, Lorg/apache/httpcore/ssl/PrivateKeyDetails;->certChain:[Ljava/security/cert/X509Certificate;

    return-void
.end method


# virtual methods
.method public getCertChain()[Ljava/security/cert/X509Certificate;
    .locals 1

    .line 55
    iget-object v0, p0, Lorg/apache/httpcore/ssl/PrivateKeyDetails;->certChain:[Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lorg/apache/httpcore/ssl/PrivateKeyDetails;->type:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/httpcore/ssl/PrivateKeyDetails;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/httpcore/ssl/PrivateKeyDetails;->certChain:[Ljava/security/cert/X509Certificate;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
