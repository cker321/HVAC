package com.ihsanbal.logging;

import okhttp3.internal.platform.Platform;

/* loaded from: classes.dex */
public interface Logger {
    public static final Logger DEFAULT = new Logger() { // from class: com.ihsanbal.logging.Logger.1
        @Override // com.ihsanbal.logging.Logger
        public void log(int i, String str, String str2) {
            Platform.get().log(i, str2, null);
        }
    };

    void log(int i, String str, String str2);
}
