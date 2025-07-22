package androidx.core.provider;

import android.content.ContentUris;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.CancellationSignal;
import android.os.Handler;
import android.provider.BaseColumns;
import androidx.collection.LruCache;
import androidx.collection.SimpleArrayMap;
import androidx.core.content.res.FontResourcesParserCompat;
import androidx.core.content.res.ResourcesCompat;
import androidx.core.graphics.TypefaceCompat;
import androidx.core.graphics.TypefaceCompatUtil;
import androidx.core.provider.SelfDestructiveThread;
import androidx.core.util.Preconditions;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

/* loaded from: classes.dex */
public class FontsContractCompat {
    public static final String PARCEL_FONT_RESULTS = "font_results";
    static final int RESULT_CODE_PROVIDER_NOT_FOUND = -1;
    static final int RESULT_CODE_WRONG_CERTIFICATES = -2;
    static final LruCache<String, Typeface> sTypefaceCache = new LruCache<>(16);
    private static final int BACKGROUND_THREAD_KEEP_ALIVE_DURATION_MS = 10000;
    private static final SelfDestructiveThread sBackgroundThread = new SelfDestructiveThread("fonts", 10, BACKGROUND_THREAD_KEEP_ALIVE_DURATION_MS);
    static final Object sLock = new Object();
    static final SimpleArrayMap<String, ArrayList<SelfDestructiveThread.ReplyCallback<TypefaceResult>>> sPendingReplies = new SimpleArrayMap<>();
    private static final Comparator<byte[]> sByteArrayComparator = new Comparator<byte[]>() { // from class: androidx.core.provider.FontsContractCompat.5
        C01785() {
        }

        @Override // java.util.Comparator
        public int compare(byte[] bArr, byte[] bArr2) {
            int length;
            int length2;
            if (bArr.length != bArr2.length) {
                length = bArr.length;
                length2 = bArr2.length;
            } else {
                for (int i = 0; i < bArr.length; i++) {
                    if (bArr[i] != bArr2[i]) {
                        length = bArr[i];
                        length2 = bArr2[i];
                    }
                }
                return 0;
            }
            return length - length2;
        }
    };

    public static final class Columns implements BaseColumns {
        public static final String FILE_ID = "file_id";
        public static final String ITALIC = "font_italic";
        public static final String RESULT_CODE = "result_code";
        public static final int RESULT_CODE_FONT_NOT_FOUND = 1;
        public static final int RESULT_CODE_FONT_UNAVAILABLE = 2;
        public static final int RESULT_CODE_MALFORMED_QUERY = 3;
        public static final int RESULT_CODE_OK = 0;
        public static final String TTC_INDEX = "font_ttc_index";
        public static final String VARIATION_SETTINGS = "font_variation_settings";
        public static final String WEIGHT = "font_weight";
    }

    public static class FontRequestCallback {
        public static final int FAIL_REASON_FONT_LOAD_ERROR = -3;
        public static final int FAIL_REASON_FONT_NOT_FOUND = 1;
        public static final int FAIL_REASON_FONT_UNAVAILABLE = 2;
        public static final int FAIL_REASON_MALFORMED_QUERY = 3;
        public static final int FAIL_REASON_PROVIDER_NOT_FOUND = -1;
        public static final int FAIL_REASON_SECURITY_VIOLATION = -4;
        public static final int FAIL_REASON_WRONG_CERTIFICATES = -2;
        public static final int RESULT_OK = 0;

        @Retention(RetentionPolicy.SOURCE)
        public @interface FontRequestFailReason {
        }

        public void onTypefaceRequestFailed(int i) {
        }

        public void onTypefaceRetrieved(Typeface typeface) {
        }
    }

    private FontsContractCompat() {
    }

    static TypefaceResult getFontInternal(Context context, FontRequest fontRequest, int i) {
        try {
            FontFamilyResult fontFamilyResultFetchFonts = fetchFonts(context, null, fontRequest);
            if (fontFamilyResultFetchFonts.getStatusCode() == 0) {
                Typeface typefaceCreateFromFontInfo = TypefaceCompat.createFromFontInfo(context, null, fontFamilyResultFetchFonts.getFonts(), i);
                return new TypefaceResult(typefaceCreateFromFontInfo, typefaceCreateFromFontInfo != null ? 0 : -3);
            }
            return new TypefaceResult(null, fontFamilyResultFetchFonts.getStatusCode() == 1 ? -2 : -3);
        } catch (PackageManager.NameNotFoundException unused) {
            return new TypefaceResult(null, -1);
        }
    }

