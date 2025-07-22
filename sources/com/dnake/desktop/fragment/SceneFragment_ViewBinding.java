package com.dnake.desktop.fragment;

import android.view.View;
import android.widget.ImageView;
import butterknife.Unbinder;
import butterknife.internal.DebouncingOnClickListener;
import butterknife.internal.Utils;
import com.dnake.desktop.C0483R;

/* loaded from: classes.dex */
public class SceneFragment_ViewBinding implements Unbinder {
    private SceneFragment target;
    private View view7f080100;
    private View view7f080101;
    private View view7f080102;
    private View view7f080103;

    public SceneFragment_ViewBinding(final SceneFragment sceneFragment, View view) {
        this.target = sceneFragment;
        View viewFindRequiredView = Utils.findRequiredView(view, C0483R.id.rlModeLijia, "method 'onViewClicked'");
        this.view7f080102 = viewFindRequiredView;
        viewFindRequiredView.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.SceneFragment_ViewBinding.1
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                sceneFragment.onViewClicked(view2);
            }
        });
        View viewFindRequiredView2 = Utils.findRequiredView(view, C0483R.id.rlModeJujia, "method 'onViewClicked'");
        this.view7f080101 = viewFindRequiredView2;
        viewFindRequiredView2.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.SceneFragment_ViewBinding.2
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                sceneFragment.onViewClicked(view2);
            }
        });
        View viewFindRequiredView3 = Utils.findRequiredView(view, C0483R.id.rlModeShuimian, "method 'onViewClicked'");
        this.view7f080103 = viewFindRequiredView3;
        viewFindRequiredView3.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.SceneFragment_ViewBinding.3
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                sceneFragment.onViewClicked(view2);
            }
        });
        View viewFindRequiredView4 = Utils.findRequiredView(view, C0483R.id.rlModeJuhui, "method 'onViewClicked'");
        this.view7f080100 = viewFindRequiredView4;
        viewFindRequiredView4.setOnClickListener(new DebouncingOnClickListener() { // from class: com.dnake.desktop.fragment.SceneFragment_ViewBinding.4
            @Override // butterknife.internal.DebouncingOnClickListener
            public void doClick(View view2) {
                sceneFragment.onViewClicked(view2);
            }
        });
        sceneFragment.imageViews = (ImageView[]) Utils.arrayFilteringNull((ImageView) Utils.findRequiredViewAsType(view, C0483R.id.rlModeLijia, "field 'imageViews'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.rlModeJujia, "field 'imageViews'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.rlModeShuimian, "field 'imageViews'", ImageView.class), (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.rlModeJuhui, "field 'imageViews'", ImageView.class));
    }

    @Override // butterknife.Unbinder
    public void unbind() {
        SceneFragment sceneFragment = this.target;
        if (sceneFragment == null) {
            throw new IllegalStateException("Bindings already cleared.");
        }
        this.target = null;
        sceneFragment.imageViews = null;
        this.view7f080102.setOnClickListener(null);
        this.view7f080102 = null;
        this.view7f080101.setOnClickListener(null);
        this.view7f080101 = null;
        this.view7f080103.setOnClickListener(null);
        this.view7f080103 = null;
        this.view7f080100.setOnClickListener(null);
        this.view7f080100 = null;
    }
}
