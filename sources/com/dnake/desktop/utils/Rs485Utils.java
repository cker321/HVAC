package com.dnake.desktop.utils;

import androidx.core.internal.view.SupportMenu;

/* loaded from: classes.dex */
public class Rs485Utils {
    public static final int FORCE_SINGLE_COIL = 5;
    public static final int MULTIPLE_WRITE = 16;
    public static final int READ_3 = 3;
    public static final int READ_4 = 4;
    public static final int READ_COIL = 1;
    public static final int SINGLE_WRITE = 6;
    private String HEXES;
    private String HEX_INDICATOR;
    private String SPACE;

    public static int setBitToZero(int i, int i2) {
        return i & ((1 << i2) ^ (-1));
    }

    public byte getBit(int i, int i2) {
        return (byte) ((i >> i2) & 1);
    }

    public int setBitToOne(int i, int i2) {
        return i | (1 << i2);
    }

    private Rs485Utils() {
        this.HEXES = "0123456789ABCDEF";
        this.HEX_INDICATOR = "0x";
        this.SPACE = " ";
    }

    public static Rs485Utils getInstance() {
        return ViewHolder.instance;
    }

    public byte[] getReadSendBytes(int i, int i2, int i3, int i4) {
        return getSendBuf(new byte[]{(byte) i, (byte) i2, (byte) (i3 >> 8), (byte) (i3 & 255), (byte) (i4 >> 8), (byte) (i4 & 255)});
    }

    public byte[] getWriteSendBytes(int i, int i2, int i3, int i4) {
        return getSendBuf(new byte[]{(byte) i, (byte) i2, (byte) (i3 >> 8), (byte) (i3 & 255), (byte) (i4 >> 8), (byte) (i4 & 255)});
    }

    public byte[] calReadDataArray(byte[] bArr) {
        int i = bArr[2] & 255;
        byte[] bArr2 = new byte[i];
        System.arraycopy(bArr, 3, bArr2, 0, i);
        return bArr2;
    }

    public int[] toIntArray(byte[] bArr) {
        if (bArr.length % 2 != 0) {
            return null;
        }
        int length = bArr.length / 2;
        int[] iArr = new int[length];
        byte[] bArr2 = new byte[2];
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            System.arraycopy(bArr, i, bArr2, 0, 2);
            iArr[i2] = GetShortAt(bArr2, 0);
            i += 2;
        }
        return iArr;
    }

    public float[] toFloatArray(byte[] bArr) {
        if (bArr.length % 4 != 0) {
            return null;
        }
        int length = bArr.length / 4;
        float[] fArr = new float[length];
        byte[] bArr2 = new byte[4];
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            System.arraycopy(bArr, i, bArr2, 0, 4);
            fArr[i2] = Float.intBitsToFloat(GetDIntAt(bArr2, 0));
            i += 4;
        }
        return fArr;
    }

    private int GetDIntAt(byte[] bArr, int i) {
        return (((((bArr[i] << 8) + (bArr[i + 1] & 255)) << 8) + (bArr[i + 2] & 255)) << 8) + (bArr[i + 3] & 255);
    }

    public int GetShortAt(byte[] bArr, int i) {
        byte b = bArr[i];
        int i2 = bArr[i + 1] & 255;
        return (b & 128) != 0 ? -(((b & Byte.MAX_VALUE) << 8) + i2) : (b << 8) + i2;
    }

    public byte[] getSendBuf(byte[] bArr) {
        int length = bArr.length + 2;
        byte[] bArr2 = new byte[length];
        System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
        int i = length - 2;
        int iAlex_crc16 = alex_crc16(bArr2, i);
        bArr2[i] = (byte) (iAlex_crc16 & 255);
        bArr2[length - 1] = (byte) ((65280 & iAlex_crc16) >> 8);
        return bArr2;
    }

    private int alex_crc16(byte[] bArr, int i) {
        int i2 = SupportMenu.USER_MASK;
        for (int i3 = 0; i3 < i; i3++) {
            i2 ^= bArr[i3] & 255;
            for (int i4 = 0; i4 < 8; i4++) {
                i2 = (i2 & 1) != 0 ? (i2 >> 1) ^ 40961 : i2 >> 1;
            }
        }
        return i2;
    }

    public boolean checkBuf(byte[] bArr) {
        if (bArr == null) {
            return false;
        }
        int iAlex_crc16 = alex_crc16(bArr, bArr.length - 2);
        return bArr[bArr.length - 1] == ((byte) ((65280 & iAlex_crc16) >> 8)) && bArr[bArr.length + (-2)] == ((byte) (iAlex_crc16 & 255));
    }

    public boolean returnCheck(byte[] bArr, byte[] bArr2) {
        return bArr != null && bArr.length == getReceiveLen(bArr2) && checkBuf(bArr) && bArr[0] == bArr2[0] && bArr[1] == bArr2[1];
    }

    public int getReceiveLen(byte[] bArr) {
        int i;
        byte b = bArr[1];
        int iGetShortAt = GetShortAt(bArr, 4);
        if (b != 1) {
            if (b == 16) {
                return 8;
            }
            if (b != 3 && b != 4) {
                return (b == 5 || b == 6) ? 8 : 0;
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

    public String hexToString(byte[] bArr) {
        if (bArr == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder(bArr.length * 2);
        for (int i = 0; i <= bArr.length - 1; i++) {
            byte b = bArr[i];
            sb.append(this.HEX_INDICATOR);
            sb.append(this.HEXES.charAt((b & 240) >> 4));
            sb.append(this.HEXES.charAt(b & 15));
            sb.append(this.SPACE);
        }
        return sb.toString();
    }

    public int getIntFromByteArray(byte[] bArr, int i, int i2, int i3) {
        return getIntFromBit2(copyTwoBytesFromData(bArr, i), i2, i3);
    }

    public int getIntFromBit2(byte[] bArr, int i, int i2) {
        int i3 = ((bArr[0] & 255) << 8) | (bArr[1] & 255);
        int i4 = (i2 - i) + 1;
        int bitToOne = 0;
        for (int i5 = 0; i5 < i4; i5++) {
            bitToOne = setBitToOne(bitToOne, i5);
        }
        return (i3 >> i) & bitToOne;
    }

    public int byte2ToInt(byte[] bArr, int i) {
        byte b = bArr[i];
        return (b << 8) + (bArr[i + 1] & 255);
    }

    public void int2Bytes(byte[] bArr, int i, int i2) {
        bArr[i] = (byte) (i2 >> 8);
        bArr[i + 1] = (byte) (i2 & 255);
    }

    private byte[] copyTwoBytesFromData(byte[] bArr, int i) {
        byte[] bArr2 = new byte[2];
        System.arraycopy(bArr, i * 2, bArr2, 0, 2);
        return bArr2;
    }

    static class ViewHolder {
        static Rs485Utils instance = new Rs485Utils();

        ViewHolder() {
        }
    }
}
