package com.dnake.desktop.component;

import com.dnake.desktop.bean.ReturnData;
import com.landleaf.smarthome.util.JsonUtils;
import com.yanzhenjie.andserver.error.BasicException;
import com.yanzhenjie.andserver.framework.ExceptionResolver;
import com.yanzhenjie.andserver.framework.body.JsonBody;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.HttpResponse;

/* loaded from: classes.dex */
public class AppExceptionResolver implements ExceptionResolver {
    @Override // com.yanzhenjie.andserver.framework.ExceptionResolver
    public void onResolve(HttpRequest httpRequest, HttpResponse httpResponse, Throwable th) {
        th.printStackTrace();
        if (th instanceof BasicException) {
            httpResponse.setStatus(((BasicException) th).getStatusCode());
        } else {
            httpResponse.setStatus(500);
        }
        httpResponse.setBody(new JsonBody(failedJson(httpResponse.getStatus(), th.getMessage())));
    }

    String failedJson(int i, String str) {
        ReturnData returnData = new ReturnData();
        returnData.setSuccess(false);
        returnData.setErrorCode(i);
        returnData.setErrorMsg(str);
        return JsonUtils.objToJson(returnData);
    }
}
