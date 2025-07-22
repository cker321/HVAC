package com.yanzhenjie.andserver.http.session;

import android.text.TextUtils;
import com.yanzhenjie.andserver.util.Assert;
import com.yanzhenjie.andserver.util.IOUtils;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/* loaded from: classes.dex */
public class StandardStore implements Store {
    private File mDirectory;

    public StandardStore(File file) {
        this.mDirectory = file;
    }

    @Override // com.yanzhenjie.andserver.http.session.Store
    public boolean replace(StandardSession standardSession) throws Throwable {
        Assert.notNull(standardSession, "The session can not be null.");
        String id = standardSession.getId();
        if (TextUtils.isEmpty(id)) {
            throw new IllegalStateException("The session id can not be empty or null.");
        }
        ObjectOutputStream objectOutputStream = null;
        try {
            try {
                if (!IOUtils.createFolder(this.mDirectory)) {
                    IOUtils.closeQuietly(null);
                    return false;
                }
                File file = new File(this.mDirectory, id);
                if (!IOUtils.createNewFile(file)) {
                    IOUtils.closeQuietly(null);
                    return false;
                }
                ObjectOutputStream objectOutputStream2 = new ObjectOutputStream(new FileOutputStream(file));
                try {
                    standardSession.writeObject(objectOutputStream2);
                    IOUtils.closeQuietly(objectOutputStream2);
                    return true;
                } catch (IOException e) {
                    e = e;
                    objectOutputStream = objectOutputStream2;
                    IOUtils.delFileOrFolder(new File(this.mDirectory, id));
                    throw e;
                } catch (Throwable th) {
                    th = th;
                    objectOutputStream = objectOutputStream2;
                    IOUtils.closeQuietly(objectOutputStream);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (IOException e2) {
            e = e2;
        }
    }

    /* JADX WARN: Not initialized variable reg: 2, insn: 0x0048: MOVE (r0 I:??[OBJECT, ARRAY]) = (r2 I:??[OBJECT, ARRAY]), block:B:25:0x0048 */
    @Override // com.yanzhenjie.andserver.http.session.Store
    public StandardSession getSession(String str) throws Throwable {
        IOException e;
        Closeable closeable;
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("The id can not be empty or null.");
        }
        Closeable closeable2 = null;
        try {
            try {
                File file = new File(this.mDirectory, str);
                if (file.exists() && !file.isDirectory()) {
                    ObjectInputStream objectInputStream = new ObjectInputStream(new FileInputStream(file));
                    try {
                        StandardSession standardSession = new StandardSession();
                        standardSession.readObject(objectInputStream);
                        IOUtils.closeQuietly(objectInputStream);
                        return standardSession;
                    } catch (IOException e2) {
                        e = e2;
                        IOUtils.delFileOrFolder(new File(this.mDirectory, str));
                        throw e;
                    }
                }
                IOUtils.closeQuietly(null);
                return null;
            } catch (IOException e3) {
                e = e3;
            } catch (Throwable th) {
                th = th;
                IOUtils.closeQuietly(closeable2);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            closeable2 = closeable;
            IOUtils.closeQuietly(closeable2);
            throw th;
        }
    }

    @Override // com.yanzhenjie.andserver.http.session.Store
    public boolean remove(StandardSession standardSession) {
        if (TextUtils.isEmpty(standardSession.getId())) {
            throw new IllegalStateException("The session id can not be empty or null.");
        }
        return IOUtils.delFileOrFolder(new File(this.mDirectory, standardSession.getId()));
    }
}
