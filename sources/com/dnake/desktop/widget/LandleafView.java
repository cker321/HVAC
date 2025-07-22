package com.dnake.desktop.widget;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.Path;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.animation.OvershootInterpolator;
import androidx.core.view.ViewCompat;
import com.dnake.desktop.C0483R;
import java.text.DecimalFormat;

/* loaded from: classes.dex */
public class LandleafView extends View {
    protected static final int ANIMATION_DURATION = 5000;
    protected static final String TAG = "LandleafView";
    protected float angle;
    protected RectF arcRect;
    protected float bRadius;
    protected int boundSize;
    protected RectF bounds;
    protected int cBgColor;
    protected float cCurProgress;
    protected float cLineWidth;
    protected int cProgressColor;
    protected float cRadius;
    protected float cStartAngle;
    protected float cSweepAngle;
    protected float cTriangleMargin;
    protected DecimalFormat decimalFormat;
    protected float leftX;
    protected float leftY;
    protected int levelBg;
    protected String levelText;
    protected int levelTextSize;
    protected float mCenter;
    protected float maxSweep;
    protected String maxText;
    protected String minText;
    protected Path path;
    protected ValueAnimator progressAnim;
    protected Paint progressPaint;
    public String progressText;
    protected int progressTextSize;
    protected int rangeSize;
    protected float rightX;
    protected float rightY;
    protected float sRadius;
    protected float startNum;
    protected Paint trianglePaint;
    protected ValueAnimator txtAnim;
    protected Paint txtPaint;

    /* renamed from: x1 */
    protected float f102x1;
    protected float xPoint;

    /* renamed from: y1 */
    protected float f103y1;
    protected float yPoint;

    protected void setProgressColor(int i) {
        this.cProgressColor = i;
    }

    public void setProgressText(float f) {
        this.progressText = String.valueOf(f);
        invalidate();
    }

