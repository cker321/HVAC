package com.yanzhenjie.andserver.framework.view;

import android.text.TextUtils;
import com.yanzhenjie.andserver.error.NotFoundException;
import com.yanzhenjie.andserver.error.ServerInternalException;
import com.yanzhenjie.andserver.framework.MessageConverter;
import com.yanzhenjie.andserver.framework.body.StringBody;
import com.yanzhenjie.andserver.http.HttpContext;
import com.yanzhenjie.andserver.http.HttpHeaders;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.HttpResponse;
import com.yanzhenjie.andserver.http.RequestDispatcher;
import com.yanzhenjie.andserver.http.ResponseBody;
import com.yanzhenjie.andserver.http.StatusCode;
import com.yanzhenjie.andserver.util.MediaType;
import com.yanzhenjie.andserver.util.Patterns;

/* loaded from: classes.dex */
public class ViewResolver implements Patterns, StatusCode, HttpHeaders {
    private MessageConverter mConverter;

    public ViewResolver() {
    }

    public ViewResolver(MessageConverter messageConverter) {
        this.mConverter = messageConverter;
    }

    public void resolve(View view, HttpRequest httpRequest, HttpResponse httpResponse) {
        if (view == null) {
            return;
        }
        Object objOutput = view.output();
        if (view.rest()) {
            resolveRest(objOutput, httpRequest, httpResponse);
        } else {
            resolvePath(objOutput, httpRequest, httpResponse);
        }
    }

    private void resolveRest(Object obj, HttpRequest httpRequest, HttpResponse httpResponse) {
        if (obj instanceof ResponseBody) {
            httpResponse.setBody((ResponseBody) obj);
            return;
        }
        MessageConverter messageConverter = this.mConverter;
        if (messageConverter != null) {
            httpResponse.setBody(messageConverter.convert(obj, obtainProduce(httpRequest)));
            return;
        }
        if (obj == null) {
            httpResponse.setBody(new StringBody(""));
        } else if (obj instanceof String) {
            httpResponse.setBody(new StringBody(obj.toString(), obtainProduce(httpRequest)));
        } else {
            httpResponse.setBody(new StringBody(obj.toString()));
        }
    }

    private MediaType obtainProduce(HttpRequest httpRequest) {
        Object attribute = httpRequest.getAttribute(HttpContext.RESPONSE_PRODUCE_TYPE);
        if (attribute instanceof MediaType) {
            return (MediaType) attribute;
        }
        return null;
    }

    private void resolvePath(Object obj, HttpRequest httpRequest, HttpResponse httpResponse) {
        if (obj instanceof CharSequence) {
            String string = obj.toString();
            if (TextUtils.isEmpty(string)) {
                return;
            }
            if (string.matches(Patterns.REDIRECT)) {
                httpResponse.setStatus(302);
                if (string.length() >= 9) {
                    httpResponse.setHeader("Location", string.substring(9));
                    return;
                }
                return;
            }
            if (string.matches(Patterns.FORWARD)) {
                String strSubstring = string.substring(8);
                RequestDispatcher requestDispatcher = httpRequest.getRequestDispatcher(strSubstring);
                if (requestDispatcher != null) {
                    requestDispatcher.forward(httpRequest, httpResponse);
                    return;
                }
                throw new NotFoundException(strSubstring);
            }
            if (string.matches(PATH)) {
                String str = string + ".html";
                RequestDispatcher requestDispatcher2 = httpRequest.getRequestDispatcher(str);
                if (requestDispatcher2 != null) {
                    requestDispatcher2.forward(httpRequest, httpResponse);
                    return;
                }
                throw new NotFoundException(str);
            }
            throw new NotFoundException(string);
        }
        throw new ServerInternalException(String.format("The return value of [%s] is not supported", obj));
    }
}
