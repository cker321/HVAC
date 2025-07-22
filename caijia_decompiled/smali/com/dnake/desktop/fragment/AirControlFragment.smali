.class public Lcom/dnake/desktop/fragment/AirControlFragment;
.super Lcom/dnake/desktop/base/BaseFragment;
.source "AirControlFragment.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field private final TYPE_T2:I

.field private final TYPE_T4_1:I

.field private final TYPE_T4_2:I

.field private adapter:Lcom/dnake/desktop/RoomAdapter;

.field private airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

.field colorLevelGood:I
    .annotation runtime Lbutterknife/BindColor;
        value = 0x7f05002c
    .end annotation
.end field

.field count:I

.field private currentTemp:I

.field private currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

.field houseType:[Ljava/lang/String;

.field private initDeviceInfo:Z

.field ivPower:Landroid/widget/ImageView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f08014c
    .end annotation
.end field

.field mFengsuViews:Ljava/util/List;
    .annotation runtime Lbutterknife/BindViews;
        value = {
            0x7f080145,
            0x7f080147,
            0x7f080146,
            0x7f080148
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field mModeViews:Ljava/util/List;
    .annotation runtime Lbutterknife/BindViews;
        value = {
            0x7f08014e,
            0x7f08014f,
            0x7f08014d,
            0x7f080149
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field maxTemp:I

.field minTemp:I

.field modeIndexMap:Landroid/util/SparseIntArray;

.field private modeOff:[I

.field private modeOn:[I

.field myLandleafView:Lcom/dnake/desktop/widget/LandleafView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080150
    .end annotation
.end field

.field outdoorTemperature:F

.field powerOn:Z

.field recyclerView:Landroidx/recyclerview/widget/RecyclerView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f0800f5
    .end annotation
.end field

.field roomArrayT2:[Ljava/lang/String;

.field roomArrayT4_1:[Ljava/lang/String;

.field roomArrayT4_2:[Ljava/lang/String;

.field ticaInnerList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/dnake/desktop/bean/TicaInnerStatus;",
            ">;"
        }
    .end annotation
.end field

.field tvTempShow:Landroid/widget/TextView;
    .annotation runtime Lbutterknife/BindView;
        value = 0x7f080151
    .end annotation
.end field

.field private volumeOff:[I

.field private volumeOn:[I


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 58
    invoke-direct {p0}, Lcom/dnake/desktop/base/BaseFragment;-><init>()V

    const-string v0, "AirControlFragment"

    .line 60
    iput-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    .line 78
    iput v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TYPE_T2:I

    const/4 v1, 0x1

    .line 79
    iput v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TYPE_T4_1:I

    const/4 v1, 0x2

    .line 80
    iput v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TYPE_T4_2:I

    const-string v1, "\u4e3b\u5367"

    const-string v2, "\u5367\u5ba42"

    const-string v3, "\u5367\u5ba41"

    const-string v4, "\u5ba2\u5385"

    const-string v5, "\u9910\u5385"

    .line 81
    filled-new-array {v4, v5, v3, v2, v1}, [Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->roomArrayT2:[Ljava/lang/String;

    const-string v5, "\u5367\u5ba43"

    .line 82
    filled-new-array {v4, v3, v2, v1, v5}, [Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->roomArrayT4_1:[Ljava/lang/String;

    .line 83
    filled-new-array {v4, v3, v2, v1}, [Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->roomArrayT4_2:[Ljava/lang/String;

    const/16 v1, 0x10

    .line 84
    iput v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->minTemp:I

    const/16 v1, 0x1e

    iput v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->maxTemp:I

    const/4 v1, 0x4

    new-array v2, v1, [I

    .line 85
    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeOff:[I

    new-array v2, v1, [I

    .line 86
    fill-array-data v2, :array_1

    iput-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeOn:[I

    new-array v2, v1, [I

    .line 87
    fill-array-data v2, :array_2

    iput-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->volumeOff:[I

    new-array v1, v1, [I

    .line 88
    fill-array-data v1, :array_3

    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->volumeOn:[I

    .line 91
    new-instance v1, Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-direct {v1}, Lcom/dnake/desktop/handler/AirControlHandler;-><init>()V

    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    .line 92
    new-instance v1, Landroid/util/SparseIntArray;

    invoke-direct {v1}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeIndexMap:Landroid/util/SparseIntArray;

    .line 94
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    .line 123
    iput-boolean v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->powerOn:Z

    .line 257
    iput v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->count:I

    .line 258
    iput-boolean v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->initDeviceInfo:Z

    const-string v0, "T2"

    const-string v1, "T4-1"

    const-string v2, "T4-2"

    .line 443
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->houseType:[Ljava/lang/String;

    return-void

    nop

    :array_0
    .array-data 4
        0x7f0700a7
        0x7f0700a9
        0x7f0700a2
        0x7f070077
    .end array-data

    :array_1
    .array-data 4
        0x7f0700a8
        0x7f0700aa
        0x7f0700a3
        0x7f070078
    .end array-data

    :array_2
    .array-data 4
        0x7f070080
        0x7f070084
        0x7f070082
        0x7f07007e
    .end array-data

    :array_3
    .array-data 4
        0x7f070081
        0x7f070085
        0x7f070083
        0x7f07007f
    .end array-data
.end method

.method static synthetic access$002(Lcom/dnake/desktop/fragment/AirControlFragment;Z)Z
    .locals 0

    .line 58
    iput-boolean p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->initDeviceInfo:Z

    return p1
.end method

.method static synthetic access$100(Lcom/dnake/desktop/fragment/AirControlFragment;)Ljava/lang/String;
    .locals 0

    .line 58
    iget-object p0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method private getNoBySn(Ljava/lang/String;)I
    .locals 2

    .line 439
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 440
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method private initNtInfo()V
    .locals 3

    .line 483
    invoke-static {}, Lcom/landleaf/smarthome/net/http/ApiFactory;->getNetApi()Lcom/landleaf/smarthome/net/http/NetApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/landleaf/smarthome/net/http/NetApi;->getFloorDeviceList()Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/dnake/desktop/fragment/AirControlFragment$2;

    invoke-direct {v1, p0}, Lcom/dnake/desktop/fragment/AirControlFragment$2;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment;)V

    new-instance v2, Lcom/dnake/desktop/fragment/AirControlFragment$3;

    invoke-direct {v2, p0}, Lcom/dnake/desktop/fragment/AirControlFragment$3;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private initRoomInfo(I)V
    .locals 6

    .line 445
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->houseType:[Ljava/lang/String;

    aget-object v0, v0, p1

    sput-object v0, Lcom/dnake/desktop/costant/VariableConstant;->HOUSE_TYPE:Ljava/lang/String;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const/4 v1, 0x0

    .line 447
    :goto_0
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->roomArrayT2:[Ljava/lang/String;

    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 448
    iget-object v3, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    new-instance v4, Lcom/dnake/desktop/bean/TicaInnerStatus;

    add-int/lit8 v5, v1, 0x1

    aget-object v1, v2, v1

    invoke-direct {v4, v5, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v1, v5

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    const/4 v1, 0x0

    .line 452
    :goto_1
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->roomArrayT4_1:[Ljava/lang/String;

    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 453
    iget-object v3, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    new-instance v4, Lcom/dnake/desktop/bean/TicaInnerStatus;

    add-int/lit8 v5, v1, 0x1

    aget-object v1, v2, v1

    invoke-direct {v4, v5, v1}, Lcom/dnake/desktop/bean/TicaInnerStatus;-><init>(ILjava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move v1, v5

    goto :goto_1

    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_2

    const/4 p1, 0x0

    .line 457
    :goto_2
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->roomArrayT4_2:[Ljava/lang/String;

    array-length v2, v1

    if-ge p1, v2, :cond_2

    .line 458
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    new-instance v3, Lcom/dnake/desktop/bean/TicaInnerStatus;

    add-int/lit8 v4, p1, 0x1

    aget-object p1, v1, p1

    invoke-direct {v3, v4, p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;-><init>(ILjava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move p1, v4

    goto :goto_2

    .line 461
    :cond_2
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    iput-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 462
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v1, p1}, Lcom/dnake/desktop/handler/AirControlHandler;->setTicaInnerStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 463
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Lcom/dnake/desktop/handler/AirControlHandler;->setDeviceList(Ljava/util/List;)V

    .line 464
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/AirControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2, v0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 465
    new-instance p1, Lcom/dnake/desktop/RoomAdapter;

    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/AirControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-direct {p1, v0, v1, v2}, Lcom/dnake/desktop/RoomAdapter;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Lcom/dnake/desktop/handler/AirControlHandler;)V

    iput-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->adapter:Lcom/dnake/desktop/RoomAdapter;

    .line 466
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->recyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method


# virtual methods
.method protected getViewID()I
    .locals 1

    const v0, 0x7f0b0022

    return v0
.end method

.method protected initFragment()V
    .locals 3

    const/4 v0, 0x1

    .line 100
    invoke-direct {p0, v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->initRoomInfo(I)V

    .line 101
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeIndexMap:Landroid/util/SparseIntArray;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 102
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeIndexMap:Landroid/util/SparseIntArray;

    const/4 v2, 0x2

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    .line 103
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeIndexMap:Landroid/util/SparseIntArray;

    const/4 v1, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 104
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeIndexMap:Landroid/util/SparseIntArray;

    const/4 v1, 0x5

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 106
    invoke-direct {p0}, Lcom/dnake/desktop/fragment/AirControlFragment;->initNtInfo()V

    return-void
.end method

.method public onClickView(Landroid/view/View;)V
    .locals 5
    .annotation runtime Lbutterknife/OnClick;
        value = {
            0x7f08014c,
            0x7f08014a,
            0x7f08014b,
            0x7f08014e,
            0x7f08014f,
            0x7f08014d,
            0x7f080149,
            0x7f080145,
            0x7f080147,
            0x7f080146,
            0x7f080148
        }
    .end annotation

    .line 129
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/4 v0, 0x3

    const-string v1, "\u4e0e\u5f53\u524d\u8fd0\u884c\u6a21\u5f0f\u51b2\u7a81\uff01\u4e0d\u53ef\u8bbe"

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x2

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_1

    .line 160
    :pswitch_0
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v4}, Lcom/dnake/desktop/handler/AirControlHandler;->handlerAirModeConflict(I)Z

    move-result p1

    if-nez p1, :cond_0

    .line 161
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/AirControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p0, p1, v1}, Lcom/dnake/desktop/fragment/AirControlFragment;->showWarnToast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 164
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v2, v4, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto/16 :goto_1

    .line 148
    :pswitch_1
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v3}, Lcom/dnake/desktop/handler/AirControlHandler;->handlerAirModeConflict(I)Z

    move-result p1

    if-nez p1, :cond_1

    .line 149
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/AirControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p0, p1, v1}, Lcom/dnake/desktop/fragment/AirControlFragment;->showWarnToast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 157
    :cond_1
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v2, v3, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto/16 :goto_1

    .line 173
    :pswitch_2
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/handler/AirControlHandler;->handlerAirModeConflict(I)Z

    move-result p1

    if-nez p1, :cond_2

    .line 174
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/AirControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p0, p1, v1}, Lcom/dnake/desktop/fragment/AirControlFragment;->showWarnToast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 182
    :cond_2
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v2, v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto/16 :goto_1

    .line 132
    :pswitch_3
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-boolean v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->powerOn:Z

    if-eqz v1, :cond_3

    goto :goto_0

    :cond_3
    const/16 v2, 0x80

    :goto_0
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v0, v2, v1}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto/16 :goto_1

    .line 141
    :pswitch_4
    iget p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    add-int/2addr p1, v3

    iput p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    .line 142
    iget v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->maxTemp:I

    if-le p1, v0, :cond_4

    .line 143
    iput v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    .line 144
    :cond_4
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v3, v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_1

    .line 135
    :pswitch_5
    iget p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    sub-int/2addr p1, v3

    iput p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    .line 136
    iget v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->minTemp:I

    if-gt p1, v0, :cond_5

    .line 137
    iput v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    .line 138
    :cond_5
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v3, v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_1

    .line 185
    :pswitch_6
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/handler/AirControlHandler;->handlerAirModeConflict(I)Z

    move-result p1

    if-nez p1, :cond_6

    .line 186
    invoke-virtual {p0}, Lcom/dnake/desktop/fragment/AirControlFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p0, p1, v1}, Lcom/dnake/desktop/fragment/AirControlFragment;->showWarnToast(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    .line 189
    :cond_6
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v2, v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_1

    .line 202
    :pswitch_7
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v4, v0, v1}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_1

    .line 196
    :pswitch_8
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v4, v3, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_1

    .line 199
    :pswitch_9
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v4, v4, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto :goto_1

    .line 193
    :pswitch_a
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v4, v2, v0}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x7f080145
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onHiddenChanged(Z)V
    .locals 1

    .line 111
    invoke-super {p0, p1}, Lcom/dnake/desktop/base/BaseFragment;->onHiddenChanged(Z)V

    if-eqz p1, :cond_0

    return-void

    .line 115
    :cond_0
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->readInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V

    return-void
.end method

.method public readAirStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;)V
    .locals 7
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 212
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "readAirStatus TicaInnerStatus:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isPowerSetting()Z

    move-result v0

    iput-boolean v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->powerOn:Z

    .line 215
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ivPower:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->isPowerSetting()Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f07009a

    goto :goto_0

    :cond_0
    const v1, 0x7f070099

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 216
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->setModeSelected(I)V

    .line 217
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingWindSpeed()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->setVolumeSelected(I)V

    .line 219
    iget v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingTemp()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 220
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getSettingTemp()I

    move-result v0

    iput v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTemp:I

    .line 221
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->myLandleafView:Lcom/dnake/desktop/widget/LandleafView;

    int-to-float v2, v0

    const/high16 v3, 0x41800000    # 16.0f

    const/high16 v4, 0x41f00000    # 30.0f

    iget v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->colorLevelGood:I

    const v0, 0x7f0d0039

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Lcom/dnake/desktop/widget/LandleafView;->setProgress(FFFILjava/lang/String;)V

    .line 223
    :cond_1
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->tvTempShow:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getReturnAirTemperature()F

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const p1, 0x7f0d004d

    invoke-virtual {p0, p1}, Lcom/dnake/desktop/fragment/AirControlFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public readSensor(Lcom/dnake/desktop/bean/ReadDeviceStatus;)V
    .locals 3
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 261
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "readDeviceStatus:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->uploadAllAirStatus(Lcom/dnake/desktop/handler/AirControlHandler;)V

    .line 263
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->readInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V

    .line 264
    iget-boolean p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->initDeviceInfo:Z

    if-nez p1, :cond_0

    .line 265
    invoke-direct {p0}, Lcom/dnake/desktop/fragment/AirControlFragment;->initNtInfo()V

    .line 267
    :cond_0
    iget p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->count:I

    rem-int/lit16 p1, p1, 0x1e0

    if-nez p1, :cond_1

    .line 268
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object p1

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/utils/CommonUtils;->uploadBugInThread(Lcom/dnake/desktop/callback/Rs485Callback;)V

    .line 270
    :cond_1
    iget p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->count:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->count:I

    return-void
.end method

.method public remoteControl(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V
    .locals 5
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 374
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "remoteControl MqttMsgBodyModel:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    invoke-virtual {p1}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;->getPayload()Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttPayloadModel;->getData()Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/landleaf/smarthome/net/mqtt/bean/MqttDataModel;->getProductCode()I

    move-result v0

    const/16 v1, 0x2008

    if-ne v0, v1, :cond_2

    .line 379
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/utils/CommonUtils;->parseRemoteInfo(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)Ljava/util/List;

    move-result-object v0

    .line 380
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dnake/desktop/bean/MqttRemoteControl;

    .line 381
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "remoteControl mqttRemoteControl:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 382
    invoke-virtual {v1}, Lcom/dnake/desktop/bean/MqttRemoteControl;->getControlAddress()I

    move-result v2

    if-nez v2, :cond_0

    .line 383
    invoke-virtual {v1}, Lcom/dnake/desktop/bean/MqttRemoteControl;->getControlValue()I

    move-result v2

    const/4 v3, 0x5

    if-eq v2, v3, :cond_0

    .line 386
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/MqttRemoteControl;->getControlValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/dnake/desktop/handler/AirControlHandler;->handlerAirModeConflict(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 387
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v1

    const/16 v2, 0x1f4

    const-string v3, "\u4e0e\u5f53\u524d\u8fd0\u884c\u6a21\u5f0f\u51b2\u7a81\uff01\u4e0d\u53ef\u8bbe"

    invoke-virtual {v1, p1, v2, v3}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;ILjava/lang/String;)V

    goto :goto_0

    .line 392
    :cond_0
    invoke-static {}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->getInstance()Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/landleaf/smarthome/net/mqtt/MqttExecutor;->sendCommonReturnMsg(Lcom/landleaf/smarthome/net/mqtt/bean/MqttMsgBodyModel;)V

    .line 393
    invoke-virtual {v1}, Lcom/dnake/desktop/bean/MqttRemoteControl;->getDeviceSn()Ljava/lang/String;

    move-result-object v2

    .line 394
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 395
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 396
    iget-object v3, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v3, v2}, Lcom/dnake/desktop/handler/AirControlHandler;->setMachineNo(I)V

    .line 397
    iget-object v3, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v3, v2}, Lcom/dnake/desktop/handler/AirControlHandler;->getShowTicaStatus(I)Lcom/dnake/desktop/bean/TicaInnerStatus;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 399
    invoke-virtual {p0, v3}, Lcom/dnake/desktop/fragment/AirControlFragment;->readAirStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 402
    :cond_1
    iget-object v3, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->adapter:Lcom/dnake/desktop/RoomAdapter;

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v3, v2}, Lcom/dnake/desktop/RoomAdapter;->setSelectPosition(I)V

    .line 403
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->adapter:Lcom/dnake/desktop/RoomAdapter;

    invoke-virtual {v2}, Lcom/dnake/desktop/RoomAdapter;->notifyDataSetChanged()V

    .line 404
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v2

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/MqttRemoteControl;->getControlAddress()I

    move-result v3

    invoke-virtual {v1}, Lcom/dnake/desktop/bean/MqttRemoteControl;->getControlValue()I

    move-result v1

    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v2, v3, v1, v4}, Lcom/dnake/desktop/utils/CommonUtils;->writeInThread(IILcom/dnake/desktop/callback/Rs485Callback;)V

    goto/16 :goto_0

    :cond_2
    return-void
.end method

.method public sceneControl(Lcom/landleaf/smarthome/model/SceneControlBean;)V
    .locals 14
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 275
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sceneControl:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AirControlFragment"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->getModeIndex()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_2

    .line 278
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0, v2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    .line 279
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0, v1, v2, v4}, Lcom/dnake/desktop/utils/CommonUtils;->writeAirMultiple(Ljava/util/List;Lcom/dnake/desktop/handler/AirControlHandler;Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 280
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->isDelayControl()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 283
    :cond_0
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 284
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getDeviceSn()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v3}, Lcom/dnake/desktop/handler/AirControlHandler;->uploadSceneWrite(Ljava/lang/String;Lcom/dnake/desktop/bean/TicaInnerStatus;Z)V

    goto :goto_0

    :cond_1
    return-void

    .line 289
    :cond_2
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->getModeIndex()I

    move-result v0

    const/16 v4, 0x1a

    const/4 v5, 0x3

    const/high16 v6, 0x41a00000    # 20.0f

    const/4 v7, 0x2

    if-ne v0, v3, :cond_6

    .line 290
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0, v3}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    .line 291
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    iget v8, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->outdoorTemperature:F

    cmpl-float v6, v8, v6

    if-ltz v6, :cond_3

    goto :goto_1

    :cond_3
    const/4 v3, 0x2

    :goto_1
    invoke-virtual {v0, v3}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingMode(I)V

    .line 292
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingTemp(I)V

    .line 293
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0, v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingWindSpeed(I)V

    .line 294
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v0

    iget-object v3, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v0, v1, v3, v4}, Lcom/dnake/desktop/utils/CommonUtils;->writeAirMultiple(Ljava/util/List;Lcom/dnake/desktop/handler/AirControlHandler;Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 295
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->isDelayControl()Z

    move-result p1

    if-eqz p1, :cond_4

    return-void

    .line 298
    :cond_4
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 299
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getDeviceSn()Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v1, v0, v3, v2}, Lcom/dnake/desktop/handler/AirControlHandler;->uploadSceneWrite(Ljava/lang/String;Lcom/dnake/desktop/bean/TicaInnerStatus;Z)V

    goto :goto_2

    :cond_5
    return-void

    .line 304
    :cond_6
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->getModeIndex()I

    move-result v0

    const-wide/16 v8, 0x12c

    if-ne v0, v7, :cond_c

    .line 305
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 306
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 307
    iget-object v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    const-string v11, "\u5367"

    if-eqz v10, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 308
    invoke-virtual {v10}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getRoomName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 309
    invoke-virtual {v10}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 311
    :cond_7
    invoke-virtual {v10}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 314
    :cond_8
    iget-object v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v5, v2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    .line 315
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v5

    iget-object v10, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v12, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v12}, Lcom/dnake/desktop/bean/TicaInnerStatus;->clone()Lcom/dnake/desktop/bean/TicaInnerStatus;

    move-result-object v12

    invoke-virtual {v5, v1, v10, v12}, Lcom/dnake/desktop/utils/CommonUtils;->writeAirMultiple(Ljava/util/List;Lcom/dnake/desktop/handler/AirControlHandler;Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 317
    :try_start_0
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception v1

    .line 319
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 322
    :goto_4
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v1, v3}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    .line 323
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    iget v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->outdoorTemperature:F

    cmpl-float v5, v5, v6

    if-ltz v5, :cond_9

    const/4 v7, 0x1

    :cond_9
    invoke-virtual {v1, v7}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingMode(I)V

    .line 324
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingTemp(I)V

    .line 325
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v1, v2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingWindSpeed(I)V

    .line 326
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v1

    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v1, v0, v2, v4}, Lcom/dnake/desktop/utils/CommonUtils;->writeAirMultiple(Ljava/util/List;Lcom/dnake/desktop/handler/AirControlHandler;Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 327
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->isDelayControl()Z

    move-result p1

    if-eqz p1, :cond_a

    return-void

    .line 330
    :cond_a
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 331
    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getRoomName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/2addr v1, v3

    .line 332
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getDeviceSn()Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v2, v0, v4, v1}, Lcom/dnake/desktop/handler/AirControlHandler;->uploadSceneWrite(Ljava/lang/String;Lcom/dnake/desktop/bean/TicaInnerStatus;Z)V

    goto :goto_5

    :cond_b
    return-void

    .line 337
    :cond_c
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->getModeIndex()I

    move-result v0

    if-ne v0, v5, :cond_13

    .line 338
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 339
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 340
    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_6
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const-string v10, "\u9910"

    const-string v11, "\u8d77\u5c45"

    const-string v12, "\u5ba2"

    if-eqz v5, :cond_f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 341
    invoke-virtual {v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getRoomName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_e

    invoke-virtual {v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getRoomName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_e

    invoke-virtual {v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getRoomName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_d

    goto :goto_7

    .line 344
    :cond_d
    invoke-virtual {v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 342
    :cond_e
    :goto_7
    invoke-virtual {v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getMachineNo()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 347
    :cond_f
    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v4, v2}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    .line 348
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v4

    iget-object v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v13, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v13}, Lcom/dnake/desktop/bean/TicaInnerStatus;->clone()Lcom/dnake/desktop/bean/TicaInnerStatus;

    move-result-object v13

    invoke-virtual {v4, v1, v5, v13}, Lcom/dnake/desktop/utils/CommonUtils;->writeAirMultiple(Ljava/util/List;Lcom/dnake/desktop/handler/AirControlHandler;Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 352
    :try_start_1
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_8

    :catch_1
    move-exception v1

    .line 354
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 357
    :goto_8
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v1, v3}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setPowerSetting(Z)V

    .line 358
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    iget v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->outdoorTemperature:F

    cmpl-float v4, v4, v6

    if-ltz v4, :cond_10

    const/4 v4, 0x1

    goto :goto_9

    :cond_10
    const/4 v4, 0x2

    :goto_9
    invoke-virtual {v1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingMode(I)V

    .line 359
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    const/16 v4, 0x17

    invoke-virtual {v1, v4}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingTemp(I)V

    .line 360
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v1, v7}, Lcom/dnake/desktop/bean/TicaInnerStatus;->setSettingWindSpeed(I)V

    .line 361
    invoke-static {}, Lcom/dnake/desktop/utils/CommonUtils;->getInstance()Lcom/dnake/desktop/utils/CommonUtils;

    move-result-object v1

    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v5}, Lcom/dnake/desktop/bean/TicaInnerStatus;->clone()Lcom/dnake/desktop/bean/TicaInnerStatus;

    move-result-object v5

    invoke-virtual {v1, v0, v4, v5}, Lcom/dnake/desktop/utils/CommonUtils;->writeAirMultiple(Ljava/util/List;Lcom/dnake/desktop/handler/AirControlHandler;Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 362
    invoke-virtual {p1}, Lcom/landleaf/smarthome/model/SceneControlBean;->isDelayControl()Z

    move-result p1

    if-eqz p1, :cond_11

    return-void

    .line 365
    :cond_11
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 366
    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getRoomName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_12

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getRoomName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_12

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getRoomName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_12

    const/4 v1, 0x1

    goto :goto_b

    :cond_12
    const/4 v1, 0x0

    .line 367
    :goto_b
    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v0}, Lcom/dnake/desktop/bean/TicaInnerStatus;->getDeviceSn()Ljava/lang/String;

    move-result-object v0

    iget-object v5, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-virtual {v4, v0, v5, v1}, Lcom/dnake/desktop/handler/AirControlHandler;->uploadSceneWrite(Ljava/lang/String;Lcom/dnake/desktop/bean/TicaInnerStatus;Z)V

    goto :goto_a

    :cond_13
    return-void
.end method

.method public setModeSelected(I)V
    .locals 3

    .line 476
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeIndexMap:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->get(I)I

    move-result p1

    const/4 v0, 0x0

    .line 477
    :goto_0
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->mModeViews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 478
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->mModeViews:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    if-ne v0, p1, :cond_0

    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeOn:[I

    aget v2, v2, v0

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->modeOff:[I

    aget v2, v2, v0

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setVolumeSelected(I)V
    .locals 3

    const/4 v0, 0x0

    .line 470
    :goto_0
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->mFengsuViews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 471
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->mFengsuViews:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    if-ne v0, p1, :cond_0

    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->volumeOn:[I

    aget v2, v2, v0

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->volumeOff:[I

    aget v2, v2, v0

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public updateDeviceInfo(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/RoomModel;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        sticky = true
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    const-string v0, "AirControlFragment"

    const-string v1, "updateDeviceInfo"

    .line 411
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 412
    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 413
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/landleaf/smarthome/model/RoomModel;

    .line 414
    invoke-virtual {v1}, Lcom/landleaf/smarthome/model/RoomModel;->getDevices()Ljava/util/List;

    move-result-object v2

    .line 415
    invoke-virtual {v1}, Lcom/landleaf/smarthome/model/RoomModel;->getRoomName()Ljava/lang/String;

    move-result-object v1

    .line 416
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/landleaf/smarthome/model/DeviceModel;

    .line 417
    invoke-virtual {v3}, Lcom/landleaf/smarthome/model/DeviceModel;->getProductCode()I

    move-result v4

    const/16 v5, 0x2008

    if-ne v4, v5, :cond_1

    .line 418
    invoke-virtual {v3}, Lcom/landleaf/smarthome/model/DeviceModel;->getDeviceSn()Ljava/lang/String;

    move-result-object v3

    .line 419
    invoke-direct {p0, v3}, Lcom/dnake/desktop/fragment/AirControlFragment;->getNoBySn(Ljava/lang/String;)I

    move-result v4

    .line 420
    new-instance v5, Lcom/dnake/desktop/bean/TicaInnerStatus;

    invoke-direct {v5, v4, v1, v3}, Lcom/dnake/desktop/bean/TicaInnerStatus;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 421
    iget-object v3, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 425
    :cond_2
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    new-instance v1, Lcom/dnake/desktop/fragment/AirControlFragment$1;

    invoke-direct {v1, p0}, Lcom/dnake/desktop/fragment/AirControlFragment$1;-><init>(Lcom/dnake/desktop/fragment/AirControlFragment;)V

    invoke-static {p1, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 431
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ticaInnerList:"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->adapter:Lcom/dnake/desktop/RoomAdapter;

    invoke-virtual {p1}, Lcom/dnake/desktop/RoomAdapter;->notifyDataSetChanged()V

    .line 433
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/dnake/desktop/bean/TicaInnerStatus;

    iput-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->currentTicaStatus:Lcom/dnake/desktop/bean/TicaInnerStatus;

    .line 434
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    invoke-virtual {v0, p1}, Lcom/dnake/desktop/handler/AirControlHandler;->setTicaInnerStatus(Lcom/dnake/desktop/bean/TicaInnerStatus;)V

    .line 435
    iget-object p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->airControlHandler:Lcom/dnake/desktop/handler/AirControlHandler;

    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ticaInnerList:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/dnake/desktop/handler/AirControlHandler;->setDeviceList(Ljava/util/List;)V

    return-void
.end method

.method public writeAirStatus(Lcom/dnake/desktop/bean/NtWriteResult;)V
    .locals 10
    .annotation runtime Lorg/greenrobot/eventbus/Subscribe;
        threadMode = .enum Lorg/greenrobot/eventbus/ThreadMode;->MAIN:Lorg/greenrobot/eventbus/ThreadMode;
    .end annotation

    .line 230
    iget-object v0, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "writeAirStatus NtWriteResult:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->isWriteWind()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 234
    :cond_0
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getValue()F

    move-result v0

    float-to-int v0, v0

    .line 236
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v1

    const/4 v2, 0x3

    const/4 v3, 0x1

    if-ne v1, v2, :cond_3

    and-int/lit16 v1, v0, 0x80

    const/16 v2, 0x80

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 237
    :goto_0
    iput-boolean v1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->powerOn:Z

    .line 238
    iget-object v2, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->ivPower:Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    const v1, 0x7f07009a

    goto :goto_1

    :cond_2
    const v1, 0x7f070099

    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 241
    :cond_3
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v1

    if-nez v1, :cond_4

    .line 242
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->setModeSelected(I)V

    .line 245
    :cond_4
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_5

    .line 246
    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->setVolumeSelected(I)V

    .line 248
    :cond_5
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v1

    if-ne v1, v3, :cond_6

    .line 249
    iget-object v4, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->myLandleafView:Lcom/dnake/desktop/widget/LandleafView;

    int-to-float v5, v0

    const/high16 v6, 0x41800000    # 16.0f

    const/high16 v7, 0x41f00000    # 30.0f

    iget v8, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->colorLevelGood:I

    const v0, 0x7f0d0039

    invoke-virtual {p0, v0}, Lcom/dnake/desktop/fragment/AirControlFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v4 .. v9}, Lcom/dnake/desktop/widget/LandleafView;->setProgress(FFFILjava/lang/String;)V

    .line 252
    :cond_6
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getAddress()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_7

    .line 253
    invoke-virtual {p1}, Lcom/dnake/desktop/bean/NtWriteResult;->getValue()F

    move-result p1

    iput p1, p0, Lcom/dnake/desktop/fragment/AirControlFragment;->outdoorTemperature:F

    :cond_7
    return-void
.end method
