package me.yokeyword.fragmentation;

import android.os.Bundle;
import android.view.MotionEvent;
import androidx.appcompat.widget.ActivityChooserView;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentationMagician;
import androidx.lifecycle.LifecycleOwner;
import me.yokeyword.fragmentation.ExtraTransaction;
import me.yokeyword.fragmentation.anim.DefaultVerticalAnimator;
import me.yokeyword.fragmentation.anim.FragmentAnimator;
import me.yokeyword.fragmentation.debug.DebugStackDelegate;
import me.yokeyword.fragmentation.queue.Action;

/* loaded from: classes.dex */
public class SupportActivityDelegate {
    private FragmentActivity mActivity;
    private DebugStackDelegate mDebugStackDelegate;
    private FragmentAnimator mFragmentAnimator;
    private ISupportActivity mSupport;
    private TransactionDelegate mTransactionDelegate;
    boolean mPopMultipleNoAnim = false;
    boolean mFragmentClickable = true;
    private int mDefaultFragmentBackground = 0;

    /* JADX WARN: Multi-variable type inference failed */
    public SupportActivityDelegate(ISupportActivity iSupportActivity) {
        if (!(iSupportActivity instanceof FragmentActivity)) {
            throw new RuntimeException("Must extends FragmentActivity/AppCompatActivity");
        }
        this.mSupport = iSupportActivity;
        FragmentActivity fragmentActivity = (FragmentActivity) iSupportActivity;
        this.mActivity = fragmentActivity;
        this.mDebugStackDelegate = new DebugStackDelegate(fragmentActivity);
    }

    public ExtraTransaction extraTransaction() {
        return new ExtraTransaction.ExtraTransactionImpl((FragmentActivity) this.mSupport, getTopFragment(), getTransactionDelegate(), true);
    }

    public void onCreate(Bundle bundle) {
        this.mTransactionDelegate = getTransactionDelegate();
        this.mFragmentAnimator = this.mSupport.onCreateFragmentAnimator();
        this.mDebugStackDelegate.onCreate(Fragmentation.getDefault().getMode());
    }

    public TransactionDelegate getTransactionDelegate() {
        if (this.mTransactionDelegate == null) {
            this.mTransactionDelegate = new TransactionDelegate(this.mSupport);
        }
        return this.mTransactionDelegate;
    }

    public void onPostCreate(Bundle bundle) {
        this.mDebugStackDelegate.onPostCreate(Fragmentation.getDefault().getMode());
    }

    public FragmentAnimator getFragmentAnimator() {
        return this.mFragmentAnimator.copy();
    }

    public void setFragmentAnimator(FragmentAnimator fragmentAnimator) {
        this.mFragmentAnimator = fragmentAnimator;
        for (LifecycleOwner lifecycleOwner : FragmentationMagician.getActiveFragments(getSupportFragmentManager())) {
            if (lifecycleOwner instanceof ISupportFragment) {
                SupportFragmentDelegate supportDelegate = ((ISupportFragment) lifecycleOwner).getSupportDelegate();
                if (supportDelegate.mAnimByActivity) {
                    supportDelegate.mFragmentAnimator = fragmentAnimator.copy();
                    if (supportDelegate.mAnimHelper != null) {
                        supportDelegate.mAnimHelper.notifyChanged(supportDelegate.mFragmentAnimator);
                    }
                }
            }
        }
    }

    public FragmentAnimator onCreateFragmentAnimator() {
        return new DefaultVerticalAnimator();
    }

    public void setDefaultFragmentBackground(int i) {
        this.mDefaultFragmentBackground = i;
    }

    public int getDefaultFragmentBackground() {
        return this.mDefaultFragmentBackground;
    }

    public void showFragmentStackHierarchyView() {
        this.mDebugStackDelegate.showFragmentStackHierarchyView();
    }

    public void logFragmentStackHierarchy(String str) {
        this.mDebugStackDelegate.logFragmentRecords(str);
    }

    public void post(Runnable runnable) {
        this.mTransactionDelegate.post(runnable);
    }

