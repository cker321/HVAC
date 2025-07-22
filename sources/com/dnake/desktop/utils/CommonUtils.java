package com.dnake.desktop.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import com.bigkoo.pickerview.builder.TimePickerBuilder;
import com.bigkoo.pickerview.listener.CustomListener;
import com.bigkoo.pickerview.listener.OnTimeSelectListener;
import com.bigkoo.pickerview.view.TimePickerView;
import com.contrarywind.view.WheelView;
import com.dnake.desktop.App;
import com.dnake.desktop.C0483R;
import com.dnake.desktop.bean.MqttRemoteControl;
import com.dnake.desktop.bean.TicaInnerStatus;
import com.dnake.desktop.callback.Rs485Callback;
import com.dnake.desktop.callback.SceneSleepClicked;
import com.dnake.desktop.costant.Constant;
import com.dnake.desktop.handler.AirControlHandler;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.landleaf.smarthome.device.AttributeTagConst;
import com.landleaf.smarthome.model.DeviceAttribute;
import com.landleaf.smarthome.net.hardware.ProtocolUtils;
import com.landleaf.smarthome.net.mqtt.bean.MqttMsgBodyModel;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class CommonUtils {
    TimePickerView pvCustomTime;

    private CommonUtils() {
    }

    public static CommonUtils getInstance() {
        return ViewHolder.instance;
    }

    static class ViewHolder {
        private static CommonUtils instance = new CommonUtils();

        ViewHolder() {
        }
    }

    public void read(Rs485Callback rs485Callback) {
        rs485Callback.read();
    }

    public void readInThread(final Rs485Callback rs485Callback) {
        ThreadPoolManager.getInstance().submitJob(new Runnable() { // from class: com.dnake.desktop.utils.CommonUtils.1
            @Override // java.lang.Runnable
            public void run() {
                rs485Callback.read();
            }
        }, 10, "read_nt_thread");
    }

    public void writeInThread(final int i, final int i2, final Rs485Callback rs485Callback) {
        ThreadPoolManager.getInstance().submitJob(new Runnable() { // from class: com.dnake.desktop.utils.CommonUtils.2
            @Override // java.lang.Runnable
            public void run() {
                rs485Callback.write(i, i2);
            }
        }, 10, "write_nt_thread");
    }

    public void writeAirMultiple(final List<Integer> list, final AirControlHandler airControlHandler, final TicaInnerStatus ticaInnerStatus) {
        ThreadPoolManager.getInstance().submitJob(new Runnable() { // from class: com.dnake.desktop.utils.CommonUtils.3
            @Override // java.lang.Runnable
            public void run() {
                airControlHandler.writeSceneMultiple(list, ticaInnerStatus);
            }
        }, 10, "write_nt_multiple_thread");
    }

    public void uploadAllAirStatus(final AirControlHandler airControlHandler) {
        ThreadPoolManager.getInstance().submitJob(new Runnable() { // from class: com.dnake.desktop.utils.CommonUtils.4
            @Override // java.lang.Runnable
            public void run() {
                airControlHandler.upload();
            }
        }, 10, "write_nt_multiple_thread");
    }

    public void uploadBugInThread(final Rs485Callback rs485Callback) {
        ThreadPoolManager.getInstance().submitJob(new Runnable() { // from class: com.dnake.desktop.utils.CommonUtils.5
            @Override // java.lang.Runnable
            public void run() {
                rs485Callback.uploadDeviceBug();
            }
        }, 10, "upload_nt_bug");
    }

    public boolean isNumber(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return str.matches("(-)?\\d+(\\.\\d+)?");
    }

    public List<MqttRemoteControl> parseRemoteInfo(MqttMsgBodyModel mqttMsgBodyModel) {
        int productCode = mqttMsgBodyModel.getPayload().getData().getProductCode();
        String deviceSn = mqttMsgBodyModel.getPayload().getData().getDeviceSn();
        List<DeviceAttribute> items = mqttMsgBodyModel.getPayload().getData().getItems();
        Map<String, Integer> attTagAdd = ProtocolUtils.getDeviceModel4ProductTag(productCode, App.instance).getAttTagAdd();
        ArrayList arrayList = new ArrayList();
        for (DeviceAttribute deviceAttribute : items) {
            MqttRemoteControl mqttRemoteControl = new MqttRemoteControl(deviceSn, productCode);
            String attrTag = deviceAttribute.getAttrTag();
            mqttRemoteControl.setControlAddress(attTagAdd.get(attrTag).intValue());
            mqttRemoteControl.setControlValue(getWindValue4AttrValue(productCode, attrTag, deviceAttribute.getAttrValue()));
            arrayList.add(mqttRemoteControl);
        }
        return arrayList;
    }

    private int getWindValue4AttrValue(int i, String str, String str2) {
        if (AttributeTagConst.SWITCH.equals(str) || AttributeTagConst.HUMI_ENABLE.equals(str)) {
            if ("on".equals(str2)) {
                return i == 7107 ? 1 : 128;
            }
            if ("off".equals(str2)) {
                return 0;
            }
        }
        if (AttributeTagConst.SYS_MODE.equals(str)) {
            if ("dehumidification".equals(str2)) {
                return i == 7107 ? 2 : 5;
            }
            if ("cold".equals(str2)) {
                return 1;
            }
            if ("hot".equals(str2)) {
                return i == 7107 ? 3 : 2;
            }
            if ("wind".equals(str2)) {
                return i == 7107 ? 0 : 4;
            }
            if (Constant.ATTR_MODE_AUTO.equals(str2)) {
                return 4;
            }
        }
        if (AttributeTagConst.WIND_SPEED.equals(str)) {
            if ("low_speed".equals(str2)) {
                return i == 7107 ? 2 : 0;
            }
            if ("medium_speed".equals(str2)) {
                return 1;
            }
            if ("high_speed".equals(str2)) {
                return i == 7107 ? 0 : 2;
            }
            if (Constant.ATTR_SPEED_AUTO.equals(str2)) {
                return 3;
            }
        }
        if (AttributeTagConst.TEMP_SETTING.equals(str) && isNumber(str2)) {
            return Integer.valueOf(str2).intValue();
        }
        return 0;
    }

    public String getWeekOfDate(Date date) {
        String[] strArr = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int i = calendar.get(7) - 1;
        if (i < 0) {
            i = 0;
        }
        return strArr[i];
    }

    public void showSetSleepTimeDialog(Context context, final SceneSleepClicked sceneSleepClicked) {
        Calendar calendar = Calendar.getInstance();
        Calendar.getInstance().set(2014, 1, 23);
        Calendar.getInstance().set(2027, 2, 28);
        TimePickerView timePickerViewBuild = new TimePickerBuilder(context, new OnTimeSelectListener() { // from class: com.dnake.desktop.utils.CommonUtils.6
            @Override // com.bigkoo.pickerview.listener.OnTimeSelectListener
            public void onTimeSelect(Date date, View view) {
                sceneSleepClicked.timeSelected(date);
            }
        }).isDialog(true).setDate(calendar).setLayoutRes(C0483R.layout.dialog_set_time, new CustomListener() { // from class: com.dnake.desktop.utils.-$$Lambda$CommonUtils$AwE6iQwsGLtu5Tt9VKm83W7IEOM
            @Override // com.bigkoo.pickerview.listener.CustomListener
            public final void customLayout(View view) {
                this.f$0.lambda$showSetSleepTimeDialog$2$CommonUtils(sceneSleepClicked, view);
            }
        }).setContentTextSize(25).setDividerType(WheelView.DividerType.WRAP).setOutSideCancelable(false).setType(new boolean[]{false, false, false, true, true, false}).setLineSpacingMultiplier(1.2f).setTextXOffset(0, 0, 0, 0, 0, 0).isCenterLabel(false).setDividerColor(Color.parseColor("#2f3032")).setBgColor(Color.parseColor("#2f3032")).setTextColorCenter(Color.parseColor("#1eac29")).build();
        this.pvCustomTime = timePickerViewBuild;
        timePickerViewBuild.show();
    }

    public /* synthetic */ void lambda$showSetSleepTimeDialog$2$CommonUtils(final SceneSleepClicked sceneSleepClicked, View view) {
        TextView textView = (TextView) view.findViewById(C0483R.id.btnSure);
        TextView textView2 = (TextView) view.findViewById(C0483R.id.btnCancal);
        textView.setOnClickListener(new View.OnClickListener() { // from class: com.dnake.desktop.utils.-$$Lambda$CommonUtils$Yl9a2yo8K0aqgN4jxy4WjhJ2wuw
            @Override // android.view.View.OnClickListener
            public final void onClick(View view2) {
                this.f$0.lambda$null$0$CommonUtils(sceneSleepClicked, view2);
            }
        });
        textView2.setOnClickListener(new View.OnClickListener() { // from class: com.dnake.desktop.utils.-$$Lambda$CommonUtils$EEaiBdBuPJqF5-nEUWmE7dimvPI
            @Override // android.view.View.OnClickListener
            public final void onClick(View view2) {
                this.f$0.lambda$null$1$CommonUtils(sceneSleepClicked, view2);
            }
        });
    }

    public /* synthetic */ void lambda$null$0$CommonUtils(SceneSleepClicked sceneSleepClicked, View view) {
        this.pvCustomTime.returnData();
        this.pvCustomTime.dismiss();
        sceneSleepClicked.viewClick(true);
    }

    public /* synthetic */ void lambda$null$1$CommonUtils(SceneSleepClicked sceneSleepClicked, View view) {
        this.pvCustomTime.dismiss();
        sceneSleepClicked.viewClick(false);
    }

    public Bitmap create2DCode(String str) throws WriterException {
        BitMatrix bitMatrixEncode = new MultiFormatWriter().encode(str, BarcodeFormat.QR_CODE, 300, 300);
        int width = bitMatrixEncode.getWidth();
        int height = bitMatrixEncode.getHeight();
        int[] iArr = new int[width * height];
        for (int i = 0; i < height; i++) {
            for (int i2 = 0; i2 < width; i2++) {
                if (bitMatrixEncode.get(i2, i)) {
                    iArr[(i * width) + i2] = -16777216;
                } else {
                    iArr[(i * width) + i2] = -1;
                }
            }
        }
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        bitmapCreateBitmap.setPixels(iArr, 0, width, 0, 0, width, height);
        return bitmapCreateBitmap;
    }

    public Date addDay(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(5, 1);
        return calendar.getTime();
    }
}
