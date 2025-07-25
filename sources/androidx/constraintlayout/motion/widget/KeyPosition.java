package androidx.constraintlayout.motion.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.motion.utils.Easing;
import androidx.constraintlayout.widget.C0155R;
import java.util.HashMap;

/* loaded from: classes.dex */
public class KeyPosition extends KeyPositionBase {
    static final int KEY_TYPE = 2;
    static final String NAME = "KeyPosition";
    private static final String PERCENT_X = "percentX";
    private static final String PERCENT_Y = "percentY";
    private static final String TAG = "KeyPosition";
    public static final int TYPE_CARTESIAN = 0;
    public static final int TYPE_PATH = 1;
    public static final int TYPE_SCREEN = 2;
    String mTransitionEasing = null;
    int mPathMotionArc = UNSET;
    int mDrawPath = 0;
    float mPercentWidth = Float.NaN;
    float mPercentHeight = Float.NaN;
    float mPercentX = Float.NaN;
    float mPercentY = Float.NaN;
    float mAltPercentX = Float.NaN;
    float mAltPercentY = Float.NaN;
    int mPositionType = 0;
    private float mCalculatedPositionX = Float.NaN;
    private float mCalculatedPositionY = Float.NaN;

    @Override // androidx.constraintlayout.motion.widget.Key
    public void addValues(HashMap<String, SplineSet> map) {
    }

    public KeyPosition() {
        this.mType = 2;
    }

    @Override // androidx.constraintlayout.motion.widget.Key
    public void load(Context context, AttributeSet attributeSet) {
        Loader.read(this, context.obtainStyledAttributes(attributeSet, C0155R.styleable.KeyPosition));
    }

    @Override // androidx.constraintlayout.motion.widget.KeyPositionBase
    void calcPosition(int i, int i2, float f, float f2, float f3, float f4) {
        int i3 = this.mPositionType;
        if (i3 == 1) {
            calcPathPosition(f, f2, f3, f4);
        } else if (i3 == 2) {
            calcScreenPosition(i, i2);
        } else {
            calcCartesianPosition(f, f2, f3, f4);
        }
    }

    private void calcScreenPosition(int i, int i2) {
        float f = this.mPercentX;
        float f2 = 0;
        this.mCalculatedPositionX = ((i - 0) * f) + f2;
        this.mCalculatedPositionY = ((i2 - 0) * f) + f2;
    }

    private void calcPathPosition(float f, float f2, float f3, float f4) {
        float f5 = f3 - f;
        float f6 = f4 - f2;
        float f7 = this.mPercentX;
        float f8 = this.mPercentY;
        this.mCalculatedPositionX = f + (f5 * f7) + ((-f6) * f8);
        this.mCalculatedPositionY = f2 + (f6 * f7) + (f5 * f8);
    }

    private void calcCartesianPosition(float f, float f2, float f3, float f4) {
        float f5 = f3 - f;
        float f6 = f4 - f2;
        float f7 = Float.isNaN(this.mPercentX) ? 0.0f : this.mPercentX;
        float f8 = Float.isNaN(this.mAltPercentY) ? 0.0f : this.mAltPercentY;
        float f9 = Float.isNaN(this.mPercentY) ? 0.0f : this.mPercentY;
        this.mCalculatedPositionX = (int) (f + (f7 * f5) + ((Float.isNaN(this.mAltPercentX) ? 0.0f : this.mAltPercentX) * f6));
        this.mCalculatedPositionY = (int) (f2 + (f5 * f8) + (f6 * f9));
    }

    @Override // androidx.constraintlayout.motion.widget.KeyPositionBase
    float getPositionX() {
        return this.mCalculatedPositionX;
    }

    @Override // androidx.constraintlayout.motion.widget.KeyPositionBase
    float getPositionY() {
        return this.mCalculatedPositionY;
    }

