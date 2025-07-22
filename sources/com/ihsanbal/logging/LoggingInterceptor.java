package com.ihsanbal.logging;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import okhttp3.HttpUrl;
import okhttp3.Interceptor;
import okhttp3.MediaType;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import okhttp3.ResponseBody;
import org.json.JSONException;

/* loaded from: classes.dex */
public class LoggingInterceptor implements Interceptor {
    private final Builder builder;
    private final boolean isDebug;

    private LoggingInterceptor(Builder builder) {
        this.builder = builder;
        this.isDebug = builder.isDebug;
    }

    @Override // okhttp3.Interceptor
    public Response intercept(Interceptor.Chain chain) throws JSONException, InterruptedException, IOException {
        Response responseBuild;
        Request request = chain.request();
        HashMap<String, String> headers = this.builder.getHeaders();
        if (headers.size() > 0) {
            Request.Builder builderNewBuilder = request.newBuilder();
            for (String str : headers.keySet()) {
                builderNewBuilder.addHeader(str, headers.get(str));
            }
            request = builderNewBuilder.build();
        }
        HashMap<String, String> httpUrl = this.builder.getHttpUrl();
        if (httpUrl.size() > 0) {
            HttpUrl.Builder builderNewBuilder2 = request.url().newBuilder(request.url().toString());
            for (String str2 : httpUrl.keySet()) {
                builderNewBuilder2.addQueryParameter(str2, httpUrl.get(str2));
            }
            request = request.newBuilder().url(builderNewBuilder2.build()).build();
        }
        Request request2 = request;
        if (!this.isDebug || this.builder.getLevel() == Level.NONE) {
            return chain.proceed(request2);
        }
        RequestBody requestBodyBody = request2.body();
        String strSubtype = (requestBodyBody == null || requestBodyBody.contentType() == null) ? null : requestBodyBody.contentType().subtype();
        Executor executor = this.builder.executor;
        if (isNotFileRequest(strSubtype)) {
            if (executor != null) {
                executor.execute(createPrintJsonRequestRunnable(this.builder, request2));
            } else {
                Printer.printJsonRequest(this.builder, request2);
            }
        } else if (executor != null) {
            executor.execute(createFileRequestRunnable(this.builder, request2));
        } else {
            Printer.printFileRequest(this.builder, request2);
        }
        long jNanoTime = System.nanoTime();
        if (!this.builder.isMockEnabled) {
            responseBuild = chain.proceed(request2);
        } else {
            try {
                TimeUnit.MILLISECONDS.sleep(this.builder.sleepMs);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            responseBuild = new Response.Builder().body(ResponseBody.create(MediaType.parse(com.yanzhenjie.andserver.util.MediaType.APPLICATION_JSON_VALUE), this.builder.listener.getJsonResponse(request2))).request(chain.request()).protocol(Protocol.HTTP_2).message("Mock").code(200).build();
        }
        long millis = TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - jNanoTime);
        List<String> listEncodedPathSegments = request2.url().encodedPathSegments();
        String string = responseBuild.headers().toString();
        int iCode = responseBuild.code();
        boolean zIsSuccessful = responseBuild.isSuccessful();
        String strMessage = responseBuild.message();
        ResponseBody responseBodyBody = responseBuild.body();
        MediaType mediaTypeContentType = responseBodyBody.contentType();
        if (!isNotFileRequest(mediaTypeContentType != null ? mediaTypeContentType.subtype() : null)) {
            if (executor != null) {
                executor.execute(createFileResponseRunnable(this.builder, millis, zIsSuccessful, iCode, string, listEncodedPathSegments, strMessage));
            } else {
                Printer.printFileResponse(this.builder, millis, zIsSuccessful, iCode, string, listEncodedPathSegments, strMessage);
            }
            return responseBuild;
        }
        String jsonString = Printer.getJsonString(responseBodyBody.string());
        String string2 = responseBuild.request().url().toString();
        if (executor != null) {
            executor.execute(createPrintJsonResponseRunnable(this.builder, millis, zIsSuccessful, iCode, string, jsonString, listEncodedPathSegments, strMessage, string2));
        } else {
            Printer.printJsonResponse(this.builder, millis, zIsSuccessful, iCode, string, jsonString, listEncodedPathSegments, strMessage, string2);
        }
        return responseBuild.newBuilder().body(ResponseBody.create(mediaTypeContentType, jsonString)).build();
    }

