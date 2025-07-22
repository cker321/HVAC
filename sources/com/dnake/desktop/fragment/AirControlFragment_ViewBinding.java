package com.dnake.desktop.fragment;

import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.RecyclerView;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.dnake.desktop.C0483R;
import com.dnake.desktop.widget.LandleafView;

/* loaded from: classes.dex */
public class AirControlFragment_ViewBinding implements Unbinder {
    private AirControlFragment target;
    private View view7f080145;
    private View view7f080146;
    private View view7f080147;
    private View view7f080148;
    private View view7f080149;
    private View view7f08014a;
    private View view7f08014b;
    private View view7f08014c;
    private View view7f08014d;
    private View view7f08014e;
    private View view7f08014f;

    public AirControlFragment_ViewBinding(final AirControlFragment airControlFragment, View view) {
        this.target = airControlFragment;
        airControlFragment.recyclerView = (RecyclerView) Utils.findRequiredViewAsType(view, C0483R.id.recyclerView, "field 'recyclerView'", RecyclerView.class);
        View viewFindRequiredView = Utils.findRequiredView(view, C0483R.id.tica_ivPower, "field 'ivPower' and method 'onClickView'");
        airControlFragment.ivPower = (ImageView) Utils.castView(viewFindRequiredView, C0483R.id.tica_ivPower, "field 'ivPower'", ImageView.class);
        this.view7f08014c = viewFindRequiredView;
        viewFindRequiredView.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.1
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        airControlFragment.tvTempShow = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tica_tvTempShow, "field 'tvTempShow'", TextView.class);
        airControlFragment.myLandleafView = (LandleafView) Utils.findRequiredViewAsType(view, C0483R.id.tica_myCustomLayout, "field 'myLandleafView'", LandleafView.class);
        View viewFindRequiredView2 = Utils.findRequiredView(view, C0483R.id.tica_ivMinus, "method 'onClickView'");
        this.view7f08014a = viewFindRequiredView2;
        viewFindRequiredView2.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.2
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView3 = Utils.findRequiredView(view, C0483R.id.tica_ivPlus, "method 'onClickView'");
        this.view7f08014b = viewFindRequiredView3;
        viewFindRequiredView3.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.3
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView4 = Utils.findRequiredView(view, C0483R.id.tica_ivZhilen, "method 'onClickView'");
        this.view7f08014e = viewFindRequiredView4;
        viewFindRequiredView4.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.4
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView5 = Utils.findRequiredView(view, C0483R.id.tica_ivZhire, "method 'onClickView'");
        this.view7f08014f = viewFindRequiredView5;
        viewFindRequiredView5.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.5
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView6 = Utils.findRequiredView(view, C0483R.id.tica_ivSongfeng, "method 'onClickView'");
        this.view7f08014d = viewFindRequiredView6;
        viewFindRequiredView6.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.6
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView7 = Utils.findRequiredView(view, C0483R.id.tica_ivChushi, "method 'onClickView'");
        this.view7f080149 = viewFindRequiredView7;
        viewFindRequiredView7.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.7
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView8 = Utils.findRequiredView(view, C0483R.id.tica_fengsu_di, "method 'onClickView'");
        this.view7f080145 = viewFindRequiredView8;
        viewFindRequiredView8.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.8
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView9 = Utils.findRequiredView(view, C0483R.id.tica_fengsu_zhong, "method 'onClickView'");
        this.view7f080147 = viewFindRequiredView9;
        viewFindRequiredView9.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.9
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView10 = Utils.findRequiredView(view, C0483R.id.tica_fengsu_gao, "method 'onClickView'");
        this.view7f080146 = viewFindRequiredView10;
        viewFindRequiredView10.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.10
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView11 = Utils.findRequiredView(view, C0483R.id.tica_fengsu_zidong, "method 'onClickView'");
        this.view7f080148 = viewFindRequiredView11;
        viewFindRequiredView11.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.AirControlFragment_ViewBinding.11
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                airControlFragment.onClickView(view2);
            }
        });
        airControlFragment.mModeViews = Utils.listFilteringNull((ImageView) Utils.findRequiredViewAsType(view, C0483R.id.tica_ivZhilen, "field 'mModeViews'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.tica_ivZhire, "field 'mModeViews'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.tica_ivSongfeng, "field 'mModeViews'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.tica_ivChushi, "field 'mModeViews'", ImageView.class));
        airControlFragment.mFengsuViews = Utils.listFilteringNull((ImageView) Utils.findRequiredViewAsType(view, C0483R.id.tica_fengsu_di, "field 'mFengsuViews'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.tica_fengsu_zhong, "field 'mFengsuViews'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.tica_fengsu_gao, "field 'mFengsuViews'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.tica_fengsu_zidong, "field 'mFengsuViews'", ImageView.class));
        airControlFragment.colorLevelGood = ContextCompat.getColor(view.getContext(), C0483R.color.colorLevelGood);
    }

    @Override // butterknife.Unbinder
    public void unbind() {
        AirControlFragment airControlFragment = this.target;
        if (airControlFragment == null) {
            throw new IllegalStateException("Bindings already cleared.");
        }
        this.target = null;
        airControlFragment.recyclerView = null;
        airControlFragment.ivPower = null;
        airControlFragment.tvTempShow = null;
        airControlFragment.myLandleafView = null;
        airControlFragment.mModeViews = null;
        airControlFragment.mFengsuViews = null;
        this.view7f08014c.setOnClickListener(null);
        this.view7f08014c = null;
        this.view7f08014a.setOnClickListener(null);
        this.view7f08014a = null;
        this.view7f08014b.setOnClickListener(null);
        this.view7f08014b = null;
        this.view7f08014e.setOnClickListener(null);
        this.view7f08014e = null;
        this.view7f08014f.setOnClickListener(null);
        this.view7f08014f = null;
        this.view7f08014d.setOnClickListener(null);
        this.view7f08014d = null;
        this.view7f080149.setOnClickListener(null);
        this.view7f080149 = null;
        this.view7f080145.setOnClickListener(null);
        this.view7f080145 = null;
        this.view7f080147.setOnClickListener(null);
        this.view7f080147 = null;
        this.view7f080146.setOnClickListener(null);
        this.view7f080146 = null;
        this.view7f080148.setOnClickListener(null);
        this.view7f080148 = null;
    }
}
