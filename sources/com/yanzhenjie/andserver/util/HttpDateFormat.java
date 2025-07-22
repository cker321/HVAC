package com.yanzhenjie.andserver.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: classes.dex */
public final class HttpDateFormat {
    private static final SimpleDateFormat FORMAT;
    private static final SimpleDateFormat[] FORMATS_TEMPLATE = {new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz", Locale.US), new SimpleDateFormat("EEEEEE, dd-MMM-yy HH:mm:ss zzz", Locale.US), new SimpleDateFormat("EEE MMMM d HH:mm:ss yyyy", Locale.US)};
    private static final TimeZone GMT_ZONE = TimeZone.getTimeZone("GMT");
    private static final String RFC1123_DATE = "EEE, dd MMM yyyy HH:mm:ss zzz";

    static {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz", Locale.US);
        FORMAT = simpleDateFormat;
        simpleDateFormat.setTimeZone(GMT_ZONE);
    }

    public static String getCurrentDate() {
        String str;
        synchronized (FORMAT) {
            str = FORMAT.format(new Date(System.currentTimeMillis()));
        }
        return str;
    }

    public static String formatDate(long j) {
        String str;
        synchronized (HttpDateFormat.class) {
            str = FORMAT.format(new Date(j));
        }
        return str;
    }

    public static long parseDate(String str) {
        Date date = null;
        for (SimpleDateFormat simpleDateFormat : FORMATS_TEMPLATE) {
            try {
                date = simpleDateFormat.parse(str);
            } catch (ParseException unused) {
            }
        }
        if (date == null) {
            return -1L;
        }
        return date.getTime();
    }
}
