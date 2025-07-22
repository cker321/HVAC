package com.dnake.desktop.fragment;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import androidx.core.content.ContextCompat;
import butterknife.Unbinder;
import butterknife.internal.Utils;
import com.dnake.desktop.C0483R;
import com.dnake.desktop.widget.ArofeneView1;
import com.dnake.desktop.widget.LandleafView;

/* loaded from: classes.dex */
public class MonitorFragment_ViewBinding implements Unbinder {
    private MonitorFragment target;

    public MonitorFragment_ViewBinding(MonitorFragment monitorFragment, View view) {
        this.target = monitorFragment;
        monitorFragment.tvUnit = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvUnit, "field 'tvUnit'", TextView.class);
        monitorFragment.ivWeatherStatus = (ImageView) Utils.findRequiredViewAsType(view, C0483R.id.ivWeatherStatus, "field 'ivWeatherStatus'", ImageView.class);
        monitorFragment.tvWeatherStatus = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvWeatherStatus, "field 'tvWeatherStatus'", TextView.class);
        monitorFragment.tvUpdateTime = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvUpdateTime, "field 'tvUpdateTime'", TextView.class);
        monitorFragment.tvCalender = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvCalender, "field 'tvCalender'", TextView.class);
        monitorFragment.tvWindDir = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvWindDir, "field 'tvWindDir'", TextView.class);
        monitorFragment.tvWindLevel = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvWindLevel, "field 'tvWindLevel'", TextView.class);
        monitorFragment.tvSport = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvSport, "field 'tvSport'", TextView.class);
        monitorFragment.tvSunny = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvSunny, "field 'tvSunny'", TextView.class);
        monitorFragment.tvChuanyi = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvChuanyi, "field 'tvChuanyi'", TextView.class);
        monitorFragment.tvGanmao = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvGanmao, "field 'tvGanmao'", TextView.class);
        monitorFragment.tvCo2In = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvCo2In, "field 'tvCo2In'", TextView.class);
        monitorFragment.tvTempIn = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvTempIn, "field 'tvTempIn'", TextView.class);
        monitorFragment.tvTempOut = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvTempOut, "field 'tvTempOut'", TextView.class);
        monitorFragment.tvHumidityIn = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvHumidityIn, "field 'tvHumidityIn'", TextView.class);
        monitorFragment.tvHumidityOut = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvHumidityOut, "field 'tvHumidityOut'", TextView.class);
        monitorFragment.tvPmIn = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvPmIn, "field 'tvPmIn'", TextView.class);
        monitorFragment.tvPmOut = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvPmOut, "field 'tvPmOut'", TextView.class);
        monitorFragment.arofeneViewVoc = (ArofeneView1) Utils.findRequiredViewAsType(view, C0483R.id.arofeneView1F, "field 'arofeneViewVoc'", ArofeneView1.class);
        monitorFragment.tvDataType = (TextView) Utils.findRequiredViewAsType(view, C0483R.id.tvDataType, "field 'tvDataType'", TextView.class);
        monitorFragment.myMonitorLayout = (LandleafView) Utils.findRequiredViewAsType(view, C0483R.id.myCustomLayout, "field 'myMonitorLayout'", LandleafView.class);
        monitorFragment.layouts = Utils.listFilteringNull((RelativeLayout) Utils.findRequiredViewAsType(view, C0483R.id.rlVoc, "field 'layouts'", RelativeLayout.class), (RelativeLayout) Utils.findRequiredViewAsType(view, C0483R.id.rlCo2, "field 'layouts'", RelativeLayout.class), (RelativeLayout) Utils.findRequiredViewAsType(view, C0483R.id.rlTemp, "field 'layouts'", RelativeLayout.class), (RelativeLayout) Utils.findRequiredViewAsType(view, C0483R.id.rlHumidity, "field 'layouts'", RelativeLayout.class), (RelativeLayout) Utils.findRequiredViewAsType(view, C0483R.id.rlPm, "field 'layouts'", RelativeLayout.class));
        Context context = view.getContext();
        Resources resources = context.getResources();
        monitorFragment.tvUnits = resources.getStringArray(C0483R.array.dataUnit);
        monitorFragment.dataTypes = resources.getStringArray(C0483R.array.dataType);
        monitorFragment.arofeneLevels = resources.getStringArray(C0483R.array.arofeneLevel);
        monitorFragment.colorLevelGood = ContextCompat.getColor(context, C0483R.color.colorLevelGood);
        monitorFragment.colorLevelMedium = ContextCompat.getColor(context, C0483R.color.colorLevelMedium);
        monitorFragment.colorLevelBad = ContextCompat.getColor(context, C0483R.color.colorLevelBad);
        monitorFragment.colorClicked = ContextCompat.getColor(context, C0483R.color.colorClicked);
        monitorFragment.colorUnClick = ContextCompat.getColor(context, C0483R.color.colorUnClick);
        monitorFragment.shapeLeftBottomSelected = ContextCompat.getDrawable(context, C0483R.drawable.shape_left_bottom_selected);
        monitorFragment.shapeLeftBottomUnSelect = ContextCompat.getDrawable(context, C0483R.drawable.shape_left_bottom_unselect);
        monitorFragment.shapeLeftTopSelected = ContextCompat.getDrawable(context, C0483R.drawable.shape_left_top_selected);
        monitorFragment.shapeLeftTopUnSelect = ContextCompat.getDrawable(context, C0483R.drawable.shape_left_top_unselect);
        monitorFragment.strShushi = resources.getString(C0483R.string.str_level_shushi);
        monitorFragment.strLianghao = resources.getString(C0483R.string.str_level_lianghao);
        monitorFragment.strJiaocha = resources.getString(C0483R.string.str_level_jiaocha);
    }

    @Override // butterknife.Unbinder
    public void unbind() {
        MonitorFragment monitorFragment = this.target;
        if (monitorFragment == null) {
            throw new IllegalStateException("Bindings already cleared.");
        }
        this.target = null;
        monitorFragment.tvUnit = null;
        monitorFragment.ivWeatherStatus = null;
        monitorFragment.tvWeatherStatus = null;
        monitorFragment.tvUpdateTime = null;
        monitorFragment.tvCalender = null;
        monitorFragment.tvWindDir = null;
        monitorFragment.tvWindLevel = null;
        monitorFragment.tvSport = null;
        monitorFragment.tvSunny = null;
        monitorFragment.tvChuanyi = null;
        monitorFragment.tvGanmao = null;
        monitorFragment.tvCo2In = null;
        monitorFragment.tvTempIn = null;
        monitorFragment.tvTempOut = null;
        monitorFragment.tvHumidityIn = null;
        monitorFragment.tvHumidityOut = null;
        monitorFragment.tvPmIn = null;
        monitorFragment.tvPmOut = null;
        monitorFragment.arofeneViewVoc = null;
        monitorFragment.tvDataType = null;
        monitorFragment.myMonitorLayout = null;
        monitorFragment.layouts = null;
    }
}
