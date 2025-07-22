package com.landleaf.smarthome.net.http;

import com.landleaf.smarthome.model.FamilyModel;
import com.landleaf.smarthome.model.FloorModel;
import com.landleaf.smarthome.model.NewsModel;
import com.landleaf.smarthome.model.SceneModel;
import com.landleaf.smarthome.model.TimingModel;
import com.landleaf.smarthome.model.VersionModel;
import com.landleaf.smarthome.model.WeatherModel;
import io.reactivex.Observable;
import java.util.List;
import retrofit2.http.POST;

/* loaded from: classes.dex */
public interface NetApi {
    @POST("familyCode")
    Observable<NetResponse<FamilyModel>> apkFamilyCode();

    @POST("apk-version/check")
    Observable<NetResponse<VersionModel>> apkUpdate(NetRequest<String> netRequest);

    @POST("holidays/check")
    Observable<NetResponse<FamilyModel>> checkHoliday(NetRequest<String> netRequest);

    @POST("timing/scene/delete")
    Observable<NetResponse<List<TimingModel>>> deleteTimingSceneList(NetRequest<List<String>> netRequest);

    @POST("floor-room-device/list")
    Observable<NetResponse<List<FloorModel>>> getFloorDeviceList();

    @POST("news/list")
    Observable<NetResponse<List<NewsModel>>> getNewsList();

    @POST("scene/list")
    Observable<NetResponse<List<SceneModel>>> getSceneList();

    @POST("timing/scene/list")
    Observable<NetResponse<List<TimingModel>>> getTimingSceneList();

    @POST("weather")
    Observable<NetResponse<WeatherModel>> getWeather();

    @POST("timing/scene/save-update")
    Observable<NetResponse<List<TimingModel>>> updateTimingSceneList(NetRequest<List<TimingModel>> netRequest);
}
