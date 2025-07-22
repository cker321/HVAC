package com.dnake.desktop.fragment;

import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import butterknife.BindColor;
import butterknife.BindString;
import butterknife.BindView;
import butterknife.BindViews;
import butterknife.OnClick;
import com.dnake.desktop.C0483R;
import com.dnake.desktop.base.BaseFragment;
import com.dnake.desktop.bean.NtWriteResult;
import com.dnake.desktop.bean.ReadDeviceStatus;
import com.dnake.desktop.bean.TicaInnerStatus;
import com.dnake.desktop.bean.WindStatus;
import com.dnake.desktop.costant.Constant;
import com.dnake.desktop.handler.WindControlHandler;
import com.dnake.desktop.utils.CommonUtils;
import com.dnake.desktop.utils.PreferencesUtils;
import com.dnake.desktop.widget.LandleafView;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.model.RoomModel;
import com.landleaf.smarthome.model.SceneControlBean;
import java.util.List;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/* loaded from: classes.dex */
public class WindControlFragment extends BaseFragment {

    @BindColor(C0483R.color.colorLevelGood)
    int colorLevelGood;

    @BindColor(C0483R.color.colorLevelMedium)
    int colorLevelMedium;
    int currentAirMode;

    @BindView(C0483R.id.ivJiashi)
    ImageView ivJiashi;

    @BindViews({C0483R.id.ivTongfeng, C0483R.id.ivXiaji, C0483R.id.ivChushi, C0483R.id.ivDongji, C0483R.id.ivZhineng})
    ImageView[] ivModes;

    @BindView(C0483R.id.ivPower)
    ImageView ivPower;

    @BindViews({C0483R.id.ivGao, C0483R.id.ivZhong, C0483R.id.ivDi})
    ImageView[] ivVolumes;

    @BindView(C0483R.id.myCustomLayout)
    LandleafView myCustomLayout;
    float outdoorTemperature;
    float showTemp;

    @BindString(C0483R.string.str_level_lianghao)
    String strLianghao;

    @BindString(C0483R.string.str_level_shushi)
    String strShushi;
    float windHumidity;
    private String TAG = "WindControlFragment";
    private int[] modeOff = {C0483R.drawable.icon_tongfeng_off, C0483R.drawable.icon_zhilen_off, C0483R.drawable.icon_chushi_off, C0483R.drawable.icon_zhire_off, C0483R.drawable.icon_fengsu_auto_off};
    private int[] modeOn = {C0483R.drawable.icon_tongfeng_on, C0483R.drawable.icon_zhilen_on, C0483R.drawable.icon_chushi_on, C0483R.drawable.icon_zhire_on, C0483R.drawable.icon_fengsu_auto_on};
    private int[] volumeOff = {C0483R.drawable.icon_gao_off, C0483R.drawable.icon_zhong_off, C0483R.drawable.icon_di_off};
    private int[] volumeOn = {C0483R.drawable.icon_gao_on, C0483R.drawable.icon_zhong_on, C0483R.drawable.icon_di_on};
    private WindControlHandler windControlHandler = new WindControlHandler();
    boolean powerOn = false;
    boolean jiashiOn = false;
    int currentMode = 0;
    int count = 0;

    private int getWindSpeedByCO2(float f) {
        if (f > 800.0f) {
            return 0;
        }
        return f < 600.0f ? 2 : 1;
    }

    @Override // com.dnake.desktop.base.BaseFragment
    protected int getViewID() {
        return C0483R.layout.fragment_hvac_wind;
    }

    @Override // com.dnake.desktop.base.BaseFragment
    protected void initFragment() {
    }

    @Override // me.yokeyword.fragmentation.SupportFragment, androidx.fragment.app.Fragment
    public void onHiddenChanged(boolean z) {
        super.onHiddenChanged(z);
        if (z) {
            return;
        }
        CommonUtils.getInstance().readInThread(this.windControlHandler);
    }

