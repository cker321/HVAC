package com.landleaf.smarthome;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import androidx.appcompat.app.AppCompatActivity;
import com.gyf.barlibrary.BarHide;
import com.gyf.barlibrary.ImmersionBar;
import com.landleaf.smarthome.device.AttributeTagConst;
import com.landleaf.smarthome.device.ProductCodeConst;
import com.landleaf.smarthome.model.DeviceAttribute;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.model.FloorModel;
import com.landleaf.smarthome.model.WeatherModel;
import com.landleaf.smarthome.net.http.ApiFactory;
import com.landleaf.smarthome.net.http.NetResponse;
import com.landleaf.smarthome.net.mqtt.MqttExecutor;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public class MainActivity extends AppCompatActivity {
    static /* synthetic */ void lambda$onCreate$4(View view) {
    }

    void test() {
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) throws IllegalAccessException, NoSuchMethodException, ClassNotFoundException, SecurityException, IllegalArgumentException, InvocationTargetException {
        super.onCreate(bundle);
        ImmersionBar.with(this).hideBar(BarHide.FLAG_HIDE_BAR).init();
        setContentView(C0697R.layout.activity_main);
        final ImageView imageView = (ImageView) findViewById(C0697R.id.f137iv);
        imageView.setOnClickListener(new View.OnClickListener() { // from class: com.landleaf.smarthome.-$$Lambda$MainActivity$KXKqHXQHZN7nlSex4IyRP1SJ4hI
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.lambda$onCreate$0$MainActivity(imageView, view);
            }
        });
        findViewById(C0697R.id.textView).setOnClickListener(new View.OnClickListener() { // from class: com.landleaf.smarthome.-$$Lambda$MainActivity$o3YfTcxQjjm6FTdau7Glp7myY9Q
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                MqttExecutor.getInstance().connect("88888888");
            }
        });
        findViewById(C0697R.id.textView3).setOnClickListener(new View.OnClickListener() { // from class: com.landleaf.smarthome.-$$Lambda$MainActivity$fyEIR1lbFBLjIqa0yzZxQ5oT1w8
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                MqttExecutor.getInstance().sendSecurityAlarmMsg(null);
            }
        });
        findViewById(C0697R.id.textView2).setOnClickListener(new View.OnClickListener() { // from class: com.landleaf.smarthome.-$$Lambda$MainActivity$Lqe8tlc0etJMLbBDNnKVviemCaI
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                MainActivity.lambda$onCreate$3(view);
            }
        });
        findViewById(C0697R.id.textView4).setOnClickListener(new View.OnClickListener() { // from class: com.landleaf.smarthome.-$$Lambda$MainActivity$oIzoqSjfqj7vlp5GMm9yar_-auE
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                MainActivity.lambda$onCreate$4(view);
            }
        });
        ApiFactory.getNetApi().getWeather().subscribeOn(Schedulers.m42io()).subscribe(new Consumer<NetResponse<WeatherModel>>() { // from class: com.landleaf.smarthome.MainActivity.1
            @Override // io.reactivex.functions.Consumer
            public void accept(NetResponse<WeatherModel> netResponse) throws Exception {
                if (netResponse.isSuccess) {
                    Log.d("MainActivity", "weatherModelNetResponse:" + netResponse.data);
                }
            }
        }, new Consumer<Throwable>() { // from class: com.landleaf.smarthome.MainActivity.2
            @Override // io.reactivex.functions.Consumer
            public void accept(Throwable th) throws Exception {
                Log.d("MainActivity", th.toString());
            }
        });
        ApiFactory.getNetApi().getFloorDeviceList().subscribeOn(Schedulers.m42io()).subscribe(new Consumer<NetResponse<List<FloorModel>>>() { // from class: com.landleaf.smarthome.MainActivity.3
            @Override // io.reactivex.functions.Consumer
            public void accept(NetResponse<List<FloorModel>> netResponse) throws Exception {
                netResponse.data.get(0).getRooms();
            }
        }, new Consumer<Throwable>() { // from class: com.landleaf.smarthome.MainActivity.4
            @Override // io.reactivex.functions.Consumer
            public void accept(Throwable th) throws Exception {
            }
        });
    }

    public /* synthetic */ void lambda$onCreate$0$MainActivity(ImageView imageView, View view) {
        test();
        imageView.setBackgroundResource(C0697R.drawable.test_2);
    }

    static /* synthetic */ void lambda$onCreate$3(View view) {
        DeviceModel deviceModel = new DeviceModel();
        deviceModel.setDeviceSn("5");
        deviceModel.setProductCode(ProductCodeConst.SENSOR);
        ArrayList arrayList = new ArrayList();
        DeviceAttribute deviceAttribute = new DeviceAttribute(AttributeTagConst.TEMP, "20");
        DeviceAttribute deviceAttribute2 = new DeviceAttribute(AttributeTagConst.HUMIDITY, "25");
        DeviceAttribute deviceAttribute3 = new DeviceAttribute(AttributeTagConst.VOC, "0.2");
        DeviceAttribute deviceAttribute4 = new DeviceAttribute(AttributeTagConst.CO2, "200");
        DeviceAttribute deviceAttribute5 = new DeviceAttribute(AttributeTagConst.PM25, "30");
        arrayList.add(deviceAttribute);
        arrayList.add(deviceAttribute2);
        arrayList.add(deviceAttribute3);
        arrayList.add(deviceAttribute4);
        arrayList.add(deviceAttribute5);
        MqttExecutor.getInstance().sendDeviceUpdateMsg(deviceModel);
    }
}