    private static final class TypefaceResult {
        final int mResult;
        final Typeface mTypeface;

        TypefaceResult(Typeface typeface, int i) {
            this.mTypeface = typeface;
            this.mResult = i;
        }
    }

    public static void resetCache() {
        sTypefaceCache.evictAll();
    }

    public static Typeface getFontSync(Context context, FontRequest fontRequest, ResourcesCompat.FontCallback fontCallback, Handler handler, boolean z, int i, int i2) {
        String str = fontRequest.getIdentifier() + "-" + i2;
        Typeface typeface = sTypefaceCache.get(str);
        if (typeface != null) {
            if (fontCallback != null) {
                fontCallback.onFontRetrieved(typeface);
            }
            return typeface;
        }
        if (z && i == -1) {
            TypefaceResult fontInternal = getFontInternal(context, fontRequest, i2);
            if (fontCallback != null) {
                if (fontInternal.mResult == 0) {
                    fontCallback.callbackSuccessAsync(fontInternal.mTypeface, handler);
                } else {
                    fontCallback.callbackFailAsync(fontInternal.mResult, handler);
                }
            }
            return fontInternal.mTypeface;
        }
        CallableC01741 callableC01741 = new Callable<TypefaceResult>() { // from class: androidx.core.provider.FontsContractCompat.1
            final /* synthetic */ Context val$context;
            final /* synthetic */ String val$id;
            final /* synthetic */ FontRequest val$request;
            final /* synthetic */ int val$style;

            CallableC01741(Context context2, FontRequest fontRequest2, int i22, String str2) {
                context = context2;
                fontRequest = fontRequest2;
                i = i22;
                str = str2;
            }

            @Override // java.util.concurrent.Callable
            public TypefaceResult call() throws Exception {
                TypefaceResult fontInternal2 = FontsContractCompat.getFontInternal(context, fontRequest, i);
                if (fontInternal2.mTypeface != null) {
                    FontsContractCompat.sTypefaceCache.put(str, fontInternal2.mTypeface);
                }
                return fontInternal2;
            }
        };
        if (z) {
            try {
                return ((TypefaceResult) sBackgroundThread.postAndWait(callableC01741, i)).mTypeface;
            } catch (InterruptedException unused) {
                return null;
            }
        }
        C01752 c01752 = fontCallback == null ? null : new SelfDestructiveThread.ReplyCallback<TypefaceResult>() { // from class: androidx.core.provider.FontsContractCompat.2
            final /* synthetic */ Handler val$handler;

            C01752(Handler handler2) {
                handler = handler2;
            }

            @Override // androidx.core.provider.SelfDestructiveThread.ReplyCallback
            public void onReply(TypefaceResult typefaceResult) {
                if (typefaceResult == null) {
                    fontCallback.callbackFailAsync(1, handler);
                } else if (typefaceResult.mResult == 0) {
                    fontCallback.callbackSuccessAsync(typefaceResult.mTypeface, handler);
                } else {
                    fontCallback.callbackFailAsync(typefaceResult.mResult, handler);
                }
            }
        };
        synchronized (sLock) {
            ArrayList<SelfDestructiveThread.ReplyCallback<TypefaceResult>> arrayList = sPendingReplies.get(str2);
            if (arrayList != null) {
                if (c01752 != null) {
                    arrayList.add(c01752);
                }
                return null;
            }
            if (c01752 != null) {
                ArrayList<SelfDestructiveThread.ReplyCallback<TypefaceResult>> arrayList2 = new ArrayList<>();
                arrayList2.add(c01752);
                sPendingReplies.put(str2, arrayList2);
            }
            sBackgroundThread.postAndReply(callableC01741, new SelfDestructiveThread.ReplyCallback<TypefaceResult>() { // from class: androidx.core.provider.FontsContractCompat.3
                final /* synthetic */ String val$id;

                C01763(String str2) {
                    str = str2;
                }

                @Override // androidx.core.provider.SelfDestructiveThread.ReplyCallback
                public void onReply(TypefaceResult typefaceResult) {
                    synchronized (FontsContractCompat.sLock) {
                        ArrayList<SelfDestructiveThread.ReplyCallback<TypefaceResult>> arrayList3 = FontsContractCompat.sPendingReplies.get(str);
                        if (arrayList3 == null) {
                            return;
                        }
                        FontsContractCompat.sPendingReplies.remove(str);
                        for (int i3 = 0; i3 < arrayList3.size(); i3++) {
                            arrayList3.get(i3).onReply(typefaceResult);
                        }
                    }
                }
            });
            return null;
        }
    }

