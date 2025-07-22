package com.yanzhenjie.andserver.http;

/* loaded from: classes.dex */
public enum HttpMethod {
    GET("GET"),
    HEAD("HEAD"),
    POST("POST"),
    PUT("PUT"),
    PATCH("PATCH"),
    DELETE("DELETE"),
    OPTIONS("OPTIONS"),
    TRACE("TRACE");

    private String value;

    HttpMethod(String str) {
        this.value = str;
    }

    public String value() {
        return this.value;
    }

    /* renamed from: com.yanzhenjie.andserver.http.HttpMethod$1 */
    static /* synthetic */ class C07341 {
        static final /* synthetic */ int[] $SwitchMap$com$yanzhenjie$andserver$http$HttpMethod;

        static {
            int[] iArr = new int[HttpMethod.values().length];
            $SwitchMap$com$yanzhenjie$andserver$http$HttpMethod = iArr;
            try {
                iArr[HttpMethod.POST.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$yanzhenjie$andserver$http$HttpMethod[HttpMethod.PUT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$yanzhenjie$andserver$http$HttpMethod[HttpMethod.PATCH.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$yanzhenjie$andserver$http$HttpMethod[HttpMethod.DELETE.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    public boolean allowBody() {
        int i = C07341.$SwitchMap$com$yanzhenjie$andserver$http$HttpMethod[ordinal()];
        return i == 1 || i == 2 || i == 3 || i == 4;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0060  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static com.yanzhenjie.andserver.http.HttpMethod reverse(java.lang.String r3) {
        /*
            java.util.Locale r0 = java.util.Locale.ENGLISH
            java.lang.String r3 = r3.toUpperCase(r0)
            int r0 = r3.hashCode()
            r1 = 0
            r2 = 1
            switch(r0) {
                case -531492226: goto L56;
                case 70454: goto L4c;
                case 79599: goto L42;
                case 2213344: goto L38;
                case 2461856: goto L2e;
                case 75900968: goto L24;
                case 80083237: goto L1a;
                case 2012838315: goto L10;
                default: goto Lf;
            }
        Lf:
            goto L60
        L10:
            java.lang.String r0 = "DELETE"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L60
            r0 = 5
            goto L61
        L1a:
            java.lang.String r0 = "TRACE"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L60
            r0 = 7
            goto L61
        L24:
            java.lang.String r0 = "PATCH"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L60
            r0 = 4
            goto L61
        L2e:
            java.lang.String r0 = "POST"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L60
            r0 = 2
            goto L61
        L38:
            java.lang.String r0 = "HEAD"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L60
            r0 = 1
            goto L61
        L42:
            java.lang.String r0 = "PUT"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L60
            r0 = 3
            goto L61
        L4c:
            java.lang.String r0 = "GET"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L60
            r0 = 0
            goto L61
        L56:
            java.lang.String r0 = "OPTIONS"
            boolean r0 = r3.equals(r0)
            if (r0 == 0) goto L60
            r0 = 6
            goto L61
        L60:
            r0 = -1
        L61:
            switch(r0) {
                case 0: goto L89;
                case 1: goto L86;
                case 2: goto L83;
                case 3: goto L80;
                case 4: goto L7d;
                case 5: goto L7a;
                case 6: goto L77;
                case 7: goto L74;
                default: goto L64;
            }
        L64:
            java.lang.Object[] r0 = new java.lang.Object[r2]
            r0[r1] = r3
            java.lang.String r3 = "The value %1$s is not supported."
            java.lang.String r3 = java.lang.String.format(r3, r0)
            java.lang.UnsupportedOperationException r0 = new java.lang.UnsupportedOperationException
            r0.<init>(r3)
            throw r0
        L74:
            com.yanzhenjie.andserver.http.HttpMethod r3 = com.yanzhenjie.andserver.http.HttpMethod.TRACE
            return r3
        L77:
            com.yanzhenjie.andserver.http.HttpMethod r3 = com.yanzhenjie.andserver.http.HttpMethod.OPTIONS
            return r3
        L7a:
            com.yanzhenjie.andserver.http.HttpMethod r3 = com.yanzhenjie.andserver.http.HttpMethod.DELETE
            return r3
        L7d:
            com.yanzhenjie.andserver.http.HttpMethod r3 = com.yanzhenjie.andserver.http.HttpMethod.PATCH
            return r3
        L80:
            com.yanzhenjie.andserver.http.HttpMethod r3 = com.yanzhenjie.andserver.http.HttpMethod.PUT
            return r3
        L83:
            com.yanzhenjie.andserver.http.HttpMethod r3 = com.yanzhenjie.andserver.http.HttpMethod.POST
            return r3
        L86:
            com.yanzhenjie.andserver.http.HttpMethod r3 = com.yanzhenjie.andserver.http.HttpMethod.HEAD
            return r3
        L89:
            com.yanzhenjie.andserver.http.HttpMethod r3 = com.yanzhenjie.andserver.http.HttpMethod.GET
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.yanzhenjie.andserver.http.HttpMethod.reverse(java.lang.String):com.yanzhenjie.andserver.http.HttpMethod");
    }

    @Override // java.lang.Enum
    public String toString() {
        return this.value;
    }
}
