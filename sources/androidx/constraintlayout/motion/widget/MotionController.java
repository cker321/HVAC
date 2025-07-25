package androidx.constraintlayout.motion.widget;

import android.graphics.RectF;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.motion.utils.CurveFit;
import androidx.constraintlayout.motion.utils.Easing;
import androidx.constraintlayout.motion.utils.VelocityMatrix;
import androidx.constraintlayout.motion.widget.KeyCycleOscillator;
import androidx.constraintlayout.motion.widget.SplineSet;
import androidx.constraintlayout.motion.widget.TimeCycleSplineSet;
import androidx.constraintlayout.solver.widgets.ConstraintWidget;
import androidx.constraintlayout.solver.widgets.analyzer.BasicMeasure;
import androidx.constraintlayout.widget.ConstraintAttribute;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes.dex */
public class MotionController {
    private static final boolean DEBUG = false;
    public static final int DRAW_PATH_AS_CONFIGURED = 4;
    public static final int DRAW_PATH_BASIC = 1;
    public static final int DRAW_PATH_CARTESIAN = 3;
    public static final int DRAW_PATH_NONE = 0;
    public static final int DRAW_PATH_RECTANGLE = 5;
    public static final int DRAW_PATH_RELATIVE = 2;
    public static final int DRAW_PATH_SCREEN = 6;
    private static final boolean FAVOR_FIXED_SIZE_VIEWS = false;
    public static final int HORIZONTAL_PATH_X = 2;
    public static final int HORIZONTAL_PATH_Y = 3;
    public static final int PATH_PERCENT = 0;
    public static final int PATH_PERPENDICULAR = 1;
    private static final String TAG = "MotionController";
    public static final int VERTICAL_PATH_X = 4;
    public static final int VERTICAL_PATH_Y = 5;
    String[] attributeTable;
    private CurveFit mArcSpline;
    private int[] mAttributeInterpCount;
    private String[] mAttributeNames;
    private HashMap<String, SplineSet> mAttributesMap;
    String mConstraintTag;
    private HashMap<String, KeyCycleOscillator> mCycleMap;
    int mId;
    private double[] mInterpolateData;
    private int[] mInterpolateVariables;
    private double[] mInterpolateVelocity;
    private KeyTrigger[] mKeyTriggers;
    private CurveFit[] mSpline;
    private HashMap<String, TimeCycleSplineSet> mTimeCycleAttributesMap;
    View mView;
    private int mCurveFitType = -1;
    private MotionPaths mStartMotionPath = new MotionPaths();
    private MotionPaths mEndMotionPath = new MotionPaths();
    private MotionConstrainedPoint mStartPoint = new MotionConstrainedPoint();
    private MotionConstrainedPoint mEndPoint = new MotionConstrainedPoint();
    float mMotionStagger = Float.NaN;
    float mStaggerOffset = 0.0f;
    float mStaggerScale = 1.0f;
    private int MAX_DIMENSION = 4;
    private float[] mValuesBuff = new float[4];
    private ArrayList<MotionPaths> mMotionPaths = new ArrayList<>();
    private float[] mVelocity = new float[1];
    private ArrayList<Key> mKeyList = new ArrayList<>();
    private int mPathMotionArc = Key.UNSET;

    MotionPaths getKeyFrame(int i) {
        return this.mMotionPaths.get(i);
    }

    MotionController(View view) {
        setView(view);
    }

    float getStartX() {
        return this.mStartMotionPath.f29x;
    }

    float getStartY() {
        return this.mStartMotionPath.f30y;
    }

    float getFinalX() {
        return this.mEndMotionPath.f29x;
    }

    float getFinalY() {
        return this.mEndMotionPath.f30y;
    }

    void buildPath(float[] fArr, int i) {
        int i2 = i;
        float f = 1.0f;
        float f2 = 1.0f / (i2 - 1);
        HashMap<String, SplineSet> map = this.mAttributesMap;
        SplineSet splineSet = map == null ? null : map.get("translationX");
        HashMap<String, SplineSet> map2 = this.mAttributesMap;
        SplineSet splineSet2 = map2 == null ? null : map2.get("translationY");
        HashMap<String, KeyCycleOscillator> map3 = this.mCycleMap;
        KeyCycleOscillator keyCycleOscillator = map3 == null ? null : map3.get("translationX");
        HashMap<String, KeyCycleOscillator> map4 = this.mCycleMap;
        KeyCycleOscillator keyCycleOscillator2 = map4 != null ? map4.get("translationY") : null;
        int i3 = 0;
        while (i3 < i2) {
            float f3 = i3 * f2;
            float f4 = 0.0f;
            if (this.mStaggerScale != f) {
                if (f3 < this.mStaggerOffset) {
                    f3 = 0.0f;
                }
                float f5 = this.mStaggerOffset;
                if (f3 > f5 && f3 < 1.0d) {
                    f3 = (f3 - f5) * this.mStaggerScale;
                }
            }
            double d = f3;
            Easing easing = this.mStartMotionPath.mKeyFrameEasing;
            float f6 = Float.NaN;
            Iterator<MotionPaths> it = this.mMotionPaths.iterator();
            while (it.hasNext()) {
                MotionPaths next = it.next();
                if (next.mKeyFrameEasing != null) {
                    if (next.time < f3) {
                        easing = next.mKeyFrameEasing;
                        f4 = next.time;
                    } else if (Float.isNaN(f6)) {
                        f6 = next.time;
                    }
                }
            }
            if (easing != null) {
                if (Float.isNaN(f6)) {
                    f6 = 1.0f;
                }
                d = (((float) easing.get((f3 - f4) / r16)) * (f6 - f4)) + f4;
            }
            this.mSpline[0].getPos(d, this.mInterpolateData);
            CurveFit curveFit = this.mArcSpline;
            if (curveFit != null) {
                double[] dArr = this.mInterpolateData;
                if (dArr.length > 0) {
                    curveFit.getPos(d, dArr);
                }
            }
            int i4 = i3 * 2;
            this.mStartMotionPath.getCenter(this.mInterpolateVariables, this.mInterpolateData, fArr, i4);
            if (keyCycleOscillator != null) {
                fArr[i4] = fArr[i4] + keyCycleOscillator.get(f3);
            } else if (splineSet != null) {
                fArr[i4] = fArr[i4] + splineSet.get(f3);
            }
            if (keyCycleOscillator2 != null) {
                int i5 = i4 + 1;
                fArr[i5] = fArr[i5] + keyCycleOscillator2.get(f3);
            } else if (splineSet2 != null) {
                int i6 = i4 + 1;
                fArr[i6] = fArr[i6] + splineSet2.get(f3);
            }
            i3++;
            i2 = i;
            f = 1.0f;
        }
    }

