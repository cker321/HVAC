package com.dnake.desktop.fragment;

import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import butterknife.BindArray;
import butterknife.BindColor;
import butterknife.BindDrawable;
import butterknife.BindString;
import butterknife.BindView;
import butterknife.BindViews;
import com.bumptech.glide.Glide;
import com.contrarywind.timer.MessageHandler;
import com.dnake.desktop.C0483R;
import com.dnake.desktop.base.BaseFragment;
import com.dnake.desktop.bean.ReadDeviceStatus;
import com.dnake.desktop.bean.RecordBean;
import com.dnake.desktop.costant.Constant;
import com.dnake.desktop.handler.SensorHandler;
import com.dnake.desktop.utils.CommonUtils;
import com.dnake.desktop.utils.PreferencesUtils;
import com.dnake.desktop.widget.ArofeneView1;
import com.dnake.desktop.widget.LandleafView;
import com.jakewharton.rxbinding2.view.RxView;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.model.RoomModel;
import com.landleaf.smarthome.model.WeatherModel;
import com.landleaf.smarthome.util.JsonUtils;
import io.reactivex.functions.Consumer;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/* loaded from: classes.dex */
public class MonitorFragment extends BaseFragment {
    public static final float CO2_LEVEL_1 = 1000.0f;
    public static final float CO2_LEVEL_2 = 1500.0f;
    public static final float HUMIDITY_LEVEL_1 = 30.0f;
    public static final float HUMIDITY_LEVEL_2 = 70.0f;
    public static final float MAX_VALUE_CO2 = 2000.0f;
    public static final float MAX_VALUE_HUMIDITY = 100.0f;
    public static final float MAX_VALUE_PM25 = 200.0f;
    public static final float MIN_VALUE_CO2 = 0.0f;
    public static final float MIN_VALUE_HUMIDITY = 0.0f;
    public static final float MIN_VALUE_PM25 = 0.0f;
    public static final float PM25_LEVEL_1 = 50.0f;
    public static final float PM25_LEVEL_2 = 100.0f;
    public static final float VOC_LEVEL_1 = 0.26f;
    public static final float VOC_LEVEL_2 = 0.6f;

    @BindArray(C0483R.array.arofeneLevel)
    String[] arofeneLevels;

    @BindView(C0483R.id.arofeneView1F)
    ArofeneView1 arofeneViewVoc;

    @BindColor(C0483R.color.colorClicked)
    int colorClicked;

    @BindColor(C0483R.color.colorLevelBad)
    int colorLevelBad;

    @BindColor(C0483R.color.colorLevelGood)
    int colorLevelGood;

    @BindColor(C0483R.color.colorLevelMedium)
    int colorLevelMedium;

    @BindColor(C0483R.color.colorUnClick)
    int colorUnClick;

    @BindArray(C0483R.array.dataType)
    String[] dataTypes;

    @BindView(C0483R.id.ivWeatherStatus)
    ImageView ivWeatherStatus;

    @BindViews({C0483R.id.rlVoc, C0483R.id.rlCo2, C0483R.id.rlTemp, C0483R.id.rlHumidity, C0483R.id.rlPm})
    List<RelativeLayout> layouts;

    @BindView(C0483R.id.myCustomLayout)
    LandleafView myMonitorLayout;
    private RecordBean recordBean;
    private int selectedColor;

    @BindDrawable(C0483R.drawable.shape_left_bottom_selected)
    Drawable shapeLeftBottomSelected;

    @BindDrawable(C0483R.drawable.shape_left_bottom_unselect)
    Drawable shapeLeftBottomUnSelect;

    @BindDrawable(C0483R.drawable.shape_left_top_selected)
    Drawable shapeLeftTopSelected;

    @BindDrawable(C0483R.drawable.shape_left_top_unselect)
    Drawable shapeLeftTopUnSelect;

    @BindString(C0483R.string.str_level_jiaocha)
    String strJiaocha;

    @BindString(C0483R.string.str_level_lianghao)
    String strLianghao;

    @BindString(C0483R.string.str_level_shushi)
    String strShushi;

