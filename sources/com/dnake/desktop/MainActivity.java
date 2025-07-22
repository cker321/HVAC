package com.dnake.desktop;

import android.content.Intent;
import android.graphics.Bitmap;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.Toast;
import androidx.fragment.app.FragmentActivity;
import butterknife.BindColor;
import butterknife.BindView;
import butterknife.BindViews;
import butterknife.OnClick;
import com.afollestad.materialdialogs.MaterialDialog;
import com.bumptech.glide.Glide;
import com.dnake.desktop.base.BaseActivity;
import com.dnake.desktop.bean.ReadDeviceStatus;
import com.dnake.desktop.costant.VariableConstant;
import com.dnake.desktop.fragment.AirControlFragment;
import com.dnake.desktop.fragment.MonitorFragment;
import com.dnake.desktop.fragment.SceneFragment;
import com.dnake.desktop.fragment.WindControlFragment;
import com.dnake.desktop.utils.CommonUtils;
import com.dnake.desktop.utils.ThreadPoolManager;
import com.dnake.desktop.widget.TimeView;
import com.google.zxing.WriterException;
import com.landleaf.smarthome.model.SceneModel;
import com.landleaf.smarthome.model.WeatherModel;
import com.landleaf.smarthome.net.http.ApiFactory;
import com.landleaf.smarthome.net.http.NetResponse;
import com.landleaf.smarthome.net.mqtt.MqttExecutor;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.io.ByteArrayOutputStream;
import java.util.List;
import java.util.concurrent.TimeUnit;
import me.yokeyword.fragmentation.SupportFragment;
import org.greenrobot.eventbus.EventBus;

/* loaded from: classes.dex */
public class MainActivity extends BaseActivity {

    @BindColor(C0483R.color.colorClicked)
    int clickedColor;

    @BindColor(C0483R.color.colorUnClick)
    int colorUnClick;
    private ServerManager mServerManager;

    @BindViews({C0483R.id.rlHvacWind, C0483R.id.rlHvacAir, C0483R.id.rlMulControl})
    List<RelativeLayout> mView;

    @BindView(C0483R.id.timeView)
    TimeView timeView;
    private String TAG = "MainActivity";
    protected SupportFragment[] mFragments = new SupportFragment[4];

    @Override // com.dnake.desktop.base.BaseActivity
    protected int getLayoutViewId() {
        return C0483R.layout.activity_main_caijia;
    }

    @Override // com.dnake.desktop.base.BaseActivity
    protected void initActivity() {
        this.mFragments[0] = new MonitorFragment();
        this.mFragments[1] = new WindControlFragment();
        this.mFragments[2] = new AirControlFragment();
        this.mFragments[3] = new SceneFragment();
        SupportFragment[] supportFragmentArr = this.mFragments;
        loadMultipleRootFragment(C0483R.id.flMain, 0, supportFragmentArr[0], supportFragmentArr[1], supportFragmentArr[2], supportFragmentArr[3]);
        MqttExecutor.getInstance().connect(App.deviceId);
        ServerManager serverManager = new ServerManager(this);
        this.mServerManager = serverManager;
        serverManager.register();
        this.mServerManager.startServer();
        initInfo();
    }

    private void setSelectedColor(int i) {
        int i2 = 0;
        while (i2 < this.mView.size()) {
            this.mView.get(i2).setBackgroundColor(i == i2 ? this.clickedColor : this.colorUnClick);
            i2++;
        }
    }

    private void clearSelectedColor() {
        for (int i = 0; i < this.mView.size(); i++) {
            this.mView.get(i).setBackgroundColor(this.colorUnClick);
        }
    }

