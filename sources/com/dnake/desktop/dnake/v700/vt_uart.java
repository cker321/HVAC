package com.dnake.desktop.dnake.v700;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.nio.ByteBuffer;
import java.util.Arrays;

/* loaded from: classes.dex */
public class vt_uart {
    private static final int BUFFER_SIZE = 512;
    private static final int atomicTime = 10;

    /* renamed from: ip */
    private static final String f101ip = "127.0.0.1";
    private static final int rPort = 10061;
    private static final int tPort = 10060;
    private static DatagramSocket uart;
    private static final String TAG = vt_uart.class.getSimpleName();
    private static final ByteBuffer RECEIVE_BUFFER = ByteBuffer.allocate(512);

    public static void start() {
        try {
            uart = new DatagramSocket(rPort);
            new Thread(new vt_uart_thread()).start();
        } catch (SocketException e) {
            e.printStackTrace();
        }
    }

    private static class vt_uart_thread implements Runnable {
        private vt_uart_thread() {
        }

        @Override // java.lang.Runnable
        public void run() throws IOException {
            while (!Thread.interrupted()) {
                try {
                    byte[] bArr = new byte[1024];
                    DatagramPacket datagramPacket = new DatagramPacket(bArr, 1024);
                    Arrays.sort(bArr);
                    vt_uart.uart.receive(datagramPacket);
                    int length = datagramPacket.getLength();
                    synchronized (vt_uart.RECEIVE_BUFFER) {
                        if (length > 0) {
                            byte[] bArr2 = new byte[length];
                            System.arraycopy(datagramPacket.getData(), 0, bArr2, 0, length);
                            if (vt_uart.RECEIVE_BUFFER.remaining() <= length) {
                                vt_uart.RECEIVE_BUFFER.clear();
                            }
                            vt_uart.RECEIVE_BUFFER.put(bArr2);
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void setup(int i, int i2) {
        dmsg dmsgVar = new dmsg();
        dxml dxmlVar = new dxml();
        dxmlVar.setInt("/params/parity", i);
        dxmlVar.setInt("/params/speed", i2);
        dmsgVar.m11to("/control/vt_uart/setup", dxmlVar.toString());
    }

    /* renamed from: tx */
    private static void m13tx(byte[] bArr) throws IOException {
        if (uart != null) {
            try {
                uart.send(new DatagramPacket(bArr, bArr.length, InetAddress.getByName(f101ip), tPort));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001f, code lost:
    
        com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER.flip();
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x002a, code lost:
    
        if (com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER.remaining() < r5) goto L17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x002c, code lost:
    
        r4 = new byte[r5];
     */
    /* JADX WARN: Code restructure failed: missing block: B:13:0x002e, code lost:
    
        com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER.get(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x0033, code lost:
    
        r0 = r4;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0035, code lost:
    
        r5 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0036, code lost:
    
        r0 = r4;
     */
    /* renamed from: rx */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static byte[] m12rx(byte[] r4, int r5, int r6) {
        /*
            r0 = 0
            java.nio.ByteBuffer r1 = com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER     // Catch: java.lang.Throwable -> L41 java.lang.InterruptedException -> L43
            r1.clear()     // Catch: java.lang.Throwable -> L41 java.lang.InterruptedException -> L43
            m13tx(r4)     // Catch: java.lang.Throwable -> L41 java.lang.InterruptedException -> L43
            r4 = 0
        La:
            int r1 = r6 / 10
            if (r4 >= r1) goto L47
            java.util.concurrent.TimeUnit r1 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch: java.lang.Throwable -> L41 java.lang.InterruptedException -> L43
            long r2 = (long) r4     // Catch: java.lang.Throwable -> L41 java.lang.InterruptedException -> L43
            r1.sleep(r2)     // Catch: java.lang.Throwable -> L41 java.lang.InterruptedException -> L43
            java.nio.ByteBuffer r1 = com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER     // Catch: java.lang.Throwable -> L41 java.lang.InterruptedException -> L43
            monitor-enter(r1)     // Catch: java.lang.Throwable -> L41 java.lang.InterruptedException -> L43
            java.nio.ByteBuffer r2 = com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER     // Catch: java.lang.Throwable -> L3e
            int r2 = r2.position()     // Catch: java.lang.Throwable -> L3e
            if (r2 != r5) goto L3a
            java.nio.ByteBuffer r4 = com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER     // Catch: java.lang.Throwable -> L3e
            r4.flip()     // Catch: java.lang.Throwable -> L3e
            java.nio.ByteBuffer r4 = com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER     // Catch: java.lang.Throwable -> L3e
            int r4 = r4.remaining()     // Catch: java.lang.Throwable -> L3e
            if (r4 < r5) goto L38
            byte[] r4 = new byte[r5]     // Catch: java.lang.Throwable -> L3e
            java.nio.ByteBuffer r5 = com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER     // Catch: java.lang.Throwable -> L35
            r5.get(r4)     // Catch: java.lang.Throwable -> L35
            r0 = r4
            goto L38
        L35:
            r5 = move-exception
            r0 = r4
            goto L3f
        L38:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L3e
            goto L47
        L3a:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L3e
            int r4 = r4 + 1
            goto La
        L3e:
            r5 = move-exception
        L3f:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L3e
            throw r5     // Catch: java.lang.Throwable -> L41 java.lang.InterruptedException -> L43
        L41:
            r4 = move-exception
            goto L4d
        L43:
            r4 = move-exception
            r4.printStackTrace()     // Catch: java.lang.Throwable -> L41
        L47:
            java.nio.ByteBuffer r4 = com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER
            r4.clear()
            return r0
        L4d:
            java.nio.ByteBuffer r5 = com.dnake.desktop.dnake.v700.vt_uart.RECEIVE_BUFFER
            r5.clear()
            goto L54
        L53:
            throw r4
        L54:
            goto L53
        */
        throw new UnsupportedOperationException("Method not decompiled: com.dnake.desktop.dnake.v700.vt_uart.m12rx(byte[], int, int):byte[]");
    }
}
