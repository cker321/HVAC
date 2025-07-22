package com.dnake.desktop.fragment;

import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import butterknife.BindViews;
import butterknife.OnClick;
import com.dnake.desktop.C0483R;
import com.dnake.desktop.base.BaseFragment;
import com.landleaf.smarthome.model.SceneControlBean;
import io.reactivex.Single;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.util.concurrent.TimeUnit;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/* loaded from: classes.dex */
public class SceneFragment extends BaseFragment {

    @BindViews({C0483R.id.rlModeLijia, C0483R.id.rlModeJujia, C0483R.id.rlModeShuimian, C0483R.id.rlModeJuhui})
    ImageView[] imageViews;
    private String TAG = "SceneFragment";
    int[] scenceModeNormal = {C0483R.drawable.icon_mode_lijia, C0483R.drawable.icon_mode_jujia, C0483R.drawable.icon_mode_shuimian, C0483R.drawable.icon_mode_juhui};
    int[] scenceModeSelected = {C0483R.drawable.icon_mode_lijia_selected, C0483R.drawable.icon_mode_jujia_selected, C0483R.drawable.icon_mode_shuimian_selected, C0483R.drawable.icon_mode_juhui_selected};

    @Override // com.dnake.desktop.base.BaseFragment
    protected int getViewID() {
        return C0483R.layout.fragment_nt_scene_control;
    }

    @Override // com.dnake.desktop.base.BaseFragment
    protected void initFragment() {
    }

    @OnClick({C0483R.id.rlModeLijia, C0483R.id.rlModeJujia, C0483R.id.rlModeShuimian, C0483R.id.rlModeJuhui})
    public void onViewClicked(View view) {
        switch (view.getId()) {
            case C0483R.id.rlModeJuhui /* 2131230976 */:
                setCurrentMode(3, false);
                break;
            case C0483R.id.rlModeJujia /* 2131230977 */:
                setCurrentMode(1, false);
                break;
            case C0483R.id.rlModeLijia /* 2131230978 */:
                setCurrentMode(0, false);
                break;
            case C0483R.id.rlModeShuimian /* 2131230979 */:
                setCurrentMode(2, false);
                break;
        }
    }

    private void setModeSelected(int i) {
        int i2 = 0;
        while (true) {
            int[] iArr = this.scenceModeNormal;
            if (i2 >= iArr.length) {
                return;
            }
            this.imageViews[i2].setImageResource(i2 == i ? this.scenceModeSelected[i2] : iArr[i2]);
            i2++;
        }
    }

    private void setCurrentMode(int i, boolean z) {
        setModeSelected(i);
        SceneControlBean sceneControlBean = new SceneControlBean(i, z);
        sceneControlBean.setDelayControl(false);
        EventBus.getDefault().post(sceneControlBean);
        setModeDelay(sceneControlBean, 10);
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void sceneControl(SceneControlBean sceneControlBean) {
        Log.d(this.TAG, "sceneControl:" + sceneControlBean);
        if (sceneControlBean.isRemountControl()) {
            setModeSelected(sceneControlBean.getModeIndex());
        }
    }

    public void setModeDelay(final SceneControlBean sceneControlBean, int i) {
        Single.timer(i, TimeUnit.SECONDS).subscribeOn(Schedulers.m42io()).subscribe(new Consumer<Long>() { // from class: com.dnake.desktop.fragment.SceneFragment.1
            @Override // io.reactivex.functions.Consumer
            public void accept(Long l) throws Exception {
                sceneControlBean.setDelayControl(true);
                EventBus.getDefault().post(sceneControlBean);
            }
        }, new Consumer<Throwable>() { // from class: com.dnake.desktop.fragment.SceneFragment.2
            @Override // io.reactivex.functions.Consumer
            public void accept(Throwable th) throws Exception {
                Log.d(SceneFragment.this.TAG, th.toString());
            }
        });
    }
}
