package com.landleaf.smarthome.net.hardware;

import android.content.Context;
import android.util.Log;
import com.landleaf.smarthome.model.DeviceAttribute;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.util.rxutils.RxJavaUtils;
import com.landleaf.smarthome.util.rxutils.RxSchedulerUtils;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Predicate;
import java.util.List;

/* loaded from: classes.dex */
public class HardwareExecutor {
    private static final String TAG = "HardwareExecutor";
    private static Context context;
    private static volatile HardwareExecutor singleton;

    static /* synthetic */ boolean lambda$deviceReadAsyn$0(DeviceModel deviceModel) throws Exception {
        return deviceModel != null;
    }

    static /* synthetic */ boolean lambda$deviceWriteAsyn$3(DeviceModel deviceModel) throws Exception {
        return deviceModel != null;
    }

    private HardwareExecutor() {
    }

    public static HardwareExecutor getInstance(Context context2) {
        if (singleton == null) {
            synchronized (HardwareExecutor.class) {
                if (singleton == null) {
                    singleton = new HardwareExecutor();
                    context = context2;
                }
            }
        }
        return singleton;
    }

    public void deviceReadAsyn(final DeviceModel deviceModel) {
        RxJavaUtils.createObservable(deviceModel).compose(RxSchedulerUtils._io_io_o()).filter(new Predicate() { // from class: com.landleaf.smarthome.net.hardware.-$$Lambda$HardwareExecutor$8AUq-9oiYt_tzvA6o12tZPqr0iQ
            @Override // io.reactivex.functions.Predicate
            public final boolean test(Object obj) {
                return HardwareExecutor.lambda$deviceReadAsyn$0((DeviceModel) obj);
            }
        }).subscribe(new Consumer() { // from class: com.landleaf.smarthome.net.hardware.-$$Lambda$HardwareExecutor$i3XIfA6vey9418lx3fuo9xjejRg
            @Override // io.reactivex.functions.Consumer
            public final void accept(Object obj) throws Exception {
                HardwareExecutor.lambda$deviceReadAsyn$1(deviceModel, (DeviceModel) obj);
            }
        }, new Consumer() { // from class: com.landleaf.smarthome.net.hardware.-$$Lambda$HardwareExecutor$LvA8399zgw2mrCAQn99WncWcbvw
            @Override // io.reactivex.functions.Consumer
            public final void accept(Object obj) {
                Log.d(HardwareExecutor.TAG, "通讯异常->" + ((Throwable) obj).getMessage());
            }
        });
    }

    static /* synthetic */ void lambda$deviceReadAsyn$1(DeviceModel deviceModel, DeviceModel deviceModel2) throws Exception {
        ProtocolUtils.getDeviceModel4ProductTag(deviceModel2.getProductCode(), context).getStartAdd();
        deviceModel2.getPort();
        deviceModel.getProtocol();
    }

    public void deviceWriteAsyn(final DeviceModel deviceModel, final String str, final String str2) {
        RxJavaUtils.createObservable(deviceModel).compose(RxSchedulerUtils._io_io_o()).filter(new Predicate() { // from class: com.landleaf.smarthome.net.hardware.-$$Lambda$HardwareExecutor$GxLaL95icCcNR-g5a2E_vCiWV4E
            @Override // io.reactivex.functions.Predicate
            public final boolean test(Object obj) {
                return HardwareExecutor.lambda$deviceWriteAsyn$3((DeviceModel) obj);
            }
        }).subscribe(new Consumer() { // from class: com.landleaf.smarthome.net.hardware.-$$Lambda$HardwareExecutor$WUt10nv56uBlRXlozHr-n-2ADVU
            @Override // io.reactivex.functions.Consumer
            public final void accept(Object obj) throws Exception {
                HardwareExecutor.lambda$deviceWriteAsyn$4(deviceModel, str, str2, (DeviceModel) obj);
            }
        }, new Consumer() { // from class: com.landleaf.smarthome.net.hardware.-$$Lambda$HardwareExecutor$L5UB2vmdifS3owtQx5rbInY5j3M
            @Override // io.reactivex.functions.Consumer
            public final void accept(Object obj) {
                Log.d(HardwareExecutor.TAG, "通讯异常->" + ((Throwable) obj).getMessage());
            }
        });
    }

    static /* synthetic */ void lambda$deviceWriteAsyn$4(DeviceModel deviceModel, String str, String str2, DeviceModel deviceModel2) throws Exception {
        deviceModel2.getPort();
        ProtocolUtils.getAdd4AttTag(deviceModel, str, context);
        ProtocolUtils.getAdd4AttValue(deviceModel, str2, context);
        deviceModel.getProtocol();
    }

    public void deviceWriteAsyn(DeviceModel deviceModel, List<DeviceAttribute> list) {
        for (int i = 0; i < list.size(); i++) {
            deviceWriteAsyn(deviceModel, list.get(i).getAttrTag(), list.get(i).getAttrValue());
        }
    }

    public void deviceWriteAsyn(DeviceModel deviceModel, DeviceAttribute deviceAttribute) {
        deviceWriteAsyn(deviceModel, deviceAttribute.getAttrTag(), deviceAttribute.getAttrValue());
    }
}
