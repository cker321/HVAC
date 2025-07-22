package com.dnake.desktop.fragment;

import android.util.Log;
import android.util.SparseIntArray;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import butterknife.BindColor;
import butterknife.BindView;
import butterknife.BindViews;
import butterknife.OnClick;
import com.dnake.desktop.C0483R;
import com.dnake.desktop.RoomAdapter;
import com.dnake.desktop.base.BaseFragment;
import com.dnake.desktop.bean.MqttRemoteControl;
import com.dnake.desktop.bean.NtWriteResult;
import com.dnake.desktop.bean.ReadDeviceStatus;
import com.dnake.desktop.bean.TicaInnerStatus;
import com.dnake.desktop.costant.Constant;
import com.dnake.desktop.costant.VariableConstant;
import com.dnake.desktop.handler.AirControlHandler;
import com.dnake.desktop.utils.CommonUtils;
import com.dnake.desktop.widget.LandleafView;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.model.FloorModel;
import com.landleaf.smarthome.model.RoomModel;
import com.landleaf.smarthome.model.SceneControlBean;
import com.landleaf.smarthome.net.http.ApiFactory;
import com.landleaf.smarthome.net.http.NetResponse;
import com.landleaf.smarthome.net.mqtt.MqttExecutor;
import com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/* loaded from: classes.dex */
public class AirControlFragment extends BaseFragment {
    private RoomAdapter adapter;

    @BindColor(C0483R.color.colorLevelGood)
    int colorLevelGood;
    private int currentTemp;
    private TicaInnerStatus currentTicaStatus;

    @BindView(C0483R.id.tica_ivPower)
    ImageView ivPower;

    @BindViews({C0483R.id.tica_fengsu_di, C0483R.id.tica_fengsu_zhong, C0483R.id.tica_fengsu_gao, C0483R.id.tica_fengsu_zidong})
    List<ImageView> mFengsuViews;

    @BindViews({C0483R.id.tica_ivZhilen, C0483R.id.tica_ivZhire, C0483R.id.tica_ivSongfeng, C0483R.id.tica_ivChushi})
    List<ImageView> mModeViews;

    @BindView(C0483R.id.tica_myCustomLayout)
    LandleafView myLandleafView;
    float outdoorTemperature;

    @BindView(C0483R.id.recyclerView)
    RecyclerView recyclerView;

    @BindView(C0483R.id.tica_tvTempShow)
    TextView tvTempShow;
    private String TAG = "AirControlFragment";
    private final int TYPE_T2 = 0;
    private final int TYPE_T4_1 = 1;
    private final int TYPE_T4_2 = 2;
    // T2户型空调房间名称
    String[] roomArrayT2 = {Constant.ROOM_KETING, "餐厅", "卧室1", "卧室2", "主卧"};
    // T4-1户型空调房间名称
    String[] roomArrayT4_1 = {Constant.ROOM_KETING, "卧室1", "卧室2", "主卧", "卧室3"};
    // T4-2户型空调房间名称
    String[] roomArrayT4_2 = {Constant.ROOM_KETING, "卧室1", "卧室2", "主卧"};
    int minTemp = 16;
    int maxTemp = 30;
    private int[] modeOff = {C0483R.drawable.icon_zhilen_off, C0483R.drawable.icon_zhire_off, C0483R.drawable.icon_tongfeng_off, C0483R.drawable.icon_chushi_off};
    private int[] modeOn = {C0483R.drawable.icon_zhilen_on, C0483R.drawable.icon_zhire_on, C0483R.drawable.icon_tongfeng_on, C0483R.drawable.icon_chushi_on};
    private int[] volumeOff = {C0483R.drawable.icon_fengsu_di_off, C0483R.drawable.icon_fengsu_zhong_off, C0483R.drawable.icon_fengsu_gao_off, C0483R.drawable.icon_fengsu_auto_off};
    private int[] volumeOn = {C0483R.drawable.icon_fengsu_di_on, C0483R.drawable.icon_fengsu_zhong_on, C0483R.drawable.icon_fengsu_gao_on, C0483R.drawable.icon_fengsu_auto_on};
    private AirControlHandler airControlHandler = new AirControlHandler();
    SparseIntArray modeIndexMap = new SparseIntArray();
    ArrayList<TicaInnerStatus> ticaInnerList = new ArrayList<>();
    boolean powerOn = false;
    int count = 0;
    private boolean initDeviceInfo = false;
    String[] houseType = {"T2", "T4-1", "T4-2"};

