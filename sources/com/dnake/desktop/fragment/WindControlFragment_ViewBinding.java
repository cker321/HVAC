package com.dnake.desktop.fragment;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.widget.ImageView;
import androidx.core.content.ContextCompat;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.dnake.desktop.C0483R;
import com.dnake.desktop.widget.LandleafView;

/* loaded from: classes.dex */
public class WindControlFragment_ViewBinding implements Unbinder {
    private WindControlFragment target;
    private View view7f0800a8;
    private View view7f0800a9;
    private View view7f0800aa;
    private View view7f0800ab;
    private View view7f0800ac;
    private View view7f0800ad;
    private View view7f0800af;
    private View view7f0800b1;
    private View view7f0800b2;
    private View view7f0800b3;

    public WindControlFragment_ViewBinding(final WindControlFragment windControlFragment, View view) {
        this.target = windControlFragment;
        View viewFindRequiredView = Utils.findRequiredView(view, C0483R.id.ivPower, "field 'ivPower' and method 'onClickView'");
        windControlFragment.ivPower = (ImageView) Utils.castView(viewFindRequiredView, C0483R.id.ivPower, "field 'ivPower'", ImageView.class);
        this.view7f0800ad = viewFindRequiredView;
        viewFindRequiredView.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.1
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView2 = Utils.findRequiredView(view, C0483R.id.ivJiashi, "field 'ivJiashi' and method 'onClickView'");
        windControlFragment.ivJiashi = (ImageView) Utils.castView(viewFindRequiredView2, C0483R.id.ivJiashi, "field 'ivJiashi'", ImageView.class);
        this.view7f0800ac = viewFindRequiredView2;
        viewFindRequiredView2.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.2
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        windControlFragment.myCustomLayout = (LandleafView) Utils.findRequiredViewAsType(view, C0483R.id.myCustomLayout, "field 'myCustomLayout'", LandleafView.class);
        View viewFindRequiredView3 = Utils.findRequiredView(view, C0483R.id.ivGao, "method 'onClickView'");
        this.view7f0800ab = viewFindRequiredView3;
        viewFindRequiredView3.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.3
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView4 = Utils.findRequiredView(view, C0483R.id.ivZhong, "method 'onClickView'");
        this.view7f0800b3 = viewFindRequiredView4;
        viewFindRequiredView4.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.4
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView5 = Utils.findRequiredView(view, C0483R.id.ivDi, "method 'onClickView'");
        this.view7f0800a9 = viewFindRequiredView5;
        viewFindRequiredView5.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.5
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView6 = Utils.findRequiredView(view, C0483R.id.ivXiaji, "method 'onClickView'");
        this.view7f0800b1 = viewFindRequiredView6;
        viewFindRequiredView6.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.6
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView7 = Utils.findRequiredView(view, C0483R.id.ivDongji, "method 'onClickView'");
        this.view7f0800aa = viewFindRequiredView7;
        viewFindRequiredView7.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.7
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView8 = Utils.findRequiredView(view, C0483R.id.ivTongfeng, "method 'onClickView'");
        this.view7f0800af = viewFindRequiredView8;
        viewFindRequiredView8.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.8
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView9 = Utils.findRequiredView(view, C0483R.id.ivChushi, "method 'onClickView'");
        this.view7f0800a8 = viewFindRequiredView9;
        viewFindRequiredView9.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.9
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        View viewFindRequiredView10 = Utils.findRequiredView(view, C0483R.id.ivZhineng, "method 'onClickView'");
        this.view7f0800b2 = viewFindRequiredView10;
        viewFindRequiredView10.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.WindControlFragment_ViewBinding.10
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                windControlFragment.onClickView(view2);
            }
        });
        windControlFragment.ivModes = (ImageView[]) Utils.arrayFilteringNull((ImageView) Utils.findRequiredViewAsType(view, C0483R.id.ivTongfeng, "field 'ivModes'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.ivXiaji, "field 'ivModes'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.ivChushi, "field 'ivModes'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.ivDongji, "field 'ivModes'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.ivZhineng, "field 'ivModes'", ImageView.class));
        windControlFragment.ivVolumes = (ImageView[]) Utils.arrayFilteringNull((ImageView) Utils.findRequiredViewAsType(view, C0483R.id.ivGao, "field 'ivVolumes'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.ivZhong, "field 'ivVolumes'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.ivDi, "field 'ivVolumes'", ImageView.class));
        Context context = view.getContext();
        Resources resources = context.getResources();
        windControlFragment.colorLevelGood = ContextCompat.getColor(context, C0483R.color.colorLevelGood);
        windControlFragment.colorLevelMedium = ContextCompat.getColor(context, C0483R.color.colorLevelMedium);
        windControlFragment.strShushi = resources.getString(C0483R.string.str_level_shushi);
        windControlFragment.strLianghao = resources.getString(C0483R.string.str_level_lianghao);
    }

    @Override // butterknife.Unbinder
    public void unbind() {
        WindControlFragment windControlFragment = this.target;
        if (windControlFragment == null) {
            throw new IllegalStateException("Bindings already cleared.");
        }
        this.target = null;
        windControlFragment.ivPower = null;
        windControlFragment.ivJiashi = null;
        windControlFragment.myCustomLayout = null;
        windControlFragment.ivModes = null;
        windControlFragment.ivVolumes = null;
        this.view7f0800ad.setOnClickListener(null);
        this.view7f0800ad = null;
        this.view7f0800ac.setOnClickListener(null);
        this.view7f0800ac = null;
        this.view7f0800ab.setOnClickListener(null);
        this.view7f0800ab = null;
        this.view7f0800b3.setOnClickListener(null);
        this.view7f0800b3 = null;
        this.view7f0800a9.setOnClickListener(null);
        this.view7f0800a9 = null;
        this.view7f0800b1.setOnClickListener(null);
        this.view7f0800b1 = null;
        this.view7f0800aa.setOnClickListener(null);
        this.view7f0800aa = null;
        this.view7f0800af.setOnClickListener(null);
        this.view7f0800af = null;
        this.view7f0800a8.setOnClickListener(null);
        this.view7f0800a8 = null;
        this.view7f0800b2.setOnClickListener(null);
        this.view7f0800b2 = null;
    }
}
