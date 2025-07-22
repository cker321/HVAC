package com.yanzhenjie.andserver.framework.website;

import android.text.TextUtils;
import com.yanzhenjie.andserver.error.NotFoundException;
import com.yanzhenjie.andserver.framework.body.FileBody;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.ResponseBody;
import com.yanzhenjie.andserver.util.Assert;
import com.yanzhenjie.andserver.util.DigestUtils;
import com.yanzhenjie.andserver.util.Patterns;
import java.io.File;
import java.io.IOException;
import org.eclipse.paho.client.mqttv3.MqttTopic;

/* loaded from: classes.dex */
public class StorageWebsite extends BasicWebsite implements Patterns {
    private final String mRootPath;

    public StorageWebsite(String str) {
        this(str, BasicWebsite.DEFAULT_INDEX);
    }

    public StorageWebsite(String str, String str2) {
        super(str2);
        Assert.isTrue(!TextUtils.isEmpty(str), "The rootPath cannot be empty.");
        Assert.isTrue(str.matches(PATH), "The format of [%s] is wrong, it should be like [/root/project].");
        this.mRootPath = str;
    }

    @Override // com.yanzhenjie.andserver.framework.handler.HandlerAdapter
    public boolean intercept(HttpRequest httpRequest) {
        return findPathResource(httpRequest.getPath()) != null;
    }

    private File findPathResource(String str) {
        if (MqttTopic.TOPIC_LEVEL_SEPARATOR.equals(str)) {
            File file = new File(this.mRootPath, getIndexFileName());
            if (file.exists() && file.isFile()) {
                return file;
            }
            return null;
        }
        File file2 = new File(this.mRootPath, str);
        if (!file2.exists()) {
            return null;
        }
        if (file2.isFile()) {
            return file2;
        }
        File file3 = new File(file2, getIndexFileName());
        if (file3.exists() && file3.isFile()) {
            return file3;
        }
        return null;
    }

    @Override // com.yanzhenjie.andserver.framework.website.BasicWebsite, com.yanzhenjie.andserver.framework.website.Website, com.yanzhenjie.andserver.framework.ETag
    public String getETag(HttpRequest httpRequest) throws Throwable {
        File fileFindPathResource = findPathResource(httpRequest.getPath());
        if (fileFindPathResource == null) {
            return null;
        }
        return DigestUtils.md5DigestAsHex(fileFindPathResource.getAbsolutePath() + fileFindPathResource.lastModified());
    }

    @Override // com.yanzhenjie.andserver.framework.website.BasicWebsite, com.yanzhenjie.andserver.framework.website.Website, com.yanzhenjie.andserver.framework.LastModified
    public long getLastModified(HttpRequest httpRequest) throws Throwable {
        File fileFindPathResource = findPathResource(httpRequest.getPath());
        if (fileFindPathResource != null) {
            return fileFindPathResource.lastModified();
        }
        return -1L;
    }

    @Override // com.yanzhenjie.andserver.framework.website.Website
    public ResponseBody getBody(HttpRequest httpRequest) throws IOException {
        String path = httpRequest.getPath();
        File fileFindPathResource = findPathResource(path);
        if (fileFindPathResource == null) {
            throw new NotFoundException(path);
        }
        return new FileBody(fileFindPathResource);
    }
}
