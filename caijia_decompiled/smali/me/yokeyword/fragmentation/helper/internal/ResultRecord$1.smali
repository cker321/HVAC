.class final Lme/yokeyword/fragmentation/helper/internal/ResultRecord$1;
.super Ljava/lang/Object;
.source "ResultRecord.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/yokeyword/fragmentation/helper/internal/ResultRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lme/yokeyword/fragmentation/helper/internal/ResultRecord;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lme/yokeyword/fragmentation/helper/internal/ResultRecord$1;->createFromParcel(Landroid/os/Parcel;)Lme/yokeyword/fragmentation/helper/internal/ResultRecord;

    move-result-object p1

    return-object p1
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lme/yokeyword/fragmentation/helper/internal/ResultRecord;
    .locals 1

    .line 29
    new-instance v0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;

    invoke-direct {v0, p1}, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lme/yokeyword/fragmentation/helper/internal/ResultRecord$1;->newArray(I)[Lme/yokeyword/fragmentation/helper/internal/ResultRecord;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lme/yokeyword/fragmentation/helper/internal/ResultRecord;
    .locals 0

    .line 34
    new-array p1, p1, [Lme/yokeyword/fragmentation/helper/internal/ResultRecord;

    return-object p1
.end method
