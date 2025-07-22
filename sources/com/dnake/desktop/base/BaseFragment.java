package com.dnake.desktop.base;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import butterknife.ButterKnife;
import butterknife.Unbinder;
import com.dnake.desktop.App;
import es.dmoral.toasty.Toasty;
import me.yokeyword.fragmentation.SupportFragment;
import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

/* loaded from: classes.dex */
public abstract class BaseFragment extends SupportFragment {
    private Unbinder bind;
    protected String clientId;

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void getMessage(String str) {
    }

    protected abstract int getViewID();

    protected abstract void initFragment();

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(getViewID(), viewGroup, false);
        this.bind = ButterKnife.bind(this, viewInflate);
        this.clientId = App.deviceId;
        initFragment();
        return viewInflate;
    }

    @Override // me.yokeyword.fragmentation.SupportFragment, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        EventBus.getDefault().register(this);
    }

    @Override // me.yokeyword.fragmentation.SupportFragment, androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.bind.unbind();
        EventBus.getDefault().unregister(this);
    }

    protected void showWarnToast(Context context, String str) {
        Toasty.warning(context, str, 0, true).show();
    }

    protected void hideNavigation() {
        getActivity().getWindow().getDecorView().setSystemUiVisibility(3846);
    }
}
