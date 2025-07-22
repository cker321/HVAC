.class final Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator$1;
.super Ljava/lang/Object;
.source "DefaultVerticalAnimator.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 34
    invoke-virtual {p0, p1}, Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator$1;->createFromParcel(Landroid/os/Parcel;)Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;

    move-result-object p1

    return-object p1
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;
    .locals 1

    .line 37
    new-instance v0, Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;

    invoke-direct {v0, p1}, Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 34
    invoke-virtual {p0, p1}, Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator$1;->newArray(I)[Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;
    .locals 0

    .line 42
    new-array p1, p1, [Lme/yokeyword/fragmentation/anim/DefaultVerticalAnimator;

    return-object p1
.end method
