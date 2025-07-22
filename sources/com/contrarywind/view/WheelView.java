package com.contrarywind.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Handler;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import com.contrarywind.adapter.WheelAdapter;
import com.contrarywind.interfaces.IPickerViewData;
import com.contrarywind.listener.LoopViewGestureListener;
import com.contrarywind.listener.OnItemSelectedListener;
import com.contrarywind.timer.InertiaTimerTask;
import com.contrarywind.timer.MessageHandler;
import com.contrarywind.timer.SmoothScrollTimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public class WheelView extends View {
    private static final float SCALE_CONTENT = 0.8f;
    private static final String[] TIME_NUM = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09"};
    private static final int VELOCITY_FLING = 5;
    private float CENTER_CONTENT_OFFSET;
    private final float DEFAULT_TEXT_TARGET_SKEW_X;
    private WheelAdapter adapter;
    private float centerY;
    private int change;
    private Context context;
    private int dividerColor;
    private DividerType dividerType;
    private int drawCenterContentStart;
    private int drawOutContentStart;
    private float firstLineY;
    private GestureDetector gestureDetector;
    private Handler handler;
    private int initPosition;
    private boolean isCenterLabel;
    private boolean isLoop;
    private boolean isOptions;
    private float itemHeight;
    private int itemsVisible;
    private String label;
    private float lineSpacingMultiplier;
    private ScheduledExecutorService mExecutor;
    private ScheduledFuture<?> mFuture;
    private int mGravity;
    private int mOffset;
    private int maxTextHeight;
    private int maxTextWidth;
    private int measuredHeight;
    private int measuredWidth;
    private OnItemSelectedListener onItemSelectedListener;
    private Paint paintCenterText;
    private Paint paintIndicator;
    private Paint paintOuterText;
    private int preCurrentIndex;
    private float previousY;
    private int radius;
    private float secondLineY;
    private int selectedItem;
    private long startTime;
    private int textColorCenter;
    private int textColorOut;
    private int textSize;
    private int textXOffset;
    private float totalScrollY;
    private Typeface typeface;
    private int widthMeasureSpec;

    public enum ACTION {
        CLICK,
        FLING,
        DAGGLE
    }

    public enum DividerType {
        FILL,
        WRAP
    }

    public WheelView(Context context) {
        this(context, null);
    }

    public WheelView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.isOptions = false;
        this.isCenterLabel = true;
        this.mExecutor = Executors.newSingleThreadScheduledExecutor();
        this.typeface = Typeface.MONOSPACE;
        this.lineSpacingMultiplier = 1.6f;
        this.itemsVisible = 11;
        this.mOffset = 0;
        this.previousY = 0.0f;
        this.startTime = 0L;
        this.mGravity = 17;
        this.drawCenterContentStart = 0;
        this.drawOutContentStart = 0;
        this.DEFAULT_TEXT_TARGET_SKEW_X = 0.5f;
        this.textSize = getResources().getDimensionPixelSize(C0467R.dimen.pickerview_textsize);
        float f = getResources().getDisplayMetrics().density;
        if (f < 1.0f) {
            this.CENTER_CONTENT_OFFSET = 2.4f;
        } else if (1.0f <= f && f < 2.0f) {
            this.CENTER_CONTENT_OFFSET = 3.6f;
        } else if (1.0f <= f && f < 2.0f) {
            this.CENTER_CONTENT_OFFSET = 4.5f;
        } else if (2.0f <= f && f < 3.0f) {
            this.CENTER_CONTENT_OFFSET = 6.0f;
        } else if (f >= 3.0f) {
            this.CENTER_CONTENT_OFFSET = f * 2.5f;
        }
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0467R.styleable.pickerview, 0, 0);
            this.mGravity = typedArrayObtainStyledAttributes.getInt(C0467R.styleable.pickerview_wheelview_gravity, 17);
            this.textColorOut = typedArrayObtainStyledAttributes.getColor(C0467R.styleable.pickerview_wheelview_textColorOut, -5723992);
            this.textColorCenter = typedArrayObtainStyledAttributes.getColor(C0467R.styleable.pickerview_wheelview_textColorCenter, -14013910);
            this.dividerColor = typedArrayObtainStyledAttributes.getColor(C0467R.styleable.pickerview_wheelview_dividerColor, -2763307);
            this.textSize = typedArrayObtainStyledAttributes.getDimensionPixelOffset(C0467R.styleable.pickerview_wheelview_textSize, this.textSize);
            this.lineSpacingMultiplier = typedArrayObtainStyledAttributes.getFloat(C0467R.styleable.pickerview_wheelview_lineSpacingMultiplier, this.lineSpacingMultiplier);
            typedArrayObtainStyledAttributes.recycle();
        }
        judgeLineSpace();
        initLoopView(context);
    }

    private void judgeLineSpace() {
        float f = this.lineSpacingMultiplier;
        if (f < 1.0f) {
            this.lineSpacingMultiplier = 1.0f;
        } else if (f > 4.0f) {
            this.lineSpacingMultiplier = 4.0f;
        }
    }

    private void initLoopView(Context context) {
        this.context = context;
        this.handler = new MessageHandler(this);
        GestureDetector gestureDetector = new GestureDetector(context, new LoopViewGestureListener(this));
        this.gestureDetector = gestureDetector;
        gestureDetector.setIsLongpressEnabled(false);
        this.isLoop = true;
        this.totalScrollY = 0.0f;
        this.initPosition = -1;
        initPaints();
    }

    private void initPaints() {
        Paint paint = new Paint();
        this.paintOuterText = paint;
        paint.setColor(this.textColorOut);
        this.paintOuterText.setAntiAlias(true);
        this.paintOuterText.setTypeface(this.typeface);
        this.paintOuterText.setTextSize(this.textSize);
        Paint paint2 = new Paint();
        this.paintCenterText = paint2;
        paint2.setColor(this.textColorCenter);
        this.paintCenterText.setAntiAlias(true);
        this.paintCenterText.setTextScaleX(1.1f);
        this.paintCenterText.setTypeface(this.typeface);
        this.paintCenterText.setTextSize(this.textSize);
        Paint paint3 = new Paint();
        this.paintIndicator = paint3;
        paint3.setColor(this.dividerColor);
        this.paintIndicator.setAntiAlias(true);
        setLayerType(1, null);
    }

    private void reMeasure() {
        if (this.adapter == null) {
            return;
        }
        measureTextWidthHeight();
        int i = (int) (this.itemHeight * (this.itemsVisible - 1));
        double d = i * 2;
        Double.isNaN(d);
        this.measuredHeight = (int) (d / 3.141592653589793d);
        double d2 = i;
        Double.isNaN(d2);
        this.radius = (int) (d2 / 3.141592653589793d);
        this.measuredWidth = View.MeasureSpec.getSize(this.widthMeasureSpec);
        int i2 = this.measuredHeight;
        float f = this.itemHeight;
        this.firstLineY = (i2 - f) / 2.0f;
        float f2 = (i2 + f) / 2.0f;
        this.secondLineY = f2;
        this.centerY = (f2 - ((f - this.maxTextHeight) / 2.0f)) - this.CENTER_CONTENT_OFFSET;
        if (this.initPosition == -1) {
            if (this.isLoop) {
                this.initPosition = (this.adapter.getItemsCount() + 1) / 2;
            } else {
                this.initPosition = 0;
            }
        }
        this.preCurrentIndex = this.initPosition;
    }

    private void measureTextWidthHeight() {
        Rect rect = new Rect();
        for (int i = 0; i < this.adapter.getItemsCount(); i++) {
            String contentText = getContentText(this.adapter.getItem(i));
            this.paintCenterText.getTextBounds(contentText, 0, contentText.length(), rect);
            int iWidth = rect.width();
            if (iWidth > this.maxTextWidth) {
                this.maxTextWidth = iWidth;
            }
        }
        this.paintCenterText.getTextBounds("星期", 0, 2, rect);
        int iHeight = rect.height() + 2;
        this.maxTextHeight = iHeight;
        this.itemHeight = this.lineSpacingMultiplier * iHeight;
    }

    public void smoothScroll(ACTION action) {
        cancelFuture();
        if (action == ACTION.FLING || action == ACTION.DAGGLE) {
            float f = this.totalScrollY;
            float f2 = this.itemHeight;
            int i = (int) (((f % f2) + f2) % f2);
            this.mOffset = i;
            if (i > f2 / 2.0f) {
                this.mOffset = (int) (f2 - i);
            } else {
                this.mOffset = -i;
            }
        }
        this.mFuture = this.mExecutor.scheduleWithFixedDelay(new SmoothScrollTimerTask(this, this.mOffset), 0L, 10L, TimeUnit.MILLISECONDS);
    }

    public final void scrollBy(float f) {
        cancelFuture();
        this.mFuture = this.mExecutor.scheduleWithFixedDelay(new InertiaTimerTask(this, f), 0L, 5L, TimeUnit.MILLISECONDS);
    }

    public void cancelFuture() {
        ScheduledFuture<?> scheduledFuture = this.mFuture;
        if (scheduledFuture == null || scheduledFuture.isCancelled()) {
            return;
        }
        this.mFuture.cancel(true);
        this.mFuture = null;
    }

    public final void setCyclic(boolean z) {
        this.isLoop = z;
    }

    public final void setTypeface(Typeface typeface) {
        this.typeface = typeface;
        this.paintOuterText.setTypeface(typeface);
        this.paintCenterText.setTypeface(this.typeface);
    }

    public final void setTextSize(float f) {
        if (f > 0.0f) {
            int i = (int) (this.context.getResources().getDisplayMetrics().density * f);
            this.textSize = i;
            this.paintOuterText.setTextSize(i);
            this.paintCenterText.setTextSize(this.textSize);
        }
    }

    public final void setCurrentItem(int i) {
        this.selectedItem = i;
        this.initPosition = i;
        this.totalScrollY = 0.0f;
        invalidate();
    }

    public final void setOnItemSelectedListener(OnItemSelectedListener onItemSelectedListener) {
        this.onItemSelectedListener = onItemSelectedListener;
    }

    public final void setAdapter(WheelAdapter wheelAdapter) {
        this.adapter = wheelAdapter;
        reMeasure();
        invalidate();
    }

    public final WheelAdapter getAdapter() {
        return this.adapter;
    }

    public final int getCurrentItem() {
        int i;
        WheelAdapter wheelAdapter = this.adapter;
        if (wheelAdapter == null) {
            return 0;
        }
        if (this.isLoop && ((i = this.selectedItem) < 0 || i >= wheelAdapter.getItemsCount())) {
            return Math.max(0, Math.min(Math.abs(Math.abs(this.selectedItem) - this.adapter.getItemsCount()), this.adapter.getItemsCount() - 1));
        }
        return Math.max(0, Math.min(this.selectedItem, this.adapter.getItemsCount() - 1));
    }

    public final void onItemSelected() {
        if (this.onItemSelectedListener != null) {
            postDelayed(new Runnable() { // from class: com.contrarywind.view.WheelView.1
                @Override // java.lang.Runnable
                public void run() {
                    WheelView.this.onItemSelectedListener.onItemSelected(WheelView.this.getCurrentItem());
                }
            }, 200L);
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        int i;
        if (this.adapter == null) {
            return;
        }
        int iMin = Math.min(Math.max(0, this.initPosition), this.adapter.getItemsCount() - 1);
        this.initPosition = iMin;
        Object[] objArr = new Object[this.itemsVisible];
        int i2 = (int) (this.totalScrollY / this.itemHeight);
        this.change = i2;
        try {
            this.preCurrentIndex = iMin + (i2 % this.adapter.getItemsCount());
        } catch (ArithmeticException unused) {
            Log.e("WheelView", "出错了！adapter.getItemsCount() == 0，联动数据不匹配");
        }
        if (!this.isLoop) {
            if (this.preCurrentIndex < 0) {
                this.preCurrentIndex = 0;
            }
            if (this.preCurrentIndex > this.adapter.getItemsCount() - 1) {
                this.preCurrentIndex = this.adapter.getItemsCount() - 1;
            }
        } else {
            if (this.preCurrentIndex < 0) {
                this.preCurrentIndex = this.adapter.getItemsCount() + this.preCurrentIndex;
            }
            if (this.preCurrentIndex > this.adapter.getItemsCount() - 1) {
                this.preCurrentIndex -= this.adapter.getItemsCount();
            }
        }
        float f = this.totalScrollY % this.itemHeight;
        int i3 = 0;
        while (true) {
            int i4 = this.itemsVisible;
            if (i3 >= i4) {
                break;
            }
            int i5 = this.preCurrentIndex - ((i4 / 2) - i3);
            if (this.isLoop) {
                objArr[i3] = this.adapter.getItem(getLoopMappingIndex(i5));
            } else if (i5 < 0) {
                objArr[i3] = "";
            } else if (i5 > this.adapter.getItemsCount() - 1) {
                objArr[i3] = "";
            } else {
                objArr[i3] = this.adapter.getItem(i5);
            }
            i3++;
        }
        if (this.dividerType == DividerType.WRAP) {
            if (TextUtils.isEmpty(this.label)) {
                i = (this.measuredWidth - this.maxTextWidth) / 2;
            } else {
                i = (this.measuredWidth - this.maxTextWidth) / 4;
            }
            float f2 = i - 12;
            float f3 = f2 <= 0.0f ? 10.0f : f2;
            float f4 = this.measuredWidth - f3;
            float f5 = this.firstLineY;
            float f6 = f3;
            canvas.drawLine(f6, f5, f4, f5, this.paintIndicator);
            float f7 = this.secondLineY;
            canvas.drawLine(f6, f7, f4, f7, this.paintIndicator);
        } else {
            float f8 = this.firstLineY;
            canvas.drawLine(0.0f, f8, this.measuredWidth, f8, this.paintIndicator);
            float f9 = this.secondLineY;
            canvas.drawLine(0.0f, f9, this.measuredWidth, f9, this.paintIndicator);
        }
        if (!TextUtils.isEmpty(this.label) && this.isCenterLabel) {
            canvas.drawText(this.label, (this.measuredWidth - getTextWidth(this.paintCenterText, this.label)) - this.CENTER_CONTENT_OFFSET, this.centerY, this.paintCenterText);
        }
        for (int i6 = 0; i6 < this.itemsVisible; i6++) {
            canvas.save();
            double d = ((this.itemHeight * i6) - f) / this.radius;
            Double.isNaN(d);
            float f10 = (float) (90.0d - ((d / 3.141592653589793d) * 180.0d));
            if (f10 >= 90.0f || f10 <= -90.0f) {
                canvas.restore();
            } else {
                float fPow = (float) Math.pow(Math.abs(f10) / 90.0f, 2.2d);
                String contentText = (!this.isCenterLabel && !TextUtils.isEmpty(this.label) && !TextUtils.isEmpty(getContentText(objArr[i6]))) ? getContentText(objArr[i6]) + this.label : getContentText(objArr[i6]);
                reMeasureTextSize(contentText);
                measuredCenterContentStart(contentText);
                measuredOutContentStart(contentText);
                double d2 = this.radius;
                double dCos = Math.cos(d);
                double d3 = this.radius;
                Double.isNaN(d3);
                Double.isNaN(d2);
                double d4 = d2 - (dCos * d3);
                double dSin = Math.sin(d);
                double d5 = this.maxTextHeight;
                Double.isNaN(d5);
                float f11 = (float) (d4 - ((dSin * d5) / 2.0d));
                canvas.translate(0.0f, f11);
                float f12 = this.firstLineY;
                if (f11 <= f12 && this.maxTextHeight + f11 >= f12) {
                    canvas.save();
                    canvas.clipRect(0.0f, 0.0f, this.measuredWidth, this.firstLineY - f11);
                    canvas.scale(1.0f, ((float) Math.sin(d)) * SCALE_CONTENT);
                    canvas.drawText(contentText, this.drawOutContentStart, this.maxTextHeight, this.paintOuterText);
                    canvas.restore();
                    canvas.save();
                    canvas.clipRect(0.0f, this.firstLineY - f11, this.measuredWidth, (int) this.itemHeight);
                    canvas.scale(1.0f, ((float) Math.sin(d)) * 1.0f);
                    canvas.drawText(contentText, this.drawCenterContentStart, this.maxTextHeight - this.CENTER_CONTENT_OFFSET, this.paintCenterText);
                    canvas.restore();
                } else {
                    float f13 = this.secondLineY;
                    if (f11 <= f13 && this.maxTextHeight + f11 >= f13) {
                        canvas.save();
                        canvas.clipRect(0.0f, 0.0f, this.measuredWidth, this.secondLineY - f11);
                        canvas.scale(1.0f, ((float) Math.sin(d)) * 1.0f);
                        canvas.drawText(contentText, this.drawCenterContentStart, this.maxTextHeight - this.CENTER_CONTENT_OFFSET, this.paintCenterText);
                        canvas.restore();
                        canvas.save();
                        canvas.clipRect(0.0f, this.secondLineY - f11, this.measuredWidth, (int) this.itemHeight);
                        canvas.scale(1.0f, ((float) Math.sin(d)) * SCALE_CONTENT);
                        canvas.drawText(contentText, this.drawOutContentStart, this.maxTextHeight, this.paintOuterText);
                        canvas.restore();
                    } else {
                        if (f11 >= this.firstLineY) {
                            int i7 = this.maxTextHeight;
                            if (i7 + f11 <= this.secondLineY) {
                                canvas.drawText(contentText, this.drawCenterContentStart, i7 - this.CENTER_CONTENT_OFFSET, this.paintCenterText);
                                this.selectedItem = this.preCurrentIndex - ((this.itemsVisible / 2) - i6);
                            }
                        }
                        canvas.save();
                        canvas.clipRect(0, 0, this.measuredWidth, (int) this.itemHeight);
                        canvas.scale(1.0f, ((float) Math.sin(d)) * SCALE_CONTENT);
                        Paint paint = this.paintOuterText;
                        int i8 = this.textXOffset;
                        paint.setTextSkewX((i8 == 0 ? 0 : i8 > 0 ? 1 : -1) * (f10 <= 0.0f ? 1 : -1) * 0.5f * fPow);
                        this.paintOuterText.setAlpha((int) ((1.0f - fPow) * 255.0f));
                        canvas.drawText(contentText, this.drawOutContentStart + (this.textXOffset * fPow), this.maxTextHeight, this.paintOuterText);
                        canvas.restore();
                        canvas.restore();
                        this.paintCenterText.setTextSize(this.textSize);
                    }
                }
                canvas.restore();
                this.paintCenterText.setTextSize(this.textSize);
            }
        }
    }

    private void reMeasureTextSize(String str) {
        Rect rect = new Rect();
        this.paintCenterText.getTextBounds(str, 0, str.length(), rect);
        int i = this.textSize;
        for (int iWidth = rect.width(); iWidth > this.measuredWidth; iWidth = rect.width()) {
            i--;
            this.paintCenterText.setTextSize(i);
            this.paintCenterText.getTextBounds(str, 0, str.length(), rect);
        }
        this.paintOuterText.setTextSize(i);
    }

    private int getLoopMappingIndex(int i) {
        if (i < 0) {
            return getLoopMappingIndex(i + this.adapter.getItemsCount());
        }
        return i > this.adapter.getItemsCount() + (-1) ? getLoopMappingIndex(i - this.adapter.getItemsCount()) : i;
    }

    private String getContentText(Object obj) {
        if (obj == null) {
            return "";
        }
        if (obj instanceof IPickerViewData) {
            return ((IPickerViewData) obj).getPickerViewText();
        }
        if (obj instanceof Integer) {
            return getFixNum(((Integer) obj).intValue());
        }
        return obj.toString();
    }

    private String getFixNum(int i) {
        return (i < 0 || i >= 10) ? String.valueOf(i) : TIME_NUM[i];
    }

    private void measuredCenterContentStart(String str) {
        String str2;
        Rect rect = new Rect();
        this.paintCenterText.getTextBounds(str, 0, str.length(), rect);
        int i = this.mGravity;
        if (i == 3) {
            this.drawCenterContentStart = 0;
            return;
        }
        if (i == 5) {
            this.drawCenterContentStart = (this.measuredWidth - rect.width()) - ((int) this.CENTER_CONTENT_OFFSET);
            return;
        }
        if (i != 17) {
            return;
        }
        if (this.isOptions || (str2 = this.label) == null || str2.equals("") || !this.isCenterLabel) {
            double dWidth = this.measuredWidth - rect.width();
            Double.isNaN(dWidth);
            this.drawCenterContentStart = (int) (dWidth * 0.5d);
        } else {
            double dWidth2 = this.measuredWidth - rect.width();
            Double.isNaN(dWidth2);
            this.drawCenterContentStart = (int) (dWidth2 * 0.25d);
        }
    }

    private void measuredOutContentStart(String str) {
        String str2;
        Rect rect = new Rect();
        this.paintOuterText.getTextBounds(str, 0, str.length(), rect);
        int i = this.mGravity;
        if (i == 3) {
            this.drawOutContentStart = 0;
            return;
        }
        if (i == 5) {
            this.drawOutContentStart = (this.measuredWidth - rect.width()) - ((int) this.CENTER_CONTENT_OFFSET);
            return;
        }
        if (i != 17) {
            return;
        }
        if (this.isOptions || (str2 = this.label) == null || str2.equals("") || !this.isCenterLabel) {
            double dWidth = this.measuredWidth - rect.width();
            Double.isNaN(dWidth);
            this.drawOutContentStart = (int) (dWidth * 0.5d);
        } else {
            double dWidth2 = this.measuredWidth - rect.width();
            Double.isNaN(dWidth2);
            this.drawOutContentStart = (int) (dWidth2 * 0.25d);
        }
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        this.widthMeasureSpec = i;
        reMeasure();
        setMeasuredDimension(this.measuredWidth, this.measuredHeight);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean zOnTouchEvent = this.gestureDetector.onTouchEvent(motionEvent);
        float f = (-this.initPosition) * this.itemHeight;
        float itemsCount = ((this.adapter.getItemsCount() - 1) - this.initPosition) * this.itemHeight;
        int action = motionEvent.getAction();
        boolean z = false;
        if (action == 0) {
            this.startTime = System.currentTimeMillis();
            cancelFuture();
            this.previousY = motionEvent.getRawY();
        } else if (action == 2) {
            float rawY = this.previousY - motionEvent.getRawY();
            this.previousY = motionEvent.getRawY();
            float f2 = this.totalScrollY + rawY;
            this.totalScrollY = f2;
            if (!this.isLoop && ((f2 - (this.itemHeight * 0.25f) < f && rawY < 0.0f) || (this.totalScrollY + (this.itemHeight * 0.25f) > itemsCount && rawY > 0.0f))) {
                this.totalScrollY -= rawY;
                z = true;
            }
        } else if (!zOnTouchEvent) {
            float y = motionEvent.getY();
            int i = this.radius;
            double dAcos = Math.acos((i - y) / i);
            double d = this.radius;
            Double.isNaN(d);
            double d2 = dAcos * d;
            float f3 = this.itemHeight;
            double d3 = f3 / 2.0f;
            Double.isNaN(d3);
            double d4 = d2 + d3;
            Double.isNaN(f3);
            this.mOffset = (int) (((((int) (d4 / r7)) - (this.itemsVisible / 2)) * f3) - (((this.totalScrollY % f3) + f3) % f3));
            if (System.currentTimeMillis() - this.startTime > 120) {
                smoothScroll(ACTION.DAGGLE);
            } else {
                smoothScroll(ACTION.CLICK);
            }
        }
        if (!z && motionEvent.getAction() != 0) {
            invalidate();
        }
        return true;
    }

    public int getItemsCount() {
        WheelAdapter wheelAdapter = this.adapter;
        if (wheelAdapter != null) {
            return wheelAdapter.getItemsCount();
        }
        return 0;
    }

    public void setLabel(String str) {
        this.label = str;
    }

    public void isCenterLabel(boolean z) {
        this.isCenterLabel = z;
    }

    public void setGravity(int i) {
        this.mGravity = i;
    }

    public int getTextWidth(Paint paint, String str) {
        if (str == null || str.length() <= 0) {
            return 0;
        }
        int length = str.length();
        paint.getTextWidths(str, new float[length]);
        int iCeil = 0;
        for (int i = 0; i < length; i++) {
            iCeil += (int) Math.ceil(r2[i]);
        }
        return iCeil;
    }

    public void setIsOptions(boolean z) {
        this.isOptions = z;
    }

    public void setTextColorOut(int i) {
        this.textColorOut = i;
        this.paintOuterText.setColor(i);
    }

    public void setTextColorCenter(int i) {
        this.textColorCenter = i;
        this.paintCenterText.setColor(i);
    }

    public void setTextXOffset(int i) {
        this.textXOffset = i;
        if (i != 0) {
            this.paintCenterText.setTextScaleX(1.0f);
        }
    }

    public void setDividerColor(int i) {
        this.dividerColor = i;
        this.paintIndicator.setColor(i);
    }

    public void setDividerType(DividerType dividerType) {
        this.dividerType = dividerType;
    }

    public void setLineSpacingMultiplier(float f) {
        if (f != 0.0f) {
            this.lineSpacingMultiplier = f;
            judgeLineSpace();
        }
    }

    public boolean isLoop() {
        return this.isLoop;
    }

    public float getTotalScrollY() {
        return this.totalScrollY;
    }

    public void setTotalScrollY(float f) {
        this.totalScrollY = f;
    }

    public float getItemHeight() {
        return this.itemHeight;
    }

    public int getInitPosition() {
        return this.initPosition;
    }

    @Override // android.view.View
    public Handler getHandler() {
        return this.handler;
    }
}