    @Override // androidx.constraintlayout.motion.widget.KeyPositionBase
    public void positionAttributes(View view, RectF rectF, RectF rectF2, float f, float f2, String[] strArr, float[] fArr) {
        int i = this.mPositionType;
        if (i == 1) {
            positionPathAttributes(rectF, rectF2, f, f2, strArr, fArr);
        } else if (i == 2) {
            positionScreenAttributes(view, rectF, rectF2, f, f2, strArr, fArr);
        } else {
            positionCartAttributes(rectF, rectF2, f, f2, strArr, fArr);
        }
    }

    void positionPathAttributes(RectF rectF, RectF rectF2, float f, float f2, String[] strArr, float[] fArr) {
        float fCenterX = rectF.centerX();
        float fCenterY = rectF.centerY();
        float fCenterX2 = rectF2.centerX() - fCenterX;
        float fCenterY2 = rectF2.centerY() - fCenterY;
        float fHypot = (float) Math.hypot(fCenterX2, fCenterY2);
        if (fHypot < 1.0E-4d) {
            System.out.println("distance ~ 0");
            fArr[0] = 0.0f;
            fArr[1] = 0.0f;
            return;
        }
        float f3 = fCenterX2 / fHypot;
        float f4 = fCenterY2 / fHypot;
        float f5 = f2 - fCenterY;
        float f6 = f - fCenterX;
        float f7 = ((f3 * f5) - (f6 * f4)) / fHypot;
        float f8 = ((f3 * f6) + (f4 * f5)) / fHypot;
        if (strArr[0] != null) {
            if (PERCENT_X.equals(strArr[0])) {
                fArr[0] = f8;
                fArr[1] = f7;
                return;
            }
            return;
        }
        strArr[0] = PERCENT_X;
        strArr[1] = PERCENT_Y;
        fArr[0] = f8;
        fArr[1] = f7;
    }

    void positionScreenAttributes(View view, RectF rectF, RectF rectF2, float f, float f2, String[] strArr, float[] fArr) {
        rectF.centerX();
        rectF.centerY();
        rectF2.centerX();
        rectF2.centerY();
        ViewGroup viewGroup = (ViewGroup) view.getParent();
        int width = viewGroup.getWidth();
        int height = viewGroup.getHeight();
        if (strArr[0] != null) {
            if (PERCENT_X.equals(strArr[0])) {
                fArr[0] = f / width;
                fArr[1] = f2 / height;
                return;
            } else {
                fArr[1] = f / width;
                fArr[0] = f2 / height;
                return;
            }
        }
        strArr[0] = PERCENT_X;
        fArr[0] = f / width;
        strArr[1] = PERCENT_Y;
        fArr[1] = f2 / height;
    }

    void positionCartAttributes(RectF rectF, RectF rectF2, float f, float f2, String[] strArr, float[] fArr) {
        float fCenterX = rectF.centerX();
        float fCenterY = rectF.centerY();
        float fCenterX2 = rectF2.centerX() - fCenterX;
        float fCenterY2 = rectF2.centerY() - fCenterY;
        if (strArr[0] != null) {
            if (PERCENT_X.equals(strArr[0])) {
                fArr[0] = (f - fCenterX) / fCenterX2;
                fArr[1] = (f2 - fCenterY) / fCenterY2;
                return;
            } else {
                fArr[1] = (f - fCenterX) / fCenterX2;
                fArr[0] = (f2 - fCenterY) / fCenterY2;
                return;
            }
        }
        strArr[0] = PERCENT_X;
        fArr[0] = (f - fCenterX) / fCenterX2;
        strArr[1] = PERCENT_Y;
        fArr[1] = (f2 - fCenterY) / fCenterY2;
    }

    @Override // androidx.constraintlayout.motion.widget.KeyPositionBase
    public boolean intersects(int i, int i2, RectF rectF, RectF rectF2, float f, float f2) {
        calcPosition(i, i2, rectF.centerX(), rectF.centerY(), rectF2.centerX(), rectF2.centerY());
        return Math.abs(f - this.mCalculatedPositionX) < 20.0f && Math.abs(f2 - this.mCalculatedPositionY) < 20.0f;
    }