    @BindView(C0483R.id.tvCalender)
    TextView tvCalender;

    @BindView(C0483R.id.tvChuanyi)
    TextView tvChuanyi;

    @BindView(C0483R.id.tvCo2In)
    TextView tvCo2In;

    @BindView(C0483R.id.tvDataType)
    TextView tvDataType;

    @BindView(C0483R.id.tvGanmao)
    TextView tvGanmao;

    @BindView(C0483R.id.tvHumidityIn)
    TextView tvHumidityIn;

    @BindView(C0483R.id.tvHumidityOut)
    TextView tvHumidityOut;

    @BindView(C0483R.id.tvPmIn)
    TextView tvPmIn;

    @BindView(C0483R.id.tvPmOut)
    TextView tvPmOut;

    @BindView(C0483R.id.tvSport)
    TextView tvSport;

    @BindView(C0483R.id.tvSunny)
    TextView tvSunny;

    @BindView(C0483R.id.tvTempIn)
    TextView tvTempIn;

    @BindView(C0483R.id.tvTempOut)
    TextView tvTempOut;

    @BindView(C0483R.id.tvUnit)
    TextView tvUnit;

    @BindArray(C0483R.array.dataUnit)
    String[] tvUnits;

    @BindView(C0483R.id.tvUpdateTime)
    TextView tvUpdateTime;

    @BindView(C0483R.id.tvWeatherStatus)
    TextView tvWeatherStatus;

    @BindView(C0483R.id.tvWindDir)
    TextView tvWindDir;

    @BindView(C0483R.id.tvWindLevel)
    TextView tvWindLevel;
    private String TAG = "MonitorFragment";
    private int position = 2;
    SensorHandler sensorHandler = new SensorHandler();

    @Override // com.dnake.desktop.base.BaseFragment
    protected int getViewID() {
        return C0483R.layout.fragment_monitor;
    }

    public int getVocLevel(float f) {
        if (f < 0.26f) {
            return 0;
        }
        return f >= 0.6f ? 2 : 1;
    }

    @Override // com.dnake.desktop.base.BaseFragment
    protected void initFragment() {
        setClick();
        WeatherModel weatherModel = (WeatherModel) JsonUtils.jsonToObj(PreferencesUtils.getInstance(getActivity()).read(Constant.WEATHER_HISTORY, ""), WeatherModel.class);
        RecordBean recordBean = (RecordBean) JsonUtils.jsonToObj(PreferencesUtils.getInstance(getActivity()).read(Constant.SENSOR_HISTORY, ""), RecordBean.class);
        getWeather(weatherModel);
        getRecordModel(recordBean);
    }

    private void setClick() {
        for (final int i = 1; i < this.layouts.size(); i++) {
            RxView.clicks(this.layouts.get(i)).throttleFirst(2L, TimeUnit.SECONDS).subscribe(new Consumer() { // from class: com.dnake.desktop.fragment.-$$Lambda$MonitorFragment$j9u3z2qEGI2HbyDRdw1NW8-z34s
                @Override // io.reactivex.functions.Consumer
                public final void accept(Object obj) throws Exception {
                    this.f$0.lambda$setClick$0$MonitorFragment(i, obj);
                }
            });
        }
    }

    public /* synthetic */ void lambda$setClick$0$MonitorFragment(int i, Object obj) throws Exception {
        this.position = i;
        setValue();
    }

    @Subscribe(sticky = MqttConnectOptions.CLEAN_SESSION_DEFAULT, threadMode = ThreadMode.MAIN)
    public void getWeather(WeatherModel weatherModel) {
        Log.d(this.TAG, "收到天气:" + weatherModel);
        if (weatherModel == null) {
            return;
        }
        this.tvCalender.setText(weatherModel.getCalender());
        this.tvWeatherStatus.setText(weatherModel.getWeatherStatus());
        this.tvUpdateTime.setText(weatherModel.getUpdateTime());
        this.tvWindDir.setText(weatherModel.getWindDirection());
        this.tvWindLevel.setText(weatherModel.getWindLevel());
        this.tvSport.setText(weatherModel.getSportLevel());
        this.tvSunny.setText(weatherModel.getUvLevel());
        this.tvChuanyi.setText(weatherModel.getDressLevel());
        this.tvGanmao.setText(weatherModel.getColdLevel());
        Glide.with(this).load(weatherModel.getPicUrl()).into(this.ivWeatherStatus);
        setWeatherModel(weatherModel);
        PreferencesUtils.getInstance(getActivity()).write(Constant.WEATHER_HISTORY, JsonUtils.objToJson(weatherModel));
    }

