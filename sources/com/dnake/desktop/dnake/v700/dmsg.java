package com.dnake.desktop.dnake.v700;

import android.os.StrictMode;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.StringTokenizer;

/* loaded from: classes.dex */
public class dmsg {

    /* renamed from: ds */
    private static DatagramSocket f100ds;
    private static __msg_port[] msg_port;
    private static InetAddress rAddr;
    private static int rPort;
    public String mBody = null;

    private static class __msg_port {
        int port;
        String url;

        private __msg_port() {
        }
    }

    private static int mPort(String str) {
        setup_port();
        for (__msg_port __msg_portVar : msg_port) {
            if (str.indexOf(__msg_portVar.url) == 0) {
                return __msg_portVar.port;
            }
        }
        return -1;
    }

    public static void setup_port() {
        if (msg_port == null) {
            __msg_port[] __msg_portVarArr = new __msg_port[10];
            msg_port = __msg_portVarArr;
            __msg_portVarArr[0] = new __msg_port();
            msg_port[0].url = "/talk";
            msg_port[0].port = 9800;
            msg_port[1] = new __msg_port();
            msg_port[1].url = "/ui";
            msg_port[1].port = 9801;
            msg_port[2] = new __msg_port();
            msg_port[2].url = "/monitor";
            msg_port[2].port = 9802;
            msg_port[3] = new __msg_port();
            msg_port[3].url = "/upgrade";
            msg_port[3].port = 9803;
            msg_port[4] = new __msg_port();
            msg_port[4].url = "/control";
            msg_port[4].port = 9804;
            msg_port[5] = new __msg_port();
            msg_port[5].url = "/security";
            msg_port[5].port = 9830;
            msg_port[6] = new __msg_port();
            msg_port[6].url = "/smart";
            msg_port[6].port = 9831;
            msg_port[7] = new __msg_port();
            msg_port[7].url = "/apps";
            msg_port[7].port = 9832;
            msg_port[8] = new __msg_port();
            msg_port[8].url = "/settings";
            msg_port[8].port = 9833;
            msg_port[9] = new __msg_port();
            msg_port[9].url = "/exApp";
            msg_port[9].port = 9850;
            StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder().permitAll().build());
        }
    }

    public static Boolean start(String str) {
        int iMPort = mPort(str);
        if (iMPort < 0) {
            return false;
        }
        try {
            f100ds = new DatagramSocket(iMPort, InetAddress.getByName("127.0.0.1"));
        } catch (SocketException | UnknownHostException e) {
            e.printStackTrace();
        }
        new Thread(new DmsgThread()).start();
        return true;
    }

    public static void ack(int i, String str) throws IOException {
        String str2;
        if (rAddr == null) {
            return;
        }
        if (str != null) {
            str2 = "MSG/1.0 " + i + " OK\r\n\r\n" + str;
        } else {
            str2 = "MSG/1.0 " + i + " OK\r\n\r\n";
        }
        byte[] bytes = str2.getBytes();
        try {
            f100ds.send(new DatagramPacket(bytes, bytes.length, rAddr, rPort));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /* renamed from: to */
    public int m11to(String str, String str2) throws IOException {
        String str3;
        DatagramSocket datagramSocket = null;
        this.mBody = null;
        int iMPort = mPort(str);
        if (iMPort < 0) {
            return 0;
        }
        try {
            DatagramSocket datagramSocket2 = new DatagramSocket();
            try {
                if (str2 != null) {
                    str3 = "POST " + str + " MSG/1.0\r\n\r\n" + str2;
                } else {
                    str3 = "POST " + str + " MSG/1.0\r\n\r\n";
                }
                byte[] bytes = str3.getBytes();
                DatagramPacket datagramPacket = new DatagramPacket(bytes, bytes.length, InetAddress.getByName("127.0.0.1"), iMPort);
                datagramSocket2.setSoTimeout(500);
                datagramSocket2.send(datagramPacket);
                DatagramPacket datagramPacket2 = new DatagramPacket(new byte[8192], 8192);
                datagramSocket2.receive(datagramPacket2);
                if (datagramPacket2.getLength() < 8) {
                    datagramSocket2.close();
                    return 0;
                }
                if (!is_utf8(datagramPacket2.getData(), datagramPacket2.getLength()).booleanValue()) {
                    try {
                        str3 = new String(datagramPacket2.getData(), 0, datagramPacket2.getLength(), "GBK");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                } else {
                    str3 = new String(datagramPacket2.getData(), 0, datagramPacket2.getLength());
                }
                StringTokenizer stringTokenizer = new StringTokenizer(str3, " ");
                stringTokenizer.nextToken();
                String strNextToken = stringTokenizer.nextToken();
                int iIndexOf = str3.indexOf("\r\n\r\n");
                if (iIndexOf > 0) {
                    this.mBody = str3.substring(iIndexOf + 4);
                }
                return Integer.parseInt(strNextToken);
            } catch (IOException e2) {
                e = e2;
                datagramSocket = datagramSocket2;
                e.printStackTrace();
                if (datagramSocket == null) {
                    return -1;
                }
                datagramSocket.close();
                return -1;
            }
        } catch (IOException e3) {
            e = e3;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void process(DatagramPacket datagramPacket) {
        String str;
        if (!is_utf8(datagramPacket.getData(), datagramPacket.getLength()).booleanValue()) {
            try {
                str = new String(datagramPacket.getData(), 0, datagramPacket.getLength(), "GBK");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                str = null;
            }
        } else {
            str = new String(datagramPacket.getData(), 0, datagramPacket.getLength());
        }
        StringTokenizer stringTokenizer = new StringTokenizer(str, " ");
        String strNextToken = stringTokenizer.nextToken();
        String strNextToken2 = stringTokenizer.nextToken();
        int iIndexOf = str != null ? str.indexOf("\r\n\r\n") : 0;
        String strSubstring = iIndexOf > 0 ? str.substring(iIndexOf + 4) : null;
        if (strNextToken2 == null || strNextToken == null || !strNextToken.equals("POST")) {
            return;
        }
        devent.event(strNextToken2, strSubstring);
    }

    public static class DmsgThread implements Runnable {
        @Override // java.lang.Runnable
        public void run() throws IOException {
            DatagramPacket datagramPacket = new DatagramPacket(new byte[131072], 131072);
            while (true) {
                try {
                    if (dmsg.f100ds != null) {
                        dmsg.f100ds.receive(datagramPacket);
                        InetAddress unused = dmsg.rAddr = datagramPacket.getAddress();
                        int unused2 = dmsg.rPort = datagramPacket.getPort();
                        dmsg.process(datagramPacket);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                InetAddress unused3 = dmsg.rAddr = null;
            }
        }
    }

    private static Boolean is_utf8(byte[] bArr, int i) {
        int i2;
        boolean z = true;
        Boolean bool = true;
        if (bArr == null) {
            return bool;
        }
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        while (i3 < i) {
            if (bArr[i3] <= 0 || bArr[i3] >= Byte.MAX_VALUE) {
                bool = false;
                if ((bArr[i3] & 224) == 192 && (i2 = i3 + 1) <= bArr.length) {
                    if ((bArr[i2] & 192) == 128) {
                        int i6 = bArr[i3] & 255;
                        int i7 = bArr[i2] & 255;
                        if (129 <= i6 && i6 <= 254 && 64 <= i7 && i7 <= 254 && i7 != 127) {
                            System.out.println("Not do!");
                        }
                        i5++;
                        i3 = i2;
                    }
                    i3++;
                    i4++;
                } else if ((bArr[i3] & 240) == 224) {
                    i3++;
                    i4++;
                } else {
                    i3++;
                    i4++;
                }
            }
            i3++;
        }
        if (!bool.booleanValue() && i4 > 0 && i5 * 10 < i4) {
            z = false;
        }
        return Boolean.valueOf(z);
    }
}
