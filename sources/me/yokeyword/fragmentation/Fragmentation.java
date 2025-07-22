package me.yokeyword.fragmentation;

import me.yokeyword.fragmentation.helper.ExceptionHandler;

/* loaded from: classes.dex */
public class Fragmentation {
    public static final int BUBBLE = 2;
    static volatile Fragmentation INSTANCE = null;
    public static final int NONE = 0;
    public static final int SHAKE = 1;
    private boolean debug;
    private ExceptionHandler handler;
    private int mode;

    public static Fragmentation getDefault() {
        if (INSTANCE == null) {
            synchronized (Fragmentation.class) {
                if (INSTANCE == null) {
                    INSTANCE = new Fragmentation(new FragmentationBuilder());
                }
            }
        }
        return INSTANCE;
    }

    Fragmentation(FragmentationBuilder fragmentationBuilder) {
        this.mode = 2;
        boolean z = fragmentationBuilder.debug;
        this.debug = z;
        if (!z) {
            this.mode = 0;
        } else {
            this.mode = fragmentationBuilder.mode;
        }
        this.handler = fragmentationBuilder.handler;
    }

    public boolean isDebug() {
        return this.debug;
    }

    public void setDebug(boolean z) {
        this.debug = z;
    }

    public ExceptionHandler getHandler() {
        return this.handler;
    }

    public void setHandler(ExceptionHandler exceptionHandler) {
        this.handler = exceptionHandler;
    }

    public int getMode() {
        return this.mode;
    }

    public void setMode(int i) {
        this.mode = i;
    }

    public static FragmentationBuilder builder() {
        return new FragmentationBuilder();
    }

    public static class FragmentationBuilder {
        private boolean debug;
        private ExceptionHandler handler;
        private int mode;

        public FragmentationBuilder debug(boolean z) {
            this.debug = z;
            return this;
        }

        public FragmentationBuilder stackViewMode(int i) {
            this.mode = i;
            return this;
        }

        public FragmentationBuilder handleException(ExceptionHandler exceptionHandler) {
            this.handler = exceptionHandler;
            return this;
        }

        public Fragmentation install() {
            Fragmentation.INSTANCE = new Fragmentation(this);
            return Fragmentation.INSTANCE;
        }
    }
}
