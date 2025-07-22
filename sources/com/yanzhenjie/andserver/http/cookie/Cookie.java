package com.yanzhenjie.andserver.http.cookie;

import android.text.TextUtils;
import java.io.Serializable;
import java.util.Locale;

/* loaded from: classes.dex */
public class Cookie implements Cloneable, Serializable {
    private static final String TSPECIALS = "/()<>@,;:\\\"[]?={} \t";
    private String comment;
    private String domain;
    private String name;
    private String path;
    private boolean secure;
    private String value;
    private int maxAge = -1;
    private int version = 0;
    private boolean isHttpOnly = false;

    public Cookie(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("The name of the cookie cannot be empty or null.");
        }
        if (!isToken(str) || str.equalsIgnoreCase("Comment") || str.equalsIgnoreCase("Discard") || str.equalsIgnoreCase("Domain") || str.equalsIgnoreCase("Expires") || str.equalsIgnoreCase("Max-Age") || str.equalsIgnoreCase("Path") || str.equalsIgnoreCase("Secure") || str.equalsIgnoreCase("Version") || str.startsWith("$")) {
            throw new IllegalArgumentException(String.format("This name [%1$s] is a reserved character.", str));
        }
        this.name = str;
        this.value = str2;
    }

    public void setComment(String str) {
        this.comment = str;
    }

    public String getComment() {
        return this.comment;
    }

    public void setDomain(String str) {
        if (!TextUtils.isEmpty(str)) {
            this.domain = str.toLowerCase(Locale.ENGLISH);
        } else {
            this.domain = null;
        }
    }

    public String getDomain() {
        return this.domain;
    }

    public void setMaxAge(int i) {
        this.maxAge = i;
    }

    public int getMaxAge() {
        return this.maxAge;
    }

    public void setPath(String str) {
        this.path = str;
    }

    public String getPath() {
        return this.path;
    }

    public void setSecure(boolean z) {
        this.secure = z;
    }

    public boolean getSecure() {
        return this.secure;
    }

    public String getName() {
        return this.name;
    }

    public void setValue(String str) {
        this.value = str;
    }

    public String getValue() {
        return this.value;
    }

    public int getVersion() {
        return this.version;
    }

    public void setVersion(int i) {
        this.version = i;
    }

    private boolean isToken(String str) {
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char cCharAt = str.charAt(i);
            if (cCharAt < ' ' || cCharAt >= 127 || TSPECIALS.indexOf(cCharAt) != -1) {
                return false;
            }
        }
        return true;
    }

    public Object clone() {
        try {
            return super.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public void setHttpOnly(boolean z) {
        this.isHttpOnly = z;
    }

    public boolean isHttpOnly() {
        return this.isHttpOnly;
    }
}