    /* renamed from: androidx.core.provider.FontsContractCompat$1 */
    class CallableC01741 implements Callable<TypefaceResult> {
        final /* synthetic */ Context val$context;
        final /* synthetic */ String val$id;
        final /* synthetic */ FontRequest val$request;
        final /* synthetic */ int val$style;

        CallableC01741(Context context2, FontRequest fontRequest2, int i22, String str2) {
            context = context2;
            fontRequest = fontRequest2;
            i = i22;
            str = str2;
        }

        @Override // java.util.concurrent.Callable
        public TypefaceResult call() throws Exception {
            TypefaceResult fontInternal2 = FontsContractCompat.getFontInternal(context, fontRequest, i);
            if (fontInternal2.mTypeface != null) {
                FontsContractCompat.sTypefaceCache.put(str, fontInternal2.mTypeface);
            }
            return fontInternal2;
        }
    }

    /* renamed from: androidx.core.provider.FontsContractCompat$2 */
    class C01752 implements SelfDestructiveThread.ReplyCallback<TypefaceResult> {
        final /* synthetic */ Handler val$handler;

        C01752(Handler handler2) {
            handler = handler2;
        }

        @Override // androidx.core.provider.SelfDestructiveThread.ReplyCallback
        public void onReply(TypefaceResult typefaceResult) {
            if (typefaceResult == null) {
                fontCallback.callbackFailAsync(1, handler);
            } else if (typefaceResult.mResult == 0) {
                fontCallback.callbackSuccessAsync(typefaceResult.mTypeface, handler);
            } else {
                fontCallback.callbackFailAsync(typefaceResult.mResult, handler);
            }
        }
    }

    /* renamed from: androidx.core.provider.FontsContractCompat$3 */
    class C01763 implements SelfDestructiveThread.ReplyCallback<TypefaceResult> {
        final /* synthetic */ String val$id;

        C01763(String str2) {
            str = str2;
        }

        @Override // androidx.core.provider.SelfDestructiveThread.ReplyCallback
        public void onReply(TypefaceResult typefaceResult) {
            synchronized (FontsContractCompat.sLock) {
                ArrayList<SelfDestructiveThread.ReplyCallback<TypefaceResult>> arrayList3 = FontsContractCompat.sPendingReplies.get(str);
                if (arrayList3 == null) {
                    return;
                }
                FontsContractCompat.sPendingReplies.remove(str);
                for (int i3 = 0; i3 < arrayList3.size(); i3++) {
                    arrayList3.get(i3).onReply(typefaceResult);
                }
            }
        }
    }

    public static class FontInfo {
        private final boolean mItalic;
        private final int mResultCode;
        private final int mTtcIndex;
        private final Uri mUri;
        private final int mWeight;

        public FontInfo(Uri uri, int i, int i2, boolean z, int i3) {
            this.mUri = (Uri) Preconditions.checkNotNull(uri);
            this.mTtcIndex = i;
            this.mWeight = i2;
            this.mItalic = z;
            this.mResultCode = i3;
        }

        public Uri getUri() {
            return this.mUri;
        }

        public int getTtcIndex() {
            return this.mTtcIndex;
        }

        public int getWeight() {
            return this.mWeight;
        }

        public boolean isItalic() {
            return this.mItalic;
        }

        public int getResultCode() {
            return this.mResultCode;
        }
    }

    public static class FontFamilyResult {
        public static final int STATUS_OK = 0;
        public static final int STATUS_UNEXPECTED_DATA_PROVIDED = 2;
        public static final int STATUS_WRONG_CERTIFICATES = 1;
        private final FontInfo[] mFonts;
        private final int mStatusCode;

