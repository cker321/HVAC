package com.bumptech.glide;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.resource.gif.GifDrawable;
import com.bumptech.glide.manager.ConnectivityMonitor;
import com.bumptech.glide.manager.ConnectivityMonitorFactory;
import com.bumptech.glide.manager.Lifecycle;
import com.bumptech.glide.manager.LifecycleListener;
import com.bumptech.glide.manager.RequestManagerTreeNode;
import com.bumptech.glide.manager.RequestTracker;
import com.bumptech.glide.manager.TargetTracker;
import com.bumptech.glide.request.BaseRequestOptions;
import com.bumptech.glide.request.Request;
import com.bumptech.glide.request.RequestListener;
import com.bumptech.glide.request.RequestOptions;
import com.bumptech.glide.request.target.Target;
import com.bumptech.glide.request.target.ViewTarget;
import com.bumptech.glide.request.transition.Transition;
import com.bumptech.glide.util.Util;
import java.io.File;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.dex */
public class RequestManager implements LifecycleListener, ModelTypes<RequestBuilder<Drawable>> {
    private static final RequestOptions DECODE_TYPE_BITMAP = RequestOptions.decodeTypeOf(Bitmap.class).lock();
    private static final RequestOptions DECODE_TYPE_GIF = RequestOptions.decodeTypeOf(GifDrawable.class).lock();
    private static final RequestOptions DOWNLOAD_ONLY_OPTIONS = RequestOptions.diskCacheStrategyOf(DiskCacheStrategy.DATA).priority(Priority.LOW).skipMemoryCache(true);
    private final Runnable addSelfToLifecycle;
    private final ConnectivityMonitor connectivityMonitor;
    protected final Context context;
    private final CopyOnWriteArrayList<RequestListener<Object>> defaultRequestListeners;
    protected final Glide glide;
    final Lifecycle lifecycle;
    private final Handler mainHandler;
    private RequestOptions requestOptions;
    private final RequestTracker requestTracker;
    private final TargetTracker targetTracker;
    private final RequestManagerTreeNode treeNode;

    public RequestManager(Glide glide, Lifecycle lifecycle, RequestManagerTreeNode requestManagerTreeNode, Context context) {
        this(glide, lifecycle, requestManagerTreeNode, new RequestTracker(), glide.getConnectivityMonitorFactory(), context);
    }

    RequestManager(Glide glide, Lifecycle lifecycle, RequestManagerTreeNode requestManagerTreeNode, RequestTracker requestTracker, ConnectivityMonitorFactory connectivityMonitorFactory, Context context) {
        this.targetTracker = new TargetTracker();
        this.addSelfToLifecycle = new Runnable() { // from class: com.bumptech.glide.RequestManager.1
            @Override // java.lang.Runnable
            public void run() {
                RequestManager.this.lifecycle.addListener(RequestManager.this);
            }
        };
        this.mainHandler = new Handler(Looper.getMainLooper());
        this.glide = glide;
        this.lifecycle = lifecycle;
        this.treeNode = requestManagerTreeNode;
        this.requestTracker = requestTracker;
        this.context = context;
        this.connectivityMonitor = connectivityMonitorFactory.build(context.getApplicationContext(), new RequestManagerConnectivityListener(requestTracker));
        if (Util.isOnBackgroundThread()) {
            this.mainHandler.post(this.addSelfToLifecycle);
        } else {
            lifecycle.addListener(this);
        }
        lifecycle.addListener(this.connectivityMonitor);
        this.defaultRequestListeners = new CopyOnWriteArrayList<>(glide.getGlideContext().getDefaultRequestListeners());
        setRequestOptions(glide.getGlideContext().getDefaultRequestOptions());
        glide.registerRequestManager(this);
    }

    protected synchronized void setRequestOptions(RequestOptions requestOptions) {
        this.requestOptions = requestOptions.mo79clone().autoClone();
    }

    private synchronized void updateRequestOptions(RequestOptions requestOptions) {
        this.requestOptions = this.requestOptions.apply(requestOptions);
    }

    public synchronized RequestManager applyDefaultRequestOptions(RequestOptions requestOptions) {
        updateRequestOptions(requestOptions);
        return this;
    }

    public synchronized RequestManager setDefaultRequestOptions(RequestOptions requestOptions) {
        setRequestOptions(requestOptions);
        return this;
    }

    public RequestManager addDefaultRequestListener(RequestListener<Object> requestListener) {
        this.defaultRequestListeners.add(requestListener);
        return this;
    }

    public synchronized boolean isPaused() {
        return this.requestTracker.isPaused();
    }

    public synchronized void pauseRequests() {
        this.requestTracker.pauseRequests();
    }

    public synchronized void pauseAllRequests() {
        this.requestTracker.pauseAllRequests();
    }

    public synchronized void pauseRequestsRecursive() {
        pauseRequests();
        Iterator<RequestManager> it = this.treeNode.getDescendants().iterator();
        while (it.hasNext()) {
            it.next().pauseRequests();
        }
    }

    public synchronized void resumeRequests() {
        this.requestTracker.resumeRequests();
    }

