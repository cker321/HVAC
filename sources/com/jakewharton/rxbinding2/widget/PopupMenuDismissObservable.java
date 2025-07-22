package com.jakewharton.rxbinding2.widget;

import android.widget.PopupMenu;
import com.jakewharton.rxbinding2.internal.Notification;
import com.jakewharton.rxbinding2.internal.Preconditions;
import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.android.MainThreadDisposable;

/* loaded from: classes.dex */
final class PopupMenuDismissObservable extends Observable<Object> {
    private final PopupMenu view;

    PopupMenuDismissObservable(PopupMenu popupMenu) {
        this.view = popupMenu;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super Object> observer) {
        if (Preconditions.checkMainThread(observer)) {
            Listener listener = new Listener(this.view, observer);
            this.view.setOnDismissListener(listener);
            observer.onSubscribe(listener);
        }
    }

    static final class Listener extends MainThreadDisposable implements PopupMenu.OnDismissListener {
        private final Observer<? super Object> observer;
        private final PopupMenu view;

        Listener(PopupMenu popupMenu, Observer<? super Object> observer) {
            this.view = popupMenu;
            this.observer = observer;
        }

        @Override // android.widget.PopupMenu.OnDismissListener
        public void onDismiss(PopupMenu popupMenu) {
            if (isDisposed()) {
                return;
            }
            this.observer.onNext(Notification.INSTANCE);
        }

        @Override // io.reactivex.android.MainThreadDisposable
        protected void onDispose() {
            this.view.setOnDismissListener(null);
        }
    }
}
