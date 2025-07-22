.class public Lme/yokeyword/fragmentation/anim/FragmentAnimator;
.super Ljava/lang/Object;
.source "FragmentAnimator.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lme/yokeyword/fragmentation/anim/FragmentAnimator;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected enter:I

.field protected exit:I

.field protected popEnter:I

.field protected popExit:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 47
    new-instance v0, Lme/yokeyword/fragmentation/anim/FragmentAnimator$1;

    invoke-direct {v0}, Lme/yokeyword/fragmentation/anim/FragmentAnimator$1;-><init>()V

    sput-object v0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput p1, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->enter:I

    .line 26
    iput p2, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->exit:I

    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput p1, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->enter:I

    .line 31
    iput p2, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->exit:I

    .line 32
    iput p3, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popEnter:I

    .line 33
    iput p4, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popExit:I

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->enter:I

    .line 42
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->exit:I

    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popEnter:I

    .line 44
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popExit:I

    return-void
.end method


# virtual methods
.method public copy()Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 5

    .line 37
    new-instance v0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;

    invoke-virtual {p0}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->getEnter()I

    move-result v1

    invoke-virtual {p0}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->getExit()I

    move-result v2

    invoke-virtual {p0}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->getPopEnter()I

    move-result v3

    invoke-virtual {p0}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->getPopExit()I

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;-><init>(IIII)V

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getEnter()I
    .locals 1

    .line 60
    iget v0, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->enter:I

    return v0
.end method

.method public getExit()I
    .locals 1

    .line 69
    iget v0, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->exit:I

    return v0
.end method

.method public getPopEnter()I
    .locals 1

    .line 81
    iget v0, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popEnter:I

    return v0
.end method

.method public getPopExit()I
    .locals 1

    .line 90
    iget v0, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popExit:I

    return v0
.end method

.method public setEnter(I)Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 0

    .line 64
    iput p1, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->enter:I

    return-object p0
.end method

.method public setExit(I)Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 0

    .line 76
    iput p1, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->exit:I

    return-object p0
.end method

.method public setPopEnter(I)Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 0

    .line 85
    iput p1, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popEnter:I

    return-object p0
.end method

.method public setPopExit(I)Lme/yokeyword/fragmentation/anim/FragmentAnimator;
    .locals 0

    .line 94
    iput p1, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popExit:I

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 105
    iget p2, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->enter:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 106
    iget p2, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->exit:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 107
    iget p2, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popEnter:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 108
    iget p2, p0, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->popExit:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
