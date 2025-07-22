package me.yokeyword.fragmentation.queue;

import android.os.Handler;
import android.os.Looper;
import java.util.LinkedList;
import java.util.Queue;
import me.yokeyword.fragmentation.ISupportFragment;
import me.yokeyword.fragmentation.SupportHelper;

/* loaded from: classes.dex */
public class ActionQueue {
    private Handler mMainHandler;
    private Queue<Action> mQueue = new LinkedList();

    public ActionQueue(Handler handler) {
        this.mMainHandler = handler;
    }

    public void enqueue(final Action action) {
        if (isThrottleBACK(action)) {
            return;
        }
        if (action.action == 4 && this.mQueue.isEmpty() && Thread.currentThread() == Looper.getMainLooper().getThread()) {
            action.run();
        } else {
            this.mMainHandler.post(new Runnable() { // from class: me.yokeyword.fragmentation.queue.ActionQueue.1
                @Override // java.lang.Runnable
                public void run() {
                    ActionQueue.this.enqueueAction(action);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void enqueueAction(Action action) {
        this.mQueue.add(action);
        if (this.mQueue.size() == 1) {
            handleAction();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleAction() {
        if (this.mQueue.isEmpty()) {
            return;
        }
        Action actionPeek = this.mQueue.peek();
        actionPeek.run();
        executeNextAction(actionPeek);
    }

    private void executeNextAction(Action action) {
        if (action.action == 1) {
            ISupportFragment backStackTopFragment = SupportHelper.getBackStackTopFragment(action.fragmentManager);
            action.duration = backStackTopFragment == null ? 300L : backStackTopFragment.getSupportDelegate().getExitAnimDuration();
        }
        this.mMainHandler.postDelayed(new Runnable() { // from class: me.yokeyword.fragmentation.queue.ActionQueue.2
            @Override // java.lang.Runnable
            public void run() {
                ActionQueue.this.mQueue.poll();
                ActionQueue.this.handleAction();
            }
        }, action.duration);
    }

    private boolean isThrottleBACK(Action action) {
        Action actionPeek;
        return action.action == 3 && (actionPeek = this.mQueue.peek()) != null && actionPeek.action == 1;
    }
}
