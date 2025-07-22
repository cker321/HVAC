package com.google.zxing;

import com.google.zxing.common.detector.MathUtils;

/* loaded from: classes.dex */
public class ResultPoint {

    /* renamed from: x */
    private final float f105x;

    /* renamed from: y */
    private final float f106y;

    public ResultPoint(float f, float f2) {
        this.f105x = f;
        this.f106y = f2;
    }

    public final float getX() {
        return this.f105x;
    }

    public final float getY() {
        return this.f106y;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof ResultPoint) {
            ResultPoint resultPoint = (ResultPoint) obj;
            if (this.f105x == resultPoint.f105x && this.f106y == resultPoint.f106y) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (Float.floatToIntBits(this.f105x) * 31) + Float.floatToIntBits(this.f106y);
    }

    public final String toString() {
        return "(" + this.f105x + ',' + this.f106y + ')';
    }

    public static void orderBestPatterns(ResultPoint[] resultPointArr) {
        ResultPoint resultPoint;
        ResultPoint resultPoint2;
        ResultPoint resultPoint3;
        float fDistance = distance(resultPointArr[0], resultPointArr[1]);
        float fDistance2 = distance(resultPointArr[1], resultPointArr[2]);
        float fDistance3 = distance(resultPointArr[0], resultPointArr[2]);
        if (fDistance2 >= fDistance && fDistance2 >= fDistance3) {
            resultPoint = resultPointArr[0];
            resultPoint2 = resultPointArr[1];
            resultPoint3 = resultPointArr[2];
        } else if (fDistance3 >= fDistance2 && fDistance3 >= fDistance) {
            resultPoint = resultPointArr[1];
            resultPoint2 = resultPointArr[0];
            resultPoint3 = resultPointArr[2];
        } else {
            resultPoint = resultPointArr[2];
            resultPoint2 = resultPointArr[0];
            resultPoint3 = resultPointArr[1];
        }
        if (crossProductZ(resultPoint2, resultPoint, resultPoint3) < 0.0f) {
            ResultPoint resultPoint4 = resultPoint3;
            resultPoint3 = resultPoint2;
            resultPoint2 = resultPoint4;
        }
        resultPointArr[0] = resultPoint2;
        resultPointArr[1] = resultPoint;
        resultPointArr[2] = resultPoint3;
    }

    public static float distance(ResultPoint resultPoint, ResultPoint resultPoint2) {
        return MathUtils.distance(resultPoint.f105x, resultPoint.f106y, resultPoint2.f105x, resultPoint2.f106y);
    }

    private static float crossProductZ(ResultPoint resultPoint, ResultPoint resultPoint2, ResultPoint resultPoint3) {
        float f = resultPoint2.f105x;
        float f2 = resultPoint2.f106y;
        return ((resultPoint3.f105x - f) * (resultPoint.f106y - f2)) - ((resultPoint3.f106y - f2) * (resultPoint.f105x - f));
    }
}
