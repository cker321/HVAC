package com.yanzhenjie.andserver.http;

import android.text.TextUtils;
import com.yanzhenjie.andserver.util.HttpDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public class Modified implements HttpHeaders {
    private static final Pattern ETAG_PATTERN = Pattern.compile("\\*|\\s*((W\\/)?(\"[^\"]*\"))\\s*,?");
    private boolean isNotModified;
    private HttpRequest mRequest;
    private HttpResponse mResponse;

    public Modified(HttpRequest httpRequest, HttpResponse httpResponse) {
        this.mRequest = httpRequest;
        this.mResponse = httpResponse;
    }

    public boolean process(long j) {
        return process(null, j);
    }

    public boolean process(String str) {
        return process(str, -1L);
    }

    public boolean process(String str, long j) {
        boolean z = true;
        if (this.isNotModified) {
            return true;
        }
        if (validateIfUnmodifiedSince(j)) {
            if (!this.isNotModified) {
                this.mResponse.setStatus(411);
            }
            return this.isNotModified;
        }
        if (!validateIfNoneMatch(str)) {
            validateIfModifiedSince(j);
        }
        HttpMethod method = this.mRequest.getMethod();
        if (method != HttpMethod.GET && method != HttpMethod.HEAD) {
            z = false;
        }
        if (this.isNotModified) {
            this.mResponse.setStatus(z ? 304 : 411);
        }
        if (z) {
            if (j > 0 && this.mResponse.getHeader("Last-Modified") == null) {
                this.mResponse.setDateHeader("Last-Modified", j);
            }
            if (!TextUtils.isEmpty(str) && this.mResponse.getHeader("ETag") == null) {
                this.mResponse.setHeader("ETag", padETagIfNecessary(str));
            }
            this.mResponse.setHeader("Cache-Control", "private");
        }
        return this.isNotModified;
    }

    private boolean validateIfNoneMatch(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        List<String> headers = this.mRequest.getHeaders("If-None-Match");
        if (headers.isEmpty()) {
            return false;
        }
        String strPadETagIfNecessary = padETagIfNecessary(str);
        Iterator<String> it = headers.iterator();
        while (it.hasNext()) {
            Matcher matcher = ETAG_PATTERN.matcher(it.next());
            while (true) {
                if (!matcher.find()) {
                    break;
                }
                if (!TextUtils.isEmpty(matcher.group()) && strPadETagIfNecessary.replaceFirst("^W/", "").equals(matcher.group(3))) {
                    this.isNotModified = true;
                    break;
                }
            }
        }
        return true;
    }

    private String padETagIfNecessary(String str) {
        if (TextUtils.isEmpty(str)) {
            return str;
        }
        if ((str.startsWith("\"") || str.startsWith("W/\"")) && str.endsWith("\"")) {
            return str;
        }
        return "\"" + str + "\"";
    }

    private boolean validateIfModifiedSince(long j) {
        if (j < 0) {
            return false;
        }
        long dateHeader = parseDateHeader("If-Modified-Since");
        if (dateHeader == -1) {
            return false;
        }
        this.isNotModified = dateHeader >= j;
        return true;
    }

    private boolean validateIfUnmodifiedSince(long j) {
        if (j < 0) {
            return false;
        }
        long dateHeader = parseDateHeader("If-Unmodified-Since");
        if (dateHeader == -1) {
            return false;
        }
        this.isNotModified = dateHeader >= j;
        return true;
    }

    private long parseDateHeader(String str) {
        int iIndexOf;
        try {
            return this.mRequest.getDateHeader(str);
        } catch (IllegalStateException unused) {
            String header = this.mRequest.getHeader(str);
            if (TextUtils.isEmpty(header) || (iIndexOf = header.indexOf(59)) == -1) {
                return -1L;
            }
            return parseDateValue(header.substring(0, iIndexOf));
        }
    }

    private long parseDateValue(String str) {
        if (str != null && str.length() >= 3) {
            return HttpDateFormat.parseDate(str);
        }
        return -1L;
    }
}