    private void setWeatherModel(WeatherModel weatherModel) {
        if (CommonUtils.getInstance().isNumber(weatherModel.getTemp())) {
            getTempColorLevel(Float.parseFloat(weatherModel.getTemp()));
            this.tvTempOut.setTextColor(this.selectedColor);
            this.tvTempOut.setText(String.format("%s%s", weatherModel.getTemp(), getString(C0483R.string.str_unit_sheshidu)));
        }
        if (CommonUtils.getInstance().isNumber(weatherModel.getHumidity())) {
            getHumidityColorLevel(Float.parseFloat(weatherModel.getHumidity()));
            this.tvHumidityOut.setTextColor(this.selectedColor);
            this.tvHumidityOut.setText(String.format("%s%s", weatherModel.getHumidity(), getString(C0483R.string.str_unit_baifenbi)));
        }
        if (CommonUtils.getInstance().isNumber(weatherModel.getPm25())) {
            getPm25ColorLevel(Float.parseFloat(weatherModel.getPm25()));
            this.tvPmOut.setTextColor(this.selectedColor);
            this.tvPmOut.setText(weatherModel.getPm25());
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void getRecordModel(RecordBean recordBean) {
        if (recordBean == null) {
            return;
        }
        Log.d("MonitorFragment", "recordBean:" + recordBean);
        this.recordBean = recordBean;
        setRoomIn(recordBean);
        setValue();
        PreferencesUtils.getInstance(getActivity()).write(Constant.SENSOR_HISTORY, JsonUtils.objToJson(recordBean));
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void readSensor(ReadDeviceStatus readDeviceStatus) {
        CommonUtils.getInstance().readInThread(this.sensorHandler);
    }

    @Subscribe(sticky = MqttConnectOptions.CLEAN_SESSION_DEFAULT, threadMode = ThreadMode.MAIN)
    public void updateDeviceInfo(List<RoomModel> list) {
        for (RoomModel roomModel : list) {
            if (roomModel.getRoomName().equals(Constant.ROOM_KETING)) {
                for (DeviceModel deviceModel : roomModel.getDevices()) {
                    if (deviceModel.getProductCode() == 1101) {
                        this.sensorHandler.setDeviceSn(deviceModel.getDeviceSn());
                    }
                }
            }
        }
    }

    private void setRoomIn(RecordBean recordBean) {
        this.arofeneViewVoc.setArofeneLevelTxt(getVocLevel(recordBean.getVoc()), getActivity());
        getCO2ColorLevel(recordBean.getCo2());
        this.tvCo2In.setTextColor(this.selectedColor);
        int co2 = (int) recordBean.getCo2();
        if (recordBean.getCo2() > 2000.0f) {
            co2 = MessageHandler.WHAT_SMOOTH_SCROLL;
        }
        this.tvCo2In.setText(String.valueOf(co2));
        PreferencesUtils.getInstance(getActivity()).writeFloat(Constant.SENSOR_CO2, recordBean.getCo2());
        getTempColorLevel(recordBean.getTemp());
        this.tvTempIn.setTextColor(this.selectedColor);
        this.tvTempIn.setText(String.format("%s%s", String.valueOf((int) recordBean.getTemp()), getString(C0483R.string.str_unit_sheshidu)));
        getHumidityColorLevel(recordBean.getHumidity());
        this.tvHumidityIn.setTextColor(this.selectedColor);
        this.tvHumidityIn.setText(String.format("%s%s", String.valueOf((int) recordBean.getHumidity()), getString(C0483R.string.str_unit_baifenbi)));
        getPm25ColorLevel(recordBean.getPm25());
        this.tvPmIn.setTextColor(this.selectedColor);
        this.tvPmIn.setText(String.valueOf((int) recordBean.getPm25()));
    }

    private void setValue() {
        int cO2ColorLevel;
        float f;
        float f2;
        this.tvDataType.setText(this.dataTypes[this.position]);
        int i = this.position;
        if (i == 1) {
            RecordBean recordBean = this.recordBean;
            float co2 = recordBean == null ? 0.0f : recordBean.getCo2();
            cO2ColorLevel = getCO2ColorLevel(co2);
            temp = co2;
            f = 0.0f;
            f2 = 2000.0f;
        } else if (i == 2) {
            RecordBean recordBean2 = this.recordBean;
            temp = recordBean2 != null ? recordBean2.getTemp() : 0.0f;
            cO2ColorLevel = getTempColorLevel(temp);
            f = -20.0f;
            f2 = 50.0f;
        } else if (i == 3) {
            RecordBean recordBean3 = this.recordBean;
            float humidity = recordBean3 == null ? 0.0f : recordBean3.getHumidity();
            cO2ColorLevel = getHumidityColorLevel(humidity);
            temp = humidity;
            f = 0.0f;
            f2 = 100.0f;
        } else if (i != 4) {
            cO2ColorLevel = 0;
            f = 0.0f;
            f2 = 0.0f;
        } else {
            RecordBean recordBean4 = this.recordBean;
            float pm25 = recordBean4 == null ? 0.0f : recordBean4.getPm25();
            cO2ColorLevel = getPm25ColorLevel(pm25);
            temp = pm25;
            f = 0.0f;
            f2 = 200.0f;
        }
        this.myMonitorLayout.setProgress((int) temp, f, f2, this.selectedColor, new String[]{this.strShushi, this.strLianghao, this.strJiaocha}[cO2ColorLevel]);
        this.tvUnit.setText(this.tvUnits[this.position]);
        for (int i2 = 0; i2 < this.layouts.size(); i2++) {
            if (i2 == this.position) {
                if (i2 == 2) {
                    this.layouts.get(i2).setBackground(this.shapeLeftBottomSelected);
                } else if (i2 == 0) {
                    this.layouts.get(i2).setBackground(this.shapeLeftTopSelected);
                } else {
                    this.layouts.get(i2).setBackgroundColor(Color.parseColor("#2a4d63"));
                }
            } else if (i2 == 2) {
                this.layouts.get(i2).setBackground(this.shapeLeftBottomUnSelect);
            } else if (i2 == 0) {
                this.layouts.get(i2).setBackground(this.shapeLeftTopUnSelect);
            } else {
                this.layouts.get(i2).setBackgroundColor(Color.parseColor("#2f3032"));
            }
        }
    }

    public int getTempColorLevel(float f) {
        if (f >= 18.0f && f <= 26.0f) {
            this.selectedColor = this.colorLevelGood;
            return 0;
        }
        this.selectedColor = this.colorLevelMedium;
        return 1;
    }

    public int getHumidityColorLevel(float f) {
        if (f >= 30.0f && f <= 70.0f) {
            this.selectedColor = this.colorLevelGood;
            return 0;
        }
        this.selectedColor = this.colorLevelMedium;
        return 1;
    }

    public int getPm25ColorLevel(float f) {
        if (f < 50.0f) {
            this.selectedColor = this.colorLevelGood;
            return 0;
        }
        if (f >= 100.0f) {
            this.selectedColor = this.colorLevelBad;
            return 2;
        }
        this.selectedColor = this.colorLevelMedium;
        return 1;
    }

    public int getCO2ColorLevel(float f) {
        if (f < 1000.0f) {
            this.selectedColor = this.colorLevelGood;
            return 0;
        }
        if (f >= 1500.0f) {
            this.selectedColor = this.colorLevelBad;
            return 2;
        }
        this.selectedColor = this.colorLevelMedium;
        return 1;
    }
}
