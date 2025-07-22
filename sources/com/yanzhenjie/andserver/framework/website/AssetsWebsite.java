package com.yanzhenjie.andserver.framework.website;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.res.AssetManager;
import android.text.TextUtils;
import com.yanzhenjie.andserver.error.NotFoundException;
import com.yanzhenjie.andserver.framework.body.StreamBody;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.ResponseBody;
import com.yanzhenjie.andserver.util.Assert;
import com.yanzhenjie.andserver.util.DigestUtils;
import com.yanzhenjie.andserver.util.MediaType;
import com.yanzhenjie.andserver.util.Patterns;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class AssetsWebsite extends BasicWebsite implements Patterns {
    private boolean isScanned;
    private final PackageInfo mPackageInfo;
    private final Map<String, String> mPatternMap;
    private final AssetsReader mReader;
    private final String mRootPath;

    public AssetsWebsite(Context context, String str) {
        this(context, str, BasicWebsite.DEFAULT_INDEX);
    }

    public AssetsWebsite(Context context, String str, String str2) {
        super(str2);
        Assert.isTrue(!TextUtils.isEmpty(str), "The rootPath cannot be empty.");
        Assert.isTrue(!TextUtils.isEmpty(str2), "The indexFileName cannot be empty.");
        if (!str.matches(PATH)) {
            throw new IllegalArgumentException(String.format("The format of [%s] is wrong, it should be like [/root/project].", str));
        }
        this.mReader = new AssetsReader(context.getAssets());
        this.mRootPath = trimStartSlash(str);
        this.mPatternMap = new HashMap();
        try {
            this.mPackageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override // com.yanzhenjie.andserver.framework.handler.HandlerAdapter
    public boolean intercept(HttpRequest httpRequest) {
        tryScanFile();
        return this.mPatternMap.containsKey(httpRequest.getPath());
    }

    private void tryScanFile() {
        if (this.isScanned) {
            return;
        }
        synchronized (AssetsWebsite.class) {
            if (!this.isScanned) {
                for (String str : this.mReader.scanFile(this.mRootPath)) {
                    String strAddStartSlash = addStartSlash(str.substring(this.mRootPath.length()));
                    this.mPatternMap.put(strAddStartSlash, str);
                    String indexFileName = getIndexFileName();
                    if (strAddStartSlash.endsWith(indexFileName)) {
                        String strAddStartSlash2 = addStartSlash(strAddStartSlash.substring(0, strAddStartSlash.indexOf(indexFileName) - 1));
                        this.mPatternMap.put(strAddStartSlash2, str);
                        this.mPatternMap.put(addEndSlash(strAddStartSlash2), str);
                    }
                }
                this.isScanned = true;
            }
        }
    }

    @Override // com.yanzhenjie.andserver.framework.website.BasicWebsite, com.yanzhenjie.andserver.framework.website.Website, com.yanzhenjie.andserver.framework.ETag
    public String getETag(HttpRequest httpRequest) throws Throwable {
        String path = httpRequest.getPath();
        InputStream inputStream = this.mReader.getInputStream(this.mPatternMap.get(path));
        if (inputStream != null) {
            return DigestUtils.md5DigestAsHex(inputStream);
        }
        throw new NotFoundException(path);
    }

    @Override // com.yanzhenjie.andserver.framework.website.BasicWebsite, com.yanzhenjie.andserver.framework.website.Website, com.yanzhenjie.andserver.framework.LastModified
    public long getLastModified(HttpRequest httpRequest) throws Throwable {
        if (this.mReader.isFile(this.mPatternMap.get(httpRequest.getPath()))) {
            return this.mPackageInfo.lastUpdateTime;
        }
        return -1L;
    }

    @Override // com.yanzhenjie.andserver.framework.website.Website
    public ResponseBody getBody(HttpRequest httpRequest) throws IOException {
        String path = httpRequest.getPath();
        String str = this.mPatternMap.get(path);
        InputStream inputStream = this.mReader.getInputStream(str);
        if (inputStream == null) {
            throw new NotFoundException(path);
        }
        return new StreamBody(inputStream, inputStream.available(), MediaType.getFileMediaType(str));
    }

    public static class AssetsReader {
        private AssetManager mAssetManager;

        public AssetsReader(AssetManager assetManager) {
            this.mAssetManager = assetManager;
        }

        public InputStream getInputStream(String str) {
            try {
                return this.mAssetManager.open(str);
            } catch (Throwable unused) {
                return null;
            }
        }

        public boolean isFile(String str) {
            return getInputStream(str) != null;
        }

        public List<String> list(String str) {
            ArrayList arrayList = new ArrayList();
            try {
                Collections.addAll(arrayList, this.mAssetManager.list(str));
            } catch (Throwable unused) {
            }
            return arrayList;
        }

        public List<String> scanFile(String str) {
            Assert.isTrue(!TextUtils.isEmpty(str), "The path cannot be empty.");
            ArrayList arrayList = new ArrayList();
            if (isFile(str)) {
                arrayList.add(str);
            } else {
                Iterator<String> it = list(str).iterator();
                while (it.hasNext()) {
                    String str2 = str + File.separator + it.next();
                    if (isFile(str2)) {
                        arrayList.add(str2);
                    } else {
                        List<String> listScanFile = scanFile(str2);
                        if (listScanFile.size() > 0) {
                            arrayList.addAll(listScanFile);
                        }
                    }
                }
            }
            return arrayList;
        }
    }
}