    private boolean isNotFileRequest(String str) {
        return str != null && (str.contains("json") || str.contains("xml") || str.contains("plain") || str.contains("html"));
    }

    private static Runnable createPrintJsonRequestRunnable(final Builder builder, final Request request) {
        return new Runnable() { // from class: com.ihsanbal.logging.LoggingInterceptor.1
            @Override // java.lang.Runnable
            public void run() {
                Printer.printJsonRequest(builder, request);
            }
        };
    }

    private static Runnable createFileRequestRunnable(final Builder builder, final Request request) {
        return new Runnable() { // from class: com.ihsanbal.logging.LoggingInterceptor.2
            @Override // java.lang.Runnable
            public void run() {
                Printer.printFileRequest(builder, request);
            }
        };
    }

    private static Runnable createPrintJsonResponseRunnable(final Builder builder, final long j, final boolean z, final int i, final String str, final String str2, final List<String> list, final String str3, final String str4) {
        return new Runnable() { // from class: com.ihsanbal.logging.LoggingInterceptor.3
            @Override // java.lang.Runnable
            public void run() {
                Printer.printJsonResponse(builder, j, z, i, str, str2, list, str3, str4);
            }
        };
    }

    private static Runnable createFileResponseRunnable(final Builder builder, final long j, final boolean z, final int i, final String str, final List<String> list, final String str2) {
        return new Runnable() { // from class: com.ihsanbal.logging.LoggingInterceptor.4
            @Override // java.lang.Runnable
            public void run() {
                Printer.printFileResponse(builder, j, z, i, str, list, str2);
            }
        };
    }

    public static class Builder {
        private static String TAG = "LoggingI";
        private Executor executor;
        private boolean isDebug;
        private boolean isMockEnabled;
        private BufferListener listener;
        private Logger logger;
        private String requestTag;
        private String responseTag;
        private long sleepMs;
        private boolean isLogHackEnable = false;
        private int type = 4;
        private Level level = Level.BASIC;
        private final HashMap<String, String> headers = new HashMap<>();
        private final HashMap<String, String> queries = new HashMap<>();

        int getType() {
            return this.type;
        }

        Level getLevel() {
            return this.level;
        }

        public Builder setLevel(Level level) {
            this.level = level;
            return this;
        }

        HashMap<String, String> getHeaders() {
            return this.headers;
        }

        HashMap<String, String> getHttpUrl() {
            return this.queries;
        }

        String getTag(boolean z) {
            return z ? TextUtils.isEmpty(this.requestTag) ? TAG : this.requestTag : TextUtils.isEmpty(this.responseTag) ? TAG : this.responseTag;
        }

        Logger getLogger() {
            return this.logger;
        }

        Executor getExecutor() {
            return this.executor;
        }

        boolean isLogHackEnable() {
            return this.isLogHackEnable;
        }

        public Builder addHeader(String str, String str2) {
            this.headers.put(str, str2);
            return this;
        }

        public Builder addQueryParam(String str, String str2) {
            this.queries.put(str, str2);
            return this;
        }

        public Builder tag(String str) {
            TAG = str;
            return this;
        }

        public Builder request(String str) {
            this.requestTag = str;
            return this;
        }

        public Builder response(String str) {
            this.responseTag = str;
            return this;
        }

        public Builder loggable(boolean z) {
            this.isDebug = z;
            return this;
        }

        public Builder log(int i) {
            this.type = i;
            return this;
        }

        public Builder logger(Logger logger) {
            this.logger = logger;
            return this;
        }

        public Builder executor(Executor executor) {
            this.executor = executor;
            return this;
        }

        public Builder enableMock(boolean z, long j, BufferListener bufferListener) {
            this.isMockEnabled = z;
            this.sleepMs = j;
            this.listener = bufferListener;
            return this;
        }

        public Builder enableAndroidStudio_v3_LogsHack(boolean z) {
            this.isLogHackEnable = z;
            return this;
        }

        public LoggingInterceptor build() {
            return new LoggingInterceptor(this);
        }
    }
}
