package com.google.zxing.common.reedsolomon;

/* loaded from: classes.dex */
public final class GenericGF {
    public static final GenericGF AZTEC_DATA_8;
    public static final GenericGF DATA_MATRIX_FIELD_256;
    public static final GenericGF MAXICODE_FIELD_64;
    private final int[] expTable;
    private final int generatorBase;
    private final int[] logTable;
    private final GenericGFPoly one;
    private final int primitive;
    private final int size;
    private final GenericGFPoly zero;
    public static final GenericGF AZTEC_DATA_12 = new GenericGF(4201, 4096, 1);
    public static final GenericGF AZTEC_DATA_10 = new GenericGF(1033, 1024, 1);
    public static final GenericGF AZTEC_DATA_6 = new GenericGF(67, 64, 1);
    public static final GenericGF AZTEC_PARAM = new GenericGF(19, 16, 1);
    public static final GenericGF QR_CODE_FIELD_256 = new GenericGF(285, 256, 0);

    static int addOrSubtract(int i, int i2) {
        return i ^ i2;
    }

    static {
        GenericGF genericGF = new GenericGF(301, 256, 1);
        DATA_MATRIX_FIELD_256 = genericGF;
        AZTEC_DATA_8 = genericGF;
        MAXICODE_FIELD_64 = AZTEC_DATA_6;
    }

    public GenericGF(int i, int i2, int i3) {
        this.primitive = i;
        this.size = i2;
        this.generatorBase = i3;
        this.expTable = new int[i2];
        this.logTable = new int[i2];
        int i4 = 1;
        for (int i5 = 0; i5 < i2; i5++) {
            this.expTable[i5] = i4;
            i4 <<= 1;
            if (i4 >= i2) {
                i4 = (i4 ^ i) & (i2 - 1);
            }
        }
        for (int i6 = 0; i6 < i2 - 1; i6++) {
            this.logTable[this.expTable[i6]] = i6;
        }
        this.zero = new GenericGFPoly(this, new int[]{0});
        this.one = new GenericGFPoly(this, new int[]{1});
    }

    GenericGFPoly getZero() {
        return this.zero;
    }

    GenericGFPoly getOne() {
        return this.one;
    }

    GenericGFPoly buildMonomial(int i, int i2) {
        if (i < 0) {
            throw new IllegalArgumentException();
        }
        if (i2 == 0) {
            return this.zero;
        }
        int[] iArr = new int[i + 1];
        iArr[0] = i2;
        return new GenericGFPoly(this, iArr);
    }

    int exp(int i) {
        return this.expTable[i];
    }

    int log(int i) {
        if (i == 0) {
            throw new IllegalArgumentException();
        }
        return this.logTable[i];
    }

    int inverse(int i) {
        if (i == 0) {
            throw new ArithmeticException();
        }
        return this.expTable[(this.size - this.logTable[i]) - 1];
    }

    int multiply(int i, int i2) {
        if (i == 0 || i2 == 0) {
            return 0;
        }
        int[] iArr = this.expTable;
        int[] iArr2 = this.logTable;
        return iArr[(iArr2[i] + iArr2[i2]) % (this.size - 1)];
    }

    public int getSize() {
        return this.size;
    }

    public int getGeneratorBase() {
        return this.generatorBase;
    }

    public String toString() {
        return "GF(0x" + Integer.toHexString(this.primitive) + ',' + this.size + ')';
    }
}
