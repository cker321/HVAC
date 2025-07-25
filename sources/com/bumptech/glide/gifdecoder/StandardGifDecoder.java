package com.bumptech.glide.gifdecoder;

import android.graphics.Bitmap;
import android.util.Log;
import androidx.fragment.app.FragmentTransaction;
import com.bumptech.glide.gifdecoder.GifDecoder;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Iterator;

/* loaded from: classes.dex */
public class StandardGifDecoder implements GifDecoder {
    private static final int BYTES_PER_INTEGER = 4;
    private static final int COLOR_TRANSPARENT_BLACK = 0;
    private static final int INITIAL_FRAME_POINTER = -1;
    private static final int MASK_INT_LOWEST_BYTE = 255;
    private static final int MAX_STACK_SIZE = 4096;
    private static final int NULL_CODE = -1;
    private static final String TAG = StandardGifDecoder.class.getSimpleName();
    private int[] act;
    private Bitmap.Config bitmapConfig;
    private final GifDecoder.BitmapProvider bitmapProvider;
    private byte[] block;
    private int downsampledHeight;
    private int downsampledWidth;
    private int framePointer;
    private GifHeader header;
    private Boolean isFirstFrameTransparent;
    private byte[] mainPixels;
    private int[] mainScratch;
    private GifHeaderParser parser;
    private final int[] pct;
    private byte[] pixelStack;
    private short[] prefix;
    private Bitmap previousImage;
    private ByteBuffer rawData;
    private int sampleSize;
    private boolean savePrevious;
    private int status;
    private byte[] suffix;

    public StandardGifDecoder(GifDecoder.BitmapProvider bitmapProvider, GifHeader gifHeader, ByteBuffer byteBuffer) {
        this(bitmapProvider, gifHeader, byteBuffer, 1);
    }

    public StandardGifDecoder(GifDecoder.BitmapProvider bitmapProvider, GifHeader gifHeader, ByteBuffer byteBuffer, int i) {
        this(bitmapProvider);
        setData(gifHeader, byteBuffer, i);
    }