    void buildBounds(float[] fArr, int i) {
        float f = 1.0f / (i - 1);
        HashMap<String, SplineSet> map = this.mAttributesMap;
        if (map != null) {
            map.get("translationX");
        }
        HashMap<String, SplineSet> map2 = this.mAttributesMap;
        if (map2 != null) {
            map2.get("translationY");
        }
        HashMap<String, KeyCycleOscillator> map3 = this.mCycleMap;
        if (map3 != null) {
            map3.get("translationX");
        }
        HashMap<String, KeyCycleOscillator> map4 = this.mCycleMap;
        if (map4 != null) {
            map4.get("translationY");
        }
        for (int i2 = 0; i2 < i; i2++) {
            float f2 = i2 * f;
            float f3 = 0.0f;
            if (this.mStaggerScale != 1.0f) {
                if (f2 < this.mStaggerOffset) {
                    f2 = 0.0f;
                }
                float f4 = this.mStaggerOffset;
                if (f2 > f4 && f2 < 1.0d) {
                    f2 = (f2 - f4) * this.mStaggerScale;
                }
            }
            double d = f2;
            Easing easing = this.mStartMotionPath.mKeyFrameEasing;
            float f5 = Float.NaN;
            Iterator<MotionPaths> it = this.mMotionPaths.iterator();
            while (it.hasNext()) {
                MotionPaths next = it.next();
                if (next.mKeyFrameEasing != null) {
                    if (next.time < f2) {
                        easing = next.mKeyFrameEasing;
                        f3 = next.time;
                    } else if (Float.isNaN(f5)) {
                        f5 = next.time;
                    }
                }
            }
            if (easing != null) {
                if (Float.isNaN(f5)) {
                    f5 = 1.0f;
                }
                d = (((float) easing.get((f2 - f3) / r9)) * (f5 - f3)) + f3;
            }
            this.mSpline[0].getPos(d, this.mInterpolateData);
            CurveFit curveFit = this.mArcSpline;
            if (curveFit != null) {
                double[] dArr = this.mInterpolateData;
                if (dArr.length > 0) {
                    curveFit.getPos(d, dArr);
                }
            }
            this.mStartMotionPath.getBounds(this.mInterpolateVariables, this.mInterpolateData, fArr, i2 * 2);
        }
    }

    private float getPreCycleDistance() {
        float[] fArr = new float[2];
        float f = 1.0f / 99;
        double d = 0.0d;
        double d2 = 0.0d;
        float f2 = 0.0f;
        for (int i = 0; i < 100; i++) {
            float f3 = i * f;
            double d3 = f3;
            Easing easing = this.mStartMotionPath.mKeyFrameEasing;
            float f4 = Float.NaN;
            Iterator<MotionPaths> it = this.mMotionPaths.iterator();
            float f5 = 0.0f;
            while (it.hasNext()) {
                MotionPaths next = it.next();
                if (next.mKeyFrameEasing != null) {
                    if (next.time < f3) {
                        Easing easing2 = next.mKeyFrameEasing;
                        f5 = next.time;
                        easing = easing2;
                    } else if (Float.isNaN(f4)) {
                        f4 = next.time;
                    }
                }
            }
            if (easing != null) {
                if (Float.isNaN(f4)) {
                    f4 = 1.0f;
                }
                d3 = (((float) easing.get((f3 - f5) / r16)) * (f4 - f5)) + f5;
            }
            this.mSpline[0].getPos(d3, this.mInterpolateData);
            this.mStartMotionPath.getCenter(this.mInterpolateVariables, this.mInterpolateData, fArr, 0);
            if (i > 0) {
                double d4 = f2;
                double d5 = fArr[1];
                Double.isNaN(d5);
                double d6 = d2 - d5;
                double d7 = fArr[0];
                Double.isNaN(d7);
                double dHypot = Math.hypot(d6, d - d7);
                Double.isNaN(d4);
                f2 = (float) (d4 + dHypot);
            }
            d = fArr[0];
            d2 = fArr[1];
        }
        return f2;
    }

    KeyPositionBase getPositionKeyframe(int i, int i2, float f, float f2) {
        RectF rectF = new RectF();
        rectF.left = this.mStartMotionPath.f29x;
        rectF.top = this.mStartMotionPath.f30y;
        rectF.right = rectF.left + this.mStartMotionPath.width;
        rectF.bottom = rectF.top + this.mStartMotionPath.height;
        RectF rectF2 = new RectF();
        rectF2.left = this.mEndMotionPath.f29x;
        rectF2.top = this.mEndMotionPath.f30y;
        rectF2.right = rectF2.left + this.mEndMotionPath.width;
        rectF2.bottom = rectF2.top + this.mEndMotionPath.height;
        Iterator<Key> it = this.mKeyList.iterator();
        while (it.hasNext()) {
            Key next = it.next();
            if (next instanceof KeyPositionBase) {
                KeyPositionBase keyPositionBase = (KeyPositionBase) next;
                if (keyPositionBase.intersects(i, i2, rectF, rectF2, f, f2)) {
                    return keyPositionBase;
                }
            }
        }
        return null;
    }

    int buildKeyFrames(float[] fArr, int[] iArr) {
        if (fArr == null) {
            return 0;
        }
        double[] timePoints = this.mSpline[0].getTimePoints();
        if (iArr != null) {
            Iterator<MotionPaths> it = this.mMotionPaths.iterator();
            int i = 0;
            while (it.hasNext()) {
                iArr[i] = it.next().mMode;
                i++;
            }
        }
        int i2 = 0;
        for (double d : timePoints) {
            this.mSpline[0].getPos(d, this.mInterpolateData);
            this.mStartMotionPath.getCenter(this.mInterpolateVariables, this.mInterpolateData, fArr, i2);
            i2 += 2;
        }
        return i2 / 2;
    }