    @Override // com.dnake.desktop.base.BaseFragment
    protected int getViewID() {
        return C0483R.layout.fragment_hvac_tica;
    }

    @Override // com.dnake.desktop.base.BaseFragment
    protected void initFragment() {
        initRoomInfo(1);
        this.modeIndexMap.put(1, 0);
        this.modeIndexMap.put(2, 1);
        this.modeIndexMap.put(4, 2);
        this.modeIndexMap.put(5, 3);
        initNtInfo();
    }

    @Override // me.yokeyword.fragmentation.SupportFragment, androidx.fragment.app.Fragment
    public void onHiddenChanged(boolean z) {
        super.onHiddenChanged(z);
        if (z) {
            return;
        }
        CommonUtils.getInstance().readInThread(this.airControlHandler);
    }

    @OnClick({C0483R.id.tica_ivPower, C0483R.id.tica_ivMinus, C0483R.id.tica_ivPlus, C0483R.id.tica_ivZhilen, C0483R.id.tica_ivZhire, C0483R.id.tica_ivSongfeng, C0483R.id.tica_ivChushi, C0483R.id.tica_fengsu_di, C0483R.id.tica_fengsu_zhong, C0483R.id.tica_fengsu_gao, C0483R.id.tica_fengsu_zidong})
    public void onClickView(View view) {
        switch (view.getId()) {
            case C0483R.id.tica_fengsu_di /* 2131231045 */:
                CommonUtils.getInstance().writeInThread(2, 0, this.airControlHandler);
                break;
            case C0483R.id.tica_fengsu_gao /* 2131231046 */:
                CommonUtils.getInstance().writeInThread(2, 2, this.airControlHandler);
                break;
            case C0483R.id.tica_fengsu_zhong /* 2131231047 */:
                CommonUtils.getInstance().writeInThread(2, 1, this.airControlHandler);
                break;
            case C0483R.id.tica_fengsu_zidong /* 2131231048 */:
                CommonUtils.getInstance().writeInThread(2, 3, this.airControlHandler);
                break;
            case C0483R.id.tica_ivChushi /* 2131231049 */:
                if (!this.airControlHandler.handlerAirModeConflict(5)) {
                    showWarnToast(getActivity(), "与当前运行模式冲突！不可设");
                    break;
                } else {
                    CommonUtils.getInstance().writeInThread(0, 5, this.airControlHandler);
                    break;
                }
            case C0483R.id.tica_ivMinus /* 2131231050 */:
                int i = this.currentTemp - 1;
                this.currentTemp = i;
                int i2 = this.minTemp;
                if (i <= i2) {
                    this.currentTemp = i2;
                }
                CommonUtils.getInstance().writeInThread(1, this.currentTemp, this.airControlHandler);
                break;
            case C0483R.id.tica_ivPlus /* 2131231051 */:
                int i3 = this.currentTemp + 1;
                this.currentTemp = i3;
                int i4 = this.maxTemp;
                if (i3 > i4) {
                    this.currentTemp = i4;
                }
                CommonUtils.getInstance().writeInThread(1, this.currentTemp, this.airControlHandler);
                break;
            case C0483R.id.tica_ivPower /* 2131231052 */:
                CommonUtils.getInstance().writeInThread(3, this.powerOn ? 0 : 128, this.airControlHandler);
                break;
            case C0483R.id.tica_ivSongfeng /* 2131231053 */:
                if (!this.airControlHandler.handlerAirModeConflict(4)) {
                    showWarnToast(getActivity(), "与当前运行模式冲突！不可设");
                    break;
                } else {
                    CommonUtils.getInstance().writeInThread(0, 4, this.airControlHandler);
                    break;
                }
            case C0483R.id.tica_ivZhilen /* 2131231054 */:
                if (!this.airControlHandler.handlerAirModeConflict(1)) {
                    showWarnToast(getActivity(), "与当前运行模式冲突！不可设");
                    break;
                } else {
                    CommonUtils.getInstance().writeInThread(0, 1, this.airControlHandler);
                    break;
                }
            case C0483R.id.tica_ivZhire /* 2131231055 */:
                if (!this.airControlHandler.handlerAirModeConflict(2)) {
                    showWarnToast(getActivity(), "与当前运行模式冲突！不可设");
                    break;
                } else {
                    CommonUtils.getInstance().writeInThread(0, 2, this.airControlHandler);
                    break;
                }
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void readAirStatus(TicaInnerStatus ticaInnerStatus) {
        Log.d(this.TAG, "readAirStatus TicaInnerStatus:" + ticaInnerStatus);
        this.powerOn = ticaInnerStatus.isPowerSetting();
        this.ivPower.setImageResource(ticaInnerStatus.isPowerSetting() ? C0483R.drawable.icon_power_on : C0483R.drawable.icon_power_off);
        setModeSelected(ticaInnerStatus.getSettingMode());
        setVolumeSelected(ticaInnerStatus.getSettingWindSpeed());
        if (this.currentTemp != ticaInnerStatus.getSettingTemp()) {
            int settingTemp = ticaInnerStatus.getSettingTemp();
            this.currentTemp = settingTemp;
            this.myLandleafView.setProgress(settingTemp, 16.0f, 30.0f, this.colorLevelGood, getString(C0483R.string.str_level_shushi));
        }
        this.tvTempShow.setText(ticaInnerStatus.getReturnAirTemperature() + getString(C0483R.string.str_unit_sheshidu));
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void writeAirStatus(NtWriteResult ntWriteResult) {
        Log.d(this.TAG, "writeAirStatus NtWriteResult:" + ntWriteResult);
        if (ntWriteResult.isWriteWind()) {
            return;
        }
        int value = (int) ntWriteResult.getValue();
        if (ntWriteResult.getAddress() == 3) {
            boolean z = (value & 128) == 128;
            this.powerOn = z;
            this.ivPower.setImageResource(z ? C0483R.drawable.icon_power_on : C0483R.drawable.icon_power_off);
        }
        if (ntWriteResult.getAddress() == 0) {
            setModeSelected(value);
        }
        if (ntWriteResult.getAddress() == 2) {
            setVolumeSelected(value);
        }
        if (ntWriteResult.getAddress() == 1) {
            this.myLandleafView.setProgress(value, 16.0f, 30.0f, this.colorLevelGood, getString(C0483R.string.str_level_shushi));
        }
        if (ntWriteResult.getAddress() == 100) {
            this.outdoorTemperature = ntWriteResult.getValue();
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void readSensor(ReadDeviceStatus readDeviceStatus) {
        Log.d(this.TAG, "readDeviceStatus:" + readDeviceStatus);
        CommonUtils.getInstance().uploadAllAirStatus(this.airControlHandler);
        CommonUtils.getInstance().readInThread(this.airControlHandler);
        if (!this.initDeviceInfo) {
            initNtInfo();
        }
        if (this.count % 480 == 0) {
            CommonUtils.getInstance().uploadBugInThread(this.airControlHandler);
        }
        this.count++;
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void sceneControl(SceneControlBean sceneControlBean) throws InterruptedException {
        Log.d("AirControlFragment", "sceneControl:" + sceneControlBean);
        if (sceneControlBean.getModeIndex() == 0) {
            this.currentTicaStatus.setPowerSetting(false);
            CommonUtils.getInstance().writeAirMultiple(null, this.airControlHandler, this.currentTicaStatus);
            if (sceneControlBean.isDelayControl()) {
                return;
            }
            Iterator<TicaInnerStatus> it = this.ticaInnerList.iterator();
            while (it.hasNext()) {
                TicaInnerStatus next = it.next();
                this.airControlHandler.uploadSceneWrite(next.getDeviceSn(), next, true);
            }
            return;
        }
        if (sceneControlBean.getModeIndex() == 1) {
            this.currentTicaStatus.setPowerSetting(true);
            this.currentTicaStatus.setSettingMode(this.outdoorTemperature < 20.0f ? 2 : 1);
            this.currentTicaStatus.setSettingTemp(26);
            this.currentTicaStatus.setSettingWindSpeed(3);
            CommonUtils.getInstance().writeAirMultiple(null, this.airControlHandler, this.currentTicaStatus);
            if (sceneControlBean.isDelayControl()) {
                return;
            }
            Iterator<TicaInnerStatus> it2 = this.ticaInnerList.iterator();
            while (it2.hasNext()) {
                this.airControlHandler.uploadSceneWrite(it2.next().getDeviceSn(), this.currentTicaStatus, false);
            }
            return;
        }
        if (sceneControlBean.getModeIndex() == 2) {
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            Iterator<TicaInnerStatus> it3 = this.ticaInnerList.iterator();
            while (it3.hasNext()) {
                TicaInnerStatus next2 = it3.next();
                if (next2.getRoomName().contains("卧")) {
                    arrayList.add(Integer.valueOf(next2.getMachineNo()));
                } else {
                    arrayList2.add(Integer.valueOf(next2.getMachineNo()));
                }
            }
            this.currentTicaStatus.setPowerSetting(false);
            CommonUtils.getInstance().writeAirMultiple(arrayList2, this.airControlHandler, this.currentTicaStatus.m81clone());
            try {
                Thread.sleep(300L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            this.currentTicaStatus.setPowerSetting(true);
            this.currentTicaStatus.setSettingMode(this.outdoorTemperature >= 20.0f ? 1 : 2);
            this.currentTicaStatus.setSettingTemp(26);
            this.currentTicaStatus.setSettingWindSpeed(0);
            CommonUtils.getInstance().writeAirMultiple(arrayList, this.airControlHandler, this.currentTicaStatus);
            if (sceneControlBean.isDelayControl()) {
                return;
            }
            Iterator<TicaInnerStatus> it4 = this.ticaInnerList.iterator();
            while (it4.hasNext()) {
                this.airControlHandler.uploadSceneWrite(it4.next().getDeviceSn(), this.currentTicaStatus, !r0.getRoomName().contains("卧"));
            }
            return;
        }
        if (sceneControlBean.getModeIndex() == 3) {
            ArrayList arrayList3 = new ArrayList();
            ArrayList arrayList4 = new ArrayList();
            Iterator<TicaInnerStatus> it5 = this.ticaInnerList.iterator();
            while (it5.hasNext()) {
                TicaInnerStatus next3 = it5.next();
                if (next3.getRoomName().contains("客") || next3.getRoomName().contains("起居") || next3.getRoomName().contains("餐")) {
                    arrayList3.add(Integer.valueOf(next3.getMachineNo()));
                } else {
                    arrayList4.add(Integer.valueOf(next3.getMachineNo()));
                }
            }
            this.currentTicaStatus.setPowerSetting(false);
            CommonUtils.getInstance().writeAirMultiple(arrayList4, this.airControlHandler, this.currentTicaStatus.m81clone());
            try {
                Thread.sleep(300L);
            } catch (InterruptedException e2) {
                e2.printStackTrace();
            }
            this.currentTicaStatus.setPowerSetting(true);
            this.currentTicaStatus.setSettingMode(this.outdoorTemperature >= 20.0f ? 1 : 2);
            this.currentTicaStatus.setSettingTemp(23);
            this.currentTicaStatus.setSettingWindSpeed(2);
            CommonUtils.getInstance().writeAirMultiple(arrayList3, this.airControlHandler, this.currentTicaStatus.m81clone());
            if (sceneControlBean.isDelayControl()) {
                return;
            }
            Iterator<TicaInnerStatus> it6 = this.ticaInnerList.iterator();
            while (it6.hasNext()) {
                TicaInnerStatus next4 = it6.next();
                this.airControlHandler.uploadSceneWrite(next4.getDeviceSn(), this.currentTicaStatus, (next4.getRoomName().contains("客") || next4.getRoomName().contains("起居") || next4.getRoomName().contains("餐")) ? false : true);
            }
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void remoteControl(MqttMsgBodyModel mqttMsgBodyModel) throws NumberFormatException {
        Log.d(this.TAG, "remoteControl MqttMsgBodyModel:" + mqttMsgBodyModel);
        if (mqttMsgBodyModel.getPayload().getData().getProductCode() == 8200) {
            for (MqttRemoteControl mqttRemoteControl : CommonUtils.getInstance().parseRemoteInfo(mqttMsgBodyModel)) {
                Log.d(this.TAG, "remoteControl mqttRemoteControl:" + mqttRemoteControl);
                if (mqttRemoteControl.getControlAddress() == 0 && mqttRemoteControl.getControlValue() != 5 && !this.airControlHandler.handlerAirModeConflict(mqttRemoteControl.getControlValue())) {
                    MqttExecutor.getInstance().sendCommonReturnMsg(mqttMsgBodyModel, 500, "与当前运行模式冲突！不可设");
                } else {
                    MqttExecutor.getInstance().sendCommonReturnMsg(mqttMsgBodyModel);
                    String deviceSn = mqttRemoteControl.getDeviceSn();
                    int i = Integer.parseInt(deviceSn.substring(deviceSn.length() - 1, deviceSn.length()));
                    this.airControlHandler.setMachineNo(i);
                    TicaInnerStatus showTicaStatus = this.airControlHandler.getShowTicaStatus(i);
                    if (showTicaStatus != null) {
                        readAirStatus(showTicaStatus);
                    }
                    this.adapter.setSelectPosition(i - 1);
                    this.adapter.notifyDataSetChanged();
                    CommonUtils.getInstance().writeInThread(mqttRemoteControl.getControlAddress(), mqttRemoteControl.getControlValue(), this.airControlHandler);
                }
            }
        }
    }

    @Subscribe(sticky = MqttConnectOptions.CLEAN_SESSION_DEFAULT, threadMode = ThreadMode.MAIN)
    public void updateDeviceInfo(List<RoomModel> list) {
        Log.d("AirControlFragment", "updateDeviceInfo");
        this.ticaInnerList.clear();
        for (RoomModel roomModel : list) {
            List<DeviceModel> devices = roomModel.getDevices();
            String roomName = roomModel.getRoomName();
            for (DeviceModel deviceModel : devices) {
                if (deviceModel.getProductCode() == 8200) {
                    String deviceSn = deviceModel.getDeviceSn();
                    this.ticaInnerList.add(new TicaInnerStatus(getNoBySn(deviceSn), roomName, deviceSn));
                }
            }
        }
        Collections.sort(this.ticaInnerList, new Comparator<TicaInnerStatus>() { // from class: com.dnake.desktop.fragment.AirControlFragment.1
            @Override // java.util.Comparator
            public int compare(TicaInnerStatus ticaInnerStatus, TicaInnerStatus ticaInnerStatus2) {
                return ticaInnerStatus.getMachineNo() - ticaInnerStatus2.getMachineNo();
            }
        });
        Log.d("AirControlFragment", "ticaInnerList:" + this.ticaInnerList);
        this.adapter.notifyDataSetChanged();
        TicaInnerStatus ticaInnerStatus = this.ticaInnerList.get(0);
        this.currentTicaStatus = ticaInnerStatus;
        this.airControlHandler.setTicaInnerStatus(ticaInnerStatus);
        this.airControlHandler.setDeviceList(this.ticaInnerList);
    }

    private int getNoBySn(String str) {
        return Integer.valueOf(str.substring(str.length() - 1, str.length())).intValue();
    }

    private void initRoomInfo(int i) {
        VariableConstant.HOUSE_TYPE = this.houseType[i];
        if (i == 0) {
            int i2 = 0;
            while (true) {
                String[] strArr = this.roomArrayT2;
                if (i2 >= strArr.length) {
                    break;
                }
                int i3 = i2 + 1;
                this.ticaInnerList.add(new TicaInnerStatus(i3, strArr[i2]));
                i2 = i3;
            }
        }
        if (i == 1) {
            int i4 = 0;
            while (true) {
                String[] strArr2 = this.roomArrayT4_1;
                if (i4 >= strArr2.length) {
                    break;
                }
                int i5 = i4 + 1;
                this.ticaInnerList.add(new TicaInnerStatus(i5, strArr2[i4]));
                i4 = i5;
            }
        }
        if (i == 2) {
            int i6 = 0;
            while (true) {
                String[] strArr3 = this.roomArrayT4_2;
                if (i6 >= strArr3.length) {
                    break;
                }
                int i7 = i6 + 1;
                this.ticaInnerList.add(new TicaInnerStatus(i7, strArr3[i6]));
                i6 = i7;
            }
        }
        TicaInnerStatus ticaInnerStatus = this.ticaInnerList.get(0);
        this.currentTicaStatus = ticaInnerStatus;
        this.airControlHandler.setTicaInnerStatus(ticaInnerStatus);
        this.airControlHandler.setDeviceList(this.ticaInnerList);
        this.recyclerView.setLayoutManager(new LinearLayoutManager(getActivity(), 0, false));
        RoomAdapter roomAdapter = new RoomAdapter(getActivity(), this.ticaInnerList, this.airControlHandler);
        this.adapter = roomAdapter;
        this.recyclerView.setAdapter(roomAdapter);
    }

    public void setVolumeSelected(int i) {
        int i2 = 0;
        while (i2 < this.mFengsuViews.size()) {
            this.mFengsuViews.get(i2).setImageResource(i2 == i ? this.volumeOn[i2] : this.volumeOff[i2]);
            i2++;
        }
    }

    public void setModeSelected(int i) {
        int i2 = this.modeIndexMap.get(i);
        int i3 = 0;
        while (i3 < this.mModeViews.size()) {
            this.mModeViews.get(i3).setImageResource(i3 == i2 ? this.modeOn[i3] : this.modeOff[i3]);
            i3++;
        }
    }

    private void initNtInfo() {
        ApiFactory.getNetApi().getFloorDeviceList().subscribeOn(Schedulers.m42io()).subscribe(new Consumer<NetResponse<List<FloorModel>>>() { // from class: com.dnake.desktop.fragment.AirControlFragment.2
            @Override // io.reactivex.functions.Consumer
            public void accept(NetResponse<List<FloorModel>> netResponse) throws Exception {
                EventBus.getDefault().postSticky(netResponse.data.get(0).getRooms());
                AirControlFragment.this.initDeviceInfo = true;
            }
        }, new Consumer<Throwable>() { // from class: com.dnake.desktop.fragment.AirControlFragment.3
            @Override // io.reactivex.functions.Consumer
            public void accept(Throwable th) throws Exception {
                Log.d(AirControlFragment.this.TAG, "initNtInfo:" + th.toString());
                AirControlFragment.this.initDeviceInfo = false;
            }
        });
    }
}
