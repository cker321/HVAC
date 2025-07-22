package com.dnake.desktop.utils;

import android.os.Process;
import java.util.concurrent.ThreadFactory;

/* loaded from: classes.dex */
class PriorityThreadFactory implements ThreadFactory {
    private String name;
    private int priority;

    PriorityThreadFactory(String str, int i) {
        this.name = str;
        this.priority = i;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    void setName(Class<?> cls, String str) {
        this.name = cls.getSimpleName() + "-" + str;
    }

    void setName(String str, String str2) {
        this.name = str + "-" + str2;
    }

    public int getPriority() {
        return this.priority;
    }

    void setPriority(int i) {
        this.priority = i;
    }

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(Runnable runnable) {
        return new Thread(runnable, this.name) { // from class: com.dnake.desktop.utils.PriorityThreadFactory.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() throws SecurityException, IllegalArgumentException {
                Process.setThreadPriority(PriorityThreadFactory.this.priority);
                super.run();
            }
        };
    }
}