    public synchronized void resumeRequestsRecursive() {
        Util.assertMainThread();
        resumeRequests();
        Iterator<RequestManager> it = this.treeNode.getDescendants().iterator();
        while (it.hasNext()) {
            it.next().resumeRequests();
        }
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public synchronized void onStart() {
        resumeRequests();
        this.targetTracker.onStart();
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public synchronized void onStop() {
        pauseRequests();
        this.targetTracker.onStop();
    }

    @Override // com.bumptech.glide.manager.LifecycleListener
    public synchronized void onDestroy() {
        this.targetTracker.onDestroy();
        Iterator<Target<?>> it = this.targetTracker.getAll().iterator();
        while (it.hasNext()) {
            clear(it.next());
        }
        this.targetTracker.clear();
        this.requestTracker.clearRequests();
        this.lifecycle.removeListener(this);
        this.lifecycle.removeListener(this.connectivityMonitor);
        this.mainHandler.removeCallbacks(this.addSelfToLifecycle);
        this.glide.unregisterRequestManager(this);
    }

    public RequestBuilder<Bitmap> asBitmap() {
        return m10as(Bitmap.class).apply((BaseRequestOptions<?>) DECODE_TYPE_BITMAP);
    }

    public RequestBuilder<GifDrawable> asGif() {
        return m10as(GifDrawable.class).apply((BaseRequestOptions<?>) DECODE_TYPE_GIF);
    }

    public RequestBuilder<Drawable> asDrawable() {
        return m10as(Drawable.class);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.ModelTypes
    public RequestBuilder<Drawable> load(Bitmap bitmap) {
        return asDrawable().load(bitmap);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.ModelTypes
    public RequestBuilder<Drawable> load(Drawable drawable) {
        return asDrawable().load(drawable);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.ModelTypes
    public RequestBuilder<Drawable> load(String str) {
        return asDrawable().load(str);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.ModelTypes
    public RequestBuilder<Drawable> load(Uri uri) {
        return asDrawable().load(uri);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.ModelTypes
    public RequestBuilder<Drawable> load(File file) {
        return asDrawable().load(file);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.ModelTypes
    public RequestBuilder<Drawable> load(Integer num) {
        return asDrawable().load(num);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.ModelTypes
    @Deprecated
    public RequestBuilder<Drawable> load(URL url) {
        return asDrawable().load(url);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.ModelTypes
    public RequestBuilder<Drawable> load(byte[] bArr) {
        return asDrawable().load(bArr);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.bumptech.glide.ModelTypes
    public RequestBuilder<Drawable> load(Object obj) {
        return asDrawable().load(obj);
    }

    public RequestBuilder<File> downloadOnly() {
        return m10as(File.class).apply((BaseRequestOptions<?>) DOWNLOAD_ONLY_OPTIONS);
    }

    public RequestBuilder<File> download(Object obj) {
        return downloadOnly().load(obj);
    }

    public RequestBuilder<File> asFile() {
        return m10as(File.class).apply((BaseRequestOptions<?>) RequestOptions.skipMemoryCacheOf(true));
    }

    /* renamed from: as */
    public <ResourceType> RequestBuilder<ResourceType> m10as(Class<ResourceType> cls) {
        return new RequestBuilder<>(this.glide, this, cls, this.context);
    }

    public void clear(View view) {
        clear(new ClearTarget(view));
    }

    public synchronized void clear(Target<?> target) {
        if (target == null) {
            return;
        }
        untrackOrDelegate(target);
    }

    private void untrackOrDelegate(Target<?> target) {
        if (untrack(target) || this.glide.removeFromManagers(target) || target.getRequest() == null) {
            return;
        }
        Request request = target.getRequest();
        target.setRequest(null);
        request.clear();
    }

    synchronized boolean untrack(Target<?> target) {
        Request request = target.getRequest();
        if (request == null) {
            return true;
        }
        if (!this.requestTracker.clearRemoveAndRecycle(request)) {
            return false;
        }
        this.targetTracker.untrack(target);
        target.setRequest(null);
        return true;
    }

    synchronized void track(Target<?> target, Request request) {
        this.targetTracker.track(target);
        this.requestTracker.runRequest(request);
    }

    List<RequestListener<Object>> getDefaultRequestListeners() {
        return this.defaultRequestListeners;
    }

    synchronized RequestOptions getDefaultRequestOptions() {
        return this.requestOptions;
    }

    <T> TransitionOptions<?, T> getDefaultTransitionOptions(Class<T> cls) {
        return this.glide.getGlideContext().getDefaultTransitionOptions(cls);
    }

    public synchronized String toString() {
        return super.toString() + "{tracker=" + this.requestTracker + ", treeNode=" + this.treeNode + "}";
    }

    private class RequestManagerConnectivityListener implements ConnectivityMonitor.ConnectivityListener {
        private final RequestTracker requestTracker;

        RequestManagerConnectivityListener(RequestTracker requestTracker) {
            this.requestTracker = requestTracker;
        }

        @Override // com.bumptech.glide.manager.ConnectivityMonitor.ConnectivityListener
        public void onConnectivityChanged(boolean z) {
            if (z) {
                synchronized (RequestManager.this) {
                    this.requestTracker.restartRequests();
                }
            }
        }
    }

    private static class ClearTarget extends ViewTarget<View, Object> {
        @Override // com.bumptech.glide.request.target.Target
        public void onResourceReady(Object obj, Transition<? super Object> transition) {
        }

        ClearTarget(View view) {
            super(view);
        }
    }
}
