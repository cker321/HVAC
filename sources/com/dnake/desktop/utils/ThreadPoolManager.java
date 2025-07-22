package com.dnake.desktop.utils;

import androidx.appcompat.widget.ActivityChooserView;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public class ThreadPoolManager {
    private static final int CORE_POOL_SIZE;
    private static final int CPU_COUNT;
    private static final int MAXIMUM_POOL_SIZE;
    private static final String TAG = ThreadPoolManager.class.getSimpleName();
    private static ThreadPoolExecutor cachedThreadPool;
    private static ThreadPoolExecutor fixedThreadPool;
    private static ThreadPoolManager instance;
    private ExecutorService executorService;
    private Map<String, ExecutorService> executorServiceMap = new ConcurrentHashMap();
    private Map<String, ScheduledExecutorService> scheduledExecutorServiceMap = new ConcurrentHashMap();
    private PriorityThreadFactory priorityThreadFactory = new PriorityThreadFactory(TAG, 10);

    static {
        int iAvailableProcessors = Runtime.getRuntime().availableProcessors();
        CPU_COUNT = iAvailableProcessors;
        CORE_POOL_SIZE = iAvailableProcessors + 1;
        MAXIMUM_POOL_SIZE = (iAvailableProcessors * 2) + 1;
    }

    private ThreadPoolManager() {
        fixedThreadPool = new ThreadPoolExecutor(CORE_POOL_SIZE, MAXIMUM_POOL_SIZE, 0L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
        cachedThreadPool = new ThreadPoolExecutor(0, ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED, 60L, TimeUnit.SECONDS, new SynchronousQueue());
    }

    public static synchronized ThreadPoolManager getInstance() {
        if (instance == null) {
            instance = new ThreadPoolManager();
        }
        return instance;
    }

    public void removeSingleFixJob(String str) {
        if (this.executorServiceMap.containsKey(str)) {
            ((ExecutorService) Objects.requireNonNull(this.executorServiceMap.get(str))).shutdownNow();
            ((ExecutorService) Objects.requireNonNull(this.executorServiceMap.get(str))).shutdown();
            this.executorServiceMap.remove(str);
        }
    }

    public Future submitSingleFixJob(Runnable runnable, String str, int i) {
        this.priorityThreadFactory.setName(runnable.getClass(), str);
        this.priorityThreadFactory.setPriority(i);
        if (!this.executorServiceMap.containsKey(str)) {
            ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor(this.priorityThreadFactory);
            this.executorService = executorServiceNewSingleThreadExecutor;
            this.executorServiceMap.put(str, executorServiceNewSingleThreadExecutor);
        } else {
            this.executorService = this.executorServiceMap.get(str);
            removeSingleFixJob(str);
        }
        return this.executorService.submit(runnable);
    }

    public Future submitSingleFixJob(Callable<?> callable, String str, int i) {
        this.priorityThreadFactory.setName(callable.getClass(), str);
        this.priorityThreadFactory.setPriority(i);
        if (!this.executorServiceMap.containsKey(str)) {
            ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor(this.priorityThreadFactory);
            this.executorService = executorServiceNewSingleThreadExecutor;
            this.executorServiceMap.put(str, executorServiceNewSingleThreadExecutor);
        } else {
            this.executorService = this.executorServiceMap.get(str);
            removeSingleFixJob(str);
        }
        return this.executorService.submit(callable);
    }

    public boolean removeFixJob(Runnable runnable) {
        return fixedThreadPool.remove(runnable);
    }

    public Future submitFixJob(Runnable runnable, String str, int i) {
        this.priorityThreadFactory.setName(runnable.getClass(), str);
        this.priorityThreadFactory.setPriority(i);
        fixedThreadPool.setThreadFactory(this.priorityThreadFactory);
        return fixedThreadPool.submit(runnable);
    }

    public boolean removeJob(Runnable runnable) {
        return cachedThreadPool.remove(runnable);
    }

    public Future submitJob(Runnable runnable, int i, String str) {
        this.priorityThreadFactory.setName(runnable.getClass(), str);
        this.priorityThreadFactory.setPriority(i);
        cachedThreadPool.setThreadFactory(this.priorityThreadFactory);
        return cachedThreadPool.submit(runnable);
    }

    public Future submitJob(Callable<?> callable, int i, String str) {
        this.priorityThreadFactory.setName(str);
        this.priorityThreadFactory.setPriority(i);
        cachedThreadPool.setThreadFactory(this.priorityThreadFactory);
        return cachedThreadPool.submit(callable);
    }

    public Future submitSingleJob(Runnable runnable, String str, int i, String str2) {
        this.priorityThreadFactory.setName(runnable.getClass(), str2);
        this.priorityThreadFactory.setPriority(i);
        if (!this.executorServiceMap.containsKey(str)) {
            ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor(this.priorityThreadFactory);
            this.executorService = executorServiceNewSingleThreadExecutor;
            this.executorServiceMap.put(str, executorServiceNewSingleThreadExecutor);
        } else {
            this.executorService = this.executorServiceMap.get(str);
        }
        return ((ExecutorService) Objects.requireNonNull(this.executorService)).submit(runnable);
    }

    public Future submitSingleJob(Callable<?> callable, String str, int i, String str2) {
        this.priorityThreadFactory.setName(str, str2);
        this.priorityThreadFactory.setPriority(i);
        if (!this.executorServiceMap.containsKey(str)) {
            ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor(this.priorityThreadFactory);
            this.executorService = executorServiceNewSingleThreadExecutor;
            this.executorServiceMap.put(str, executorServiceNewSingleThreadExecutor);
        } else {
            this.executorService = this.executorServiceMap.get(str);
        }
        return ((ExecutorService) Objects.requireNonNull(this.executorService)).submit(callable);
    }

    public Future submitScheduleJob(Runnable runnable, int i, String str, long j, long j2, TimeUnit timeUnit, String str2) {
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool;
        this.priorityThreadFactory.setName(str, str2);
        this.priorityThreadFactory.setPriority(i);
        if (!this.scheduledExecutorServiceMap.containsKey(str)) {
            scheduledExecutorServiceNewScheduledThreadPool = Executors.newScheduledThreadPool(CORE_POOL_SIZE, this.priorityThreadFactory);
            this.scheduledExecutorServiceMap.put(str, scheduledExecutorServiceNewScheduledThreadPool);
        } else {
            scheduledExecutorServiceNewScheduledThreadPool = this.scheduledExecutorServiceMap.get(str);
        }
        return ((ScheduledExecutorService) Objects.requireNonNull(scheduledExecutorServiceNewScheduledThreadPool)).scheduleAtFixedRate(runnable, j, j2, timeUnit);
    }

    public Future submitScheduleWithFixedDealyJob(Runnable runnable, int i, String str, long j, long j2, TimeUnit timeUnit, String str2) {
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool;
        this.priorityThreadFactory.setName(str, str2);
        this.priorityThreadFactory.setPriority(i);
        if (!this.scheduledExecutorServiceMap.containsKey(str)) {
            scheduledExecutorServiceNewScheduledThreadPool = Executors.newScheduledThreadPool(CORE_POOL_SIZE, this.priorityThreadFactory);
            this.scheduledExecutorServiceMap.put(str, scheduledExecutorServiceNewScheduledThreadPool);
        } else {
            scheduledExecutorServiceNewScheduledThreadPool = this.scheduledExecutorServiceMap.get(str);
        }
        return ((ScheduledExecutorService) Objects.requireNonNull(scheduledExecutorServiceNewScheduledThreadPool)).scheduleWithFixedDelay(runnable, j, j2, timeUnit);
    }

    public void removeScheduleJob(String str) {
        if (this.scheduledExecutorServiceMap.containsKey(str)) {
            ScheduledExecutorService scheduledExecutorService = this.scheduledExecutorServiceMap.get(str);
            ((ScheduledExecutorService) Objects.requireNonNull(scheduledExecutorService)).shutdown();
            scheduledExecutorService.shutdownNow();
            this.scheduledExecutorServiceMap.remove(str);
        }
    }

    public void removeAllScheduleJob() {
        Iterator<String> it = this.scheduledExecutorServiceMap.keySet().iterator();
        while (it.hasNext()) {
            removeScheduleJob(it.next());
        }
    }
}
