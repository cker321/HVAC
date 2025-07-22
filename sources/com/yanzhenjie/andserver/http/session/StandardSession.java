package com.yanzhenjie.andserver.http.session;

import android.text.TextUtils;
import com.yanzhenjie.andserver.util.Assert;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes.dex */
public class StandardSession implements Session {
    private static final String[] EMPTY_ARRAY = new String[0];
    private long createdTime;

    /* renamed from: id */
    private String f155id;
    private boolean isNew;
    private boolean isValid;
    private long lastAccessedTime;
    private int maxInactiveInterval = -1;
    private Map<String, Object> mAttributes = new ConcurrentHashMap();

    public void setId(String str) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("The id can not be empty or null.");
        }
        this.f155id = str;
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public String getId() {
        return this.f155id;
    }

    public void setCreatedTime(long j) {
        this.createdTime = j;
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public long getCreatedTime() {
        return this.createdTime;
    }

    public void setLastAccessedTime(long j) {
        this.lastAccessedTime = j;
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public long getLastAccessedTime() {
        validate();
        return this.lastAccessedTime;
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public void setMaxInactiveInterval(int i) {
        this.maxInactiveInterval = i;
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public int getMaxInactiveInterval() {
        return this.maxInactiveInterval;
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public Object getAttribute(String str) {
        validate();
        if (str == null) {
            return null;
        }
        return this.mAttributes.get(str);
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public Enumeration<String> getAttributeNames() {
        validate();
        return Collections.enumeration(new HashSet(this.mAttributes.keySet()));
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public void setAttribute(String str, Object obj) {
        validate();
        Assert.notNull(str, "The name cannot be null.");
        if (obj == null) {
            return;
        }
        this.mAttributes.put(str, obj);
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public void removeAttribute(String str) {
        validate();
        if (str == null) {
            return;
        }
        this.mAttributes.remove(str);
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public void invalidate() {
        validate();
        this.isValid = false;
    }

    public void setNew(boolean z) {
        this.isNew = z;
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public boolean isNew() {
        validate();
        return this.isNew;
    }

    private void validate() {
        if (!isValid()) {
            throw new IllegalStateException("This session is invalid.");
        }
    }

    public void setValid(boolean z) {
        this.isValid = z;
    }

    @Override // com.yanzhenjie.andserver.http.session.Session
    public boolean isValid() {
        if (!this.isValid) {
            return false;
        }
        if (this.maxInactiveInterval > 0) {
            if (((int) ((System.currentTimeMillis() - this.lastAccessedTime) / 1000)) >= this.maxInactiveInterval) {
                this.isValid = false;
            }
        } else {
            this.isValid = true;
        }
        return this.isValid;
    }

    public void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.writeObject(this.f155id);
        objectOutputStream.writeLong(this.createdTime);
        objectOutputStream.writeLong(this.lastAccessedTime);
        objectOutputStream.writeInt(this.maxInactiveInterval);
        objectOutputStream.writeBoolean(this.isNew);
        objectOutputStream.writeBoolean(this.isValid);
        objectOutputStream.writeInt(this.mAttributes.size());
        for (String str : (String[]) this.mAttributes.keySet().toArray(EMPTY_ARRAY)) {
            Object obj = this.mAttributes.get(str);
            if (obj != null && (obj instanceof Serializable)) {
                objectOutputStream.writeObject(str);
                objectOutputStream.writeObject(obj);
            }
        }
    }

    public void readObject(ObjectInputStream objectInputStream) throws IOException, ClassNotFoundException {
        this.f155id = (String) objectInputStream.readObject();
        this.createdTime = objectInputStream.readLong();
        this.lastAccessedTime = objectInputStream.readLong();
        this.maxInactiveInterval = objectInputStream.readInt();
        this.isNew = objectInputStream.readBoolean();
        this.isValid = objectInputStream.readBoolean();
        int i = objectInputStream.readInt();
        for (int i2 = 0; i2 < i; i2++) {
            this.mAttributes.put((String) objectInputStream.readObject(), objectInputStream.readObject());
        }
    }
}
