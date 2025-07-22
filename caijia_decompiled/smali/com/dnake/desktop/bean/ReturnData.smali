.class public Lcom/dnake/desktop/bean/ReturnData;
.super Ljava/lang/Object;
.source "ReturnData.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/dnake/desktop/bean/ReturnData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private data:Ljava/lang/Object;

.field private errorCode:I

.field private errorMsg:Ljava/lang/String;

.field private isSuccess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 56
    new-instance v0, Lcom/dnake/desktop/bean/ReturnData$1;

    invoke-direct {v0}, Lcom/dnake/desktop/bean/ReturnData$1;-><init>()V

    sput-object v0, Lcom/dnake/desktop/bean/ReturnData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/dnake/desktop/bean/ReturnData;->isSuccess:Z

    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/dnake/desktop/bean/ReturnData;->errorCode:I

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/dnake/desktop/bean/ReturnData;->errorMsg:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getData()Ljava/lang/Object;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/dnake/desktop/bean/ReturnData;->data:Ljava/lang/Object;

    return-object v0
.end method

.method public getErrorCode()I
    .locals 1

    .line 77
    iget v0, p0, Lcom/dnake/desktop/bean/ReturnData;->errorCode:I

    return v0
.end method

.method public getErrorMsg()Ljava/lang/String;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/dnake/desktop/bean/ReturnData;->errorMsg:Ljava/lang/String;

    return-object v0
.end method

.method public isSuccess()Z
    .locals 1

    .line 69
    iget-boolean v0, p0, Lcom/dnake/desktop/bean/ReturnData;->isSuccess:Z

    return v0
.end method

.method public setData(Ljava/lang/Object;)V
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/dnake/desktop/bean/ReturnData;->data:Ljava/lang/Object;

    return-void
.end method

.method public setErrorCode(I)V
    .locals 0

    .line 81
    iput p1, p0, Lcom/dnake/desktop/bean/ReturnData;->errorCode:I

    return-void
.end method

.method public setErrorMsg(Ljava/lang/String;)V
    .locals 0

    .line 89
    iput-object p1, p0, Lcom/dnake/desktop/bean/ReturnData;->errorMsg:Ljava/lang/String;

    return-void
.end method

.method public setSuccess(Z)V
    .locals 0

    .line 73
    iput-boolean p1, p0, Lcom/dnake/desktop/bean/ReturnData;->isSuccess:Z

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 46
    iget-boolean p2, p0, Lcom/dnake/desktop/bean/ReturnData;->isSuccess:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 47
    iget p2, p0, Lcom/dnake/desktop/bean/ReturnData;->errorCode:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 48
    iget-object p2, p0, Lcom/dnake/desktop/bean/ReturnData;->errorMsg:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