    @OnClick({C0483R.id.rlHome, C0483R.id.rlHvacWind, C0483R.id.rlHvacAir, C0483R.id.rlSafeAlarm, C0483R.id.rlVideoTalk, C0483R.id.rlMulControl, C0483R.id.ivQRCode})
    public void onViewClicked(View view) {
        switch (view.getId()) {
            case C0483R.id.ivQRCode /* 2131230894 */:
                final MaterialDialog materialDialogShow = new MaterialDialog.Builder(this).customView(C0483R.layout.dialog_show_qrcode, false).show();
                ImageView imageView = (ImageView) materialDialogShow.getCustomView().findViewById(C0483R.id.ivQRCode);
                Button button = (Button) materialDialogShow.getCustomView().findViewById(C0483R.id.btClose);
                macToQRcode(imageView);
                button.setOnClickListener(new View.OnClickListener() { // from class: com.dnake.desktop.MainActivity.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view2) {
                        materialDialogShow.dismiss();
                        MainActivity.this.hideNavigation();
                    }
                });
                break;
            case C0483R.id.rlHome /* 2131230971 */:
                clearSelectedColor();
                showHideFragment(this.mFragments[0]);
                break;
            case C0483R.id.rlHvacAir /* 2131230973 */:
                setSelectedColor(1);
                showHideFragment(this.mFragments[2]);
                break;
            case C0483R.id.rlHvacWind /* 2131230974 */:
                setSelectedColor(0);
                showHideFragment(this.mFragments[1]);
                break;
            case C0483R.id.rlMulControl /* 2131230980 */:
                setSelectedColor(2);
                showHideFragment(this.mFragments[3]);
                break;
            case C0483R.id.rlSafeAlarm /* 2131230982 */:
                goToActivity("com.dnake.security");
                break;
            case C0483R.id.rlVideoTalk /* 2131230984 */:
                goToActivity("com.dnake.talk");
                break;
        }
    }

    @Override // com.dnake.desktop.base.BaseActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStart() {
        super.onStart();
        this.timeView.start();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStop() {
        super.onStop();
        this.timeView.stop();
    }

    public void goToActivity(String str) {
        Intent launchIntentForPackage = getPackageManager().getLaunchIntentForPackage(str);
        if (getPackageManager().resolveActivity(launchIntentForPackage, 0) != null) {
            startActivity(launchIntentForPackage);
            return;
        }
        Toast.makeText(this, str + "界面跳转失败,请确认是否安装该模块！", 0).show();
    }

    private void initInfo() {
        ThreadPoolManager.getInstance().submitScheduleJob(new Runnable() { // from class: com.dnake.desktop.MainActivity.2
            @Override // java.lang.Runnable
            public void run() {
                MainActivity.this.initWeather();
                EventBus.getDefault().post(new ReadDeviceStatus(true));
            }
        }, 10, "init_info", 5L, 180L, TimeUnit.SECONDS, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initWeather() {
        ApiFactory.getNetApi().getWeather().subscribeOn(Schedulers.m42io()).subscribe(new Consumer<NetResponse<WeatherModel>>() { // from class: com.dnake.desktop.MainActivity.3
            @Override // io.reactivex.functions.Consumer
            public void accept(NetResponse<WeatherModel> netResponse) throws Exception {
                if (netResponse.code == 200) {
                    EventBus.getDefault().postSticky(netResponse.data);
                }
            }
        }, new Consumer<Throwable>() { // from class: com.dnake.desktop.MainActivity.4
            @Override // io.reactivex.functions.Consumer
            public void accept(Throwable th) throws Exception {
                Log.d(MainActivity.this.TAG, "initWeather:" + th.toString());
            }
        });
    }

    private void initSceneInfo() {
        ApiFactory.getNetApi().getSceneList().subscribeOn(Schedulers.m42io()).subscribe(new Consumer<NetResponse<List<SceneModel>>>() { // from class: com.dnake.desktop.MainActivity.5
            @Override // io.reactivex.functions.Consumer
            public void accept(NetResponse<List<SceneModel>> netResponse) throws Exception {
                List<SceneModel> list = netResponse.data;
            }
        }, new Consumer<Throwable>() { // from class: com.dnake.desktop.MainActivity.6
            @Override // io.reactivex.functions.Consumer
            public void accept(Throwable th) throws Exception {
                Log.d(MainActivity.this.TAG, "initSceneInfo:" + th.toString());
            }
        });
    }

    protected void macToQRcode(ImageView imageView) {
        String str = "2:" + App.deviceId;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        Bitmap bitmapCreate2DCode = null;
        try {
            bitmapCreate2DCode = CommonUtils.getInstance().create2DCode(str);
        } catch (WriterException e) {
            e.printStackTrace();
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmapCreate2DCode.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        bitmapCreate2DCode.recycle();
        Glide.with((FragmentActivity) this).load(byteArray).fitCenter().into(imageView);
    }

    public void onServerStart(String str) {
        VariableConstant.DEVICE_IP = str;
        Log.d(this.TAG, str + " onServerStart");
    }

    public void onServerError(String str) {
        Log.d(this.TAG, str);
    }

    public void onServerStop() {
        Log.d(this.TAG, "onServerStop!");
    }

    @Override // com.dnake.desktop.base.BaseActivity, me.yokeyword.fragmentation.SupportActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        this.mServerManager.unRegister();
        this.mServerManager.stopServer();
    }
}
