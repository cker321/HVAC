.class final Lcom/dnake/desktop/bean/ReturnData$1;
.super Ljava/lang/Object;
.source "ReturnData.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/bean/ReturnData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/dnake/desktop/bean/ReturnData;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/dnake/desktop/bean/ReturnData;
    .locals 1

    .line 59
    new-instance v0, Lcom/dnake/desktop/bean/ReturnData;

    invoke-direct {v0, p1}, Lcom/dnake/desktop/bean/ReturnData;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 56
    invoke-virtual {p0, p1}, Lcom/dnake/desktop/bean/ReturnData$1;->createFromParcel(Landroid/os/Parcel;)Lcom/dnake/desktop/bean/ReturnData;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/dnake/desktop/bean/ReturnData;
    .locals 0

    .line 64
    new-array p1, p1, [Lcom/dnake/desktop/bean/ReturnData;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 56
    invoke-virtual {p0, p1}, Lcom/dnake/desktop/bean/ReturnData$1;->newArray(I)[Lcom/dnake/desktop/bean/ReturnData;

    move-result-object p1

    return-object p1
.end method