    public void onBackPressed() {
        this.mTransactionDelegate.mActionQueue.enqueue(new Action(3) { // from class: me.yokeyword.fragmentation.SupportActivityDelegate.1
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                if (!SupportActivityDelegate.this.mFragmentClickable) {
                    SupportActivityDelegate.this.mFragmentClickable = true;
                }
                if (SupportActivityDelegate.this.mTransactionDelegate.dispatchBackPressedEvent(SupportHelper.getActiveFragment(SupportActivityDelegate.this.getSupportFragmentManager()))) {
                    return;
                }
                SupportActivityDelegate.this.mSupport.onBackPressedSupport();
            }
        });
    }

    public void onBackPressedSupport() {
        if (getSupportFragmentManager().getBackStackEntryCount() > 1) {
            pop();
        } else {
            ActivityCompat.finishAfterTransition(this.mActivity);
        }
    }

    public void onDestroy() {
        this.mDebugStackDelegate.onDestroy();
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        return !this.mFragmentClickable;
    }

    public void loadRootFragment(int i, ISupportFragment iSupportFragment) {
        loadRootFragment(i, iSupportFragment, true, false);
    }

    public void loadRootFragment(int i, ISupportFragment iSupportFragment, boolean z, boolean z2) {
        this.mTransactionDelegate.loadRootTransaction(getSupportFragmentManager(), i, iSupportFragment, z, z2);
    }

    public void loadMultipleRootFragment(int i, int i2, ISupportFragment... iSupportFragmentArr) {
        this.mTransactionDelegate.loadMultipleRootTransaction(getSupportFragmentManager(), i, i2, iSupportFragmentArr);
    }

    public void showHideFragment(ISupportFragment iSupportFragment) {
        showHideFragment(iSupportFragment, null);
    }

    public void showHideFragment(ISupportFragment iSupportFragment, ISupportFragment iSupportFragment2) {
        this.mTransactionDelegate.showHideFragment(getSupportFragmentManager(), iSupportFragment, iSupportFragment2);
    }

    public void start(ISupportFragment iSupportFragment) {
        start(iSupportFragment, 0);
    }

    public void start(ISupportFragment iSupportFragment, int i) {
        this.mTransactionDelegate.dispatchStartTransaction(getSupportFragmentManager(), getTopFragment(), iSupportFragment, 0, i, 0);
    }

    public void startForResult(ISupportFragment iSupportFragment, int i) {
        this.mTransactionDelegate.dispatchStartTransaction(getSupportFragmentManager(), getTopFragment(), iSupportFragment, i, 0, 1);
    }

    public void startWithPop(ISupportFragment iSupportFragment) {
        this.mTransactionDelegate.startWithPop(getSupportFragmentManager(), getTopFragment(), iSupportFragment);
    }

    public void startWithPopTo(ISupportFragment iSupportFragment, Class<?> cls, boolean z) {
        this.mTransactionDelegate.startWithPopTo(getSupportFragmentManager(), getTopFragment(), iSupportFragment, cls.getName(), z);
    }

    public void replaceFragment(ISupportFragment iSupportFragment, boolean z) {
        this.mTransactionDelegate.dispatchStartTransaction(getSupportFragmentManager(), getTopFragment(), iSupportFragment, 0, 0, z ? 10 : 11);
    }

    public void pop() {
        this.mTransactionDelegate.pop(getSupportFragmentManager());
    }

    public void popTo(Class<?> cls, boolean z) {
        popTo(cls, z, null);
    }

    public void popTo(Class<?> cls, boolean z, Runnable runnable) {
        popTo(cls, z, runnable, ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
    }

    public void popTo(Class<?> cls, boolean z, Runnable runnable, int i) {
        this.mTransactionDelegate.popTo(cls.getName(), z, runnable, getSupportFragmentManager(), i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public FragmentManager getSupportFragmentManager() {
        return this.mActivity.getSupportFragmentManager();
    }

    private ISupportFragment getTopFragment() {
        return SupportHelper.getTopFragment(getSupportFragmentManager());
    }
}
