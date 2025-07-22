package me.yokeyword.fragmentation;

import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.fragment.app.FragmentationMagician;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import me.yokeyword.fragmentation.SupportFragmentDelegate;
import me.yokeyword.fragmentation.exception.AfterSaveStateTransactionWarning;
import me.yokeyword.fragmentation.helper.internal.ResultRecord;
import me.yokeyword.fragmentation.helper.internal.TransactionRecord;
import me.yokeyword.fragmentation.queue.Action;
import me.yokeyword.fragmentation.queue.ActionQueue;

/* loaded from: classes.dex */
class TransactionDelegate {
    static final int DEFAULT_POPTO_ANIM = Integer.MAX_VALUE;
    static final String FRAGMENTATION_ARG_CONTAINER = "fragmentation_arg_container";
    static final String FRAGMENTATION_ARG_CUSTOM_ENTER_ANIM = "fragmentation_arg_custom_enter_anim";
    static final String FRAGMENTATION_ARG_CUSTOM_EXIT_ANIM = "fragmentation_arg_custom_exit_anim";
    static final String FRAGMENTATION_ARG_CUSTOM_POP_EXIT_ANIM = "fragmentation_arg_custom_pop_exit_anim";
    static final String FRAGMENTATION_ARG_IS_SHARED_ELEMENT = "fragmentation_arg_is_shared_element";
    static final String FRAGMENTATION_ARG_REPLACE = "fragmentation_arg_replace";
    static final String FRAGMENTATION_ARG_RESULT_RECORD = "fragment_arg_result_record";
    static final String FRAGMENTATION_ARG_ROOT_STATUS = "fragmentation_arg_root_status";
    static final String FRAGMENTATION_STATE_SAVE_ANIMATOR = "fragmentation_state_save_animator";
    static final String FRAGMENTATION_STATE_SAVE_IS_HIDDEN = "fragmentation_state_save_status";
    private static final String FRAGMENTATION_STATE_SAVE_RESULT = "fragmentation_state_save_result";
    private static final String TAG = "Fragmentation";
    static final int TYPE_ADD = 0;
    static final int TYPE_ADD_RESULT = 1;
    static final int TYPE_ADD_RESULT_WITHOUT_HIDE = 3;
    static final int TYPE_ADD_WITHOUT_HIDE = 2;
    static final int TYPE_REPLACE = 10;
    static final int TYPE_REPLACE_DONT_BACK = 11;
    ActionQueue mActionQueue;
    private FragmentActivity mActivity;
    private Handler mHandler;
    private ISupportActivity mSupport;

    /* JADX WARN: Multi-variable type inference failed */
    TransactionDelegate(ISupportActivity iSupportActivity) {
        this.mSupport = iSupportActivity;
        this.mActivity = (FragmentActivity) iSupportActivity;
        Handler handler = new Handler(Looper.getMainLooper());
        this.mHandler = handler;
        this.mActionQueue = new ActionQueue(handler);
    }

