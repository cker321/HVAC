package com.yanzhenjie.andserver.error;

/* loaded from: classes.dex */
public class MaxUploadSizeExceededException extends BasicException {
    private final long mMaxSize;

    public MaxUploadSizeExceededException(long j) {
        this(j, null);
    }

    public MaxUploadSizeExceededException(long j, Throwable th) {
        super(413, "Maximum upload size of " + j + " bytes exceeded", th);
        this.mMaxSize = j;
    }

    public long getMaxSize() {
        return this.mMaxSize;
    }
}
