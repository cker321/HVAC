package com.dnake.desktop.base;

import android.os.Bundle;
import android.view.KeyEvent;
import butterknife.ButterKnife;
import butterknife.Unbinder;
import es.dmoral.toasty.Toasty;
import me.yokeyword.fragmentation.SupportActivity;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/* loaded from: classes.dex */
public abstract class BaseActivity extends SupportActivity {
    private Unbinder bind;

    protected abstract int getLayoutViewId();

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void getMessage(String str) {
    }

    protected abstract void initActivity();

    @Override // me.yokeyword.fragmentation.SupportActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(getLayoutViewId());
        this.bind = ButterKnife.bind(this);
        EventBus.getDefault().register(this);
        initActivity();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStart() {
        super.onStart();
        hideNavigation();
    }

    @Override // me.yokeyword.fragmentation.SupportActivity, androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        this.bind.unbind();
        EventBus.getDefault().unregister(this);
    }

    protected void showWarnToast(String str) {
        Toasty.warning(this, str, 0, true).show();
    }

    @Override // androidx.appcompat.app.AppCompatActivity, android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i == 4) {
            hideNavigation();
            return true;
        }
        return super.onKeyDown(i, keyEvent);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void hideNavigation() {
        getWindow().getDecorView().setSystemUiVisibility(3846);
    }
}