    int buildKeyBounds(float[] fArr, int[] iArr) {
        if (fArr == null) {
            return 0;
        }
        double[] timePoints = this.mSpline[0].getTimePoints();
        if (iArr != null) {
            Iterator<MotionPaths> it = this.mMotionPaths.iterator();
            int i = 0;
            while (it.hasNext()) {
                iArr[i] = it.next().mMode;
                i++;
            }
        }
        int i2 = 0;
        for (double d : timePoints) {
            this.mSpline[0].getPos(d, this.mInterpolateData);
            this.mStartMotionPath.getBounds(this.mInterpolateVariables, this.mInterpolateData, fArr, i2);
            i2 += 2;
        }
        return i2 / 2;
    }

    int getAttributeValues(String str, float[] fArr, int i) {
        SplineSet splineSet = this.mAttributesMap.get(str);
        if (splineSet == null) {
            return -1;
        }
        for (int i2 = 0; i2 < fArr.length; i2++) {
            fArr[i2] = splineSet.get(i2 / (fArr.length - 1));
        }
        return fArr.length;
    }

    void buildRect(float f, float[] fArr, int i) {
        this.mSpline[0].getPos(getAdjustedPosition(f, null), this.mInterpolateData);
        this.mStartMotionPath.getRect(this.mInterpolateVariables, this.mInterpolateData, fArr, i);
    }

    void buildRectangles(float[] fArr, int i) {
        float f = 1.0f / (i - 1);
        for (int i2 = 0; i2 < i; i2++) {
            this.mSpline[0].getPos(getAdjustedPosition(i2 * f, null), this.mInterpolateData);
            this.mStartMotionPath.getRect(this.mInterpolateVariables, this.mInterpolateData, fArr, i2 * 8);
        }
    }

    float getKeyFrameParameter(int i, float f, float f2) {
        float f3 = this.mEndMotionPath.f29x - this.mStartMotionPath.f29x;
        float f4 = this.mEndMotionPath.f30y - this.mStartMotionPath.f30y;
        float f5 = this.mStartMotionPath.f29x + (this.mStartMotionPath.width / 2.0f);
        float f6 = this.mStartMotionPath.f30y + (this.mStartMotionPath.height / 2.0f);
        float fHypot = (float) Math.hypot(f3, f4);
        if (fHypot < 1.0E-7d) {
            return Float.NaN;
        }
        float f7 = f - f5;
        float f8 = f2 - f6;
        if (((float) Math.hypot(f7, f8)) == 0.0f) {
            return 0.0f;
        }
        float f9 = (f7 * f3) + (f8 * f4);
        if (i == 0) {
            return f9 / fHypot;
        }
        if (i == 1) {
            return (float) Math.sqrt((fHypot * fHypot) - (f9 * f9));
        }
        if (i == 2) {
            return f7 / f3;
        }
        if (i == 3) {
            return f8 / f3;
        }
        if (i == 4) {
            return f7 / f4;
        }
        if (i != 5) {
            return 0.0f;
        }
        return f8 / f4;
    }

    private void insertKey(MotionPaths motionPaths) {
        if (Collections.binarySearch(this.mMotionPaths, motionPaths) == 0) {
            Log.e(TAG, " KeyPath positon \"" + motionPaths.position + "\" outside of range");
        }
        this.mMotionPaths.add((-r0) - 1, motionPaths);
    }

    void addKeys(ArrayList<Key> arrayList) {
        this.mKeyList.addAll(arrayList);
    }

    void addKey(Key key) {
        this.mKeyList.add(key);
    }

    public void setPathMotionArc(int i) {
        this.mPathMotionArc = i;
    }

