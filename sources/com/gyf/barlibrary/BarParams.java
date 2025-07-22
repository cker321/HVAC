package com.gyf.barlibrary;

import android.view.View;
import androidx.core.view.ViewCompat;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public class BarParams implements Cloneable {
    int flymeOSStatusBarFontColor;
    OnKeyboardListener onKeyboardListener;
    View statusBarView;
    View titleBarView;
    int statusBarColor = 0;
    int navigationBarColor = ViewCompat.MEASURED_STATE_MASK;
    int defaultNavigationBarColor = ViewCompat.MEASURED_STATE_MASK;
    float statusBarAlpha = 0.0f;
    float navigationBarAlpha = 0.0f;
    public boolean fullScreen = false;
    boolean hideNavigationBar = false;
    BarHide barHide = BarHide.FLAG_SHOW_BAR;
    boolean statusBarDarkFont = false;
    boolean navigationBarDarkIcon = false;
    boolean autoStatusBarDarkModeEnable = false;
    boolean autoNavigationBarDarkModeEnable = false;
    float autoStatusBarDarkModeAlpha = 0.0f;
    float autoNavigationBarDarkModeAlpha = 0.0f;
    boolean statusBarColorEnabled = true;
    int statusBarColorTransform = ViewCompat.MEASURED_STATE_MASK;
    int navigationBarColorTransform = ViewCompat.MEASURED_STATE_MASK;
    Map<View, Map<Integer, Integer>> viewMap = new HashMap();
    float viewAlpha = 0.0f;
    int contentColor = 0;
    int contentColorTransform = ViewCompat.MEASURED_STATE_MASK;
    float contentAlpha = 0.0f;
    public boolean fits = false;
    boolean isSupportActionBar = false;
    public boolean keyboardEnable = false;
    int keyboardMode = 18;
    boolean navigationBarEnable = true;
    boolean navigationBarWithKitkatEnable = true;
    boolean navigationBarWithEMUI3Enable = true;

    @Deprecated
    boolean fixMarginAtBottom = false;

    /* JADX INFO: Access modifiers changed from: protected */
    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public BarParams m85clone() {
        try {
            return (BarParams) super.clone();
        } catch (CloneNotSupportedException unused) {
            return null;
        }
    }
}
