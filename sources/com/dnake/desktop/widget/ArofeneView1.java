package com.dnake.desktop.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import com.dnake.desktop.C0483R;

/* loaded from: classes.dex */
public class ArofeneView1 extends View {
    private static final String TAG = ArofeneView1.class.getSimpleName();
    private String arofeneLevelTxt;
    protected int boundSize;
    protected RectF bounds;
    private float boundsHeight;
    private int colorCha;
    private int colorLiang;
    private int colorYou;
    private int colorZhong;
    int level;
    private int levelBgColor;
    private Paint levelPaint;
    private int levelTextSize;
    private int lineHeight;
    private Paint linePaint;
    private int lineWidth;
    private int triangleLength;
    private int triangleMargin;
    private Paint trianglePaint;
    private int txtMargin;

    public ArofeneView1(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.bounds = new RectF();
        this.level = 0;
        this.colorYou = Color.parseColor("#08ca08");
        this.colorLiang = Color.parseColor("#f0c61e");
        this.colorZhong = Color.parseColor("#e9490b");
        this.colorCha = Color.parseColor("#de0f0f");
        this.txtMargin = 2;
        this.triangleMargin = 10;
        initAttrs(context, attributeSet);
        initPaint();
    }

    private void initPaint() {
        Paint paint = new Paint();
        this.trianglePaint = paint;
        paint.setAntiAlias(true);
        this.trianglePaint.setColor(-1);
        this.trianglePaint.setStyle(Paint.Style.FILL);
        Paint paint2 = new Paint();
        this.linePaint = paint2;
        paint2.setStyle(Paint.Style.FILL);
        this.linePaint.setStrokeWidth(this.lineHeight);
        this.levelPaint = new Paint();
    }

    public void setArofeneLevelTxt(int i, Context context) {
        String string = context.getString(C0483R.string.str_arofene_level_you);
        int i2 = this.colorYou;
        if (i == 0) {
            string = context.getString(C0483R.string.str_arofene_level_you);
            i2 = this.colorYou;
        } else if (i == 1) {
            string = context.getString(C0483R.string.str_arofene_level_liang);
            i2 = this.colorLiang;
        } else if (i == 2) {
            string = context.getString(C0483R.string.str_arofene_level_zhong);
            i2 = this.colorZhong;
        } else if (i == 3) {
            string = context.getString(C0483R.string.str_arofene_level_jiaocha);
            i2 = this.colorCha;
        }
        this.arofeneLevelTxt = string;
        this.levelBgColor = i2;
        this.level = i;
        invalidate();
    }