    void post(final Runnable runnable) {
        this.mActionQueue.enqueue(new Action() { // from class: me.yokeyword.fragmentation.TransactionDelegate.1
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                runnable.run();
            }
        });
    }

    void loadRootTransaction(final FragmentManager fragmentManager, final int i, final ISupportFragment iSupportFragment, final boolean z, final boolean z2) {
        enqueue(fragmentManager, new Action(4) { // from class: me.yokeyword.fragmentation.TransactionDelegate.2
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                TransactionDelegate.this.bindContainerId(i, iSupportFragment);
                String name = iSupportFragment.getClass().getName();
                TransactionRecord transactionRecord = iSupportFragment.getSupportDelegate().mTransactionRecord;
                if (transactionRecord != null && transactionRecord.tag != null) {
                    name = transactionRecord.tag;
                }
                TransactionDelegate.this.start(fragmentManager, null, iSupportFragment, name, !z, null, z2, 10);
            }
        });
    }

    void loadMultipleRootTransaction(final FragmentManager fragmentManager, final int i, final int i2, final ISupportFragment... iSupportFragmentArr) {
        enqueue(fragmentManager, new Action(4) { // from class: me.yokeyword.fragmentation.TransactionDelegate.3
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
                int i3 = 0;
                while (true) {
                    Object[] objArr = iSupportFragmentArr;
                    if (i3 >= objArr.length) {
                        TransactionDelegate.this.supportCommit(fragmentManager, fragmentTransactionBeginTransaction);
                        return;
                    }
                    Fragment fragment = (Fragment) objArr[i3];
                    TransactionDelegate.this.getArguments(fragment).putInt(TransactionDelegate.FRAGMENTATION_ARG_ROOT_STATUS, 1);
                    TransactionDelegate.this.bindContainerId(i, iSupportFragmentArr[i3]);
                    fragmentTransactionBeginTransaction.add(i, fragment, fragment.getClass().getName());
                    if (i3 != i2) {
                        fragmentTransactionBeginTransaction.hide(fragment);
                    }
                    i3++;
                }
            }
        });
    }

    void dispatchStartTransaction(final FragmentManager fragmentManager, final ISupportFragment iSupportFragment, final ISupportFragment iSupportFragment2, final int i, final int i2, final int i3) {
        enqueue(fragmentManager, new Action(i2 == 2 ? 2 : 0) { // from class: me.yokeyword.fragmentation.TransactionDelegate.4
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                TransactionDelegate.this.doDispatchStartTransaction(fragmentManager, iSupportFragment, iSupportFragment2, i, i2, i3);
            }
        });
    }

    void showHideFragment(final FragmentManager fragmentManager, final ISupportFragment iSupportFragment, final ISupportFragment iSupportFragment2) {
        enqueue(fragmentManager, new Action() { // from class: me.yokeyword.fragmentation.TransactionDelegate.5
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                TransactionDelegate.this.doShowHideFragment(fragmentManager, iSupportFragment, iSupportFragment2);
            }
        });
    }

    void startWithPop(final FragmentManager fragmentManager, final ISupportFragment iSupportFragment, final ISupportFragment iSupportFragment2) {
        enqueue(fragmentManager, new Action(2) { // from class: me.yokeyword.fragmentation.TransactionDelegate.6
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                ISupportFragment topFragmentForStart = TransactionDelegate.this.getTopFragmentForStart(iSupportFragment, fragmentManager);
                if (topFragmentForStart == null) {
                    throw new NullPointerException("There is no Fragment in the FragmentManager, maybe you need to call loadRootFragment() first!");
                }
                TransactionDelegate.this.bindContainerId(topFragmentForStart.getSupportDelegate().mContainerId, iSupportFragment2);
                TransactionDelegate.this.handleAfterSaveInStateTransactionException(fragmentManager, "popTo()");
                FragmentationMagician.executePendingTransactionsAllowingStateLoss(fragmentManager);
                topFragmentForStart.getSupportDelegate().mLockAnim = true;
                if (!FragmentationMagician.isStateSaved(fragmentManager)) {
                    TransactionDelegate.this.mockStartWithPopAnim(SupportHelper.getTopFragment(fragmentManager), iSupportFragment2, topFragmentForStart.getSupportDelegate().mAnimHelper.popExitAnim);
                }
                TransactionDelegate.this.removeTopFragment(fragmentManager);
                FragmentationMagician.popBackStackAllowingStateLoss(fragmentManager);
                FragmentationMagician.executePendingTransactionsAllowingStateLoss(fragmentManager);
            }
        });
        dispatchStartTransaction(fragmentManager, iSupportFragment, iSupportFragment2, 0, 0, 0);
    }

    void startWithPopTo(final FragmentManager fragmentManager, final ISupportFragment iSupportFragment, final ISupportFragment iSupportFragment2, final String str, final boolean z) {
        enqueue(fragmentManager, new Action(2) { // from class: me.yokeyword.fragmentation.TransactionDelegate.7
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                boolean z2 = z;
                List<Fragment> willPopFragments = SupportHelper.getWillPopFragments(fragmentManager, str, z2);
                ISupportFragment topFragmentForStart = TransactionDelegate.this.getTopFragmentForStart(iSupportFragment, fragmentManager);
                if (topFragmentForStart == null) {
                    throw new NullPointerException("There is no Fragment in the FragmentManager, maybe you need to call loadRootFragment() first!");
                }
                TransactionDelegate.this.bindContainerId(topFragmentForStart.getSupportDelegate().mContainerId, iSupportFragment2);
                if (willPopFragments.size() <= 0) {
                    return;
                }
                TransactionDelegate.this.handleAfterSaveInStateTransactionException(fragmentManager, "startWithPopTo()");
                FragmentationMagician.executePendingTransactionsAllowingStateLoss(fragmentManager);
                if (!FragmentationMagician.isStateSaved(fragmentManager)) {
                    TransactionDelegate.this.mockStartWithPopAnim(SupportHelper.getTopFragment(fragmentManager), iSupportFragment2, topFragmentForStart.getSupportDelegate().mAnimHelper.popExitAnim);
                }
                TransactionDelegate.this.safePopTo(str, fragmentManager, z2 ? 1 : 0, willPopFragments);
            }
        });
        dispatchStartTransaction(fragmentManager, iSupportFragment, iSupportFragment2, 0, 0, 0);
    }

    void remove(final FragmentManager fragmentManager, final Fragment fragment, final boolean z) {
        enqueue(fragmentManager, new Action(1, fragmentManager) { // from class: me.yokeyword.fragmentation.TransactionDelegate.8
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                FragmentTransaction fragmentTransactionRemove = fragmentManager.beginTransaction().setTransition(8194).remove(fragment);
                if (z) {
                    Object preFragment = SupportHelper.getPreFragment(fragment);
                    if (preFragment instanceof Fragment) {
                        fragmentTransactionRemove.show((Fragment) preFragment);
                    }
                }
                TransactionDelegate.this.supportCommit(fragmentManager, fragmentTransactionRemove);
            }
        });
    }

    void pop(final FragmentManager fragmentManager) {
        enqueue(fragmentManager, new Action(1, fragmentManager) { // from class: me.yokeyword.fragmentation.TransactionDelegate.9
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                TransactionDelegate.this.handleAfterSaveInStateTransactionException(fragmentManager, "pop()");
                FragmentationMagician.popBackStackAllowingStateLoss(fragmentManager);
                TransactionDelegate.this.removeTopFragment(fragmentManager);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void removeTopFragment(FragmentManager fragmentManager) {
        try {
            Object backStackTopFragment = SupportHelper.getBackStackTopFragment(fragmentManager);
            if (backStackTopFragment != null) {
                fragmentManager.beginTransaction().setTransition(8194).remove((Fragment) backStackTopFragment).commitAllowingStateLoss();
            }
        } catch (Exception unused) {
        }
    }

    void popQuiet(final FragmentManager fragmentManager, final Fragment fragment) {
        enqueue(fragmentManager, new Action(2) { // from class: me.yokeyword.fragmentation.TransactionDelegate.10
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() {
                TransactionDelegate.this.mSupport.getSupportDelegate().mPopMultipleNoAnim = true;
                TransactionDelegate.this.removeTopFragment(fragmentManager);
                FragmentationMagician.popBackStackAllowingStateLoss(fragmentManager, fragment.getTag(), 0);
                FragmentationMagician.popBackStackAllowingStateLoss(fragmentManager);
                FragmentationMagician.executePendingTransactionsAllowingStateLoss(fragmentManager);
                TransactionDelegate.this.mSupport.getSupportDelegate().mPopMultipleNoAnim = false;
            }
        });
    }

    void popTo(final String str, final boolean z, final Runnable runnable, final FragmentManager fragmentManager, final int i) {
        enqueue(fragmentManager, new Action(2) { // from class: me.yokeyword.fragmentation.TransactionDelegate.11
            @Override // me.yokeyword.fragmentation.queue.Action
            public void run() throws Resources.NotFoundException {
                TransactionDelegate.this.doPopTo(str, z, fragmentManager, i);
                Runnable runnable2 = runnable;
                if (runnable2 != null) {
                    runnable2.run();
                }
            }
        });
    }

    /* JADX WARN: Multi-variable type inference failed */
    boolean dispatchBackPressedEvent(ISupportFragment iSupportFragment) {
        if (iSupportFragment != 0) {
            return iSupportFragment.onBackPressedSupport() || dispatchBackPressedEvent((ISupportFragment) ((Fragment) iSupportFragment).getParentFragment());
        }
        return false;
    }

    void handleResultRecord(Fragment fragment) {
        ResultRecord resultRecord;
        try {
            Bundle arguments = fragment.getArguments();
            if (arguments == null || (resultRecord = (ResultRecord) arguments.getParcelable(FRAGMENTATION_ARG_RESULT_RECORD)) == null) {
                return;
            }
            ((ISupportFragment) fragment.getFragmentManager().getFragment(fragment.getArguments(), FRAGMENTATION_STATE_SAVE_RESULT)).onFragmentResult(resultRecord.requestCode, resultRecord.resultCode, resultRecord.resultBundle);
        } catch (IllegalStateException unused) {
        }
    }

    private void enqueue(FragmentManager fragmentManager, Action action) {
        if (fragmentManager == null) {
            Log.w(TAG, "FragmentManager is null, skip the action!");
        } else {
            this.mActionQueue.enqueue(action);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public void doDispatchStartTransaction(FragmentManager fragmentManager, ISupportFragment iSupportFragment, ISupportFragment iSupportFragment2, int i, int i2, int i3) {
        String str;
        ArrayList<TransactionRecord.SharedElement> arrayList;
        boolean z;
        checkNotNull(iSupportFragment2, "toFragment == null");
        if ((i3 == 1 || i3 == 3) && iSupportFragment != 0) {
            Fragment fragment = (Fragment) iSupportFragment;
            if (!fragment.isAdded()) {
                Log.w(TAG, fragment.getClass().getSimpleName() + " has not been attached yet! startForResult() converted to start()");
            } else {
                saveRequestCode(fragmentManager, fragment, (Fragment) iSupportFragment2, i);
            }
        }
        ISupportFragment topFragmentForStart = getTopFragmentForStart(iSupportFragment, fragmentManager);
        int i4 = getArguments((Fragment) iSupportFragment2).getInt(FRAGMENTATION_ARG_CONTAINER, 0);
        if (topFragmentForStart == null && i4 == 0) {
            Log.e(TAG, "There is no Fragment in the FragmentManager, maybe you need to call loadRootFragment()!");
            return;
        }
        if (topFragmentForStart != null && i4 == 0) {
            bindContainerId(topFragmentForStart.getSupportDelegate().mContainerId, iSupportFragment2);
        }
        String name = iSupportFragment2.getClass().getName();
        TransactionRecord transactionRecord = iSupportFragment2.getSupportDelegate().mTransactionRecord;
        if (transactionRecord != null) {
            if (transactionRecord.tag != null) {
                name = transactionRecord.tag;
            }
            boolean z2 = transactionRecord.dontAddToBackStack;
            str = name;
            arrayList = transactionRecord.sharedElementList != null ? transactionRecord.sharedElementList : null;
            z = z2;
        } else {
            str = name;
            arrayList = null;
            z = false;
        }
        if (handleLaunchMode(fragmentManager, topFragmentForStart, iSupportFragment2, str, i2)) {
            return;
        }
        start(fragmentManager, topFragmentForStart, iSupportFragment2, str, z, arrayList, false, i3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public ISupportFragment getTopFragmentForStart(ISupportFragment iSupportFragment, FragmentManager fragmentManager) {
        if (iSupportFragment == 0) {
            return SupportHelper.getTopFragment(fragmentManager);
        }
        if (iSupportFragment.getSupportDelegate().mContainerId == 0) {
            Fragment fragment = (Fragment) iSupportFragment;
            if (fragment.getTag() != null && !fragment.getTag().startsWith("android:switcher:")) {
                throw new IllegalStateException("Can't find container, please call loadRootFragment() first!");
            }
        }
        return SupportHelper.getTopFragment(fragmentManager, iSupportFragment.getSupportDelegate().mContainerId);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public void start(FragmentManager fragmentManager, ISupportFragment iSupportFragment, ISupportFragment iSupportFragment2, String str, boolean z, ArrayList<TransactionRecord.SharedElement> arrayList, boolean z2, int i) {
        FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
        boolean z3 = i == 0 || i == 1 || i == 2 || i == 3;
        Fragment fragment = (Fragment) iSupportFragment;
        Fragment fragment2 = (Fragment) iSupportFragment2;
        Bundle arguments = getArguments(fragment2);
        arguments.putBoolean(FRAGMENTATION_ARG_REPLACE, !z3);
        if (arrayList != null) {
            arguments.putBoolean(FRAGMENTATION_ARG_IS_SHARED_ELEMENT, true);
            Iterator<TransactionRecord.SharedElement> it = arrayList.iterator();
            while (it.hasNext()) {
                TransactionRecord.SharedElement next = it.next();
                fragmentTransactionBeginTransaction.addSharedElement(next.sharedElement, next.sharedName);
            }
        } else if (z3) {
            TransactionRecord transactionRecord = iSupportFragment2.getSupportDelegate().mTransactionRecord;
            if (transactionRecord != null && transactionRecord.targetFragmentEnter != Integer.MIN_VALUE) {
                fragmentTransactionBeginTransaction.setCustomAnimations(transactionRecord.targetFragmentEnter, transactionRecord.currentFragmentPopExit, transactionRecord.currentFragmentPopEnter, transactionRecord.targetFragmentExit);
                arguments.putInt(FRAGMENTATION_ARG_CUSTOM_ENTER_ANIM, transactionRecord.targetFragmentEnter);
                arguments.putInt(FRAGMENTATION_ARG_CUSTOM_EXIT_ANIM, transactionRecord.targetFragmentExit);
                arguments.putInt(FRAGMENTATION_ARG_CUSTOM_POP_EXIT_ANIM, transactionRecord.currentFragmentPopExit);
            } else {
                fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
            }
        } else {
            arguments.putInt(FRAGMENTATION_ARG_ROOT_STATUS, 1);
        }
        if (iSupportFragment == 0) {
            fragmentTransactionBeginTransaction.replace(arguments.getInt(FRAGMENTATION_ARG_CONTAINER), fragment2, str);
            if (!z3) {
                fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN);
                arguments.putInt(FRAGMENTATION_ARG_ROOT_STATUS, z2 ? 2 : 1);
            }
        } else if (z3) {
            fragmentTransactionBeginTransaction.add(iSupportFragment.getSupportDelegate().mContainerId, fragment2, str);
            if (i != 2 && i != 3) {
                fragmentTransactionBeginTransaction.hide(fragment);
            }
        } else {
            fragmentTransactionBeginTransaction.replace(iSupportFragment.getSupportDelegate().mContainerId, fragment2, str);
        }
        if (!z && i != 11) {
            fragmentTransactionBeginTransaction.addToBackStack(str);
        }
        supportCommit(fragmentManager, fragmentTransactionBeginTransaction);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public void doShowHideFragment(FragmentManager fragmentManager, ISupportFragment iSupportFragment, ISupportFragment iSupportFragment2) {
        if (iSupportFragment == iSupportFragment2) {
            return;
        }
        FragmentTransaction fragmentTransactionShow = fragmentManager.beginTransaction().show((Fragment) iSupportFragment);
        if (iSupportFragment2 == 0) {
            List<Fragment> activeFragments = FragmentationMagician.getActiveFragments(fragmentManager);
            if (activeFragments != null) {
                for (Fragment fragment : activeFragments) {
                    if (fragment != null && fragment != iSupportFragment) {
                        fragmentTransactionShow.hide(fragment);
                    }
                }
            }
        } else {
            fragmentTransactionShow.hide((Fragment) iSupportFragment2);
        }
        supportCommit(fragmentManager, fragmentTransactionShow);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public void bindContainerId(int i, ISupportFragment iSupportFragment) {
        getArguments((Fragment) iSupportFragment).putInt(FRAGMENTATION_ARG_CONTAINER, i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Bundle getArguments(Fragment fragment) {
        Bundle arguments = fragment.getArguments();
        if (arguments != null) {
            return arguments;
        }
        Bundle bundle = new Bundle();
        fragment.setArguments(bundle);
        return bundle;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void supportCommit(FragmentManager fragmentManager, FragmentTransaction fragmentTransaction) {
        handleAfterSaveInStateTransactionException(fragmentManager, "commit()");
        fragmentTransaction.commitAllowingStateLoss();
    }

    private boolean handleLaunchMode(FragmentManager fragmentManager, ISupportFragment iSupportFragment, final ISupportFragment iSupportFragment2, String str, int i) throws Resources.NotFoundException {
        final ISupportFragment iSupportFragmentFindBackStackFragment;
        if (iSupportFragment == null || (iSupportFragmentFindBackStackFragment = SupportHelper.findBackStackFragment(iSupportFragment2.getClass(), str, fragmentManager)) == null) {
            return false;
        }
        if (i == 1) {
            if (iSupportFragment2 == iSupportFragment || iSupportFragment2.getClass().getName().equals(iSupportFragment.getClass().getName())) {
                handleNewBundle(iSupportFragment2, iSupportFragmentFindBackStackFragment);
                return true;
            }
        } else if (i == 2) {
            doPopTo(str, false, fragmentManager, Integer.MAX_VALUE);
            this.mHandler.post(new Runnable() { // from class: me.yokeyword.fragmentation.TransactionDelegate.12
                @Override // java.lang.Runnable
                public void run() {
                    TransactionDelegate.this.handleNewBundle(iSupportFragment2, iSupportFragmentFindBackStackFragment);
                }
            });
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public void handleNewBundle(ISupportFragment iSupportFragment, ISupportFragment iSupportFragment2) {
        Bundle bundle = iSupportFragment.getSupportDelegate().mNewBundle;
        Bundle arguments = getArguments((Fragment) iSupportFragment);
        if (arguments.containsKey(FRAGMENTATION_ARG_CONTAINER)) {
            arguments.remove(FRAGMENTATION_ARG_CONTAINER);
        }
        if (bundle != null) {
            arguments.putAll(bundle);
        }
        iSupportFragment2.onNewBundle(arguments);
    }

    private void saveRequestCode(FragmentManager fragmentManager, Fragment fragment, Fragment fragment2, int i) {
        Bundle arguments = getArguments(fragment2);
        ResultRecord resultRecord = new ResultRecord();
        resultRecord.requestCode = i;
        arguments.putParcelable(FRAGMENTATION_ARG_RESULT_RECORD, resultRecord);
        fragmentManager.putFragment(arguments, FRAGMENTATION_STATE_SAVE_RESULT, fragment);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doPopTo(String str, boolean z, FragmentManager fragmentManager, int i) throws Resources.NotFoundException {
        handleAfterSaveInStateTransactionException(fragmentManager, "popTo()");
        if (fragmentManager.findFragmentByTag(str) == null) {
            Log.e(TAG, "Pop failure! Can't find FragmentTag:" + str + " in the FragmentManager's Stack.");
            return;
        }
        List<Fragment> willPopFragments = SupportHelper.getWillPopFragments(fragmentManager, str, z);
        if (willPopFragments.size() <= 0) {
            return;
        }
        mockPopToAnim(willPopFragments.get(0), str, fragmentManager, z ? 1 : 0, willPopFragments, i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void safePopTo(String str, FragmentManager fragmentManager, int i, List<Fragment> list) {
        this.mSupport.getSupportDelegate().mPopMultipleNoAnim = true;
        FragmentTransaction transition = fragmentManager.beginTransaction().setTransition(8194);
        Iterator<Fragment> it = list.iterator();
        while (it.hasNext()) {
            transition.remove(it.next());
        }
        transition.commitAllowingStateLoss();
        FragmentationMagician.popBackStackAllowingStateLoss(fragmentManager, str, i);
        FragmentationMagician.executePendingTransactionsAllowingStateLoss(fragmentManager);
        this.mSupport.getSupportDelegate().mPopMultipleNoAnim = false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void mockPopToAnim(Fragment fragment, String str, FragmentManager fragmentManager, int i, List<Fragment> list, int i2) throws Resources.NotFoundException {
        final View view;
        Animation animationLoadAnimation;
        if (!(fragment instanceof ISupportFragment)) {
            safePopTo(str, fragmentManager, i, list);
            return;
        }
        ISupportFragment iSupportFragment = (ISupportFragment) fragment;
        final ViewGroup viewGroupFindContainerById = findContainerById(fragment, iSupportFragment.getSupportDelegate().mContainerId);
        if (viewGroupFindContainerById == null || (view = fragment.getView()) == null) {
            return;
        }
        viewGroupFindContainerById.removeViewInLayout(view);
        final ViewGroup viewGroupAddMockView = addMockView(view, viewGroupFindContainerById);
        safePopTo(str, fragmentManager, i, list);
        if (i2 == Integer.MAX_VALUE) {
            animationLoadAnimation = iSupportFragment.getSupportDelegate().getExitAnim();
            if (animationLoadAnimation == null) {
                animationLoadAnimation = new Animation() { // from class: me.yokeyword.fragmentation.TransactionDelegate.13
                };
            }
        } else if (i2 == 0) {
            animationLoadAnimation = new Animation() { // from class: me.yokeyword.fragmentation.TransactionDelegate.14
            };
        } else {
            animationLoadAnimation = AnimationUtils.loadAnimation(this.mActivity, i2);
        }
        view.startAnimation(animationLoadAnimation);
        this.mHandler.postDelayed(new Runnable() { // from class: me.yokeyword.fragmentation.TransactionDelegate.15
            @Override // java.lang.Runnable
            public void run() {
                try {
                    viewGroupAddMockView.removeViewInLayout(view);
                    viewGroupFindContainerById.removeViewInLayout(viewGroupAddMockView);
                } catch (Exception unused) {
                }
            }
        }, animationLoadAnimation.getDuration());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public void mockStartWithPopAnim(ISupportFragment iSupportFragment, ISupportFragment iSupportFragment2, final Animation animation) {
        final View view;
        Fragment fragment = (Fragment) iSupportFragment;
        final ViewGroup viewGroupFindContainerById = findContainerById(fragment, iSupportFragment.getSupportDelegate().mContainerId);
        if (viewGroupFindContainerById == null || (view = fragment.getView()) == null) {
            return;
        }
        viewGroupFindContainerById.removeViewInLayout(view);
        final ViewGroup viewGroupAddMockView = addMockView(view, viewGroupFindContainerById);
        iSupportFragment2.getSupportDelegate().mEnterAnimListener = new SupportFragmentDelegate.EnterAnimListener() { // from class: me.yokeyword.fragmentation.TransactionDelegate.16
            @Override // me.yokeyword.fragmentation.SupportFragmentDelegate.EnterAnimListener
            public void onEnterAnimStart() {
                view.startAnimation(animation);
                TransactionDelegate.this.mHandler.postDelayed(new Runnable() { // from class: me.yokeyword.fragmentation.TransactionDelegate.16.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            viewGroupAddMockView.removeViewInLayout(view);
                            viewGroupFindContainerById.removeViewInLayout(viewGroupAddMockView);
                        } catch (Exception unused) {
                        }
                    }
                }, animation.getDuration());
            }
        };
    }

    private ViewGroup addMockView(View view, ViewGroup viewGroup) {
        ViewGroup viewGroup2 = new ViewGroup(this.mActivity) { // from class: me.yokeyword.fragmentation.TransactionDelegate.17
            @Override // android.view.ViewGroup, android.view.View
            protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
            }
        };
        viewGroup2.addView(view);
        viewGroup.addView(viewGroup2);
        return viewGroup2;
    }

    private ViewGroup findContainerById(Fragment fragment, int i) {
        View viewFindViewById;
        if (fragment.getView() == null) {
            return null;
        }
        Fragment parentFragment = fragment.getParentFragment();
        if (parentFragment != null) {
            if (parentFragment.getView() != null) {
                viewFindViewById = parentFragment.getView().findViewById(i);
            } else {
                viewFindViewById = findContainerById(parentFragment, i);
            }
        } else {
            viewFindViewById = this.mActivity.findViewById(i);
        }
        if (viewFindViewById instanceof ViewGroup) {
            return (ViewGroup) viewFindViewById;
        }
        return null;
    }

    private static <T> void checkNotNull(T t, String str) {
        if (t == null) {
            throw new NullPointerException(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleAfterSaveInStateTransactionException(FragmentManager fragmentManager, String str) {
        if (FragmentationMagician.isStateSaved(fragmentManager)) {
            AfterSaveStateTransactionWarning afterSaveStateTransactionWarning = new AfterSaveStateTransactionWarning(str);
            if (Fragmentation.getDefault().getHandler() != null) {
                Fragmentation.getDefault().getHandler().onException(afterSaveStateTransactionWarning);
            }
        }
    }
}
