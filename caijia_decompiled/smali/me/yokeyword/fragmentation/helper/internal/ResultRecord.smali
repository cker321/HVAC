.class public final Lme/yokeyword/fragmentation/helper/internal/ResultRecord;
.super Ljava/lang/Object;
.source "ResultRecord.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lme/yokeyword/fragmentation/helper/internal/ResultRecord;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public requestCode:I

.field public resultBundle:Landroid/os/Bundle;

.field public resultCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord$1;

    invoke-direct {v0}, Lme/yokeyword/fragmentation/helper/internal/ResultRecord$1;-><init>()V

    sput-object v0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->resultCode:I

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->resultCode:I

    .line 21
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->requestCode:I

    .line 22
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->resultCode:I

    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object p1

    iput-object p1, p0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->resultBundle:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 45
    iget p2, p0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->requestCode:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 46
    iget p2, p0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->resultCode:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 47
    iget-object p2, p0, Lme/yokeyword/fragmentation/helper/internal/ResultRecord;->resultBundle:Landroid/os/Bundle;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    return-void
.end method
