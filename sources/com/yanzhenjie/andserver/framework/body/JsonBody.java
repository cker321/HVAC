package com.yanzhenjie.andserver.framework.body;

import com.yanzhenjie.andserver.util.MediaType;
import org.json.JSONObject;

/* loaded from: classes.dex */
public class JsonBody extends StringBody {
    public JsonBody(String str) {
        super(str);
    }

    public JsonBody(JSONObject jSONObject) {
        super(jSONObject.toString());
    }

    @Override // com.yanzhenjie.andserver.framework.body.StringBody, com.yanzhenjie.andserver.http.ResponseBody
    public MediaType contentType() {
        return MediaType.APPLICATION_JSON_UTF8;
    }
}
