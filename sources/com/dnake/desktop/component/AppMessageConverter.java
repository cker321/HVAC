package com.dnake.desktop.component;

import com.dnake.desktop.bean.ReturnData;
import com.landleaf.smarthome.util.JsonUtils;
import com.yanzhenjie.andserver.framework.MessageConverter;
import com.yanzhenjie.andserver.framework.body.JsonBody;
import com.yanzhenjie.andserver.http.ResponseBody;
import com.yanzhenjie.andserver.util.IOUtils;
import com.yanzhenjie.andserver.util.MediaType;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.nio.charset.Charset;

/* loaded from: classes.dex */
public class AppMessageConverter implements MessageConverter {
    @Override // com.yanzhenjie.andserver.framework.MessageConverter
    public ResponseBody convert(Object obj, MediaType mediaType) {
        return new JsonBody(successfulJson(obj));
    }

    @Override // com.yanzhenjie.andserver.framework.MessageConverter
    public <T> T convert(InputStream inputStream, MediaType mediaType, Type type) throws IOException {
        Charset charset = mediaType == null ? null : mediaType.getCharset();
        if (charset == null) {
            return (T) JsonUtils.jsonToObj(IOUtils.toString(inputStream), type);
        }
        return (T) JsonUtils.jsonToObj(IOUtils.toString(inputStream, charset), type);
    }

    public String successfulJson(Object obj) {
        ReturnData returnData = new ReturnData();
        returnData.setSuccess(true);
        returnData.setErrorCode(200);
        returnData.setData(obj);
        return JsonUtils.objToJson(returnData);
    }
}
