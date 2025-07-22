.class public Lme/yokeyword/fragmentation/anim/DefaultNoAnimator;
.super Lme/yokeyword/fragmentation/anim/FragmentAnimator;
.source "DefaultNoAnimator.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lme/yokeyword/fragmentation/anim/DefaultNoAnimator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    new-instance v0, Lme/yokeyword/fragmentation/anim/DefaultNoAnimator$1;

    invoke-direct {v0}, Lme/yokeyword/fragmentation/anim/DefaultNoAnimator$1;-><init>()V

    sput-object v0, Lme/yokeyword/fragmentation/anim/DefaultNoAnimator;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;-><init>()V

    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lme/yokeyword/fragmentation/anim/DefaultNoAnimator;->enter:I

    .line 13
    iput v0, p0, Lme/yokeyword/fragmentation/anim/DefaultNoAnimator;->exit:I

    .line 14
    iput v0, p0, Lme/yokeyword/fragmentation/anim/DefaultNoAnimator;->popEnter:I

    .line 15
    iput v0, p0, Lme/yokeyword/fragmentation/anim/DefaultNoAnimator;->popExit:I

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;-><init>(Landroid/os/Parcel;)V

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

    .line 24
    invoke-super {p0, p1, p2}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
