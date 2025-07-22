package com.ihsanbal.logging;

import com.ihsanbal.logging.LoggingInterceptor;
import java.io.IOException;
import java.util.List;
import okhttp3.Request;
import okhttp3.RequestBody;
import okio.Buffer;
import org.eclipse.paho.client.mqttv3.MqttTopic;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
class Printer {
    private static final String BODY_TAG = "Body:";
    private static final String CENTER_LINE = "├ ";
    private static final String CORNER_BOTTOM = "└ ";
    private static final String CORNER_UP = "┌ ";
    private static final String DEFAULT_LINE = "│ ";
    private static final String END_LINE = "└───────────────────────────────────────────────────────────────────────────────────────";
    private static final String HEADERS_TAG = "Headers:";
    private static final int JSON_INDENT = 3;
    private static final String METHOD_TAG = "Method: @";

    /* renamed from: N */
    private static final String f132N = "\n";
    private static final String[] OMITTED_REQUEST;
    private static final String[] OMITTED_RESPONSE;
    private static final String OOM_OMITTED;
    private static final String RECEIVED_TAG = "Received in: ";
    private static final String REQUEST_UP_LINE = "┌────── Request ────────────────────────────────────────────────────────────────────────";
    private static final String RESPONSE_UP_LINE = "┌────── Response ───────────────────────────────────────────────────────────────────────";
    private static final String STATUS_CODE_TAG = "Status Code: ";

    /* renamed from: T */
    private static final String f133T = "\t";
    private static final String URL_TAG = "URL: ";
    private static final String LINE_SEPARATOR = System.getProperty("line.separator");
    private static final String DOUBLE_SEPARATOR = LINE_SEPARATOR + LINE_SEPARATOR;

    static {
        String str = LINE_SEPARATOR;
        OMITTED_RESPONSE = new String[]{str, "Omitted response body"};
        OMITTED_REQUEST = new String[]{str, "Omitted request body"};
        OOM_OMITTED = LINE_SEPARATOR + "Output omitted because of Object size.";
    }

    protected Printer() {
        throw new UnsupportedOperationException();
    }

    private static boolean isEmpty(String str) {
        return TextUtils.isEmpty(str) || "\n".equals(str) || f133T.equals(str) || TextUtils.isEmpty(str.trim());
    }

    static void printJsonRequest(LoggingInterceptor.Builder builder, Request request) {
        String str = LINE_SEPARATOR + BODY_TAG + LINE_SEPARATOR + bodyToString(request);
        String tag = builder.getTag(true);
        if (builder.getLogger() == null) {
            C0643I.log(builder.getType(), tag, REQUEST_UP_LINE, builder.isLogHackEnable());
        }
        logLines(builder.getType(), tag, new String[]{URL_TAG + request.url()}, builder.getLogger(), false, builder.isLogHackEnable());
        logLines(builder.getType(), tag, getRequest(request, builder.getLevel()), builder.getLogger(), true, builder.isLogHackEnable());
        if (builder.getLevel() == Level.BASIC || builder.getLevel() == Level.BODY) {
            logLines(builder.getType(), tag, str.split(LINE_SEPARATOR), builder.getLogger(), true, builder.isLogHackEnable());
        }
        if (builder.getLogger() == null) {
            C0643I.log(builder.getType(), tag, END_LINE, builder.isLogHackEnable());
        }
    }

    static void printJsonResponse(LoggingInterceptor.Builder builder, long j, boolean z, int i, String str, String str2, List<String> list, String str3, String str4) {
        String str5 = LINE_SEPARATOR + BODY_TAG + LINE_SEPARATOR + getJsonString(str2);
        String tag = builder.getTag(false);
        String[] strArr = {URL_TAG + str4, "\n"};
        String[] response = getResponse(str, j, i, z, builder.getLevel(), list, str3);
        if (builder.getLogger() == null) {
            C0643I.log(builder.getType(), tag, RESPONSE_UP_LINE, builder.isLogHackEnable());
        }
        logLines(builder.getType(), tag, strArr, builder.getLogger(), true, builder.isLogHackEnable());
        logLines(builder.getType(), tag, response, builder.getLogger(), true, builder.isLogHackEnable());
        if (builder.getLevel() == Level.BASIC || builder.getLevel() == Level.BODY) {
            logLines(builder.getType(), tag, str5.split(LINE_SEPARATOR), builder.getLogger(), true, builder.isLogHackEnable());
        }
        if (builder.getLogger() == null) {
            C0643I.log(builder.getType(), tag, END_LINE, builder.isLogHackEnable());
        }
    }

    static void printFileRequest(LoggingInterceptor.Builder builder, Request request) {
        String tag = builder.getTag(true);
        if (builder.getLogger() == null) {
            C0643I.log(builder.getType(), tag, REQUEST_UP_LINE, builder.isLogHackEnable());
        }
        logLines(builder.getType(), tag, new String[]{URL_TAG + request.url()}, builder.getLogger(), false, builder.isLogHackEnable());
        logLines(builder.getType(), tag, getRequest(request, builder.getLevel()), builder.getLogger(), true, builder.isLogHackEnable());
        if (builder.getLevel() == Level.BASIC || builder.getLevel() == Level.BODY) {
            logLines(builder.getType(), tag, OMITTED_REQUEST, builder.getLogger(), true, builder.isLogHackEnable());
        }
        if (builder.getLogger() == null) {
            C0643I.log(builder.getType(), tag, END_LINE, builder.isLogHackEnable());
        }
    }