    public StandardGifDecoder(GifDecoder.BitmapProvider bitmapProvider) {
        this.pct = new int[256];
        this.bitmapConfig = Bitmap.Config.ARGB_8888;
        this.bitmapProvider = bitmapProvider;
        this.header = new GifHeader();
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getWidth() {
        return this.header.width;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getHeight() {
        return this.header.height;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public ByteBuffer getData() {
        return this.rawData;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getStatus() {
        return this.status;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public void advance() {
        this.framePointer = (this.framePointer + 1) % this.header.frameCount;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getDelay(int i) {
        if (i < 0 || i >= this.header.frameCount) {
            return -1;
        }
        return this.header.frames.get(i).delay;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getNextDelay() {
        int i;
        if (this.header.frameCount <= 0 || (i = this.framePointer) < 0) {
            return 0;
        }
        return getDelay(i);
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getFrameCount() {
        return this.header.frameCount;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getCurrentFrameIndex() {
        return this.framePointer;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public void resetFrameIndex() {
        this.framePointer = -1;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    @Deprecated
    public int getLoopCount() {
        if (this.header.loopCount == -1) {
            return 1;
        }
        return this.header.loopCount;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getNetscapeLoopCount() {
        return this.header.loopCount;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getTotalIterationCount() {
        if (this.header.loopCount == -1) {
            return 1;
        }
        if (this.header.loopCount == 0) {
            return 0;
        }
        return this.header.loopCount + 1;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int getByteSize() {
        return this.rawData.limit() + this.mainPixels.length + (this.mainScratch.length * 4);
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public synchronized Bitmap getNextFrame() {
        if (this.header.frameCount <= 0 || this.framePointer < 0) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Unable to decode frame, frameCount=" + this.header.frameCount + ", framePointer=" + this.framePointer);
            }
            this.status = 1;
        }
        if (this.status != 1 && this.status != 2) {
            this.status = 0;
            if (this.block == null) {
                this.block = this.bitmapProvider.obtainByteArray(255);
            }
            GifFrame gifFrame = this.header.frames.get(this.framePointer);
            int i = this.framePointer - 1;
            GifFrame gifFrame2 = i >= 0 ? this.header.frames.get(i) : null;
            int[] iArr = gifFrame.lct != null ? gifFrame.lct : this.header.gct;
            this.act = iArr;
            if (iArr == null) {
                if (Log.isLoggable(TAG, 3)) {
                    Log.d(TAG, "No valid color table found for frame #" + this.framePointer);
                }
                this.status = 1;
                return null;
            }
            if (gifFrame.transparency) {
                System.arraycopy(this.act, 0, this.pct, 0, this.act.length);
                int[] iArr2 = this.pct;
                this.act = iArr2;
                iArr2[gifFrame.transIndex] = 0;
            }
            return setPixels(gifFrame, gifFrame2);
        }
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "Unable to decode frame, status=" + this.status);
        }
        return null;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public int read(InputStream inputStream, int i) throws IOException {
        if (inputStream != null) {
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(i > 0 ? i + 4096 : 16384);
                byte[] bArr = new byte[16384];
                while (true) {
                    int i2 = inputStream.read(bArr, 0, 16384);
                    if (i2 == -1) {
                        break;
                    }
                    byteArrayOutputStream.write(bArr, 0, i2);
                }
                byteArrayOutputStream.flush();
                read(byteArrayOutputStream.toByteArray());
            } catch (IOException e) {
                Log.w(TAG, "Error reading data from stream", e);
            }
        } else {
            this.status = 2;
        }
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException e2) {
                Log.w(TAG, "Error closing stream", e2);
            }
        }
        return this.status;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public void clear() {
        this.header = null;
        byte[] bArr = this.mainPixels;
        if (bArr != null) {
            this.bitmapProvider.release(bArr);
        }
        int[] iArr = this.mainScratch;
        if (iArr != null) {
            this.bitmapProvider.release(iArr);
        }
        Bitmap bitmap = this.previousImage;
        if (bitmap != null) {
            this.bitmapProvider.release(bitmap);
        }
        this.previousImage = null;
        this.rawData = null;
        this.isFirstFrameTransparent = null;
        byte[] bArr2 = this.block;
        if (bArr2 != null) {
            this.bitmapProvider.release(bArr2);
        }
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public synchronized void setData(GifHeader gifHeader, byte[] bArr) {
        setData(gifHeader, ByteBuffer.wrap(bArr));
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public synchronized void setData(GifHeader gifHeader, ByteBuffer byteBuffer) {
        setData(gifHeader, byteBuffer, 1);
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public synchronized void setData(GifHeader gifHeader, ByteBuffer byteBuffer, int i) {
        if (i <= 0) {
            throw new IllegalArgumentException("Sample size must be >=0, not: " + i);
        }
        int iHighestOneBit = Integer.highestOneBit(i);
        this.status = 0;
        this.header = gifHeader;
        this.framePointer = -1;
        ByteBuffer byteBufferAsReadOnlyBuffer = byteBuffer.asReadOnlyBuffer();
        this.rawData = byteBufferAsReadOnlyBuffer;
        byteBufferAsReadOnlyBuffer.position(0);
        this.rawData.order(ByteOrder.LITTLE_ENDIAN);
        this.savePrevious = false;
        Iterator<GifFrame> it = gifHeader.frames.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            } else if (it.next().dispose == 3) {
                this.savePrevious = true;
                break;
            }
        }
        this.sampleSize = iHighestOneBit;
        this.downsampledWidth = gifHeader.width / iHighestOneBit;
        this.downsampledHeight = gifHeader.height / iHighestOneBit;
        this.mainPixels = this.bitmapProvider.obtainByteArray(gifHeader.width * gifHeader.height);
        this.mainScratch = this.bitmapProvider.obtainIntArray(this.downsampledWidth * this.downsampledHeight);
    }

    private GifHeaderParser getHeaderParser() {
        if (this.parser == null) {
            this.parser = new GifHeaderParser();
        }
        return this.parser;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public synchronized int read(byte[] bArr) {
        GifHeader header = getHeaderParser().setData(bArr).parseHeader();
        this.header = header;
        if (bArr != null) {
            setData(header, bArr);
        }
        return this.status;
    }

    @Override // com.bumptech.glide.gifdecoder.GifDecoder
    public void setDefaultBitmapConfig(Bitmap.Config config) {
        if (config != Bitmap.Config.ARGB_8888 && config != Bitmap.Config.RGB_565) {
            throw new IllegalArgumentException("Unsupported format: " + config + ", must be one of " + Bitmap.Config.ARGB_8888 + " or " + Bitmap.Config.RGB_565);
        }
        this.bitmapConfig = config;
    }

    private Bitmap setPixels(GifFrame gifFrame, GifFrame gifFrame2) {
        Bitmap bitmap;
        int[] iArr = this.mainScratch;
        int i = 0;
        if (gifFrame2 == null) {
            Bitmap bitmap2 = this.previousImage;
            if (bitmap2 != null) {
                this.bitmapProvider.release(bitmap2);
            }
            this.previousImage = null;
            Arrays.fill(iArr, 0);
        }
        if (gifFrame2 != null && gifFrame2.dispose == 3 && this.previousImage == null) {
            Arrays.fill(iArr, 0);
        }
        if (gifFrame2 != null && gifFrame2.dispose > 0) {
            if (gifFrame2.dispose == 2) {
                if (!gifFrame.transparency) {
                    int i2 = this.header.bgColor;
                    if (gifFrame.lct == null || this.header.bgIndex != gifFrame.transIndex) {
                        i = i2;
                    }
                } else if (this.framePointer == 0) {
                    this.isFirstFrameTransparent = true;
                }
                int i3 = gifFrame2.f73ih / this.sampleSize;
                int i4 = gifFrame2.f76iy / this.sampleSize;
                int i5 = gifFrame2.f74iw / this.sampleSize;
                int i6 = gifFrame2.f75ix / this.sampleSize;
                int i7 = this.downsampledWidth;
                int i8 = (i4 * i7) + i6;
                int i9 = (i3 * i7) + i8;
                while (i8 < i9) {
                    int i10 = i8 + i5;
                    for (int i11 = i8; i11 < i10; i11++) {
                        iArr[i11] = i;
                    }
                    i8 += this.downsampledWidth;
                }
            } else if (gifFrame2.dispose == 3 && (bitmap = this.previousImage) != null) {
                int i12 = this.downsampledWidth;
                bitmap.getPixels(iArr, 0, i12, 0, 0, i12, this.downsampledHeight);
            }
        }
        decodeBitmapData(gifFrame);
        if (gifFrame.interlace || this.sampleSize != 1) {
            copyCopyIntoScratchRobust(gifFrame);
        } else {
            copyIntoScratchFast(gifFrame);
        }
        if (this.savePrevious && (gifFrame.dispose == 0 || gifFrame.dispose == 1)) {
            if (this.previousImage == null) {
                this.previousImage = getNextBitmap();
            }
            Bitmap bitmap3 = this.previousImage;
            int i13 = this.downsampledWidth;
            bitmap3.setPixels(iArr, 0, i13, 0, 0, i13, this.downsampledHeight);
        }
        Bitmap nextBitmap = getNextBitmap();
        int i14 = this.downsampledWidth;
        nextBitmap.setPixels(iArr, 0, i14, 0, 0, i14, this.downsampledHeight);
        return nextBitmap;
    }

    private void copyIntoScratchFast(GifFrame gifFrame) {
        GifFrame gifFrame2 = gifFrame;
        int[] iArr = this.mainScratch;
        int i = gifFrame2.f73ih;
        int i2 = gifFrame2.f76iy;
        int i3 = gifFrame2.f74iw;
        int i4 = gifFrame2.f75ix;
        boolean z = this.framePointer == 0;
        int i5 = this.downsampledWidth;
        byte[] bArr = this.mainPixels;
        int[] iArr2 = this.act;
        int i6 = 0;
        byte b = -1;
        while (i6 < i) {
            int i7 = (i6 + i2) * i5;
            int i8 = i7 + i4;
            int i9 = i8 + i3;
            int i10 = i7 + i5;
            if (i10 < i9) {
                i9 = i10;
            }
            int i11 = gifFrame2.f74iw * i6;
            int i12 = i8;
            while (i12 < i9) {
                byte b2 = bArr[i11];
                int i13 = i;
                int i14 = b2 & 255;
                if (i14 != b) {
                    int i15 = iArr2[i14];
                    if (i15 != 0) {
                        iArr[i12] = i15;
                    } else {
                        b = b2;
                    }
                }
                i11++;
                i12++;
                i = i13;
            }
            i6++;
            gifFrame2 = gifFrame;
        }
        this.isFirstFrameTransparent = Boolean.valueOf(this.isFirstFrameTransparent == null && z && b != -1);
    }

    private void copyCopyIntoScratchRobust(GifFrame gifFrame) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int[] iArr = this.mainScratch;
        int i6 = gifFrame.f73ih / this.sampleSize;
        int i7 = gifFrame.f76iy / this.sampleSize;
        int i8 = gifFrame.f74iw / this.sampleSize;
        int i9 = gifFrame.f75ix / this.sampleSize;
        boolean z = this.framePointer == 0;
        int i10 = this.sampleSize;
        int i11 = this.downsampledWidth;
        int i12 = this.downsampledHeight;
        byte[] bArr = this.mainPixels;
        int[] iArr2 = this.act;
        Boolean bool = this.isFirstFrameTransparent;
        int i13 = 8;
        int i14 = 0;
        int i15 = 0;
        int i16 = 1;
        while (i14 < i6) {
            Boolean bool2 = bool;
            if (gifFrame.interlace) {
                if (i15 >= i6) {
                    i = i6;
                    int i17 = i16 + 1;
                    if (i17 == 2) {
                        i16 = i17;
                        i15 = 4;
                    } else if (i17 == 3) {
                        i16 = i17;
                        i15 = 2;
                        i13 = 4;
                    } else if (i17 != 4) {
                        i16 = i17;
                    } else {
                        i16 = i17;
                        i15 = 1;
                        i13 = 2;
                    }
                } else {
                    i = i6;
                }
                i2 = i15 + i13;
            } else {
                i = i6;
                i2 = i15;
                i15 = i14;
            }
            int i18 = i15 + i7;
            boolean z2 = i10 == 1;
            if (i18 < i12) {
                int i19 = i18 * i11;
                int i20 = i19 + i9;
                int i21 = i20 + i8;
                int i22 = i19 + i11;
                if (i22 < i21) {
                    i21 = i22;
                }
                i3 = i2;
                int i23 = i14 * i10 * gifFrame.f74iw;
                if (z2) {
                    int i24 = i20;
                    while (i24 < i21) {
                        int i25 = i7;
                        int i26 = iArr2[bArr[i23] & 255];
                        if (i26 != 0) {
                            iArr[i24] = i26;
                        } else if (z && bool2 == null) {
                            bool2 = true;
                        }
                        i23 += i10;
                        i24++;
                        i7 = i25;
                    }
                } else {
                    i5 = i7;
                    int i27 = ((i21 - i20) * i10) + i23;
                    int i28 = i20;
                    while (true) {
                        i4 = i8;
                        if (i28 < i21) {
                            int iAverageColorsNear = averageColorsNear(i23, i27, gifFrame.f74iw);
                            if (iAverageColorsNear != 0) {
                                iArr[i28] = iAverageColorsNear;
                            } else if (z && bool2 == null) {
                                bool2 = true;
                            }
                            i23 += i10;
                            i28++;
                            i8 = i4;
                        }
                    }
                    bool = bool2;
                    i14++;
                    i7 = i5;
                    i8 = i4;
                    i6 = i;
                    i15 = i3;
                }
            } else {
                i3 = i2;
            }
            i5 = i7;
            i4 = i8;
            bool = bool2;
            i14++;
            i7 = i5;
            i8 = i4;
            i6 = i;
            i15 = i3;
        }
        Boolean bool3 = bool;
        if (this.isFirstFrameTransparent == null) {
            this.isFirstFrameTransparent = Boolean.valueOf(bool3 == null ? false : bool3.booleanValue());
        }
    }

    private int averageColorsNear(int i, int i2, int i3) {
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        for (int i9 = i; i9 < this.sampleSize + i; i9++) {
            byte[] bArr = this.mainPixels;
            if (i9 >= bArr.length || i9 >= i2) {
                break;
            }
            int i10 = this.act[bArr[i9] & 255];
            if (i10 != 0) {
                i4 += (i10 >> 24) & 255;
                i5 += (i10 >> 16) & 255;
                i6 += (i10 >> 8) & 255;
                i7 += i10 & 255;
                i8++;
            }
        }
        int i11 = i + i3;
        for (int i12 = i11; i12 < this.sampleSize + i11; i12++) {
            byte[] bArr2 = this.mainPixels;
            if (i12 >= bArr2.length || i12 >= i2) {
                break;
            }
            int i13 = this.act[bArr2[i12] & 255];
            if (i13 != 0) {
                i4 += (i13 >> 24) & 255;
                i5 += (i13 >> 16) & 255;
                i6 += (i13 >> 8) & 255;
                i7 += i13 & 255;
                i8++;
            }
        }
        if (i8 == 0) {
            return 0;
        }
        return ((i4 / i8) << 24) | ((i5 / i8) << 16) | ((i6 / i8) << 8) | (i7 / i8);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v15, types: [short] */
    /* JADX WARN: Type inference failed for: r7v17 */
    private void decodeBitmapData(GifFrame gifFrame) {
        short s;
        StandardGifDecoder standardGifDecoder = this;
        if (gifFrame != null) {
            standardGifDecoder.rawData.position(gifFrame.bufferFrameStart);
        }
        int i = gifFrame == null ? standardGifDecoder.header.width * standardGifDecoder.header.height : gifFrame.f73ih * gifFrame.f74iw;
        byte[] bArr = standardGifDecoder.mainPixels;
        if (bArr == null || bArr.length < i) {
            standardGifDecoder.mainPixels = standardGifDecoder.bitmapProvider.obtainByteArray(i);
        }
        byte[] bArr2 = standardGifDecoder.mainPixels;
        if (standardGifDecoder.prefix == null) {
            standardGifDecoder.prefix = new short[4096];
        }
        short[] sArr = standardGifDecoder.prefix;
        if (standardGifDecoder.suffix == null) {
            standardGifDecoder.suffix = new byte[4096];
        }
        byte[] bArr3 = standardGifDecoder.suffix;
        if (standardGifDecoder.pixelStack == null) {
            standardGifDecoder.pixelStack = new byte[FragmentTransaction.TRANSIT_FRAGMENT_OPEN];
        }
        byte[] bArr4 = standardGifDecoder.pixelStack;
        int i2 = readByte();
        int i3 = 1 << i2;
        int i4 = i3 + 1;
        int i5 = i3 + 2;
        int i6 = i2 + 1;
        int i7 = (1 << i6) - 1;
        int i8 = 0;
        for (int i9 = 0; i9 < i3; i9++) {
            sArr[i9] = 0;
            bArr3[i9] = (byte) i9;
        }
        byte[] bArr5 = standardGifDecoder.block;
        int i10 = i6;
        int i11 = i5;
        int i12 = i7;
        int block = 0;
        int i13 = 0;
        int i14 = 0;
        int i15 = 0;
        int i16 = 0;
        int i17 = -1;
        int i18 = 0;
        int i19 = 0;
        while (true) {
            if (i8 >= i) {
                break;
            }
            if (block == 0) {
                block = readBlock();
                if (block <= 0) {
                    standardGifDecoder.status = 3;
                    break;
                }
                i13 = 0;
            }
            i15 += (bArr5[i13] & 255) << i14;
            i13++;
            block--;
            int i20 = i14 + 8;
            int i21 = i11;
            int i22 = i10;
            int i23 = i17;
            int i24 = i6;
            int i25 = i18;
            while (true) {
                if (i20 < i22) {
                    i17 = i23;
                    i11 = i21;
                    i14 = i20;
                    standardGifDecoder = this;
                    i18 = i25;
                    i6 = i24;
                    i10 = i22;
                    break;
                }
                int i26 = i5;
                int i27 = i15 & i12;
                i15 >>= i22;
                i20 -= i22;
                if (i27 == i3) {
                    i12 = i7;
                    i22 = i24;
                    i21 = i26;
                    i5 = i21;
                    i23 = -1;
                } else {
                    if (i27 == i4) {
                        i14 = i20;
                        i18 = i25;
                        i11 = i21;
                        i6 = i24;
                        i5 = i26;
                        i17 = i23;
                        i10 = i22;
                        standardGifDecoder = this;
                        break;
                    }
                    if (i23 == -1) {
                        bArr2[i16] = bArr3[i27];
                        i16++;
                        i8++;
                        i23 = i27;
                        i25 = i23;
                        i5 = i26;
                        i20 = i20;
                    } else {
                        if (i27 >= i21) {
                            bArr4[i19] = (byte) i25;
                            i19++;
                            s = i23;
                        } else {
                            s = i27;
                        }
                        while (s >= i3) {
                            bArr4[i19] = bArr3[s];
                            i19++;
                            s = sArr[s];
                        }
                        i25 = bArr3[s] & 255;
                        byte b = (byte) i25;
                        bArr2[i16] = b;
                        while (true) {
                            i16++;
                            i8++;
                            if (i19 <= 0) {
                                break;
                            }
                            i19--;
                            bArr2[i16] = bArr4[i19];
                        }
                        byte[] bArr6 = bArr4;
                        if (i21 < 4096) {
                            sArr[i21] = (short) i23;
                            bArr3[i21] = b;
                            i21++;
                            if ((i21 & i12) == 0 && i21 < 4096) {
                                i22++;
                                i12 += i21;
                            }
                        }
                        i23 = i27;
                        i5 = i26;
                        i20 = i20;
                        bArr4 = bArr6;
                    }
                }
            }
        }
        Arrays.fill(bArr2, i16, i, (byte) 0);
    }

    private int readByte() {
        return this.rawData.get() & 255;
    }

    private int readBlock() {
        int i = readByte();
        if (i <= 0) {
            return i;
        }
        ByteBuffer byteBuffer = this.rawData;
        byteBuffer.get(this.block, 0, Math.min(i, byteBuffer.remaining()));
        return i;
    }

    private Bitmap getNextBitmap() {
        Boolean bool = this.isFirstFrameTransparent;
        Bitmap bitmapObtain = this.bitmapProvider.obtain(this.downsampledWidth, this.downsampledHeight, (bool == null || bool.booleanValue()) ? Bitmap.Config.ARGB_8888 : this.bitmapConfig);
        bitmapObtain.setHasAlpha(true);
        return bitmapObtain;
    }
}