    @OnClick({C0483R.id.ivPower, C0483R.id.ivGao, C0483R.id.ivZhong, C0483R.id.ivDi, C0483R.id.ivXiaji, C0483R.id.ivDongji, C0483R.id.ivTongfeng, C0483R.id.ivChushi, C0483R.id.ivZhineng, C0483R.id.ivJiashi})
    public void onClickView(View view) {
        switch (view.getId()) {
            case C0483R.id.ivChushi /* 2131230888 */:
                CommonUtils.getInstance().writeInThread(51, 2, this.windControlHandler);
                break;
            case C0483R.id.ivDi /* 2131230889 */:
                CommonUtils.getInstance().writeInThread(52, 2, this.windControlHandler);
                break;
            case C0483R.id.ivDongji /* 2131230890 */:
                if (this.currentAirMode == 1) {
                    showWarnToast(getActivity(), "当前空调为制冷模式！新风模式修改无效！");
                    break;
                } else {
                    CommonUtils.getInstance().writeInThread(51, 3, this.windControlHandler);
                    break;
                }
            case C0483R.id.ivGao /* 2131230891 */:
                CommonUtils.getInstance().writeInThread(52, 0, this.windControlHandler);
                break;
            case C0483R.id.ivJiashi /* 2131230892 */:
                if (this.currentMode != 3 && !this.jiashiOn) {
                    showWarnToast(getActivity(), "只有制热模式可开启加湿！");
                    break;
                } else {
                    CommonUtils.getInstance().writeInThread(53, !this.jiashiOn ? 1 : 0, this.windControlHandler);
                    break;
                }
            case C0483R.id.ivPower /* 2131230893 */:
                CommonUtils.getInstance().writeInThread(50, !this.powerOn ? 1 : 0, this.windControlHandler);
                break;
            case C0483R.id.ivTongfeng /* 2131230895 */:
                CommonUtils.getInstance().writeInThread(51, 0, this.windControlHandler);
                break;
            case C0483R.id.ivXiaji /* 2131230897 */:
                if (this.currentAirMode == 2) {
                    showWarnToast(getActivity(), "当前空调为制热模式！新风模式修改无效！");
                    break;
                } else {
                    CommonUtils.getInstance().writeInThread(51, 1, this.windControlHandler);
                    break;
                }
            case C0483R.id.ivZhineng /* 2131230898 */:
                CommonUtils.getInstance().writeInThread(51, 4, this.windControlHandler);
                break;
            case C0483R.id.ivZhong /* 2131230899 */:
                CommonUtils.getInstance().writeInThread(52, 1, this.windControlHandler);
                break;
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void readWindStatus(WindStatus windStatus) {
        Log.d(this.TAG, "windStatus:" + windStatus);
        if (windStatus.isTypeTemp()) {
            setTemp(windStatus.getShowTemp());
            this.windHumidity = windStatus.getWindHumidity();
        } else {
            setModeIcons(windStatus.getMode());
            setVolumeIcons(windStatus.getWindSpeed());
            setPowerIcon(windStatus.getPower());
            setJiashiIcon(windStatus.getHumiditySwitch());
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void writeWindStatus(NtWriteResult ntWriteResult) {
        if (!ntWriteResult.isWriteWind()) {
            if (ntWriteResult.getAddress() == 0) {
                int value = (int) ntWriteResult.getValue();
                this.currentAirMode = value;
                if (value == 2 || value == 1) {
                    CommonUtils.getInstance().writeInThread(51, this.currentAirMode == 2 ? 3 : 1, this.windControlHandler);
                }
            }
            if (ntWriteResult.getAddress() == 100) {
                this.outdoorTemperature = ntWriteResult.getValue();
                return;
            }
            return;
        }
        int value2 = (int) ntWriteResult.getValue();
        if (ntWriteResult.getAddress() == 50) {
            setPowerIcon(value2);
        }
        if (ntWriteResult.getAddress() == 51) {
            setModeIcons(value2);
        }
        if (ntWriteResult.getAddress() == 52) {
            setVolumeIcons(value2);
        }
        if (ntWriteResult.getAddress() == 53) {
            setJiashiIcon(value2);
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void readAirStatus(TicaInnerStatus ticaInnerStatus) {
        this.currentAirMode = ticaInnerStatus.getSettingMode();
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void sceneControl(SceneControlBean sceneControlBean) {
        if (sceneControlBean.isDelayControl()) {
            return;
        }
        if (sceneControlBean.getModeIndex() == 0) {
            CommonUtils.getInstance().writeInThread(50, 0, this.windControlHandler);
            return;
        }
        if (!this.powerOn) {
            CommonUtils.getInstance().writeInThread(50, 1, this.windControlHandler);
        }
        int modeByTempHumidity = getModeByTempHumidity();
        if (sceneControlBean.getModeIndex() == 1) {
            CommonUtils.getInstance().writeInThread(52, getWindSpeedByCO2(PreferencesUtils.getInstance(getActivity()).readFloat(Constant.SENSOR_CO2, 800.0f)), this.windControlHandler);
            CommonUtils.getInstance().writeInThread(51, modeByTempHumidity, this.windControlHandler);
        }
        if (sceneControlBean.getModeIndex() == 2) {
            CommonUtils.getInstance().writeInThread(52, 2, this.windControlHandler);
            CommonUtils.getInstance().writeInThread(51, modeByTempHumidity, this.windControlHandler);
        }
        if (sceneControlBean.getModeIndex() == 3) {
            CommonUtils.getInstance().writeInThread(52, 0, this.windControlHandler);
            CommonUtils.getInstance().writeInThread(51, modeByTempHumidity, this.windControlHandler);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00be A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a8 A[SYNTHETIC] */
    @org.greenrobot.eventbus.Subscribe(threadMode = org.greenrobot.eventbus.ThreadMode.MAIN)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public void remoteControl(com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel r10) {
        /*
            r9 = this;
            java.lang.String r0 = r9.TAG
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "remoteControl MqttMsgBodyModel:"
            r1.append(r2)
            r1.append(r10)
            java.lang.String r1 = r1.toString()
            android.util.Log.d(r0, r1)
            com.landleaf.smarthome.net.mqtt.bean.MqttPayloadModel r0 = r10.getPayload()
            com.landleaf.smarthome.net.mqtt.bean.MqttDataModel r0 = r0.getData()
            int r0 = r0.getProductCode()
            r1 = 7107(0x1bc3, float:9.959E-42)
            if (r0 != r1) goto Ld8
            com.dnake.desktop.utils.CommonUtils r0 = com.dnake.desktop.utils.CommonUtils.getInstance()
            java.util.List r0 = r0.parseRemoteInfo(r10)
            java.util.Iterator r0 = r0.iterator()
        L32:
            boolean r1 = r0.hasNext()
            if (r1 == 0) goto Ld8
            java.lang.Object r1 = r0.next()
            com.dnake.desktop.bean.MqttRemoteControl r1 = (com.dnake.desktop.bean.MqttRemoteControl) r1
            java.lang.String r2 = r9.TAG
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = "remoteControl mqttRemoteControl:"
            r3.append(r4)
            r3.append(r1)
            java.lang.String r4 = ","
            r3.append(r4)
            int r4 = r9.currentAirMode
            r3.append(r4)
            java.lang.String r3 = r3.toString()
            android.util.Log.d(r2, r3)
            int r2 = r1.getControlValue()
            int r3 = r1.getControlAddress()
            r4 = 51
            r5 = 0
            r6 = 3
            r7 = 1
            java.lang.String r8 = "新风空调模式冲突，新风模式修改无效！"
            if (r3 == r4) goto L81
            r4 = 53
            if (r3 == r4) goto L74
            goto L90
        L74:
            int r3 = r9.currentMode
            if (r3 == r6) goto L7a
            if (r2 == r7) goto L7b
        L7a:
            r5 = 1
        L7b:
            if (r5 != 0) goto L7f
            java.lang.String r8 = "制热下才可加湿"
        L7f:
            r7 = r5
            goto L90
        L81:
            int r3 = r9.currentAirMode
            if (r3 != r7) goto L87
            if (r2 == r6) goto L7f
        L87:
            int r3 = r9.currentAirMode
            r4 = 2
            if (r3 != r4) goto L8e
            if (r2 == r7) goto L7f
        L8e:
            r5 = 1
            goto L7f
        L90:
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = "canControl:"
            r3.append(r4)
            r3.append(r7)
            java.lang.String r3 = r3.toString()
            java.lang.String r4 = "WindControlFragment"
            android.util.Log.d(r4, r3)
            if (r7 == 0) goto Lbe
            com.landleaf.smarthome.net.mqtt.MqttExecutor r3 = com.landleaf.smarthome.net.mqtt.MqttExecutor.getInstance()
            r3.sendCommonReturnMsg(r10)
            com.dnake.desktop.utils.CommonUtils r3 = com.dnake.desktop.utils.CommonUtils.getInstance()
            int r1 = r1.getControlAddress()
            com.dnake.desktop.handler.WindControlHandler r4 = r9.windControlHandler
            r3.writeInThread(r1, r2, r4)
            goto L32
        Lbe:
            com.landleaf.smarthome.net.mqtt.bean.MqttPayloadModel r1 = r10.getPayload()
            com.landleaf.smarthome.net.mqtt.bean.MqttDataModel r1 = r1.getData()
            java.util.List r1 = r1.getItems()
            r1.clear()
            com.landleaf.smarthome.net.mqtt.MqttExecutor r1 = com.landleaf.smarthome.net.mqtt.MqttExecutor.getInstance()
            r2 = 500(0x1f4, float:7.0E-43)
            r1.sendCommonReturnMsg(r10, r2, r8)
            goto L32
        Ld8:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.dnake.desktop.fragment.WindControlFragment.remoteControl(com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel):void");
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void readSensor(ReadDeviceStatus readDeviceStatus) {
        CommonUtils.getInstance().readInThread(this.windControlHandler);
        if (this.count % 480 == 0) {
            CommonUtils.getInstance().uploadBugInThread(this.windControlHandler);
        }
        this.count++;
    }

    @Subscribe(sticky = MqttConnectOptions.CLEAN_SESSION_DEFAULT, threadMode = ThreadMode.MAIN)
    public void updateDeviceInfo(List<RoomModel> list) {
        for (RoomModel roomModel : list) {
            if (roomModel.getRoomName().equals(Constant.ROOM_KETING)) {
                for (DeviceModel deviceModel : roomModel.getDevices()) {
                    if (deviceModel.getProductCode() == 7107) {
                        this.windControlHandler.setDeviceSn(deviceModel.getDeviceSn());
                    }
                }
            }
        }
    }

    private void setPowerIcon(int i) {
        boolean z = i == 1;
        this.powerOn = z;
        this.ivPower.setImageResource(z ? C0483R.drawable.icon_power_on : C0483R.drawable.icon_power_off);
    }

    private void setJiashiIcon(int i) {
        boolean z = i == 1;
        this.jiashiOn = z;
        this.ivJiashi.setImageResource(z ? C0483R.drawable.icon_jiashi_on : C0483R.drawable.icon_jiashi_off);
    }

    private void setModeIcons(int i) {
        this.currentMode = i;
        int i2 = 0;
        if (i != 2 && this.jiashiOn) {
            CommonUtils.getInstance().writeInThread(53, 0, this.windControlHandler);
        }
        while (true) {
            ImageView[] imageViewArr = this.ivModes;
            if (i2 >= imageViewArr.length) {
                return;
            }
            imageViewArr[i2].setImageResource(i2 == i ? this.modeOn[i] : this.modeOff[i2]);
            i2++;
        }
    }

    private void setVolumeIcons(int i) {
        int i2 = 0;
        while (true) {
            ImageView[] imageViewArr = this.ivVolumes;
            if (i2 >= imageViewArr.length) {
                return;
            }
            imageViewArr[i2].setImageResource(i2 == i ? this.volumeOn[i] : this.volumeOff[i2]);
            i2++;
        }
    }

    private void setTemp(float f) {
        if (f == this.showTemp) {
            return;
        }
        boolean z = f >= 18.0f && f <= 26.0f;
        this.myCustomLayout.setProgress((int) f, -20.0f, 50.0f, z ? this.colorLevelGood : this.colorLevelMedium, z ? this.strShushi : this.strLianghao);
        this.showTemp = f;
    }

    private int getModeByTempHumidity() {
        float f = this.outdoorTemperature;
        if (f >= 24.0f) {
            return 1;
        }
        if (f < 16.0f) {
            return 3;
        }
        return this.windHumidity > 10.0f ? 2 : 0;
    }
}