    private static class Loader {
        private static final int CURVE_FIT = 4;
        private static final int DRAW_PATH = 5;
        private static final int FRAME_POSITION = 2;
        private static final int PATH_MOTION_ARC = 10;
        private static final int PERCENT_HEIGHT = 12;
        private static final int PERCENT_WIDTH = 11;
        private static final int PERCENT_X = 6;
        private static final int PERCENT_Y = 7;
        private static final int SIZE_PERCENT = 8;
        private static final int TARGET_ID = 1;
        private static final int TRANSITION_EASING = 3;
        private static final int TYPE = 9;
        private static SparseIntArray mAttrMap;

        private Loader() {
        }

        static {
            SparseIntArray sparseIntArray = new SparseIntArray();
            mAttrMap = sparseIntArray;
            sparseIntArray.append(C0155R.styleable.KeyPosition_motionTarget, 1);
            mAttrMap.append(C0155R.styleable.KeyPosition_framePosition, 2);
            mAttrMap.append(C0155R.styleable.KeyPosition_transitionEasing, 3);
            mAttrMap.append(C0155R.styleable.KeyPosition_curveFit, 4);
            mAttrMap.append(C0155R.styleable.KeyPosition_drawPath, 5);
            mAttrMap.append(C0155R.styleable.KeyPosition_percentX, 6);
            mAttrMap.append(C0155R.styleable.KeyPosition_percentY, 7);
            mAttrMap.append(C0155R.styleable.KeyPosition_keyPositionType, 9);
            mAttrMap.append(C0155R.styleable.KeyPosition_sizePercent, 8);
            mAttrMap.append(C0155R.styleable.KeyPosition_percentWidth, 11);
            mAttrMap.append(C0155R.styleable.KeyPosition_percentHeight, 12);
            mAttrMap.append(C0155R.styleable.KeyPosition_pathMotionArc, 10);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static void read(KeyPosition keyPosition, TypedArray typedArray) {
            int indexCount = typedArray.getIndexCount();
            for (int i = 0; i < indexCount; i++) {
                int index = typedArray.getIndex(i);
                switch (mAttrMap.get(index)) {
                    case 1:
                        if (MotionLayout.IS_IN_EDIT_MODE) {
                            keyPosition.mTargetId = typedArray.getResourceId(index, keyPosition.mTargetId);
                            if (keyPosition.mTargetId == -1) {
                                keyPosition.mTargetString = typedArray.getString(index);
                                break;
                            } else {
                                break;
                            }
                        } else if (typedArray.peekValue(index).type == 3) {
                            keyPosition.mTargetString = typedArray.getString(index);
                            break;
                        } else {
                            keyPosition.mTargetId = typedArray.getResourceId(index, keyPosition.mTargetId);
                            break;
                        }
                    case 2:
                        keyPosition.mFramePosition = typedArray.getInt(index, keyPosition.mFramePosition);
                        break;
                    case 3:
                        if (typedArray.peekValue(index).type == 3) {
                            keyPosition.mTransitionEasing = typedArray.getString(index);
                            break;
                        } else {
                            keyPosition.mTransitionEasing = Easing.NAMED_EASING[typedArray.getInteger(index, 0)];
                            break;
                        }
                    case 4:
                        keyPosition.mCurveFit = typedArray.getInteger(index, keyPosition.mCurveFit);
                        break;
                    case 5:
                        keyPosition.mDrawPath = typedArray.getInt(index, keyPosition.mDrawPath);
                        break;
                    case 6:
                        keyPosition.mPercentX = typedArray.getFloat(index, keyPosition.mPercentX);
                        break;
                    case 7:
                        keyPosition.mPercentY = typedArray.getFloat(index, keyPosition.mPercentY);
                        break;
                    case 8:
                        float f = typedArray.getFloat(index, keyPosition.mPercentHeight);
                        keyPosition.mPercentWidth = f;
                        keyPosition.mPercentHeight = f;
                        break;
                    case 9:
                        keyPosition.mPositionType = typedArray.getInt(index, keyPosition.mPositionType);
                        break;
                    case 10:
                        keyPosition.mPathMotionArc = typedArray.getInt(index, keyPosition.mPathMotionArc);
                        break;
                    case 11:
                        keyPosition.mPercentWidth = typedArray.getFloat(index, keyPosition.mPercentWidth);
                        break;
                    case 12:
                        keyPosition.mPercentHeight = typedArray.getFloat(index, keyPosition.mPercentHeight);
                        break;
                    default:
                        Log.e("KeyPosition", "unused attribute 0x" + Integer.toHexString(index) + "   " + mAttrMap.get(index));
                        break;
                }
            }
            if (keyPosition.mFramePosition == -1) {
                Log.e("KeyPosition", "no frame position");
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004e  */
    @Override // androidx.constraintlayout.motion.widget.Key
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public void setValue(java.lang.String r2, java.lang.Object r3) {
        /*
            r1 = this;
            int r0 = r2.hashCode()
            switch(r0) {
                case -1812823328: goto L44;
                case -1127236479: goto L3a;
                case -1017587252: goto L30;
                case -827014263: goto L26;
                case -200259324: goto L1c;
                case 428090547: goto L12;
                case 428090548: goto L8;
                default: goto L7;
            }
        L7:
            goto L4e
        L8:
            java.lang.String r0 = "percentY"
            boolean r2 = r2.equals(r0)
            if (r2 == 0) goto L4e
            r2 = 6
            goto L4f
        L12:
            java.lang.String r0 = "percentX"
            boolean r2 = r2.equals(r0)
            if (r2 == 0) goto L4e
            r2 = 5
            goto L4f
        L1c:
            java.lang.String r0 = "sizePercent"
            boolean r2 = r2.equals(r0)
            if (r2 == 0) goto L4e
            r2 = 4
            goto L4f
        L26:
            java.lang.String r0 = "drawPath"
            boolean r2 = r2.equals(r0)
            if (r2 == 0) goto L4e
            r2 = 1
            goto L4f
        L30:
            java.lang.String r0 = "percentHeight"
            boolean r2 = r2.equals(r0)
            if (r2 == 0) goto L4e
            r2 = 3
            goto L4f
        L3a:
            java.lang.String r0 = "percentWidth"
            boolean r2 = r2.equals(r0)
            if (r2 == 0) goto L4e
            r2 = 2
            goto L4f
        L44:
            java.lang.String r0 = "transitionEasing"
            boolean r2 = r2.equals(r0)
            if (r2 == 0) goto L4e
            r2 = 0
            goto L4f
        L4e:
            r2 = -1
        L4f:
            switch(r2) {
                case 0: goto L7f;
                case 1: goto L78;
                case 2: goto L71;
                case 3: goto L6a;
                case 4: goto L61;
                case 5: goto L5a;
                case 6: goto L53;
                default: goto L52;
            }
        L52:
            goto L85
        L53:
            float r2 = r1.toFloat(r3)
            r1.mPercentY = r2
            goto L85
        L5a:
            float r2 = r1.toFloat(r3)
            r1.mPercentX = r2
            goto L85
        L61:
            float r2 = r1.toFloat(r3)
            r1.mPercentWidth = r2
            r1.mPercentHeight = r2
            goto L85
        L6a:
            float r2 = r1.toFloat(r3)
            r1.mPercentHeight = r2
            goto L85
        L71:
            float r2 = r1.toFloat(r3)
            r1.mPercentWidth = r2
            goto L85
        L78:
            int r2 = r1.toInt(r3)
            r1.mDrawPath = r2
            goto L85
        L7f:
            java.lang.String r2 = r3.toString()
            r1.mTransitionEasing = r2
        L85:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.constraintlayout.motion.widget.KeyPosition.setValue(java.lang.String, java.lang.Object):void");
    }
}