    public void setup(int i, int i2, float f, long j) {
        ArrayList arrayList;
        TimeCycleSplineSet timeCycleSplineSetMakeSpline;
        ConstraintAttribute constraintAttribute;
        SplineSet splineSetMakeSpline;
        ConstraintAttribute constraintAttribute2;
        new HashSet();
        HashSet<String> hashSet = new HashSet<>();
        HashSet<String> hashSet2 = new HashSet<>();
        HashSet<String> hashSet3 = new HashSet<>();
        HashMap<String, Integer> map = new HashMap<>();
        if (this.mPathMotionArc != Key.UNSET) {
            this.mStartMotionPath.mPathMotionArc = this.mPathMotionArc;
        }
        this.mStartPoint.different(this.mEndPoint, hashSet2);
        ArrayList<Key> arrayList2 = this.mKeyList;
        if (arrayList2 != null) {
            Iterator<Key> it = arrayList2.iterator();
            arrayList = null;
            while (it.hasNext()) {
                Key next = it.next();
                if (next instanceof KeyPosition) {
                    KeyPosition keyPosition = (KeyPosition) next;
                    insertKey(new MotionPaths(i, i2, keyPosition, this.mStartMotionPath, this.mEndMotionPath));
                    if (keyPosition.mCurveFit != Key.UNSET) {
                        this.mCurveFitType = keyPosition.mCurveFit;
                    }
                } else if (next instanceof KeyCycle) {
                    next.getAttributeNames(hashSet3);
                } else if (next instanceof KeyTimeCycle) {
                    next.getAttributeNames(hashSet);
                } else if (next instanceof KeyTrigger) {
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add((KeyTrigger) next);
                } else {
                    next.setInterpolation(map);
                    next.getAttributeNames(hashSet2);
                }
            }
        } else {
            arrayList = null;
        }
        char c = 0;
        if (arrayList != null) {
            this.mKeyTriggers = (KeyTrigger[]) arrayList.toArray(new KeyTrigger[0]);
        }
        char c2 = 1;
        if (!hashSet2.isEmpty()) {
            this.mAttributesMap = new HashMap<>();
            Iterator<String> it2 = hashSet2.iterator();
            while (it2.hasNext()) {
                String next2 = it2.next();
                if (next2.startsWith("CUSTOM,")) {
                    SparseArray sparseArray = new SparseArray();
                    String str = next2.split(",")[c2];
                    Iterator<Key> it3 = this.mKeyList.iterator();
                    while (it3.hasNext()) {
                        Key next3 = it3.next();
                        if (next3.mCustomConstraints != null && (constraintAttribute2 = next3.mCustomConstraints.get(str)) != null) {
                            sparseArray.append(next3.mFramePosition, constraintAttribute2);
                        }
                    }
                    splineSetMakeSpline = SplineSet.makeCustomSpline(next2, sparseArray);
                } else {
                    splineSetMakeSpline = SplineSet.makeSpline(next2);
                }
                if (splineSetMakeSpline != null) {
                    splineSetMakeSpline.setType(next2);
                    this.mAttributesMap.put(next2, splineSetMakeSpline);
                }
                c2 = 1;
            }
            ArrayList<Key> arrayList3 = this.mKeyList;
            if (arrayList3 != null) {
                Iterator<Key> it4 = arrayList3.iterator();
                while (it4.hasNext()) {
                    Key next4 = it4.next();
                    if (next4 instanceof KeyAttributes) {
                        next4.addValues(this.mAttributesMap);
                    }
                }
            }
            this.mStartPoint.addValues(this.mAttributesMap, 0);
            this.mEndPoint.addValues(this.mAttributesMap, 100);
            for (String str2 : this.mAttributesMap.keySet()) {
                this.mAttributesMap.get(str2).setup(map.containsKey(str2) ? map.get(str2).intValue() : 0);
            }
        }
        if (!hashSet.isEmpty()) {
            if (this.mTimeCycleAttributesMap == null) {
                this.mTimeCycleAttributesMap = new HashMap<>();
            }
            Iterator<String> it5 = hashSet.iterator();
            while (it5.hasNext()) {
                String next5 = it5.next();
                if (!this.mTimeCycleAttributesMap.containsKey(next5)) {
                    if (next5.startsWith("CUSTOM,")) {
                        SparseArray sparseArray2 = new SparseArray();
                        String str3 = next5.split(",")[1];
                        Iterator<Key> it6 = this.mKeyList.iterator();
                        while (it6.hasNext()) {
                            Key next6 = it6.next();
                            if (next6.mCustomConstraints != null && (constraintAttribute = next6.mCustomConstraints.get(str3)) != null) {
                                sparseArray2.append(next6.mFramePosition, constraintAttribute);
                            }
                        }
                        timeCycleSplineSetMakeSpline = TimeCycleSplineSet.makeCustomSpline(next5, sparseArray2);
                    } else {
                        timeCycleSplineSetMakeSpline = TimeCycleSplineSet.makeSpline(next5, j);
                    }
                    if (timeCycleSplineSetMakeSpline != null) {
                        timeCycleSplineSetMakeSpline.setType(next5);
                        this.mTimeCycleAttributesMap.put(next5, timeCycleSplineSetMakeSpline);
                    }
                }
            }
            ArrayList<Key> arrayList4 = this.mKeyList;
            if (arrayList4 != null) {
                Iterator<Key> it7 = arrayList4.iterator();
                while (it7.hasNext()) {
                    Key next7 = it7.next();
                    if (next7 instanceof KeyTimeCycle) {
                        ((KeyTimeCycle) next7).addTimeValues(this.mTimeCycleAttributesMap);
                    }
                }
            }
            for (String str4 : this.mTimeCycleAttributesMap.keySet()) {
                this.mTimeCycleAttributesMap.get(str4).setup(map.containsKey(str4) ? map.get(str4).intValue() : 0);
            }
        }
        int i3 = 2;
        int size = this.mMotionPaths.size() + 2;
        MotionPaths[] motionPathsArr = new MotionPaths[size];
        motionPathsArr[0] = this.mStartMotionPath;
        motionPathsArr[size - 1] = this.mEndMotionPath;
        if (this.mMotionPaths.size() > 0 && this.mCurveFitType == -1) {
            this.mCurveFitType = 0;
        }
        Iterator<MotionPaths> it8 = this.mMotionPaths.iterator();
        int i4 = 1;
        while (it8.hasNext()) {
            motionPathsArr[i4] = it8.next();
            i4++;
        }
        HashSet hashSet4 = new HashSet();
        for (String str5 : this.mEndMotionPath.attributes.keySet()) {
            if (this.mStartMotionPath.attributes.containsKey(str5)) {
                if (!hashSet2.contains("CUSTOM," + str5)) {
                    hashSet4.add(str5);
                }
            }
        }
        String[] strArr = (String[]) hashSet4.toArray(new String[0]);
        this.mAttributeNames = strArr;
        this.mAttributeInterpCount = new int[strArr.length];
        int i5 = 0;
        while (true) {
            String[] strArr2 = this.mAttributeNames;
            if (i5 >= strArr2.length) {
                break;
            }
            String str6 = strArr2[i5];
            this.mAttributeInterpCount[i5] = 0;
            int i6 = 0;
            while (true) {
                if (i6 >= size) {
                    break;
                }
                if (motionPathsArr[i6].attributes.containsKey(str6)) {
                    int[] iArr = this.mAttributeInterpCount;
                    iArr[i5] = iArr[i5] + motionPathsArr[i6].attributes.get(str6).noOfInterpValues();
                    break;
                }
                i6++;
            }
            i5++;
        }
        boolean z = motionPathsArr[0].mPathMotionArc != Key.UNSET;
        int length = 18 + this.mAttributeNames.length;
        boolean[] zArr = new boolean[length];
        for (int i7 = 1; i7 < size; i7++) {
            motionPathsArr[i7].different(motionPathsArr[i7 - 1], zArr, this.mAttributeNames, z);
        }
        int i8 = 0;
        for (int i9 = 1; i9 < length; i9++) {
            if (zArr[i9]) {
                i8++;
            }
        }
        int[] iArr2 = new int[i8];
        this.mInterpolateVariables = iArr2;
        this.mInterpolateData = new double[iArr2.length];
        this.mInterpolateVelocity = new double[iArr2.length];
        int i10 = 0;
        for (int i11 = 1; i11 < length; i11++) {
            if (zArr[i11]) {
                this.mInterpolateVariables[i10] = i11;
                i10++;
            }
        }
        double[][] dArr = (double[][]) Array.newInstance((Class<?>) double.class, size, this.mInterpolateVariables.length);
        double[] dArr2 = new double[size];
        for (int i12 = 0; i12 < size; i12++) {
            motionPathsArr[i12].fillStandard(dArr[i12], this.mInterpolateVariables);
            dArr2[i12] = motionPathsArr[i12].time;
        }
        int i13 = 0;
        while (true) {
            int[] iArr3 = this.mInterpolateVariables;
            if (i13 >= iArr3.length) {
                break;
            }
            if (iArr3[i13] < MotionPaths.names.length) {
                String str7 = MotionPaths.names[this.mInterpolateVariables[i13]] + " [";
                for (int i14 = 0; i14 < size; i14++) {
                    str7 = str7 + dArr[i14][i13];
                }
            }
            i13++;
        }
        this.mSpline = new CurveFit[this.mAttributeNames.length + 1];
        int i15 = 0;
        while (true) {
            String[] strArr3 = this.mAttributeNames;
            if (i15 >= strArr3.length) {
                break;
            }
            double[][] dArr3 = (double[][]) null;
            String str8 = strArr3[i15];
            double[] dArr4 = null;
            int i16 = 0;
            int i17 = 0;
            while (i16 < size) {
                if (motionPathsArr[i16].hasCustomData(str8)) {
                    if (dArr3 == null) {
                        int[] iArr4 = new int[i3];
                        iArr4[1] = motionPathsArr[i16].getCustomDataCount(str8);
                        iArr4[c] = size;
                        dArr3 = (double[][]) Array.newInstance((Class<?>) double.class, iArr4);
                        dArr4 = new double[size];
                    }
                    dArr4[i17] = motionPathsArr[i16].time;
                    motionPathsArr[i16].getCustomData(str8, dArr3[i17], 0);
                    i17++;
                }
                i16++;
                i3 = 2;
                c = 0;
            }
            i15++;
            this.mSpline[i15] = CurveFit.get(this.mCurveFitType, Arrays.copyOf(dArr4, i17), (double[][]) Arrays.copyOf(dArr3, i17));
            i3 = 2;
            c = 0;
        }
        this.mSpline[0] = CurveFit.get(this.mCurveFitType, dArr2, dArr);
        if (motionPathsArr[0].mPathMotionArc != Key.UNSET) {
            int[] iArr5 = new int[size];
            double[] dArr5 = new double[size];
            double[][] dArr6 = (double[][]) Array.newInstance((Class<?>) double.class, size, 2);
            for (int i18 = 0; i18 < size; i18++) {
                iArr5[i18] = motionPathsArr[i18].mPathMotionArc;
                dArr5[i18] = motionPathsArr[i18].time;
                dArr6[i18][0] = motionPathsArr[i18].f29x;
                dArr6[i18][1] = motionPathsArr[i18].f30y;
            }
            this.mArcSpline = CurveFit.getArc(iArr5, dArr5, dArr6);
        }
        float preCycleDistance = Float.NaN;
        this.mCycleMap = new HashMap<>();
        if (this.mKeyList != null) {
            Iterator<String> it9 = hashSet3.iterator();
            while (it9.hasNext()) {
                String next8 = it9.next();
                KeyCycleOscillator keyCycleOscillatorMakeSpline = KeyCycleOscillator.makeSpline(next8);
                if (keyCycleOscillatorMakeSpline != null) {
                    if (keyCycleOscillatorMakeSpline.variesByPath() && Float.isNaN(preCycleDistance)) {
                        preCycleDistance = getPreCycleDistance();
                    }
                    keyCycleOscillatorMakeSpline.setType(next8);
                    this.mCycleMap.put(next8, keyCycleOscillatorMakeSpline);
                }
            }
            Iterator<Key> it10 = this.mKeyList.iterator();
            while (it10.hasNext()) {
                Key next9 = it10.next();
                if (next9 instanceof KeyCycle) {
                    ((KeyCycle) next9).addCycleValues(this.mCycleMap);
                }
            }
            Iterator<KeyCycleOscillator> it11 = this.mCycleMap.values().iterator();
            while (it11.hasNext()) {
                it11.next().setup(preCycleDistance);
            }
        }
    }

