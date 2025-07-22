package me.yokeyword.fragmentation.debug;

import android.R;
import android.content.DialogInterface;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.util.Log;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.appcompat.app.AlertDialog;
import androidx.core.view.GravityCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentationMagician;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.yokeyword.fragmentation.C0766R;
import me.yokeyword.fragmentation.ISupportFragment;
import org.apache.commons.p006io.IOUtils;

/* loaded from: classes.dex */
public class DebugStackDelegate implements SensorEventListener {
    private FragmentActivity mActivity;
    private SensorManager mSensorManager;
    private AlertDialog mStackDialog;

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    public DebugStackDelegate(FragmentActivity fragmentActivity) {
        this.mActivity = fragmentActivity;
    }

    public void onCreate(int i) {
        if (i != 1) {
            return;
        }
        SensorManager sensorManager = (SensorManager) this.mActivity.getSystemService("sensor");
        this.mSensorManager = sensorManager;
        sensorManager.registerListener(this, sensorManager.getDefaultSensor(1), 3);
    }

    public void onPostCreate(int i) {
        if (i != 2) {
            return;
        }
        View viewFindViewById = this.mActivity.findViewById(R.id.content);
        if (viewFindViewById instanceof FrameLayout) {
            ImageView imageView = new ImageView(this.mActivity);
            imageView.setImageResource(C0766R.drawable.fragmentation_ic_stack);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
            layoutParams.gravity = GravityCompat.END;
            int iApplyDimension = (int) TypedValue.applyDimension(1, 18.0f, this.mActivity.getResources().getDisplayMetrics());
            layoutParams.topMargin = iApplyDimension * 7;
            layoutParams.rightMargin = iApplyDimension;
            imageView.setLayoutParams(layoutParams);
            ((FrameLayout) viewFindViewById).addView(imageView);
            imageView.setOnTouchListener(new StackViewTouchListener(imageView, iApplyDimension / 4));
            imageView.setOnClickListener(new View.OnClickListener() { // from class: me.yokeyword.fragmentation.debug.DebugStackDelegate.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    DebugStackDelegate.this.showFragmentStackHierarchyView();
                }
            });
        }
    }

    public void onDestroy() {
        SensorManager sensorManager = this.mSensorManager;
        if (sensorManager != null) {
            sensorManager.unregisterListener(this);
        }
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent sensorEvent) {
        int type = sensorEvent.sensor.getType();
        float[] fArr = sensorEvent.values;
        if (type == 1) {
            float f = 12;
            if (Math.abs(fArr[0]) >= f || Math.abs(fArr[1]) >= f || Math.abs(fArr[2]) >= f) {
                showFragmentStackHierarchyView();
            }
        }
    }

    public void showFragmentStackHierarchyView() {
        AlertDialog alertDialog = this.mStackDialog;
        if (alertDialog == null || !alertDialog.isShowing()) {
            DebugHierarchyViewContainer debugHierarchyViewContainer = new DebugHierarchyViewContainer(this.mActivity);
            debugHierarchyViewContainer.bindFragmentRecords(getFragmentRecords());
            debugHierarchyViewContainer.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
            AlertDialog alertDialogCreate = new AlertDialog.Builder(this.mActivity).setView(debugHierarchyViewContainer).setPositiveButton(R.string.cancel, (DialogInterface.OnClickListener) null).setCancelable(true).create();
            this.mStackDialog = alertDialogCreate;
            alertDialogCreate.show();
        }
    }

    public void logFragmentRecords(String str) {
        List<DebugFragmentRecord> fragmentRecords = getFragmentRecords();
        if (fragmentRecords == null) {
            return;
        }
        StringBuilder sb = new StringBuilder();
        for (int size = fragmentRecords.size() - 1; size >= 0; size--) {
            DebugFragmentRecord debugFragmentRecord = fragmentRecords.get(size);
            if (size == fragmentRecords.size() - 1) {
                sb.append("═══════════════════════════════════════════════════════════════════════════════════\n");
                if (size == 0) {
                    sb.append("\t栈顶\t\t\t");
                    sb.append(debugFragmentRecord.fragmentName);
                    sb.append(IOUtils.LINE_SEPARATOR_UNIX);
                    sb.append("═══════════════════════════════════════════════════════════════════════════════════");
                } else {
                    sb.append("\t栈顶\t\t\t");
                    sb.append(debugFragmentRecord.fragmentName);
                    sb.append("\n\n");
                }
            } else {
                if (size == 0) {
                    sb.append("\t栈底\t\t\t");
                    sb.append(debugFragmentRecord.fragmentName);
                    sb.append("\n\n");
                    processChildLog(debugFragmentRecord.childFragmentRecord, sb, 1);
                    sb.append("═══════════════════════════════════════════════════════════════════════════════════");
                    Log.i(str, sb.toString());
                    return;
                }
                sb.append("\t↓\t\t\t");
                sb.append(debugFragmentRecord.fragmentName);
                sb.append("\n\n");
            }
            processChildLog(debugFragmentRecord.childFragmentRecord, sb, 1);
        }
    }

    private List<DebugFragmentRecord> getFragmentRecords() {
        ArrayList arrayList = new ArrayList();
        List<Fragment> activeFragments = FragmentationMagician.getActiveFragments(this.mActivity.getSupportFragmentManager());
        if (activeFragments == null || activeFragments.size() < 1) {
            return null;
        }
        Iterator<Fragment> it = activeFragments.iterator();
        while (it.hasNext()) {
            addDebugFragmentRecord(arrayList, it.next());
        }
        return arrayList;
    }

    private void processChildLog(List<DebugFragmentRecord> list, StringBuilder sb, int i) {
        if (list == null || list.size() == 0) {
            return;
        }
        for (int i2 = 0; i2 < list.size(); i2++) {
            DebugFragmentRecord debugFragmentRecord = list.get(i2);
            for (int i3 = 0; i3 < i; i3++) {
                sb.append("\t\t\t");
            }
            if (i2 == 0) {
                sb.append("\t子栈顶\t\t");
                sb.append(debugFragmentRecord.fragmentName);
                sb.append("\n\n");
            } else {
                if (i2 == list.size() - 1) {
                    sb.append("\t子栈底\t\t");
                    sb.append(debugFragmentRecord.fragmentName);
                    sb.append("\n\n");
                    processChildLog(debugFragmentRecord.childFragmentRecord, sb, i + 1);
                    return;
                }
                sb.append("\t↓\t\t\t");
                sb.append(debugFragmentRecord.fragmentName);
                sb.append("\n\n");
            }
            processChildLog(debugFragmentRecord.childFragmentRecord, sb, i);
        }
    }

    private List<DebugFragmentRecord> getChildFragmentRecords(Fragment fragment) {
        ArrayList arrayList = new ArrayList();
        List<Fragment> activeFragments = FragmentationMagician.getActiveFragments(fragment.getChildFragmentManager());
        if (activeFragments == null || activeFragments.size() < 1) {
            return null;
        }
        for (int size = activeFragments.size() - 1; size >= 0; size--) {
            addDebugFragmentRecord(arrayList, activeFragments.get(size));
        }
        return arrayList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void addDebugFragmentRecord(List<DebugFragmentRecord> list, Fragment fragment) {
        CharSequence charSequenceSpan;
        if (fragment != 0) {
            int backStackEntryCount = fragment.getFragmentManager().getBackStackEntryCount();
            CharSequence simpleName = fragment.getClass().getSimpleName();
            if (backStackEntryCount == 0) {
                charSequenceSpan = span(simpleName, " *");
            } else {
                for (int i = 0; i < backStackEntryCount; i++) {
                    FragmentManager.BackStackEntry backStackEntryAt = fragment.getFragmentManager().getBackStackEntryAt(i);
                    if ((backStackEntryAt.getName() != null && backStackEntryAt.getName().equals(fragment.getTag())) || (backStackEntryAt.getName() == null && fragment.getTag() == null)) {
                        break;
                    }
                    if (i == backStackEntryCount - 1) {
                        simpleName = span(simpleName, " *");
                    }
                }
                charSequenceSpan = simpleName;
            }
            if ((fragment instanceof ISupportFragment) && ((ISupportFragment) fragment).isSupportVisible()) {
                charSequenceSpan = span(charSequenceSpan, " ☀");
            }
            list.add(new DebugFragmentRecord(charSequenceSpan, getChildFragmentRecords(fragment)));
        }
    }

    private CharSequence span(CharSequence charSequence, String str) {
        return ((Object) charSequence) + str;
    }

    private class StackViewTouchListener implements View.OnTouchListener {
        private int clickLimitValue;

        /* renamed from: dX */
        private float f272dX;
        private float downX;
        private boolean isClickState;
        private View stackView;

        /* renamed from: dY */
        private float f273dY = 0.0f;
        private float downY = 0.0f;

        StackViewTouchListener(View view, int i) {
            this.stackView = view;
            this.clickLimitValue = i;
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, MotionEvent motionEvent) {
            float rawX = motionEvent.getRawX();
            float rawY = motionEvent.getRawY();
            int action = motionEvent.getAction();
            if (action == 0) {
                this.isClickState = true;
                this.downX = rawX;
                this.downY = rawY;
                this.f272dX = this.stackView.getX() - motionEvent.getRawX();
                this.f273dY = this.stackView.getY() - motionEvent.getRawY();
            } else if (action == 1) {
                if (rawX - this.downX < this.clickLimitValue && this.isClickState) {
                    this.stackView.performClick();
                }
            } else if (action != 2) {
                if (action != 3) {
                    return false;
                }
                if (rawX - this.downX < this.clickLimitValue) {
                    this.stackView.performClick();
                }
            } else if (Math.abs(rawX - this.downX) < this.clickLimitValue && Math.abs(rawY - this.downY) < this.clickLimitValue && this.isClickState) {
                this.isClickState = true;
            } else {
                this.isClickState = false;
                this.stackView.setX(motionEvent.getRawX() + this.f272dX);
                this.stackView.setY(motionEvent.getRawY() + this.f273dY);
            }
            return true;
        }
    }
}