    public LandleafView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.progressPaint = new Paint(1);
        this.trianglePaint = new Paint(1);
        this.txtPaint = new Paint(1);
        this.path = new Path();
        this.bounds = new RectF();
        initAttrs(context, attributeSet);
        initPaint();
    }

    protected void initAttrs(Context context, AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0483R.styleable.LandleafView);
        this.cBgColor = typedArrayObtainStyledAttributes.getInteger(0, -7829368);
        this.cProgressColor = typedArrayObtainStyledAttributes.getInteger(13, -16711936);
        this.cCurProgress = typedArrayObtainStyledAttributes.getInteger(4, 0);
        this.cStartAngle = typedArrayObtainStyledAttributes.getInteger(18, 120);
        this.cRadius = typedArrayObtainStyledAttributes.getInteger(16, 200);
        this.cLineWidth = typedArrayObtainStyledAttributes.getInteger(10, 20);
        this.cTriangleMargin = typedArrayObtainStyledAttributes.getInteger(19, 10);
        float integer = typedArrayObtainStyledAttributes.getInteger(20, 20);
        this.progressTextSize = typedArrayObtainStyledAttributes.getInteger(15, 110);
        int integer2 = typedArrayObtainStyledAttributes.getInteger(17, 28);
        this.rangeSize = integer2;
        this.txtPaint.setTextSize(integer2);
        this.levelBg = typedArrayObtainStyledAttributes.getInteger(8, Color.parseColor("#39b54a"));
        this.levelTextSize = typedArrayObtainStyledAttributes.getInteger(9, 28);
        this.boundSize = typedArrayObtainStyledAttributes.getInteger(1, 5);
        String string = typedArrayObtainStyledAttributes.getString(14);
        this.progressText = string;
        this.startNum = Float.parseFloat(string);
        this.minText = typedArrayObtainStyledAttributes.getString(12);
        this.maxText = typedArrayObtainStyledAttributes.getString(11);
        this.levelText = typedArrayObtainStyledAttributes.getString(7);
        typedArrayObtainStyledAttributes.recycle();
        new PaintFlagsDrawFilter(0, 3);
        this.sRadius = this.cTriangleMargin + this.cRadius + this.cLineWidth;
        Log.d(TAG, "小圆半径:" + this.sRadius);
        double d = (double) integer;
        double dPow = Math.pow((double) this.sRadius, 2.0d) + Math.pow(d, 2.0d);
        double d2 = (double) (this.sRadius * 2.0f * integer);
        double dCos = Math.cos(2.6179938779914944d);
        Double.isNaN(d2);
        this.bRadius = (float) Math.sqrt(dPow - (d2 * dCos));
        this.maxSweep = 540.0f - (this.cStartAngle * 2.0f);
        double d3 = this.cRadius + this.cLineWidth + this.cTriangleMargin;
        double dSin = Math.sin(1.0471975511965976d);
        Double.isNaN(d);
        Double.isNaN(d3);
        this.mCenter = (float) (d3 + (dSin * d));
        float f = this.mCenter;
        float f2 = this.cRadius;
        RectF rectF = new RectF(f - f2, f - f2, f + f2, f + f2);
        this.arcRect = rectF;
        this.xPoint = rectF.centerX();
        this.yPoint = this.arcRect.centerY();
        double dSin2 = Math.sin(2.6179938779914944d);
        Double.isNaN(d);
        double d4 = d * dSin2;
        Double.isNaN(this.bRadius);
        this.angle = Math.round((float) ((Math.asin(d4 / r12) / 3.141592653589793d) * 180.0d));
        float f3 = this.cSweepAngle + this.cStartAngle;
        float f4 = this.bRadius;
        double d5 = f4 * f4 * 2.0f;
        double d6 = 2.0f * f4 * f4;
        double d7 = 360.0f - this.maxSweep;
        Double.isNaN(d7);
        double dCos2 = Math.cos((d7 * 3.141592653589793d) / 180.0d);
        Double.isNaN(d6);
        Double.isNaN(d5);
        float fSqrt = (float) Math.sqrt(d5 - (d6 * dCos2));
        double d8 = this.xPoint;
        double d9 = this.sRadius;
        double d10 = f3;
        Double.isNaN(d10);
        double d11 = (d10 * 3.141592653589793d) / 180.0d;
        double dCos3 = Math.cos(d11);
        Double.isNaN(d9);
        Double.isNaN(d8);
        this.f102x1 = (float) (d8 + (d9 * dCos3));
        double d12 = this.yPoint;
        double d13 = this.sRadius;
        double dSin3 = Math.sin(d11);
        Double.isNaN(d13);
        Double.isNaN(d12);
        float f5 = (float) (d12 + (d13 * dSin3));
        this.f103y1 = f5;
        float f6 = this.f102x1;
        float f7 = this.cTriangleMargin;
        this.leftX = f6 + f7;
        this.leftY = f5 + f7;
        this.rightX = (f6 + fSqrt) - this.txtPaint.measureText(this.minText);
        this.rightY = this.f103y1 + this.cTriangleMargin;
        calRadian();
    }

    protected void calRadian() {
        float f = this.cCurProgress;
        if (f < 0.0f || f > 100.0f) {
            throw new IllegalArgumentException("progress must >=0 && <=100，now progress is " + this.cCurProgress);
        }
        this.cSweepAngle = (f / 100.0f) * this.maxSweep;
    }

    public void drawArc(Canvas canvas, float f) {
        canvas.drawArc(this.arcRect, this.cStartAngle, f, false, this.progressPaint);
    }

    public LandleafView(Context context) {
        super(context);
        this.progressPaint = new Paint(1);
        this.trianglePaint = new Paint(1);
        this.txtPaint = new Paint(1);
        this.path = new Path();
        this.bounds = new RectF();
        initAttrs(context, null);
        initPaint();
    }

    protected void initPaint() {
        this.progressPaint.setAntiAlias(true);
        this.progressPaint.setStyle(Paint.Style.STROKE);
        this.progressPaint.setPathEffect(new DashPathEffect(new float[]{3.0f, 9.0f, 3.0f, 9.0f}, 1.0f));
        this.progressPaint.setStrokeWidth(this.cLineWidth);
        this.trianglePaint.setAntiAlias(true);
        this.trianglePaint.setStyle(Paint.Style.FILL);
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i2);
        if (mode != 1073741824) {
            size = (int) (getPaddingLeft() + (this.mCenter * 2.0f) + getPaddingRight());
        }
        if (mode2 != 1073741824) {
            size2 = (int) (getPaddingTop() + (this.mCenter * 2.0f) + getPaddingBottom());
        }
        setMeasuredDimension(size, size2);
    }

    public LandleafView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.progressPaint = new Paint(1);
        this.trianglePaint = new Paint(1);
        this.txtPaint = new Paint(1);
        this.path = new Path();
        this.bounds = new RectF();
        initAttrs(context, attributeSet);
        initPaint();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawColor(0);
        this.progressPaint.setColor(this.cBgColor);
        drawArc(canvas, this.maxSweep);
        this.progressPaint.setColor(this.cProgressColor);
        drawArc(canvas, this.cSweepAngle);
        this.trianglePaint.setColor(-1);
        drawTriangle(canvas, this.cSweepAngle);
        this.txtPaint.setStyle(Paint.Style.FILL);
        this.txtPaint.setAntiAlias(true);
        this.txtPaint.setColor(this.levelBg);
        this.txtPaint.setTextSize(this.levelTextSize);
        float stringHeight = getStringHeight(this.txtPaint);
        float stringWidth = getStringWidth(this.levelText, this.txtPaint);
        float f = this.cTriangleMargin / 2.0f;
        RectF rectF = this.bounds;
        float fMeasureText = (this.xPoint - (this.txtPaint.measureText(this.levelText) / 2.0f)) - f;
        float f2 = (this.yPoint + (this.sRadius / 2.0f)) - stringHeight;
        float f3 = f / 2.0f;
        rectF.set(fMeasureText, f2 - f3, (this.xPoint - (this.txtPaint.measureText(this.levelText) / 2.0f)) + stringWidth + f, this.yPoint + (this.sRadius / 2.0f) + f3);
        RectF rectF2 = this.bounds;
        int i = this.boundSize;
        canvas.drawRoundRect(rectF2, i, i, this.txtPaint);
        this.txtPaint.setTextAlign(Paint.Align.CENTER);
        this.txtPaint.setColor(-1);
        Paint.FontMetricsInt fontMetricsInt = this.txtPaint.getFontMetricsInt();
        canvas.drawText(this.levelText, this.bounds.centerX(), (((this.bounds.bottom + this.bounds.top) - fontMetricsInt.bottom) - fontMetricsInt.top) / 2.0f, this.txtPaint);
        this.txtPaint.setTextSize(this.rangeSize);
        canvas.drawText(this.minText, this.leftX, this.leftY, this.txtPaint);
        canvas.drawText(this.maxText, this.rightX, this.rightY, this.txtPaint);
        this.txtPaint.setColor(-1);
        this.txtPaint.setTextSize(this.progressTextSize);
        this.txtPaint.setShadowLayer(3.0f, 3.0f, 4.0f, ViewCompat.MEASURED_STATE_MASK);
        canvas.drawText(this.progressText, this.bounds.centerX(), (this.yPoint + (this.sRadius / 5.0f)) - (this.cTriangleMargin * 2.0f), this.txtPaint);
        this.txtPaint.reset();
    }

    protected void drawTriangle(Canvas canvas, float f) {
        float f2 = f + this.cStartAngle;
        double d = this.xPoint;
        double d2 = this.sRadius;
        double d3 = f2;
        Double.isNaN(d3);
        double d4 = (d3 * 3.141592653589793d) / 180.0d;
        double dCos = Math.cos(d4);
        Double.isNaN(d2);
        Double.isNaN(d);
        this.f102x1 = (float) (d + (d2 * dCos));
        double d5 = this.yPoint;
        double d6 = this.sRadius;
        double dSin = Math.sin(d4);
        Double.isNaN(d6);
        Double.isNaN(d5);
        this.f103y1 = (float) (d5 + (d6 * dSin));
        double d7 = this.xPoint;
        double d8 = this.bRadius;
        double d9 = this.angle + f2;
        Double.isNaN(d9);
        double dCos2 = Math.cos((d9 * 3.141592653589793d) / 180.0d);
        Double.isNaN(d8);
        Double.isNaN(d7);
        float f3 = (float) (d7 + (d8 * dCos2));
        double d10 = this.yPoint;
        double d11 = this.bRadius;
        double d12 = this.angle + f2;
        Double.isNaN(d12);
        double dSin2 = Math.sin((d12 * 3.141592653589793d) / 180.0d);
        Double.isNaN(d11);
        Double.isNaN(d10);
        float f4 = (float) (d10 + (d11 * dSin2));
        double d13 = this.xPoint;
        double d14 = this.bRadius;
        double d15 = f2 - this.angle;
        Double.isNaN(d15);
        double dCos3 = Math.cos((d15 * 3.141592653589793d) / 180.0d);
        Double.isNaN(d14);
        Double.isNaN(d13);
        float f5 = (float) (d13 + (d14 * dCos3));
        double d16 = this.yPoint;
        double d17 = this.bRadius;
        double d18 = f2 - this.angle;
        Double.isNaN(d18);
        double dSin3 = Math.sin((d18 * 3.141592653589793d) / 180.0d);
        Double.isNaN(d17);
        Double.isNaN(d16);
        this.path.setFillType(Path.FillType.EVEN_ODD);
        this.path.moveTo(this.f102x1, this.f103y1);
        this.path.lineTo(f3, f4);
        this.path.lineTo(f5, (float) (d16 + (d17 * dSin3)));
        this.path.lineTo(this.f102x1, this.f103y1);
        this.path.close();
        canvas.drawPath(this.path, this.trianglePaint);
        this.path.reset();
    }

    public void setProgress(float f, float f2, float f3, int i, String str) {
        if (f >= f3) {
            f = f3;
        }
        if (f <= f2) {
            f = f2;
        }
        int i2 = (int) (((f - f2) / (f3 - f2)) * 100.0f);
        this.levelText = str;
        this.levelBg = i;
        this.minText = String.valueOf(f2);
        this.maxText = String.valueOf(f3);
        if (i2 < 0 || i2 > 100) {
            throw new IllegalArgumentException("progress must >=0 && <=100，now progress is " + i2);
        }
        valueAnimator(this.cCurProgress, i2, i);
        runFloat(500, f);
        this.startNum = f;
    }

    public void setRange(float f, float f2) {
        this.minText = String.valueOf(f);
        this.maxText = String.valueOf(f2);
        invalidate();
    }

    protected void valueAnimator(final float f, final float f2, final int i) {
        ValueAnimator valueAnimator = this.progressAnim;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(1);
        this.progressAnim = valueAnimatorOfInt;
        valueAnimatorOfInt.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.dnake.desktop.widget.LandleafView.1
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public void onAnimationUpdate(ValueAnimator valueAnimator2) {
                float animatedFraction = valueAnimator2.getAnimatedFraction();
                LandleafView.this.cCurProgress = evaluate(animatedFraction, Integer.valueOf((int) f), Integer.valueOf((int) f2)).intValue();
                if (LandleafView.this.cCurProgress < 0.0f || LandleafView.this.cCurProgress > 100.0f) {
                    return;
                }
                LandleafView.this.calRadian();
                LandleafView.this.setProgressColor(i);
                LandleafView.this.invalidate();
            }

            private Integer evaluate(float f3, Integer num, Integer num2) {
                return Integer.valueOf((int) (num.intValue() + (f3 * (num2.intValue() - r3))));
            }
        });
        this.progressAnim.addListener(new Animator.AnimatorListener() { // from class: com.dnake.desktop.widget.LandleafView.2
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                LandleafView.this.progressAnim = null;
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
                LandleafView.this.progressAnim = null;
            }
        });
        this.progressAnim.setInterpolator(new OvershootInterpolator());
        this.progressAnim.setDuration((int) ((Math.abs(f2 - f) / 100.0f) * 5000.0f));
        this.progressAnim.start();
    }

    protected DecimalFormat getDecimalFormat(float f) {
        int length = (f + "").contains(".") ? ((f + "").length() - (f + "").indexOf(".")) - 1 : 0;
        StringBuilder sb = new StringBuilder("##0");
        if (length >= 1) {
            sb.append(".");
            for (int i = 0; i < length; i++) {
                sb.append("0");
            }
        }
        DecimalFormat decimalFormat = new DecimalFormat(sb.toString());
        this.decimalFormat = decimalFormat;
        return decimalFormat;
    }

    protected void runFloat(int i, float f) {
        this.decimalFormat = getDecimalFormat(f);
        ValueAnimator valueAnimator = this.txtAnim;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(this.startNum, f);
        this.txtAnim = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(i);
        this.txtAnim.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.dnake.desktop.widget.-$$Lambda$LandleafView$gnHyM4CuMsbXXhIbqZSSvRPVP9s
            @Override // android.animation.ValueAnimator.AnimatorUpdateListener
            public final void onAnimationUpdate(ValueAnimator valueAnimator2) {
                this.f$0.lambda$runFloat$0$LandleafView(valueAnimator2);
            }
        });
        this.txtAnim.addListener(new Animator.AnimatorListener() { // from class: com.dnake.desktop.widget.LandleafView.3
            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationRepeat(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationStart(Animator animator) {
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationEnd(Animator animator) {
                LandleafView.this.txtAnim = null;
            }

            @Override // android.animation.Animator.AnimatorListener
            public void onAnimationCancel(Animator animator) {
                LandleafView.this.txtAnim = null;
            }
        });
        this.txtAnim.start();
    }

    public /* synthetic */ void lambda$runFloat$0$LandleafView(ValueAnimator valueAnimator) {
        this.progressText = this.decimalFormat.format(Float.parseFloat(valueAnimator.getAnimatedValue().toString()));
        invalidate();
    }

    public float getStringWidth(String str, Paint paint) {
        return paint.measureText(str);
    }

    public float getStringHeight(Paint paint) {
        Paint.FontMetrics fontMetrics = paint.getFontMetrics();
        return (float) (Math.ceil(fontMetrics.descent - fontMetrics.top) + 2.0d);
    }
}
