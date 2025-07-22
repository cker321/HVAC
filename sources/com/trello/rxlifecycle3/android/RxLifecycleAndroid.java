package com.trello.rxlifecycle3.android;

import android.view.View;
import com.trello.rxlifecycle3.LifecycleTransformer;
import com.trello.rxlifecycle3.OutsideLifecycleException;
import com.trello.rxlifecycle3.RxLifecycle;
import com.trello.rxlifecycle3.internal.Preconditions;
import io.reactivex.Observable;
import io.reactivex.functions.Function;

/* loaded from: classes.dex */
public class RxLifecycleAndroid {
    private static final Function<ActivityEvent, ActivityEvent> ACTIVITY_LIFECYCLE = new Function<ActivityEvent, ActivityEvent>() { // from class: com.trello.rxlifecycle3.android.RxLifecycleAndroid.1
        @Override // io.reactivex.functions.Function
        public ActivityEvent apply(ActivityEvent activityEvent) throws Exception {
            switch (C07263.$SwitchMap$com$trello$rxlifecycle3$android$ActivityEvent[activityEvent.ordinal()]) {
                case 1:
                    return ActivityEvent.DESTROY;
                case 2:
                    return ActivityEvent.STOP;
                case 3:
                    return ActivityEvent.PAUSE;
                case 4:
                    return ActivityEvent.STOP;
                case 5:
                    return ActivityEvent.DESTROY;
                case 6:
                    throw new OutsideLifecycleException("Cannot bind to Activity lifecycle when outside of it.");
                default:
                    throw new UnsupportedOperationException("Binding to " + activityEvent + " not yet implemented");
            }
        }
    };
    private static final Function<FragmentEvent, FragmentEvent> FRAGMENT_LIFECYCLE = new Function<FragmentEvent, FragmentEvent>() { // from class: com.trello.rxlifecycle3.android.RxLifecycleAndroid.2
        @Override // io.reactivex.functions.Function
        public FragmentEvent apply(FragmentEvent fragmentEvent) throws Exception {
            switch (C07263.$SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[fragmentEvent.ordinal()]) {
                case 1:
                    return FragmentEvent.DETACH;
                case 2:
                    return FragmentEvent.DESTROY;
                case 3:
                    return FragmentEvent.DESTROY_VIEW;
                case 4:
                    return FragmentEvent.STOP;
                case 5:
                    return FragmentEvent.PAUSE;
                case 6:
                    return FragmentEvent.STOP;
                case 7:
                    return FragmentEvent.DESTROY_VIEW;
                case 8:
                    return FragmentEvent.DESTROY;
                case 9:
                    return FragmentEvent.DETACH;
                case 10:
                    throw new OutsideLifecycleException("Cannot bind to Fragment lifecycle when outside of it.");
                default:
                    throw new UnsupportedOperationException("Binding to " + fragmentEvent + " not yet implemented");
            }
        }
    };

    private RxLifecycleAndroid() {
        throw new AssertionError("No instances");
    }

    public static <T> LifecycleTransformer<T> bindActivity(Observable<ActivityEvent> observable) {
        return RxLifecycle.bind(observable, ACTIVITY_LIFECYCLE);
    }

    public static <T> LifecycleTransformer<T> bindFragment(Observable<FragmentEvent> observable) {
        return RxLifecycle.bind(observable, FRAGMENT_LIFECYCLE);
    }

    public static <T> LifecycleTransformer<T> bindView(View view) {
        Preconditions.checkNotNull(view, "view == null");
        return RxLifecycle.bind(Observable.create(new ViewDetachesOnSubscribe(view)));
    }

    /* renamed from: com.trello.rxlifecycle3.android.RxLifecycleAndroid$3 */
    static /* synthetic */ class C07263 {
        static final /* synthetic */ int[] $SwitchMap$com$trello$rxlifecycle3$android$ActivityEvent;
        static final /* synthetic */ int[] $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent;

        static {
            int[] iArr = new int[FragmentEvent.values().length];
            $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent = iArr;
            try {
                iArr[FragmentEvent.ATTACH.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[FragmentEvent.CREATE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[FragmentEvent.CREATE_VIEW.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[FragmentEvent.START.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[FragmentEvent.RESUME.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[FragmentEvent.PAUSE.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[FragmentEvent.STOP.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[FragmentEvent.DESTROY_VIEW.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[FragmentEvent.DESTROY.ordinal()] = 9;
            } catch (NoSuchFieldError unused9) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$FragmentEvent[FragmentEvent.DETACH.ordinal()] = 10;
            } catch (NoSuchFieldError unused10) {
            }
            int[] iArr2 = new int[ActivityEvent.values().length];
            $SwitchMap$com$trello$rxlifecycle3$android$ActivityEvent = iArr2;
            try {
                iArr2[ActivityEvent.CREATE.ordinal()] = 1;
            } catch (NoSuchFieldError unused11) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$ActivityEvent[ActivityEvent.START.ordinal()] = 2;
            } catch (NoSuchFieldError unused12) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$ActivityEvent[ActivityEvent.RESUME.ordinal()] = 3;
            } catch (NoSuchFieldError unused13) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$ActivityEvent[ActivityEvent.PAUSE.ordinal()] = 4;
            } catch (NoSuchFieldError unused14) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$ActivityEvent[ActivityEvent.STOP.ordinal()] = 5;
            } catch (NoSuchFieldError unused15) {
            }
            try {
                $SwitchMap$com$trello$rxlifecycle3$android$ActivityEvent[ActivityEvent.DESTROY.ordinal()] = 6;
            } catch (NoSuchFieldError unused16) {
            }
        }
    }
}