    public String toString() {
        return " start: x: " + this.mStartMotionPath.f29x + " y: " + this.mStartMotionPath.f30y + " end: x: " + this.mEndMotionPath.f29x + " y: " + this.mEndMotionPath.f30y;
    }

    private void readView(MotionPaths motionPaths) {
        motionPaths.setBounds((int) this.mView.getX(), (int) this.mView.getY(), this.mView.getWidth(), this.mView.getHeight());
    }

    public void setView(View view) {
        this.mView = view;
        this.mId = view.getId();
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams instanceof ConstraintLayout.LayoutParams) {
            this.mConstraintTag = ((ConstraintLayout.LayoutParams) layoutParams).getConstraintTag();
        }
    }

    void setStartCurrentState(View view) {
        this.mStartMotionPath.time = 0.0f;
        this.mStartMotionPath.position = 0.0f;
        this.mStartMotionPath.setBounds(view.getX(), view.getY(), view.getWidth(), view.getHeight());
        this.mStartPoint.setState(view);
    }

    void setStartState(ConstraintWidget constraintWidget, ConstraintSet constraintSet) {
        this.mStartMotionPath.time = 0.0f;
        this.mStartMotionPath.position = 0.0f;
        readView(this.mStartMotionPath);
        this.mStartMotionPath.setBounds(constraintWidget.getX(), constraintWidget.getY(), constraintWidget.getWidth(), constraintWidget.getHeight());
        ConstraintSet.Constraint parameters = constraintSet.getParameters(this.mId);
        this.mStartMotionPath.applyParameters(parameters);
        this.mMotionStagger = parameters.motion.mMotionStagger;
        this.mStartPoint.setState(constraintWidget, constraintSet, this.mId);
    }

    void setEndState(ConstraintWidget constraintWidget, ConstraintSet constraintSet) {
        this.mEndMotionPath.time = 1.0f;
        this.mEndMotionPath.position = 1.0f;
        readView(this.mEndMotionPath);
        this.mEndMotionPath.setBounds(constraintWidget.getX(), constraintWidget.getY(), constraintWidget.getWidth(), constraintWidget.getHeight());
        this.mEndMotionPath.applyParameters(constraintSet.getParameters(this.mId));
        this.mEndPoint.setState(constraintWidget, constraintSet, this.mId);
    }

    private float getAdjustedPosition(float f, float[] fArr) {
        float f2 = 0.0f;
        if (fArr != null) {
            fArr[0] = 1.0f;
        } else if (this.mStaggerScale != 1.0d) {
            if (f < this.mStaggerOffset) {
                f = 0.0f;
            }
            float f3 = this.mStaggerOffset;
            if (f > f3 && f < 1.0d) {
                f = (f - f3) * this.mStaggerScale;
            }
        }
        Easing easing = this.mStartMotionPath.mKeyFrameEasing;
        float f4 = Float.NaN;
        Iterator<MotionPaths> it = this.mMotionPaths.iterator();
        while (it.hasNext()) {
            MotionPaths next = it.next();
            if (next.mKeyFrameEasing != null) {
                if (next.time < f) {
                    easing = next.mKeyFrameEasing;
                    f2 = next.time;
                } else if (Float.isNaN(f4)) {
                    f4 = next.time;
                }
            }
        }
        if (easing != null) {
            float f5 = (Float.isNaN(f4) ? 1.0f : f4) - f2;
            double d = (f - f2) / f5;
            f = (((float) easing.get(d)) * f5) + f2;
            if (fArr != null) {
                fArr[0] = (float) easing.getDiff(d);
            }
        }
        return f;
    }

    boolean interpolate(View view, float f, long j, KeyCache keyCache) {
        TimeCycleSplineSet.PathRotate pathRotate;
        boolean pathRotate2;
        double d;
        float adjustedPosition = getAdjustedPosition(f, null);
        HashMap<String, SplineSet> map = this.mAttributesMap;
        if (map != null) {
            Iterator<SplineSet> it = map.values().iterator();
            while (it.hasNext()) {
                it.next().setProperty(view, adjustedPosition);
            }
        }
        HashMap<String, TimeCycleSplineSet> map2 = this.mTimeCycleAttributesMap;
        if (map2 != null) {
            pathRotate = null;
            boolean property = false;
            for (TimeCycleSplineSet timeCycleSplineSet : map2.values()) {
                if (timeCycleSplineSet instanceof TimeCycleSplineSet.PathRotate) {
                    pathRotate = (TimeCycleSplineSet.PathRotate) timeCycleSplineSet;
                } else {
                    property |= timeCycleSplineSet.setProperty(view, adjustedPosition, j, keyCache);
                }
            }
            pathRotate2 = property;
        } else {
            pathRotate = null;
            pathRotate2 = false;
        }
        CurveFit[] curveFitArr = this.mSpline;
        if (curveFitArr != null) {
            double d2 = adjustedPosition;
            curveFitArr[0].getPos(d2, this.mInterpolateData);
            this.mSpline[0].getSlope(d2, this.mInterpolateVelocity);
            CurveFit curveFit = this.mArcSpline;
            if (curveFit != null) {
                double[] dArr = this.mInterpolateData;
                if (dArr.length > 0) {
                    curveFit.getPos(d2, dArr);
                    this.mArcSpline.getSlope(d2, this.mInterpolateVelocity);
                }
            }
            this.mStartMotionPath.setView(view, this.mInterpolateVariables, this.mInterpolateData, this.mInterpolateVelocity, null);
            HashMap<String, SplineSet> map3 = this.mAttributesMap;
            if (map3 != null) {
                for (SplineSet splineSet : map3.values()) {
                    if (splineSet instanceof SplineSet.PathRotate) {
                        double[] dArr2 = this.mInterpolateVelocity;
                        ((SplineSet.PathRotate) splineSet).setPathRotate(view, adjustedPosition, dArr2[0], dArr2[1]);
                    }
                }
            }
            if (pathRotate != null) {
                double[] dArr3 = this.mInterpolateVelocity;
                d = d2;
                pathRotate2 = pathRotate.setPathRotate(view, keyCache, adjustedPosition, j, dArr3[0], dArr3[1]) | pathRotate2;
            } else {
                d = d2;
            }
            int i = 1;
            while (true) {
                CurveFit[] curveFitArr2 = this.mSpline;
                if (i >= curveFitArr2.length) {
                    break;
                }
                curveFitArr2[i].getPos(d, this.mValuesBuff);
                this.mStartMotionPath.attributes.get(this.mAttributeNames[i - 1]).setInterpolatedValue(view, this.mValuesBuff);
                i++;
            }
            if (this.mStartPoint.mVisibilityMode == 0) {
                if (adjustedPosition <= 0.0f) {
                    view.setVisibility(this.mStartPoint.visibility);
                } else if (adjustedPosition >= 1.0f) {
                    view.setVisibility(this.mEndPoint.visibility);
                } else if (this.mEndPoint.visibility != this.mStartPoint.visibility) {
                    view.setVisibility(0);
                }
            }
            if (this.mKeyTriggers != null) {
                int i2 = 0;
                while (true) {
                    KeyTrigger[] keyTriggerArr = this.mKeyTriggers;
                    if (i2 >= keyTriggerArr.length) {
                        break;
                    }
                    keyTriggerArr[i2].conditionallyFire(adjustedPosition, view);
                    i2++;
                }
            }
        } else {
            float f2 = this.mStartMotionPath.f29x + ((this.mEndMotionPath.f29x - this.mStartMotionPath.f29x) * adjustedPosition);
            float f3 = this.mStartMotionPath.f30y + ((this.mEndMotionPath.f30y - this.mStartMotionPath.f30y) * adjustedPosition);
            float f4 = f2 + 0.5f;
            int i3 = (int) f4;
            float f5 = f3 + 0.5f;
            int i4 = (int) f5;
            int i5 = (int) (f4 + this.mStartMotionPath.width + ((this.mEndMotionPath.width - this.mStartMotionPath.width) * adjustedPosition));
            int i6 = (int) (f5 + this.mStartMotionPath.height + ((this.mEndMotionPath.height - this.mStartMotionPath.height) * adjustedPosition));
            int i7 = i5 - i3;
            int i8 = i6 - i4;
            if (this.mEndMotionPath.width != this.mStartMotionPath.width || this.mEndMotionPath.height != this.mStartMotionPath.height) {
                view.measure(View.MeasureSpec.makeMeasureSpec(i7, BasicMeasure.EXACTLY), View.MeasureSpec.makeMeasureSpec(i8, BasicMeasure.EXACTLY));
            }
            view.layout(i3, i4, i5, i6);
        }
        HashMap<String, KeyCycleOscillator> map4 = this.mCycleMap;
        if (map4 != null) {
            for (KeyCycleOscillator keyCycleOscillator : map4.values()) {
                if (keyCycleOscillator instanceof KeyCycleOscillator.PathRotateSet) {
                    double[] dArr4 = this.mInterpolateVelocity;
                    ((KeyCycleOscillator.PathRotateSet) keyCycleOscillator).setPathRotate(view, adjustedPosition, dArr4[0], dArr4[1]);
                } else {
                    keyCycleOscillator.setProperty(view, adjustedPosition);
                }
            }
        }
        return pathRotate2;
    }

    void getDpDt(float f, float f2, float f3, float[] fArr) {
        double[] dArr;
        float adjustedPosition = getAdjustedPosition(f, this.mVelocity);
        CurveFit[] curveFitArr = this.mSpline;
        int i = 0;
        if (curveFitArr != null) {
            double d = adjustedPosition;
            curveFitArr[0].getSlope(d, this.mInterpolateVelocity);
            this.mSpline[0].getPos(d, this.mInterpolateData);
            float f4 = this.mVelocity[0];
            while (true) {
                dArr = this.mInterpolateVelocity;
                if (i >= dArr.length) {
                    break;
                }
                double d2 = dArr[i];
                double d3 = f4;
                Double.isNaN(d3);
                dArr[i] = d2 * d3;
                i++;
            }
            CurveFit curveFit = this.mArcSpline;
            if (curveFit != null) {
                double[] dArr2 = this.mInterpolateData;
                if (dArr2.length > 0) {
                    curveFit.getPos(d, dArr2);
                    this.mArcSpline.getSlope(d, this.mInterpolateVelocity);
                    this.mStartMotionPath.setDpDt(f2, f3, fArr, this.mInterpolateVariables, this.mInterpolateVelocity, this.mInterpolateData);
                    return;
                }
                return;
            }
            this.mStartMotionPath.setDpDt(f2, f3, fArr, this.mInterpolateVariables, dArr, this.mInterpolateData);
            return;
        }
        float f5 = this.mEndMotionPath.f29x - this.mStartMotionPath.f29x;
        float f6 = this.mEndMotionPath.f30y - this.mStartMotionPath.f30y;
        float f7 = (this.mEndMotionPath.width - this.mStartMotionPath.width) + f5;
        float f8 = (this.mEndMotionPath.height - this.mStartMotionPath.height) + f6;
        fArr[0] = (f5 * (1.0f - f2)) + (f7 * f2);
        fArr[1] = (f6 * (1.0f - f3)) + (f8 * f3);
    }

    void getPostLayoutDvDp(float f, int i, int i2, float f2, float f3, float[] fArr) {
        float adjustedPosition = getAdjustedPosition(f, this.mVelocity);
        HashMap<String, SplineSet> map = this.mAttributesMap;
        SplineSet splineSet = map == null ? null : map.get("translationX");
        HashMap<String, SplineSet> map2 = this.mAttributesMap;
        SplineSet splineSet2 = map2 == null ? null : map2.get("translationY");
        HashMap<String, SplineSet> map3 = this.mAttributesMap;
        SplineSet splineSet3 = map3 == null ? null : map3.get("rotation");
        HashMap<String, SplineSet> map4 = this.mAttributesMap;
        SplineSet splineSet4 = map4 == null ? null : map4.get("scaleX");
        HashMap<String, SplineSet> map5 = this.mAttributesMap;
        SplineSet splineSet5 = map5 == null ? null : map5.get("scaleY");
        HashMap<String, KeyCycleOscillator> map6 = this.mCycleMap;
        KeyCycleOscillator keyCycleOscillator = map6 == null ? null : map6.get("translationX");
        HashMap<String, KeyCycleOscillator> map7 = this.mCycleMap;
        KeyCycleOscillator keyCycleOscillator2 = map7 == null ? null : map7.get("translationY");
        HashMap<String, KeyCycleOscillator> map8 = this.mCycleMap;
        KeyCycleOscillator keyCycleOscillator3 = map8 == null ? null : map8.get("rotation");
        HashMap<String, KeyCycleOscillator> map9 = this.mCycleMap;
        KeyCycleOscillator keyCycleOscillator4 = map9 == null ? null : map9.get("scaleX");
        HashMap<String, KeyCycleOscillator> map10 = this.mCycleMap;
        KeyCycleOscillator keyCycleOscillator5 = map10 != null ? map10.get("scaleY") : null;
        VelocityMatrix velocityMatrix = new VelocityMatrix();
        velocityMatrix.clear();
        velocityMatrix.setRotationVelocity(splineSet3, adjustedPosition);
        velocityMatrix.setTranslationVelocity(splineSet, splineSet2, adjustedPosition);
        velocityMatrix.setScaleVelocity(splineSet4, splineSet5, adjustedPosition);
        velocityMatrix.setRotationVelocity(keyCycleOscillator3, adjustedPosition);
        velocityMatrix.setTranslationVelocity(keyCycleOscillator, keyCycleOscillator2, adjustedPosition);
        velocityMatrix.setScaleVelocity(keyCycleOscillator4, keyCycleOscillator5, adjustedPosition);
        CurveFit curveFit = this.mArcSpline;
        if (curveFit != null) {
            double[] dArr = this.mInterpolateData;
            if (dArr.length > 0) {
                double d = adjustedPosition;
                curveFit.getPos(d, dArr);
                this.mArcSpline.getSlope(d, this.mInterpolateVelocity);
                this.mStartMotionPath.setDpDt(f2, f3, fArr, this.mInterpolateVariables, this.mInterpolateVelocity, this.mInterpolateData);
            }
            velocityMatrix.applyTransform(f2, f3, i, i2, fArr);
            return;
        }
        int i3 = 0;
        if (this.mSpline != null) {
            double adjustedPosition2 = getAdjustedPosition(adjustedPosition, this.mVelocity);
            this.mSpline[0].getSlope(adjustedPosition2, this.mInterpolateVelocity);
            this.mSpline[0].getPos(adjustedPosition2, this.mInterpolateData);
            float f4 = this.mVelocity[0];
            while (true) {
                double[] dArr2 = this.mInterpolateVelocity;
                if (i3 < dArr2.length) {
                    double d2 = dArr2[i3];
                    double d3 = f4;
                    Double.isNaN(d3);
                    dArr2[i3] = d2 * d3;
                    i3++;
                } else {
                    this.mStartMotionPath.setDpDt(f2, f3, fArr, this.mInterpolateVariables, dArr2, this.mInterpolateData);
                    velocityMatrix.applyTransform(f2, f3, i, i2, fArr);
                    return;
                }
            }
        } else {
            float f5 = this.mEndMotionPath.f29x - this.mStartMotionPath.f29x;
            float f6 = this.mEndMotionPath.f30y - this.mStartMotionPath.f30y;
            KeyCycleOscillator keyCycleOscillator6 = keyCycleOscillator5;
            float f7 = (this.mEndMotionPath.width - this.mStartMotionPath.width) + f5;
            float f8 = (this.mEndMotionPath.height - this.mStartMotionPath.height) + f6;
            fArr[0] = (f5 * (1.0f - f2)) + (f7 * f2);
            fArr[1] = (f6 * (1.0f - f3)) + (f8 * f3);
            velocityMatrix.clear();
            velocityMatrix.setRotationVelocity(splineSet3, adjustedPosition);
            velocityMatrix.setTranslationVelocity(splineSet, splineSet2, adjustedPosition);
            velocityMatrix.setScaleVelocity(splineSet4, splineSet5, adjustedPosition);
            velocityMatrix.setRotationVelocity(keyCycleOscillator3, adjustedPosition);
            velocityMatrix.setTranslationVelocity(keyCycleOscillator, keyCycleOscillator2, adjustedPosition);
            velocityMatrix.setScaleVelocity(keyCycleOscillator4, keyCycleOscillator6, adjustedPosition);
            velocityMatrix.applyTransform(f2, f3, i, i2, fArr);
        }
    }

    public int getDrawPath() {
        int iMax = this.mStartMotionPath.mDrawPath;
        Iterator<MotionPaths> it = this.mMotionPaths.iterator();
        while (it.hasNext()) {
            iMax = Math.max(iMax, it.next().mDrawPath);
        }
        return Math.max(iMax, this.mEndMotionPath.mDrawPath);
    }

    public void setDrawPath(int i) {
        this.mStartMotionPath.mDrawPath = i;
    }

    String name() {
        return this.mView.getContext().getResources().getResourceEntryName(this.mView.getId());
    }

    void positionKeyframe(View view, KeyPositionBase keyPositionBase, float f, float f2, String[] strArr, float[] fArr) {
        RectF rectF = new RectF();
        rectF.left = this.mStartMotionPath.f29x;
        rectF.top = this.mStartMotionPath.f30y;
        rectF.right = rectF.left + this.mStartMotionPath.width;
        rectF.bottom = rectF.top + this.mStartMotionPath.height;
        RectF rectF2 = new RectF();
        rectF2.left = this.mEndMotionPath.f29x;
        rectF2.top = this.mEndMotionPath.f30y;
        rectF2.right = rectF2.left + this.mEndMotionPath.width;
        rectF2.bottom = rectF2.top + this.mEndMotionPath.height;
        keyPositionBase.positionAttributes(view, rectF, rectF2, f, f2, strArr, fArr);
    }

    public int getkeyFramePositions(int[] iArr, float[] fArr) {
        Iterator<Key> it = this.mKeyList.iterator();
        int i = 0;
        int i2 = 0;
        while (it.hasNext()) {
            Key next = it.next();
            iArr[i] = next.mFramePosition + (next.mType * 1000);
            this.mSpline[0].getPos(next.mFramePosition / 100.0f, this.mInterpolateData);
            this.mStartMotionPath.getCenter(this.mInterpolateVariables, this.mInterpolateData, fArr, i2);
            i2 += 2;
            i++;
        }
        return i;
    }

    public int getKeyFrameInfo(int i, int[] iArr) {
        float[] fArr = new float[2];
        Iterator<Key> it = this.mKeyList.iterator();
        int i2 = 0;
        int i3 = 0;
        while (it.hasNext()) {
            Key next = it.next();
            if (next.mType == i || i != -1) {
                iArr[i3] = 0;
                int i4 = i3 + 1;
                iArr[i4] = next.mType;
                int i5 = i4 + 1;
                iArr[i5] = next.mFramePosition;
                this.mSpline[0].getPos(next.mFramePosition / 100.0f, this.mInterpolateData);
                this.mStartMotionPath.getCenter(this.mInterpolateVariables, this.mInterpolateData, fArr, 0);
                int i6 = i5 + 1;
                iArr[i6] = Float.floatToIntBits(fArr[0]);
                int i7 = i6 + 1;
                iArr[i7] = Float.floatToIntBits(fArr[1]);
                if (next instanceof KeyPosition) {
                    KeyPosition keyPosition = (KeyPosition) next;
                    int i8 = i7 + 1;
                    iArr[i8] = keyPosition.mPositionType;
                    int i9 = i8 + 1;
                    iArr[i9] = Float.floatToIntBits(keyPosition.mPercentX);
                    i7 = i9 + 1;
                    iArr[i7] = Float.floatToIntBits(keyPosition.mPercentY);
                }
                int i10 = i7 + 1;
                iArr[i3] = i10 - i3;
                i2++;
                i3 = i10;
            }
        }
        return i2;
    }
}
