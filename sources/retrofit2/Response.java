package retrofit2;

import javax.annotation.Nullable;
import okhttp3.Headers;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.ResponseBody;

/* loaded from: classes.dex */
public final class Response<T> {

    @Nullable
    private final T body;

    @Nullable
    private final ResponseBody errorBody;
    private final okhttp3.Response rawResponse;

    public static <T> Response<T> success(@Nullable T t) {
        return success(t, new Response.Builder().code(200).message("OK").protocol(Protocol.HTTP_1_1).request(new Request.Builder().url("http://localhost/").build()).build());
    }

    public static <T> Response<T> success(@Nullable T t, Headers headers) {
        Utils.checkNotNull(headers, "headers == null");
        return success(t, new Response.Builder().code(200).message("OK").protocol(Protocol.HTTP_1_1).headers(headers).request(new Request.Builder().url("http://localhost/").build()).build());
    }

    public static <T> Response<T> success(@Nullable T t, okhttp3.Response response) {
        Utils.checkNotNull(response, "rawResponse == null");
        if (!response.isSuccessful()) {
            throw new IllegalArgumentException("rawResponse must be successful response");
        }
        return new Response<>(response, t, null);
    }

    public static <T> Response<T> error(int i, ResponseBody responseBody) {
        if (i < 400) {
            throw new IllegalArgumentException("code < 400: " + i);
        }
        return error(responseBody, new Response.Builder().code(i).message("Response.error()").protocol(Protocol.HTTP_1_1).request(new Request.Builder().url("http://localhost/").build()).build());
    }

    public static <T> Response<T> error(ResponseBody responseBody, okhttp3.Response response) {
        Utils.checkNotNull(responseBody, "body == null");
        Utils.checkNotNull(response, "rawResponse == null");
        if (response.isSuccessful()) {
            throw new IllegalArgumentException("rawResponse should not be successful response");
        }
        return new Response<>(response, null, responseBody);
    }

    private Response(okhttp3.Response response, @Nullable T t, @Nullable ResponseBody responseBody) {
        this.rawResponse = response;
        this.body = t;
        this.errorBody = responseBody;
    }

    public okhttp3.Response raw() {
        return this.rawResponse;
    }

    public int code() {
        return this.rawResponse.code();
    }

    public String message() {
        return this.rawResponse.message();
    }

    public Headers headers() {
        return this.rawResponse.headers();
    }

    public boolean isSuccessful() {
        return this.rawResponse.isSuccessful();
    }

    @Nullable
    public T body() {
        return this.body;
    }

    @Nullable
    public ResponseBody errorBody() {
        return this.errorBody;
    }

    public String toString() {
        return this.rawResponse.toString();
    }
}
