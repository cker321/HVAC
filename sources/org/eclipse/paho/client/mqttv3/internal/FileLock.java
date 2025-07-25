package org.eclipse.paho.client.mqttv3.internal;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.lang.reflect.InvocationTargetException;

/* loaded from: classes.dex */
public class FileLock {
    private RandomAccessFile file;
    private Object fileLock;
    private File lockFile;

    public FileLock(File file, String str) throws Exception {
        this.lockFile = new File(file, str);
        if (ExceptionHelper.isClassAvailable("java.nio.channels.FileLock")) {
            try {
                RandomAccessFile randomAccessFile = new RandomAccessFile(this.lockFile, "rw");
                this.file = randomAccessFile;
                Object objInvoke = randomAccessFile.getClass().getMethod("getChannel", new Class[0]).invoke(this.file, new Object[0]);
                this.fileLock = objInvoke.getClass().getMethod("tryLock", new Class[0]).invoke(objInvoke, new Object[0]);
            } catch (IllegalAccessException unused) {
                this.fileLock = null;
            } catch (IllegalArgumentException unused2) {
                this.fileLock = null;
            } catch (NoSuchMethodException unused3) {
                this.fileLock = null;
            }
            if (this.fileLock != null) {
                return;
            }
            release();
            throw new Exception("Problem obtaining file lock");
        }
    }

    public void release() throws IllegalAccessException, IOException, IllegalArgumentException, InvocationTargetException {
        try {
            if (this.fileLock != null) {
                this.fileLock.getClass().getMethod("release", new Class[0]).invoke(this.fileLock, new Object[0]);
                this.fileLock = null;
            }
        } catch (Exception unused) {
        }
        RandomAccessFile randomAccessFile = this.file;
        if (randomAccessFile != null) {
            try {
                randomAccessFile.close();
            } catch (IOException unused2) {
            }
            this.file = null;
        }
        File file = this.lockFile;
        if (file != null && file.exists()) {
            this.lockFile.delete();
        }
        this.lockFile = null;
    }
}
