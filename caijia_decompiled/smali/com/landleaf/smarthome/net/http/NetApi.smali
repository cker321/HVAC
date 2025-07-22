.class public interface abstract Lcom/landleaf/smarthome/net/http/NetApi;
.super Ljava/lang/Object;
.source "NetApi.java"


# virtual methods
.method public abstract apkFamilyCode()Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Lcom/landleaf/smarthome/model/FamilyModel;",
            ">;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "familyCode"
    .end annotation
.end method

.method public abstract apkUpdate(Lcom/landleaf/smarthome/net/http/NetRequest;)Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/http/NetRequest<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Lcom/landleaf/smarthome/model/VersionModel;",
            ">;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "apk-version/check"
    .end annotation
.end method

.method public abstract checkHoliday(Lcom/landleaf/smarthome/net/http/NetRequest;)Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/http/NetRequest<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Lcom/landleaf/smarthome/model/FamilyModel;",
            ">;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "holidays/check"
    .end annotation
.end method

.method public abstract deleteTimingSceneList(Lcom/landleaf/smarthome/net/http/NetRequest;)Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/http/NetRequest<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/TimingModel;",
            ">;>;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "timing/scene/delete"
    .end annotation
.end method

.method public abstract getFloorDeviceList()Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/FloorModel;",
            ">;>;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "floor-room-device/list"
    .end annotation
.end method

.method public abstract getNewsList()Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/NewsModel;",
            ">;>;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "news/list"
    .end annotation
.end method

.method public abstract getSceneList()Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/SceneModel;",
            ">;>;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "scene/list"
    .end annotation
.end method

.method public abstract getTimingSceneList()Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/TimingModel;",
            ">;>;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "timing/scene/list"
    .end annotation
.end method

.method public abstract getWeather()Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Lcom/landleaf/smarthome/model/WeatherModel;",
            ">;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "weather"
    .end annotation
.end method

.method public abstract updateTimingSceneList(Lcom/landleaf/smarthome/net/http/NetRequest;)Lio/reactivex/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/landleaf/smarthome/net/http/NetRequest<",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/TimingModel;",
            ">;>;)",
            "Lio/reactivex/Observable<",
            "Lcom/landleaf/smarthome/net/http/NetResponse<",
            "Ljava/util/List<",
            "Lcom/landleaf/smarthome/model/TimingModel;",
            ">;>;>;"
        }
    .end annotation

    .annotation runtime Lretrofit2/http/POST;
        value = "timing/scene/save-update"
    .end annotation
.end method
