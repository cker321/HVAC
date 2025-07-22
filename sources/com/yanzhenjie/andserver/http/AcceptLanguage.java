package com.yanzhenjie.andserver.http;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/* loaded from: classes.dex */
public class AcceptLanguage {
    private final Locale locale;
    private final double quality;

    protected AcceptLanguage(Locale locale, double d) {
        this.locale = locale;
        this.quality = d;
    }

    public Locale getLocale() {
        return this.locale;
    }

    public double getQuality() {
        return this.quality;
    }

    public static List<AcceptLanguage> parse(String str) {
        if (TextUtils.isEmpty(str)) {
            return Collections.emptyList();
        }
        String[] strArrSplit = str.split(",");
        if (strArrSplit.length == 0) {
            return Collections.emptyList();
        }
        ArrayList arrayList = new ArrayList();
        for (String str2 : strArrSplit) {
            String[] strArrSplit2 = str2.split(";");
            if (strArrSplit2.length == 2 && strArrSplit2[1].length() > 2 && strArrSplit2[1].charAt(0) == 'q' && strArrSplit2[1].charAt(1) == '=') {
                try {
                    arrayList.add(new AcceptLanguage(new Locale(strArrSplit2[1]), Double.parseDouble(strArrSplit2[1].substring(2))));
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
        }
        return arrayList;
    }
}
