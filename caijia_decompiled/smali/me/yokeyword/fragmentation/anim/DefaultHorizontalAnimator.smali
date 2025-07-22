.class public Lme/yokeyword/fragmentation/anim/DefaultHorizontalAnimator;
.super Lme/yokeyword/fragmentation/anim/FragmentAnimator;
.source "DefaultHorizontalAnimator.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lme/yokeyword/fragmentation/anim/DefaultHorizontalAnimator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Lme/yokeyword/fragmentation/anim/DefaultHorizontalAnimator$1;

    invoke-direct {v0}, Lme/yokeyword/fragmentation/anim/DefaultHorizontalAnimator$1;-><init>()V

    sput-object v0, Lme/yokeyword/fragmentation/anim/DefaultHorizontalAnimator;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 13
    invoke-direct {p0}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;-><init>()V

    .line 14
    sget v0, Lme/yokeyword/fragmentation/R$anim;->h_fragment_enter:I

    iput v0, p0, Lme/yokeyword/fragmentation/anim/DefaultHorizontalAnimator;->enter:I

    .line 15
    sget v0, Lme/yokeyword/fragmentation/R$anim;->h_fragment_exit:I

    iput v0, p0, Lme/yokeyword/fragmentation/anim/DefaultHorizontalAnimator;->exit:I

    .line 16
    sget v0, Lme/yokeyword/fragmentation/R$anim;->h_fragment_pop_enter:I

    iput v0, p0, Lme/yokeyword/fragmentation/anim/DefaultHorizontalAnimator;->popEnter:I

    .line 17
    sget v0, Lme/yokeyword/fragmentation/R$anim;->h_fragment_pop_exit:I

    iput v0, p0, Lme/yokeyword/fragmentation/anim/DefaultHorizontalAnimator;->popExit:I

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 0

    .line 21
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

    .line 26
    invoke-super {p0, p1, p2}, Lme/yokeyword/fragmentation/anim/FragmentAnimator;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
