package com.dnake.desktop.dnake;

import android.util.Log;
import com.dnake.desktop.dnake.v700.dmsg;
import com.dnake.desktop.dnake.v700.ioctl;
import com.dnake.desktop.dnake.v700.vt_uart;
import com.dnake.desktop.utils.Rs485Utils;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/* loaded from: classes.dex */
public class Rs485Executor {
    private static final int DEFAULT_INTERVAL_TIME = 300;
    private Lock lock = new ReentrantLock(true);
    private static final Rs485Executor ourInstance = new Rs485Executor();
    private static final String TAG = Rs485Executor.class.getSimpleName();

    public static Rs485Executor getInstance() {
        return ourInstance;
    }

    private Rs485Executor() {
    }

    public void setup() {
        dmsg.start("/exApp");
        vt_uart.start();
        vt_uart.setup(0, 3);
        ioctl.hooter(0);
    }

    public void updateParam(int i, int i2) throws InterruptedException {
        int i3 = 1;
        if (i != 101) {
            if (i == 110) {
                i3 = 0;
            } else if (i == 111) {
                i3 = 2;
            }
        }
        int i4 = 3;
        if (i2 != 9600 && i2 == 19200) {
            i4 = 4;
        }
        Log.i(TAG, "更新校验:" + i3 + ",更新波特率:" + i4);
        vt_uart.setup(i3, i4);
        try {
            Thread.sleep(1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public byte[] write(byte[] bArr, int i) throws InterruptedException {
        byte[] bArrM12rx;
        try {
            this.lock.lock();
            if (bArr != null) {
                TimeUnit.MILLISECONDS.sleep(300L);
                Log.d(TAG, "Send:" + Rs485Utils.getInstance().hexToString(bArr));
                bArrM12rx = vt_uart.m12rx(bArr, getReceiveLen(bArr), i);
                Log.d(TAG, "Receive:" + Rs485Utils.getInstance().hexToString(bArrM12rx));
            } else {
                bArrM12rx = null;
            }
            return bArrM12rx;
        } finally {
            this.lock.unlock();
        }
    }

    public int getReceiveLen(byte[] bArr) {
        int i;
        byte b = bArr[1];
        int iGetShortAt = GetShortAt(bArr, 4);
        if (b != 1) {
            if (b == 6 || b == 16) {
                return 8;
            }
            if (b != 3 && b != 4) {
                return 0;
            }
            i = iGetShortAt * 2;
        } else {
            if (iGetShortAt % 8 != 0) {
                return (iGetShortAt / 8) + 5 + 1;
            }
            i = iGetShortAt / 8;
        }
        return i + 5;
    }

    public int GetShortAt(byte[] bArr, int i) {
        byte b = bArr[i];
        return (b << 8) + (bArr[i + 1] & 255);
    }
}
