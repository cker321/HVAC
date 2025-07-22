package com.dnake.desktop.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.dnake.desktop.C0483R;
import com.dnake.desktop.utils.CommonUtils;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* loaded from: classes.dex */
public class TimeView extends LinearLayout {
    private static final int REFRESH_DELAY = 1000;
    private SimpleDateFormat HOUR_FORMAT;
    private SimpleDateFormat MONTH_FORMAT;
    private TextView hourView;
    private final Runnable mTimeRefresher;
    private TextView monthView;
    private TextView weekView;

    public TimeView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.HOUR_FORMAT = new SimpleDateFormat("HH:mm", Locale.CHINESE);
        this.MONTH_FORMAT = new SimpleDateFormat("MM月dd日 ", Locale.CHINESE);
        this.mTimeRefresher = new Runnable() { // from class: com.dnake.desktop.widget.TimeView.1
            @Override // java.lang.Runnable
            public void run() {
                Date date = new Date();
                TimeView.this.hourView.setText(TimeView.this.HOUR_FORMAT.format(date));
                TimeView.this.monthView.setText(TimeView.this.MONTH_FORMAT.format(date));
                TimeView.this.weekView.setText(CommonUtils.getInstance().getWeekOfDate(date));
                TimeView.this.postDelayed(this, 1000L);
            }
        };
        init(context, attributeSet);
    }

    public TimeView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.HOUR_FORMAT = new SimpleDateFormat("HH:mm", Locale.CHINESE);
        this.MONTH_FORMAT = new SimpleDateFormat("MM月dd日 ", Locale.CHINESE);
        this.mTimeRefresher = new Runnable() { // from class: com.dnake.desktop.widget.TimeView.1
            @Override // java.lang.Runnable
            public void run() {
                Date date = new Date();
                TimeView.this.hourView.setText(TimeView.this.HOUR_FORMAT.format(date));
                TimeView.this.monthView.setText(TimeView.this.MONTH_FORMAT.format(date));
                TimeView.this.weekView.setText(CommonUtils.getInstance().getWeekOfDate(date));
                TimeView.this.postDelayed(this, 1000L);
            }
        };
        init(context, attributeSet);
    }

    public TimeView(Context context) {
        super(context);
        this.HOUR_FORMAT = new SimpleDateFormat("HH:mm", Locale.CHINESE);
        this.MONTH_FORMAT = new SimpleDateFormat("MM月dd日 ", Locale.CHINESE);
        this.mTimeRefresher = new Runnable() { // from class: com.dnake.desktop.widget.TimeView.1
            @Override // java.lang.Runnable
            public void run() {
                Date date = new Date();
                TimeView.this.hourView.setText(TimeView.this.HOUR_FORMAT.format(date));
                TimeView.this.monthView.setText(TimeView.this.MONTH_FORMAT.format(date));
                TimeView.this.weekView.setText(CommonUtils.getInstance().getWeekOfDate(date));
                TimeView.this.postDelayed(this, 1000L);
            }
        };
        init(context, null);
    }

    private void init(Context context, AttributeSet attributeSet) {
        if (isInEditMode()) {
            return;
        }
        View viewInflate = LayoutInflater.from(context).inflate(C0483R.layout.cj_view_time, this);
        this.hourView = (TextView) viewInflate.findViewById(C0483R.id.myHourView);
        this.monthView = (TextView) viewInflate.findViewById(C0483R.id.myMonthView);
        this.weekView = (TextView) viewInflate.findViewById(C0483R.id.myWeekView);
    }

    public void start() {
        post(this.mTimeRefresher);
    }

    public void stop() {
        removeCallbacks(this.mTimeRefresher);
    }
}
