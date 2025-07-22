package com.dnake.desktop;

import android.content.Context;
import android.view.View;
import android.widget.RelativeLayout;
import androidx.core.content.ContextCompat;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.dnake.desktop.widget.TimeView;

/* loaded from: classes.dex */
public class MainActivity_ViewBinding implements Unbinder {
    private MainActivity target;
    private View view7f0800ae;
    private View view7f0800fb;
    private View view7f0800fd;
    private View view7f0800fe;
    private View view7f080104;
    private View view7f080106;
    private View view7f080108;

    public MainActivity_ViewBinding(MainActivity mainActivity) {
        this(mainActivity, mainActivity.getWindow().getDecorView());
    }

    public MainActivity_ViewBinding(final MainActivity mainActivity, View view) {
        this.target = mainActivity;
        mainActivity.timeView = (TimeView) Utils.findRequiredViewAsType(view, C0483R.id.timeView, "field 'timeView'", TimeView.class);
        View viewFindRequiredView = Utils.findRequiredView(view, C0483R.id.rlHome, "method 'onViewClicked'");
        this.view7f0800fb = viewFindRequiredView;
        viewFindRequiredView.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.MainActivity_ViewBinding.1
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                mainActivity.onViewClicked(view2);
            }
        });
        View viewFindRequiredView2 = Utils.findRequiredView(view, C0483R.id.rlHvacWind, "method 'onViewClicked'");
        this.view7f0800fe = viewFindRequiredView2;
        viewFindRequiredView2.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.MainActivity_ViewBinding.2
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                mainActivity.onViewClicked(view2);
            }
        });
        View viewFindRequiredView3 = Utils.findRequiredView(view, C0483R.id.rlHvacAir, "method 'onViewClicked'");
        this.view7f0800fd = viewFindRequiredView3;
        viewFindRequiredView3.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.MainActivity_ViewBinding.3
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                mainActivity.onViewClicked(view2);
            }
        });
        View viewFindRequiredView4 = Utils.findRequiredView(view, C0483R.id.rlSafeAlarm, "method 'onViewClicked'");
        this.view7f080106 = viewFindRequiredView4;
        viewFindRequiredView4.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.MainActivity_ViewBinding.4
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                mainActivity.onViewClicked(view2);
            }
        });
        View viewFindRequiredView5 = Utils.findRequiredView(view, C0483R.id.rlVideoTalk, "method 'onViewClicked'");
        this.view7f080108 = viewFindRequiredView5;
        viewFindRequiredView5.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.MainActivity_ViewBinding.5
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                mainActivity.onViewClicked(view2);
            }
        });
        View viewFindRequiredView6 = Utils.findRequiredView(view, C0483R.id.rlMulControl, "method 'onViewClicked'");
        this.view7f080104 = viewFindRequiredView6;
        viewFindRequiredView6.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.MainActivity_ViewBinding.6
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                mainActivity.onViewClicked(view2);
            }
        });
        View viewFindRequiredView7 = Utils.findRequiredView(view, C0483R.id.ivQRCode, "method 'onViewClicked'");
        this.view7f0800ae = viewFindRequiredView7;
        viewFindRequiredView7.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.MainActivity_ViewBinding.7
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                mainActivity.onViewClicked(view2);
            }
        });
        mainActivity.mView = Utils.listFilteringNull((RelativeLayout) Utils.findRequiredViewAsType(view, C0483R.id.rlHvacWind, "field 'mView'", RelativeLayout.class), (RelativeLayout) Utils.findRequiredViewAsType(view, C0483R.id.rlHvacAir, "field 'mView'", RelativeLayout.class), (RelativeLayout) Utils.findRequiredViewAsType(view, C0483R.id.rlMulControl, "field 'mView'", RelativeLayout.class));
        Context context = view.getContext();
        mainActivity.clickedColor = ContextCompat.getColor(context, C0483R.color.colorClicked);
        mainActivity.colorUnClick = ContextCompat.getColor(context, C0483R.color.colorUnClick);
    }

    @Override // butterknife.Unbinder
    public void unbind() {
        MainActivity mainActivity = this.target;
        if (mainActivity == null) {
            throw new IllegalStateException("Bindings already cleared.");
        }
        this.target = null;
        mainActivity.timeView = null;
        mainActivity.mView = null;
        this.view7f0800fb.setOnClickListener(null);
        this.view7f0800fb = null;
        this.view7f0800fe.setOnClickListener(null);
        this.view7f0800fe = null;
        this.view7f0800fd.setOnClickListener(null);
        this.view7f0800fd = null;
        this.view7f080106.setOnClickListener(null);
        this.view7f080106 = null;
        this.view7f080108.setOnClickListener(null);
        this.view7f080108 = null;
        this.view7f080104.setOnClickListener(null);
        this.view7f080104 = null;
        this.view7f0800ae.setOnClickListener(null);
        this.view7f0800ae = null;
    }
}
