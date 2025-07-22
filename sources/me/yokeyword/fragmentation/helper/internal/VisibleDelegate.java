package me.yokeyword.fragmentation.helper.internal;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentationMagician;
import java.util.List;
import me.yokeyword.fragmentation.ISupportFragment;

/* loaded from: classes.dex */
public class VisibleDelegate {
    private static final String FRAGMENTATION_STATE_SAVE_COMPAT_REPLACE = "fragmentation_compat_replace";
    private static final String FRAGMENTATION_STATE_SAVE_IS_INVISIBLE_WHEN_LEAVE = "fragmentation_invisible_when_leave";
    private Fragment mFragment;
    private Handler mHandler;
    private boolean mInvisibleWhenLeave;
    private boolean mIsSupportVisible;
    private Bundle mSaveInstanceState;
    private ISupportFragment mSupportF;
    private boolean mNeedDispatch = true;
    private boolean mIsFirstVisible = true;
    private boolean mFirstCreateViewCompatReplace = true;

    /* JADX WARN: Multi-variable type inference failed */
    public VisibleDelegate(ISupportFragment iSupportFragment) {
        this.mSupportF = iSupportFragment;
        this.mFragment = (Fragment) iSupportFragment;
    }

    public void onCreate(Bundle bundle) {
        if (bundle != null) {
            this.mSaveInstanceState = bundle;
            this.mInvisibleWhenLeave = bundle.getBoolean(FRAGMENTATION_STATE_SAVE_IS_INVISIBLE_WHEN_LEAVE);
            this.mFirstCreateViewCompatReplace = bundle.getBoolean(FRAGMENTATION_STATE_SAVE_COMPAT_REPLACE);
        }
    }

    public void onSaveInstanceState(Bundle bundle) {
        bundle.putBoolean(FRAGMENTATION_STATE_SAVE_IS_INVISIBLE_WHEN_LEAVE, this.mInvisibleWhenLeave);
        bundle.putBoolean(FRAGMENTATION_STATE_SAVE_COMPAT_REPLACE, this.mFirstCreateViewCompatReplace);
    }

    public void onActivityCreated(Bundle bundle) {
        if (this.mFirstCreateViewCompatReplace || this.mFragment.getTag() == null || !this.mFragment.getTag().startsWith("android:switcher:")) {
            if (this.mFirstCreateViewCompatReplace) {
                this.mFirstCreateViewCompatReplace = false;
            }
            if (this.mInvisibleWhenLeave || this.mFragment.isHidden() || !this.mFragment.getUserVisibleHint()) {
                return;
            }
            if ((this.mFragment.getParentFragment() == null || !isFragmentVisible(this.mFragment.getParentFragment())) && this.mFragment.getParentFragment() != null) {
                return;
            }
            this.mNeedDispatch = false;
            safeDispatchUserVisibleHint(true);
        }
    }

    public void onResume() {
        if (this.mIsFirstVisible || this.mIsSupportVisible || this.mInvisibleWhenLeave || !isFragmentVisible(this.mFragment)) {
            return;
        }
        this.mNeedDispatch = false;
        dispatchSupportVisible(true);
    }

    public void onPause() {
        if (this.mIsSupportVisible && isFragmentVisible(this.mFragment)) {
            this.mNeedDispatch = false;
            this.mInvisibleWhenLeave = false;
            dispatchSupportVisible(false);
            return;
        }
        this.mInvisibleWhenLeave = true;
    }

    public void onHiddenChanged(boolean z) {
        if (!z && !this.mFragment.isResumed()) {
            this.mInvisibleWhenLeave = false;
        } else if (z) {
            safeDispatchUserVisibleHint(false);
        } else {
            enqueueDispatchVisible();
        }
    }

    public void onDestroyView() {
        this.mIsFirstVisible = true;
    }

    public void setUserVisibleHint(boolean z) {
        if (this.mFragment.isResumed() || (!this.mFragment.isAdded() && z)) {
            if (!this.mIsSupportVisible && z) {
                safeDispatchUserVisibleHint(true);
            } else {
                if (!this.mIsSupportVisible || z) {
                    return;
                }
                dispatchSupportVisible(false);
            }
        }
    }

    private void safeDispatchUserVisibleHint(boolean z) {
        if (!this.mIsFirstVisible) {
            dispatchSupportVisible(z);
        } else if (z) {
            enqueueDispatchVisible();
        }
    }

    private void enqueueDispatchVisible() {
        getHandler().post(new Runnable() { // from class: me.yokeyword.fragmentation.helper.internal.VisibleDelegate.1
            @Override // java.lang.Runnable
            public void run() {
                VisibleDelegate.this.dispatchSupportVisible(true);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchSupportVisible(boolean z) {
        if (z && isParentInvisible()) {
            return;
        }
        if (this.mIsSupportVisible == z) {
            this.mNeedDispatch = true;
            return;
        }
        this.mIsSupportVisible = z;
        if (z) {
            if (checkAddState()) {
                return;
            }
            this.mSupportF.onSupportVisible();
            if (this.mIsFirstVisible) {
                this.mIsFirstVisible = false;
                this.mSupportF.onLazyInitView(this.mSaveInstanceState);
            }
            dispatchChild(true);
            return;
        }
        dispatchChild(false);
        this.mSupportF.onSupportInvisible();
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void dispatchChild(boolean z) {
        List<Fragment> activeFragments;
        if (!this.mNeedDispatch) {
            this.mNeedDispatch = true;
            return;
        }
        if (checkAddState() || (activeFragments = FragmentationMagician.getActiveFragments(this.mFragment.getChildFragmentManager())) == null) {
            return;
        }
        for (Fragment fragment : activeFragments) {
            if ((fragment instanceof ISupportFragment) && !fragment.isHidden() && fragment.getUserVisibleHint()) {
                ((ISupportFragment) fragment).getSupportDelegate().getVisibleDelegate().dispatchSupportVisible(z);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private boolean isParentInvisible() {
        Fragment parentFragment = this.mFragment.getParentFragment();
        if (parentFragment instanceof ISupportFragment) {
            return !((ISupportFragment) parentFragment).isSupportVisible();
        }
        return (parentFragment == 0 || parentFragment.isVisible()) ? false : true;
    }

    private boolean checkAddState() {
        if (this.mFragment.isAdded()) {
            return false;
        }
        this.mIsSupportVisible = !this.mIsSupportVisible;
        return true;
    }

    private boolean isFragmentVisible(Fragment fragment) {
        return !fragment.isHidden() && fragment.getUserVisibleHint();
    }

    public boolean isSupportVisible() {
        return this.mIsSupportVisible;
    }

    private Handler getHandler() {
        if (this.mHandler == null) {
            this.mHandler = new Handler(Looper.getMainLooper());
        }
        return this.mHandler;
    }
}