    private void initAttrs(Context context, AttributeSet attributeSet) {
        setArofeneLevelTxt(0, context);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, C0483R.styleable.ArofeneView1);
        this.lineWidth = typedArrayObtainStyledAttributes.getInteger(4, 172);
        this.lineHeight = typedArrayObtainStyledAttributes.getInteger(3, 8);
        this.triangleLength = typedArrayObtainStyledAttributes.getInteger(2, 11);
        this.levelTextSize = typedArrayObtainStyledAttributes.getInteger(1, 20);
        this.boundSize = typedArrayObtainStyledAttributes.getInteger(0, 5);
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawColor(0);
        drawLevelBg(canvas);
        drawTriangle(canvas);
        drawLine(canvas);
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        int mode2 = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i2);
        if (mode != 1073741824) {
            size = this.lineWidth;
        }
        if (mode2 != 1073741824) {
            double stringHeight = getStringHeight(this.levelPaint) + (this.txtMargin * 4) + (this.triangleMargin * 2);
            double dSqrt = Math.sqrt(Math.pow(this.triangleLength, 2.0d) - Math.pow(this.triangleLength / 2, 2.0d));
            Double.isNaN(stringHeight);
            double d = stringHeight + dSqrt;
            double d2 = this.lineHeight;
            Double.isNaN(d2);
            size2 = (int) (d + d2);
        }
        setMeasuredDimension(size, size2);
    }

    private void drawLine(Canvas canvas) {
        double d = this.boundsHeight + (this.triangleMargin * 2);
        double dSqrt = Math.sqrt(Math.pow(this.triangleLength, 2.0d) - Math.pow(this.triangleLength / 2, 2.0d));
        Double.isNaN(d);
        float f = (float) (d + dSqrt);
        this.linePaint.setColor(this.colorYou);
        canvas.drawLine(0.0f, f, this.lineWidth / 4, f, this.linePaint);
        this.linePaint.setColor(this.colorLiang);
        int i = this.lineWidth;
        canvas.drawLine(i / 4, f, i / 2, f, this.linePaint);
        this.linePaint.setColor(this.colorZhong);
        int i2 = this.lineWidth;
        canvas.drawLine(i2 / 2, f, (i2 / 4) * 3, f, this.linePaint);
        this.linePaint.setColor(this.colorCha);
        canvas.drawLine((r1 / 4) * 3, f, this.lineWidth, f, this.linePaint);
    }

    private void drawTriangle(Canvas canvas) {
        int i = (this.level * this.lineWidth) / 4;
        Path path = new Path();
        path.moveTo(((this.lineWidth / 8) - (this.triangleLength / 2)) + i, this.boundsHeight + this.triangleMargin);
        path.lineTo((this.lineWidth / 8) + (this.triangleLength / 2) + i, this.boundsHeight + this.triangleMargin);
        float f = (this.lineWidth / 8) + i;
        double d = this.boundsHeight + this.triangleMargin;
        double dSqrt = Math.sqrt(Math.pow(this.triangleLength, 2.0d) - Math.pow(this.triangleLength / 2, 2.0d));
        Double.isNaN(d);
        path.lineTo(f, (float) (d + dSqrt));
        path.close();
        canvas.drawPath(path, this.trianglePaint);
    }

    private void drawLevelBg(Canvas canvas) {
        this.levelPaint.setStyle(Paint.Style.FILL);
        this.levelPaint.setAntiAlias(true);
        this.levelPaint.setColor(this.levelBgColor);
        this.levelPaint.setTextSize(this.levelTextSize);
        float stringHeight = getStringHeight(this.levelPaint);
        float stringWidth = getStringWidth(this.arofeneLevelTxt, this.levelPaint);
        Log.d(TAG, "Str height:" + stringHeight + "-strWidth:" + stringWidth);
        int i = this.lineWidth;
        float f = stringWidth / 2.0f;
        int i2 = this.txtMargin;
        float f2 = ((float) (i / 2)) - ((((float) i2) * 4.0f) + f);
        float f3 = ((float) (i / 2)) + f + (((float) i2) * 4.0f);
        float f4 = stringHeight + (i2 * 2);
        this.boundsHeight = f4;
        this.bounds.set(f2, 0.0f, f3, f4);
        Log.d(TAG, "left:" + f2 + ",top:0.0,right:" + f3 + ",bottom:" + f4);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("centerX:");
        sb.append(this.bounds.centerX());
        sb.append("-centY:");
        sb.append(this.bounds.centerY());
        Log.d(str, sb.toString());
        RectF rectF = this.bounds;
        int i3 = this.boundSize;
        canvas.drawRoundRect(rectF, i3, i3, this.levelPaint);
        this.levelPaint.setTextAlign(Paint.Align.CENTER);
        this.levelPaint.setColor(-1);
        Paint.FontMetricsInt fontMetricsInt = this.levelPaint.getFontMetricsInt();
        canvas.drawText(this.arofeneLevelTxt, this.bounds.centerX(), (((this.bounds.bottom + this.bounds.top) - fontMetricsInt.bottom) - fontMetricsInt.top) / 2.0f, this.levelPaint);
    }

    public float getStringWidth(String str, Paint paint) {
        return paint.measureText(str);
    }

    public float getStringHeight(Paint paint) {
        Paint.FontMetrics fontMetrics = paint.getFontMetrics();
        return (float) (Math.ceil(fontMetrics.descent - fontMetrics.top) + 2.0d);
    }
}