        public FontFamilyResult(int i, FontInfo[] fontInfoArr) {
            this.mStatusCode = i;
            this.mFonts = fontInfoArr;
        }

        public int getStatusCode() {
            return this.mStatusCode;
        }

        public FontInfo[] getFonts() {
            return this.mFonts;
        }
    }

    public static void requestFont(Context context, FontRequest fontRequest, FontRequestCallback fontRequestCallback, Handler handler) {
        requestFontInternal(context.getApplicationContext(), fontRequest, fontRequestCallback, handler);
    }

    /* renamed from: androidx.core.provider.FontsContractCompat$4 */
    class RunnableC01774 implements Runnable {
        final /* synthetic */ Context val$appContext;
        final /* synthetic */ FontRequestCallback val$callback;
        final /* synthetic */ Handler val$callerThreadHandler;
        final /* synthetic */ FontRequest val$request;

        RunnableC01774(Context context, FontRequest fontRequest, Handler handler, FontRequestCallback fontRequestCallback) {
            context = context;
            fontRequest = fontRequest;
            handler = handler;
            fontRequestCallback = fontRequestCallback;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                FontFamilyResult fontFamilyResultFetchFonts = FontsContractCompat.fetchFonts(context, null, fontRequest);
                if (fontFamilyResultFetchFonts.getStatusCode() != 0) {
                    int statusCode = fontFamilyResultFetchFonts.getStatusCode();
                    if (statusCode == 1) {
                        handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.2
                            AnonymousClass2() {
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                fontRequestCallback.onTypefaceRequestFailed(-2);
                            }
                        });
                        return;
                    } else if (statusCode == 2) {
                        handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.3
                            AnonymousClass3() {
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                fontRequestCallback.onTypefaceRequestFailed(-3);
                            }
                        });
                        return;
                    } else {
                        handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.4
                            AnonymousClass4() {
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                fontRequestCallback.onTypefaceRequestFailed(-3);
                            }
                        });
                        return;
                    }
                }
                FontInfo[] fonts = fontFamilyResultFetchFonts.getFonts();
                if (fonts == null || fonts.length == 0) {
                    handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.5
                        AnonymousClass5() {
                        }

                        @Override // java.lang.Runnable
                        public void run() {
                            fontRequestCallback.onTypefaceRequestFailed(1);
                        }
                    });
                    return;
                }
                for (FontInfo fontInfo : fonts) {
                    if (fontInfo.getResultCode() != 0) {
                        int resultCode = fontInfo.getResultCode();
                        if (resultCode < 0) {
                            handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.6
                                AnonymousClass6() {
                                }

                                @Override // java.lang.Runnable
                                public void run() {
                                    fontRequestCallback.onTypefaceRequestFailed(-3);
                                }
                            });
                            return;
                        } else {
                            handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.7
                                final /* synthetic */ int val$resultCode;

                                AnonymousClass7(int resultCode2) {
                                    i = resultCode2;
                                }

                                @Override // java.lang.Runnable
                                public void run() {
                                    fontRequestCallback.onTypefaceRequestFailed(i);
                                }
                            });
                            return;
                        }
                    }
                }
                Typeface typefaceBuildTypeface = FontsContractCompat.buildTypeface(context, null, fonts);
                if (typefaceBuildTypeface == null) {
                    handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.8
                        AnonymousClass8() {
                        }

                        @Override // java.lang.Runnable
                        public void run() {
                            fontRequestCallback.onTypefaceRequestFailed(-3);
                        }
                    });
                } else {
                    handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.9
                        final /* synthetic */ Typeface val$typeface;

                        AnonymousClass9(Typeface typefaceBuildTypeface2) {
                            typeface = typefaceBuildTypeface2;
                        }

                        @Override // java.lang.Runnable
                        public void run() {
                            fontRequestCallback.onTypefaceRetrieved(typeface);
                        }
                    });
                }
            } catch (PackageManager.NameNotFoundException unused) {
                handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.1
                    AnonymousClass1() {
                    }

                    @Override // java.lang.Runnable
                    public void run() {
                        fontRequestCallback.onTypefaceRequestFailed(-1);
                    }
                });
            }
        }

        /* renamed from: androidx.core.provider.FontsContractCompat$4$1 */
        class AnonymousClass1 implements Runnable {
            AnonymousClass1() {
            }

            @Override // java.lang.Runnable
            public void run() {
                fontRequestCallback.onTypefaceRequestFailed(-1);
            }
        }

        /* renamed from: androidx.core.provider.FontsContractCompat$4$2 */
        class AnonymousClass2 implements Runnable {
            AnonymousClass2() {
            }

            @Override // java.lang.Runnable
            public void run() {
                fontRequestCallback.onTypefaceRequestFailed(-2);
            }
        }

        /* renamed from: androidx.core.provider.FontsContractCompat$4$3 */
        class AnonymousClass3 implements Runnable {
            AnonymousClass3() {
            }

            @Override // java.lang.Runnable
            public void run() {
                fontRequestCallback.onTypefaceRequestFailed(-3);
            }
        }

        /* renamed from: androidx.core.provider.FontsContractCompat$4$4 */
        class AnonymousClass4 implements Runnable {
            AnonymousClass4() {
            }

            @Override // java.lang.Runnable
            public void run() {
                fontRequestCallback.onTypefaceRequestFailed(-3);
            }
        }

        /* renamed from: androidx.core.provider.FontsContractCompat$4$5 */
        class AnonymousClass5 implements Runnable {
            AnonymousClass5() {
            }

            @Override // java.lang.Runnable
            public void run() {
                fontRequestCallback.onTypefaceRequestFailed(1);
            }
        }

        /* renamed from: androidx.core.provider.FontsContractCompat$4$6 */
        class AnonymousClass6 implements Runnable {
            AnonymousClass6() {
            }

            @Override // java.lang.Runnable
            public void run() {
                fontRequestCallback.onTypefaceRequestFailed(-3);
            }
        }

        /* renamed from: androidx.core.provider.FontsContractCompat$4$7 */
        class AnonymousClass7 implements Runnable {
            final /* synthetic */ int val$resultCode;

            AnonymousClass7(int resultCode2) {
                i = resultCode2;
            }

            @Override // java.lang.Runnable
            public void run() {
                fontRequestCallback.onTypefaceRequestFailed(i);
            }
        }

        /* renamed from: androidx.core.provider.FontsContractCompat$4$8 */
        class AnonymousClass8 implements Runnable {
            AnonymousClass8() {
            }

            @Override // java.lang.Runnable
            public void run() {
                fontRequestCallback.onTypefaceRequestFailed(-3);
            }
        }

        /* renamed from: androidx.core.provider.FontsContractCompat$4$9 */
        class AnonymousClass9 implements Runnable {
            final /* synthetic */ Typeface val$typeface;

            AnonymousClass9(Typeface typefaceBuildTypeface2) {
                typeface = typefaceBuildTypeface2;
            }

            @Override // java.lang.Runnable
            public void run() {
                fontRequestCallback.onTypefaceRetrieved(typeface);
            }
        }
    }

    private static void requestFontInternal(Context context, FontRequest fontRequest, FontRequestCallback fontRequestCallback, Handler handler) {
        handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4
            final /* synthetic */ Context val$appContext;
            final /* synthetic */ FontRequestCallback val$callback;
            final /* synthetic */ Handler val$callerThreadHandler;
            final /* synthetic */ FontRequest val$request;

            RunnableC01774(Context context2, FontRequest fontRequest2, Handler handler2, FontRequestCallback fontRequestCallback2) {
                context = context2;
                fontRequest = fontRequest2;
                handler = handler2;
                fontRequestCallback = fontRequestCallback2;
            }

            @Override // java.lang.Runnable
            public void run() {
                try {
                    FontFamilyResult fontFamilyResultFetchFonts = FontsContractCompat.fetchFonts(context, null, fontRequest);
                    if (fontFamilyResultFetchFonts.getStatusCode() != 0) {
                        int statusCode = fontFamilyResultFetchFonts.getStatusCode();
                        if (statusCode == 1) {
                            handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.2
                                AnonymousClass2() {
                                }

                                @Override // java.lang.Runnable
                                public void run() {
                                    fontRequestCallback.onTypefaceRequestFailed(-2);
                                }
                            });
                            return;
                        } else if (statusCode == 2) {
                            handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.3
                                AnonymousClass3() {
                                }

                                @Override // java.lang.Runnable
                                public void run() {
                                    fontRequestCallback.onTypefaceRequestFailed(-3);
                                }
                            });
                            return;
                        } else {
                            handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.4
                                AnonymousClass4() {
                                }

                                @Override // java.lang.Runnable
                                public void run() {
                                    fontRequestCallback.onTypefaceRequestFailed(-3);
                                }
                            });
                            return;
                        }
                    }
                    FontInfo[] fonts = fontFamilyResultFetchFonts.getFonts();
                    if (fonts == null || fonts.length == 0) {
                        handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.5
                            AnonymousClass5() {
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                fontRequestCallback.onTypefaceRequestFailed(1);
                            }
                        });
                        return;
                    }
                    for (FontInfo fontInfo : fonts) {
                        if (fontInfo.getResultCode() != 0) {
                            int resultCode2 = fontInfo.getResultCode();
                            if (resultCode2 < 0) {
                                handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.6
                                    AnonymousClass6() {
                                    }

                                    @Override // java.lang.Runnable
                                    public void run() {
                                        fontRequestCallback.onTypefaceRequestFailed(-3);
                                    }
                                });
                                return;
                            } else {
                                handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.7
                                    final /* synthetic */ int val$resultCode;

                                    AnonymousClass7(int resultCode22) {
                                        i = resultCode22;
                                    }

                                    @Override // java.lang.Runnable
                                    public void run() {
                                        fontRequestCallback.onTypefaceRequestFailed(i);
                                    }
                                });
                                return;
                            }
                        }
                    }
                    Typeface typefaceBuildTypeface2 = FontsContractCompat.buildTypeface(context, null, fonts);
                    if (typefaceBuildTypeface2 == null) {
                        handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.8
                            AnonymousClass8() {
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                fontRequestCallback.onTypefaceRequestFailed(-3);
                            }
                        });
                    } else {
                        handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.9
                            final /* synthetic */ Typeface val$typeface;

                            AnonymousClass9(Typeface typefaceBuildTypeface22) {
                                typeface = typefaceBuildTypeface22;
                            }

                            @Override // java.lang.Runnable
                            public void run() {
                                fontRequestCallback.onTypefaceRetrieved(typeface);
                            }
                        });
                    }
                } catch (PackageManager.NameNotFoundException unused) {
                    handler.post(new Runnable() { // from class: androidx.core.provider.FontsContractCompat.4.1
                        AnonymousClass1() {
                        }

                        @Override // java.lang.Runnable
                        public void run() {
                            fontRequestCallback.onTypefaceRequestFailed(-1);
                        }
                    });
                }
            }

            /* renamed from: androidx.core.provider.FontsContractCompat$4$1 */
            class AnonymousClass1 implements Runnable {
                AnonymousClass1() {
                }

                @Override // java.lang.Runnable
                public void run() {
                    fontRequestCallback.onTypefaceRequestFailed(-1);
                }
            }

            /* renamed from: androidx.core.provider.FontsContractCompat$4$2 */
            class AnonymousClass2 implements Runnable {
                AnonymousClass2() {
                }

                @Override // java.lang.Runnable
                public void run() {
                    fontRequestCallback.onTypefaceRequestFailed(-2);
                }
            }

            /* renamed from: androidx.core.provider.FontsContractCompat$4$3 */
            class AnonymousClass3 implements Runnable {
                AnonymousClass3() {
                }

                @Override // java.lang.Runnable
                public void run() {
                    fontRequestCallback.onTypefaceRequestFailed(-3);
                }
            }

            /* renamed from: androidx.core.provider.FontsContractCompat$4$4 */
            class AnonymousClass4 implements Runnable {
                AnonymousClass4() {
                }

                @Override // java.lang.Runnable
                public void run() {
                    fontRequestCallback.onTypefaceRequestFailed(-3);
                }
            }

            /* renamed from: androidx.core.provider.FontsContractCompat$4$5 */
            class AnonymousClass5 implements Runnable {
                AnonymousClass5() {
                }

                @Override // java.lang.Runnable
                public void run() {
                    fontRequestCallback.onTypefaceRequestFailed(1);
                }
            }

            /* renamed from: androidx.core.provider.FontsContractCompat$4$6 */
            class AnonymousClass6 implements Runnable {
                AnonymousClass6() {
                }

                @Override // java.lang.Runnable
                public void run() {
                    fontRequestCallback.onTypefaceRequestFailed(-3);
                }
            }

            /* renamed from: androidx.core.provider.FontsContractCompat$4$7 */
            class AnonymousClass7 implements Runnable {
                final /* synthetic */ int val$resultCode;

                AnonymousClass7(int resultCode22) {
                    i = resultCode22;
                }

                @Override // java.lang.Runnable
                public void run() {
                    fontRequestCallback.onTypefaceRequestFailed(i);
                }
            }

            /* renamed from: androidx.core.provider.FontsContractCompat$4$8 */
            class AnonymousClass8 implements Runnable {
                AnonymousClass8() {
                }

                @Override // java.lang.Runnable
                public void run() {
                    fontRequestCallback.onTypefaceRequestFailed(-3);
                }
            }

            /* renamed from: androidx.core.provider.FontsContractCompat$4$9 */
            class AnonymousClass9 implements Runnable {
                final /* synthetic */ Typeface val$typeface;

                AnonymousClass9(Typeface typefaceBuildTypeface22) {
                    typeface = typefaceBuildTypeface22;
                }

                @Override // java.lang.Runnable
                public void run() {
                    fontRequestCallback.onTypefaceRetrieved(typeface);
                }
            }
        });
    }

    public static Typeface buildTypeface(Context context, CancellationSignal cancellationSignal, FontInfo[] fontInfoArr) {
        return TypefaceCompat.createFromFontInfo(context, cancellationSignal, fontInfoArr, 0);
    }

    public static Map<Uri, ByteBuffer> prepareFontData(Context context, FontInfo[] fontInfoArr, CancellationSignal cancellationSignal) {
        HashMap map = new HashMap();
        for (FontInfo fontInfo : fontInfoArr) {
            if (fontInfo.getResultCode() == 0) {
                Uri uri = fontInfo.getUri();
                if (!map.containsKey(uri)) {
                    map.put(uri, TypefaceCompatUtil.mmap(context, cancellationSignal, uri));
                }
            }
        }
        return Collections.unmodifiableMap(map);
    }

    public static FontFamilyResult fetchFonts(Context context, CancellationSignal cancellationSignal, FontRequest fontRequest) throws PackageManager.NameNotFoundException {
        ProviderInfo provider = getProvider(context.getPackageManager(), fontRequest, context.getResources());
        if (provider == null) {
            return new FontFamilyResult(1, null);
        }
        return new FontFamilyResult(0, getFontFromProvider(context, fontRequest, provider.authority, cancellationSignal));
    }

    public static ProviderInfo getProvider(PackageManager packageManager, FontRequest fontRequest, Resources resources) throws PackageManager.NameNotFoundException {
        String providerAuthority = fontRequest.getProviderAuthority();
        ProviderInfo providerInfoResolveContentProvider = packageManager.resolveContentProvider(providerAuthority, 0);
        if (providerInfoResolveContentProvider == null) {
            throw new PackageManager.NameNotFoundException("No package found for authority: " + providerAuthority);
        }
        if (!providerInfoResolveContentProvider.packageName.equals(fontRequest.getProviderPackage())) {
            throw new PackageManager.NameNotFoundException("Found content provider " + providerAuthority + ", but package was not " + fontRequest.getProviderPackage());
        }
        List<byte[]> listConvertToByteArrayList = convertToByteArrayList(packageManager.getPackageInfo(providerInfoResolveContentProvider.packageName, 64).signatures);
        Collections.sort(listConvertToByteArrayList, sByteArrayComparator);
        List<List<byte[]>> certificates = getCertificates(fontRequest, resources);
        for (int i = 0; i < certificates.size(); i++) {
            ArrayList arrayList = new ArrayList(certificates.get(i));
            Collections.sort(arrayList, sByteArrayComparator);
            if (equalsByteArrayList(listConvertToByteArrayList, arrayList)) {
                return providerInfoResolveContentProvider;
            }
        }
        return null;
    }

    private static List<List<byte[]>> getCertificates(FontRequest fontRequest, Resources resources) {
        if (fontRequest.getCertificates() != null) {
            return fontRequest.getCertificates();
        }
        return FontResourcesParserCompat.readCerts(resources, fontRequest.getCertificatesArrayResId());
    }

    /* renamed from: androidx.core.provider.FontsContractCompat$5 */
    class C01785 implements Comparator<byte[]> {
        C01785() {
        }

        @Override // java.util.Comparator
        public int compare(byte[] bArr, byte[] bArr2) {
            int length;
            int length2;
            if (bArr.length != bArr2.length) {
                length = bArr.length;
                length2 = bArr2.length;
            } else {
                for (int i = 0; i < bArr.length; i++) {
                    if (bArr[i] != bArr2[i]) {
                        length = bArr[i];
                        length2 = bArr2[i];
                    }
                }
                return 0;
            }
            return length - length2;
        }
    }

    private static boolean equalsByteArrayList(List<byte[]> list, List<byte[]> list2) {
        if (list.size() != list2.size()) {
            return false;
        }
        for (int i = 0; i < list.size(); i++) {
            if (!Arrays.equals(list.get(i), list2.get(i))) {
                return false;
            }
        }
        return true;
    }

    private static List<byte[]> convertToByteArrayList(Signature[] signatureArr) {
        ArrayList arrayList = new ArrayList();
        for (Signature signature : signatureArr) {
            arrayList.add(signature.toByteArray());
        }
        return arrayList;
    }

    static FontInfo[] getFontFromProvider(Context context, FontRequest fontRequest, String str, CancellationSignal cancellationSignal) {
        Uri uriWithAppendedId;
        ArrayList arrayList = new ArrayList();
        Uri uriBuild = new Uri.Builder().scheme("content").authority(str).build();
        Uri uriBuild2 = new Uri.Builder().scheme("content").authority(str).appendPath("file").build();
        Cursor cursorQuery = null;
        try {
            if (Build.VERSION.SDK_INT > 16) {
                cursorQuery = context.getContentResolver().query(uriBuild, new String[]{"_id", Columns.FILE_ID, Columns.TTC_INDEX, Columns.VARIATION_SETTINGS, Columns.WEIGHT, Columns.ITALIC, Columns.RESULT_CODE}, "query = ?", new String[]{fontRequest.getQuery()}, null, cancellationSignal);
            } else {
                cursorQuery = context.getContentResolver().query(uriBuild, new String[]{"_id", Columns.FILE_ID, Columns.TTC_INDEX, Columns.VARIATION_SETTINGS, Columns.WEIGHT, Columns.ITALIC, Columns.RESULT_CODE}, "query = ?", new String[]{fontRequest.getQuery()}, null);
            }
            if (cursorQuery != null && cursorQuery.getCount() > 0) {
                int columnIndex = cursorQuery.getColumnIndex(Columns.RESULT_CODE);
                ArrayList arrayList2 = new ArrayList();
                int columnIndex2 = cursorQuery.getColumnIndex("_id");
                int columnIndex3 = cursorQuery.getColumnIndex(Columns.FILE_ID);
                int columnIndex4 = cursorQuery.getColumnIndex(Columns.TTC_INDEX);
                int columnIndex5 = cursorQuery.getColumnIndex(Columns.WEIGHT);
                int columnIndex6 = cursorQuery.getColumnIndex(Columns.ITALIC);
                while (cursorQuery.moveToNext()) {
                    int i = columnIndex != -1 ? cursorQuery.getInt(columnIndex) : 0;
                    int i2 = columnIndex4 != -1 ? cursorQuery.getInt(columnIndex4) : 0;
                    if (columnIndex3 == -1) {
                        uriWithAppendedId = ContentUris.withAppendedId(uriBuild, cursorQuery.getLong(columnIndex2));
                    } else {
                        uriWithAppendedId = ContentUris.withAppendedId(uriBuild2, cursorQuery.getLong(columnIndex3));
                    }
                    arrayList2.add(new FontInfo(uriWithAppendedId, i2, columnIndex5 != -1 ? cursorQuery.getInt(columnIndex5) : 400, columnIndex6 != -1 && cursorQuery.getInt(columnIndex6) == 1, i));
                }
                arrayList = arrayList2;
            }
            return (FontInfo[]) arrayList.toArray(new FontInfo[0]);
        } finally {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
        }
    }
}
