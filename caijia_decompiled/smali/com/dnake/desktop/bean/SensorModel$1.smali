.class final Lcom/dnake/desktop/bean/SensorModel$1;
.super Ljava/lang/Object;
.source "SensorModel.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dnake/desktop/bean/SensorModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/dnake/desktop/bean/SensorModel;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/dnake/desktop/bean/SensorModel;
    .locals 2

    .line 161
    new-instance v0, Lcom/dnake/desktop/bean/SensorModel;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/dnake/desktop/bean/SensorModel;-><init>(Landroid/os/Parcel;Lcom/dnake/desktop/bean/SensorModel$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 158
    invoke-virtual {p0, p1}, Lcom/dnake/desktop/bean/SensorModel$1;->createFromParcel(Landroid/os/Parcel;)Lcom/dnake/desktop/bean/SensorModel;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/dnake/desktop/bean/SensorModel;
    .locals 0

    .line 166
    new-array p1, p1, [Lcom/dnake/desktop/bean/SensorModel;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 158
    invoke-virtual {p0, p1}, Lcom/dnake/desktop/bean/SensorModel$1;->newArray(I)[Lcom/dnake/desktop/bean/SensorModel;

    move-result-object p1

    return-object p1
.end method
