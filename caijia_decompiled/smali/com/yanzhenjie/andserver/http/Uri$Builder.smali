.class public Lcom/yanzhenjie/andserver/http/Uri$Builder;
.super Ljava/lang/Object;
.source "Uri.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yanzhenjie/andserver/http/Uri;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mFragment:Ljava/lang/String;

.field private mHost:Ljava/lang/String;

.field private mPath:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mPort:I

.field private mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mScheme:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p1

    .line 211
    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mScheme:Ljava/lang/String;

    .line 212
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mHost:Ljava/lang/String;

    .line 213
    invoke-virtual {p1}, Ljava/net/URI;->getPort()I

    move-result v0

    iput v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mPort:I

    .line 214
    invoke-virtual {p1}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/http/Uri;->access$700(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mPath:Ljava/util/List;

    .line 215
    invoke-virtual {p1}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/yanzhenjie/andserver/http/Uri;->access$800(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object v0

    iput-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    .line 216
    invoke-virtual {p1}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mFragment:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/yanzhenjie/andserver/http/Uri$1;)V
    .locals 0

    .line 199
    invoke-direct {p0, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Ljava/lang/String;
    .locals 0

    .line 199
    iget-object p0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mScheme:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Ljava/lang/String;
    .locals 0

    .line 199
    iget-object p0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mHost:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/yanzhenjie/andserver/http/Uri$Builder;)I
    .locals 0

    .line 199
    iget p0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mPort:I

    return p0
.end method

.method static synthetic access$400(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Ljava/util/List;
    .locals 0

    .line 199
    iget-object p0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mPath:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$500(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Lcom/yanzhenjie/andserver/util/MultiValueMap;
    .locals 0

    .line 199
    iget-object p0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    return-object p0
.end method

.method static synthetic access$600(Lcom/yanzhenjie/andserver/http/Uri$Builder;)Ljava/lang/String;
    .locals 0

    .line 199
    iget-object p0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mFragment:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public addPath(C)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 247
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addPath(D)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 251
    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addPath(F)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 255
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addPath(I)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 235
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addPath(J)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 239
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addPath(Ljava/lang/CharSequence;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 1

    .line 259
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mPath:Ljava/util/List;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 1

    .line 264
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mPath:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addPath(Z)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 243
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addQuery(Ljava/lang/String;C)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 291
    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addQuery(Ljava/lang/String;D)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 295
    invoke-static {p2, p3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addQuery(Ljava/lang/String;F)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 299
    invoke-static {p2}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addQuery(Ljava/lang/String;I)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 279
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addQuery(Ljava/lang/String;J)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 283
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addQuery(Ljava/lang/String;Ljava/lang/CharSequence;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 1

    .line 307
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0
.end method

.method public addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 1

    .line 312
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1, p2}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0
.end method

.method public addQuery(Ljava/lang/String;Ljava/util/List;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/yanzhenjie/andserver/http/Uri$Builder;"
        }
    .end annotation

    .line 317
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 318
    iget-object v1, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v1, p1, v0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public addQuery(Ljava/lang/String;S)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 303
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addQuery(Ljava/lang/String;Z)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 287
    invoke-static {p2}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/yanzhenjie/andserver/http/Uri$Builder;->addQuery(Ljava/lang/String;Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;

    move-result-object p1

    return-object p1
.end method

.method public build()Lcom/yanzhenjie/andserver/http/Uri;
    .locals 2

    .line 349
    new-instance v0, Lcom/yanzhenjie/andserver/http/Uri;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/yanzhenjie/andserver/http/Uri;-><init>(Lcom/yanzhenjie/andserver/http/Uri$Builder;Lcom/yanzhenjie/andserver/http/Uri$1;)V

    return-object v0
.end method

.method public clearPath()Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 1

    .line 274
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mPath:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-object p0
.end method

.method public clearQuery()Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 1

    .line 339
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->clear()V

    return-object p0
.end method

.method public removeQuery(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 1

    .line 334
    iget-object v0, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    invoke-interface {v0, p1}, Lcom/yanzhenjie/andserver/util/MultiValueMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public setFragment(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 344
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mFragment:Ljava/lang/String;

    return-object p0
.end method

.method public setHost(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 225
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mHost:Ljava/lang/String;

    return-object p0
.end method

.method public setPath(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 269
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri;->access$700(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mPath:Ljava/util/List;

    return-object p0
.end method

.method public setPort(I)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 230
    iput p1, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mPort:I

    return-object p0
.end method

.method public setQuery(Lcom/yanzhenjie/andserver/util/MultiValueMap;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/yanzhenjie/andserver/util/MultiValueMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/yanzhenjie/andserver/http/Uri$Builder;"
        }
    .end annotation

    .line 329
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    return-object p0
.end method

.method public setQuery(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 324
    invoke-static {p1}, Lcom/yanzhenjie/andserver/http/Uri;->access$800(Ljava/lang/String;)Lcom/yanzhenjie/andserver/util/MultiValueMap;

    move-result-object p1

    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mQuery:Lcom/yanzhenjie/andserver/util/MultiValueMap;

    return-object p0
.end method

.method public setScheme(Ljava/lang/String;)Lcom/yanzhenjie/andserver/http/Uri$Builder;
    .locals 0

    .line 220
    iput-object p1, p0, Lcom/yanzhenjie/andserver/http/Uri$Builder;->mScheme:Ljava/lang/String;

    return-object p0
.end method
