package com.ihsanbal.logging;

/* renamed from: com.ihsanbal.logging.I */
/* loaded from: classes.dex */
class C0643I {
    private static String[] prefix = {". ", " ."};
    private static int index = 0;

    protected C0643I() {
        throw new UnsupportedOperationException();
    }

    static void log(int i, String str, String str2, boolean z) {
        String finalTag = getFinalTag(str, z);
        if (z) {
            str = finalTag;
        }
        java.util.logging.Logger logger = java.util.logging.Logger.getLogger(str);
        if (i == 4) {
            logger.log(java.util.logging.Level.INFO, str2);
        } else {
            logger.log(java.util.logging.Level.WARNING, str2);
        }
    }

    private static String getFinalTag(String str, boolean z) {
        if (!z) {
            return str;
        }
        index ^= 1;
        return prefix[index] + str;
    }
}
