package retrofit2.adapter.rxjava2;

import io.reactivex.Completable;
import io.reactivex.Flowable;
import io.reactivex.Maybe;
import io.reactivex.Observable;
import io.reactivex.Scheduler;
import io.reactivex.Single;
import java.lang.annotation.Annotation;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import javax.annotation.Nullable;
import retrofit2.CallAdapter;
import retrofit2.Response;
import retrofit2.Retrofit;

/* loaded from: classes.dex */
public final class RxJava2CallAdapterFactory extends CallAdapter.Factory {
    private final boolean isAsync;

    @Nullable
    private final Scheduler scheduler;

    public static RxJava2CallAdapterFactory create() {
        return new RxJava2CallAdapterFactory(null, false);
    }

    public static RxJava2CallAdapterFactory createAsync() {
        return new RxJava2CallAdapterFactory(null, true);
    }

    public static RxJava2CallAdapterFactory createWithScheduler(Scheduler scheduler) {
        if (scheduler == null) {
            throw new NullPointerException("scheduler == null");
        }
        return new RxJava2CallAdapterFactory(scheduler, false);
    }

    private RxJava2CallAdapterFactory(@Nullable Scheduler scheduler, boolean z) {
        this.scheduler = scheduler;
        this.isAsync = z;
    }

    @Override // retrofit2.CallAdapter.Factory
    public CallAdapter<?, ?> get(Type type, Annotation[] annotationArr, Retrofit retrofit) {
        Type parameterUpperBound;
        boolean z;
        boolean z2;
        Class<?> rawType = getRawType(type);
        if (rawType == Completable.class) {
            return new RxJava2CallAdapter(Void.class, this.scheduler, this.isAsync, false, true, false, false, false, true);
        }
        boolean z3 = rawType == Flowable.class;
        boolean z4 = rawType == Single.class;
        boolean z5 = rawType == Maybe.class;
        if (rawType != Observable.class && !z3 && !z4 && !z5) {
            return null;
        }
        if (!(type instanceof ParameterizedType)) {
            String str = !z3 ? !z4 ? z5 ? "Maybe" : "Observable" : "Single" : "Flowable";
            throw new IllegalStateException(str + " return type must be parameterized as " + str + "<Foo> or " + str + "<? extends Foo>");
        }
        Type parameterUpperBound2 = getParameterUpperBound(0, (ParameterizedType) type);
        Class<?> rawType2 = getRawType(parameterUpperBound2);
        if (rawType2 == Response.class) {
            if (!(parameterUpperBound2 instanceof ParameterizedType)) {
                throw new IllegalStateException("Response must be parameterized as Response<Foo> or Response<? extends Foo>");
            }
            parameterUpperBound = getParameterUpperBound(0, (ParameterizedType) parameterUpperBound2);
            z = false;
        } else if (rawType2 == Result.class) {
            if (!(parameterUpperBound2 instanceof ParameterizedType)) {
                throw new IllegalStateException("Result must be parameterized as Result<Foo> or Result<? extends Foo>");
            }
            parameterUpperBound = getParameterUpperBound(0, (ParameterizedType) parameterUpperBound2);
            z = true;
        } else {
            parameterUpperBound = parameterUpperBound2;
            z = false;
            z2 = true;
            return new RxJava2CallAdapter(parameterUpperBound, this.scheduler, this.isAsync, z, z2, z3, z4, z5, false);
        }
        z2 = false;
        return new RxJava2CallAdapter(parameterUpperBound, this.scheduler, this.isAsync, z, z2, z3, z4, z5, false);
    }
}