    static void printFileResponse(LoggingInterceptor.Builder builder, long j, boolean z, int i, String str, List<String> list, String str2) {
        String tag = builder.getTag(false);
        if (builder.getLogger() == null) {
            C0643I.log(builder.getType(), tag, RESPONSE_UP_LINE, builder.isLogHackEnable());
        }
        logLines(builder.getType(), tag, getResponse(str, j, i, z, builder.getLevel(), list, str2), builder.getLogger(), true, builder.isLogHackEnable());
        logLines(builder.getType(), tag, OMITTED_RESPONSE, builder.getLogger(), true, builder.isLogHackEnable());
        if (builder.getLogger() == null) {
            C0643I.log(builder.getType(), tag, END_LINE, builder.isLogHackEnable());
        }
    }

    private static String[] getRequest(Request request, Level level) {
        String string = request.headers().toString();
        boolean z = level == Level.HEADERS || level == Level.BASIC;
        StringBuilder sb = new StringBuilder();
        sb.append(METHOD_TAG);
        sb.append(request.method());
        sb.append(DOUBLE_SEPARATOR);
        String str = "";
        if (!isEmpty(string) && z) {
            str = HEADERS_TAG + LINE_SEPARATOR + dotHeaders(string);
        }
        sb.append(str);
        return sb.toString().split(LINE_SEPARATOR);
    }

    private static String[] getResponse(String str, long j, int i, boolean z, Level level, List<String> list, String str2) {
        String str3;
        boolean z2 = level == Level.HEADERS || level == Level.BASIC;
        String strSlashSegments = slashSegments(list);
        StringBuilder sb = new StringBuilder();
        String str4 = "";
        if (TextUtils.isEmpty(strSlashSegments)) {
            str3 = "";
        } else {
            str3 = strSlashSegments + " - ";
        }
        sb.append(str3);
        sb.append("is success : ");
        sb.append(z);
        sb.append(" - ");
        sb.append(RECEIVED_TAG);
        sb.append(j);
        sb.append("ms");
        sb.append(DOUBLE_SEPARATOR);
        sb.append(STATUS_CODE_TAG);
        sb.append(i);
        sb.append(" / ");
        sb.append(str2);
        sb.append(DOUBLE_SEPARATOR);
        if (!isEmpty(str) && z2) {
            str4 = HEADERS_TAG + LINE_SEPARATOR + dotHeaders(str);
        }
        sb.append(str4);
        return sb.toString().split(LINE_SEPARATOR);
    }

    private static String slashSegments(List<String> list) {
        StringBuilder sb = new StringBuilder();
        for (String str : list) {
            sb.append(MqttTopic.TOPIC_LEVEL_SEPARATOR);
            sb.append(str);
        }
        return sb.toString();
    }

    private static String dotHeaders(String str) {
        String str2;
        String[] strArrSplit = str.split(LINE_SEPARATOR);
        StringBuilder sb = new StringBuilder();
        int i = 0;
        if (strArrSplit.length > 1) {
            while (i < strArrSplit.length) {
                if (i == 0) {
                    str2 = CORNER_UP;
                } else {
                    str2 = i == strArrSplit.length - 1 ? CORNER_BOTTOM : CENTER_LINE;
                }
                sb.append(str2);
                sb.append(strArrSplit[i]);
                sb.append("\n");
                i++;
            }
        } else {
            int length = strArrSplit.length;
            while (i < length) {
                String str3 = strArrSplit[i];
                sb.append("─ ");
                sb.append(str3);
                sb.append("\n");
                i++;
            }
        }
        return sb.toString();
    }

    private static void logLines(int i, String str, String[] strArr, Logger logger, boolean z, boolean z2) {
        for (String str2 : strArr) {
            int length = str2.length();
            int i2 = z ? 110 : length;
            int i3 = 0;
            while (i3 <= length / i2) {
                int i4 = i3 * i2;
                i3++;
                int length2 = i3 * i2;
                if (length2 > str2.length()) {
                    length2 = str2.length();
                }
                if (logger == null) {
                    C0643I.log(i, str, DEFAULT_LINE + str2.substring(i4, length2), z2);
                } else {
                    logger.log(i, str, str2.substring(i4, length2));
                }
            }
        }
    }

    private static String bodyToString(Request request) {
        try {
            Request requestBuild = request.newBuilder().build();
            Buffer buffer = new Buffer();
            RequestBody requestBodyBody = requestBuild.body();
            if (requestBodyBody == null) {
                return "";
            }
            requestBodyBody.writeTo(buffer);
            return getJsonString(buffer.readUtf8());
        } catch (IOException e) {
            return "{\"err\": \"" + e.getMessage() + "\"}";
        }
    }

    static String getJsonString(String str) throws JSONException {
        try {
            if (str.startsWith("{")) {
                str = new JSONObject(str).toString(3);
            } else if (str.startsWith("[")) {
                str = new JSONArray(str).toString(3);
            }
            return str;
        } catch (OutOfMemoryError unused) {
            return OOM_OMITTED;
        } catch (JSONException unused2) {
            return str;
        }
    }
}
