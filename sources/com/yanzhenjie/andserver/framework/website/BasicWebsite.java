package com.yanzhenjie.andserver.framework.website;

import android.text.TextUtils;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.util.Assert;
import java.io.File;

/* loaded from: classes.dex */
public abstract class BasicWebsite extends Website {
    public static final String DEFAULT_INDEX = "index.html";
    private final String mIndexFileName;

    @Override // com.yanzhenjie.andserver.framework.website.Website, com.yanzhenjie.andserver.framework.ETag
    public String getETag(HttpRequest httpRequest) throws Throwable {
        return null;
    }

    @Override // com.yanzhenjie.andserver.framework.website.Website, com.yanzhenjie.andserver.framework.LastModified
    public long getLastModified(HttpRequest httpRequest) throws Throwable {
        return -1L;
    }

    public BasicWebsite() {
        this(DEFAULT_INDEX);
    }

    public BasicWebsite(String str) {
        Assert.isTrue(!TextUtils.isEmpty(str), "The indexFileName cannot be empty.");
        this.mIndexFileName = str;
    }

    protected final String getIndexFileName() {
        return this.mIndexFileName;
    }

    protected String addStartSlash(String str) {
        if (str.startsWith(File.separator)) {
            return str;
        }
        return File.separator + str;
    }

    protected String addEndSlash(String str) {
        if (str.endsWith(File.separator)) {
            return str;
        }
        return str + File.separator;
    }

    protected String trimStartSlash(String str) {
        while (str.startsWith(File.separator)) {
            str = str.substring(1);
        }
        return str;
    }

    protected String trimEndSlash(String str) {
        while (str.endsWith(File.separator)) {
            str = str.substring(0, str.length() - 1);
        }
        return str;
    }

    protected String trimSlash(String str) {
        return trimEndSlash(trimStartSlash(str));
    }
}
