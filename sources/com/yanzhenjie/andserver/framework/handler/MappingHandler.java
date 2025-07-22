package com.yanzhenjie.andserver.framework.handler;

import android.text.TextUtils;
import com.yanzhenjie.andserver.framework.ETag;
import com.yanzhenjie.andserver.framework.LastModified;
import com.yanzhenjie.andserver.framework.body.StringBody;
import com.yanzhenjie.andserver.framework.cross.CrossOrigin;
import com.yanzhenjie.andserver.framework.mapping.Addition;
import com.yanzhenjie.andserver.framework.mapping.Mapping;
import com.yanzhenjie.andserver.framework.mapping.Path;
import com.yanzhenjie.andserver.framework.view.BodyView;
import com.yanzhenjie.andserver.framework.view.View;
import com.yanzhenjie.andserver.http.HttpHeaders;
import com.yanzhenjie.andserver.http.HttpMethod;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.HttpResponse;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public abstract class MappingHandler implements MethodHandler {
    private final Addition mAddition;
    private final CrossOrigin mCrossOrigin;
    private final Object mHost;
    private final Mapping mMapping;

    protected abstract View onHandle(HttpRequest httpRequest, HttpResponse httpResponse) throws Throwable;

    public MappingHandler(Object obj, Mapping mapping, Addition addition, CrossOrigin crossOrigin) {
        this.mHost = obj;
        this.mMapping = mapping;
        this.mAddition = addition;
        this.mCrossOrigin = crossOrigin;
    }

    @Override // com.yanzhenjie.andserver.framework.ETag
    public String getETag(HttpRequest httpRequest) throws Throwable {
        Object host = getHost();
        if (host instanceof ETag) {
            return ((ETag) host).getETag(httpRequest);
        }
        return null;
    }

    @Override // com.yanzhenjie.andserver.framework.LastModified
    public long getLastModified(HttpRequest httpRequest) throws Throwable {
        Object host = getHost();
        if (host instanceof LastModified) {
            return ((LastModified) host).getLastModified(httpRequest);
        }
        return -1L;
    }

    @Override // com.yanzhenjie.andserver.framework.handler.MethodHandler
    public Addition getAddition() {
        return this.mAddition;
    }

    @Override // com.yanzhenjie.andserver.framework.handler.MethodHandler
    public CrossOrigin getCrossOrigin() {
        return this.mCrossOrigin;
    }

    @Override // com.yanzhenjie.andserver.framework.handler.MethodHandler
    public Mapping getMapping() {
        return this.mMapping;
    }

    protected Object getHost() {
        return this.mHost;
    }

    protected Map<String, String> getPathVariable(String str) {
        boolean z;
        List<Path.Segment> listPathToList = Path.pathToList(str);
        Iterator<Path.Rule> it = this.mMapping.getPath().getRuleList().iterator();
        while (it.hasNext()) {
            List<Path.Segment> segments = it.next().getSegments();
            if (listPathToList.size() == segments.size()) {
                if (Path.listToPath(segments).equals(str)) {
                    return Collections.emptyMap();
                }
                int i = 0;
                boolean z2 = false;
                while (true) {
                    if (i >= segments.size()) {
                        z = true;
                        break;
                    }
                    Path.Segment segment = segments.get(i);
                    boolean zIsBlurred = segment.isBlurred();
                    z2 = z2 || zIsBlurred;
                    if (!segment.equals(listPathToList.get(i)) && !zIsBlurred) {
                        z = false;
                        break;
                    }
                    i++;
                }
                if (z && z2) {
                    HashMap map = new HashMap();
                    for (int i2 = 0; i2 < segments.size(); i2++) {
                        Path.Segment segment2 = segments.get(i2);
                        if (segment2.isBlurred()) {
                            Path.Segment segment3 = listPathToList.get(i2);
                            String value = segment2.getValue();
                            map.put(value.substring(1, value.length() - 1), segment3.getValue());
                        }
                    }
                    return map;
                }
            }
        }
        return Collections.emptyMap();
    }

    @Override // com.yanzhenjie.andserver.framework.handler.RequestHandler
    public View handle(HttpRequest httpRequest, HttpResponse httpResponse) throws Throwable {
        String header = httpRequest.getHeader(HttpHeaders.ORIGIN);
        if (!TextUtils.isEmpty(header) && this.mCrossOrigin != null) {
            HttpMethod method = httpRequest.getMethod();
            List listAsList = Arrays.asList(this.mCrossOrigin.getMethods());
            if (!listAsList.isEmpty() && !listAsList.contains(method)) {
                return invalidCORS(httpResponse, new HttpMethod[0]);
            }
            httpResponse.setHeader(HttpHeaders.Access_Control_Allow_Origin, header);
            httpResponse.setHeader(HttpHeaders.Access_Control_Allow_Credentials, Boolean.toString(this.mCrossOrigin.isAllowCredentials()));
            httpResponse.setHeader("Vary", HttpHeaders.ORIGIN);
        }
        return onHandle(httpRequest, httpResponse);
    }

    private View invalidCORS(HttpResponse httpResponse, HttpMethod... httpMethodArr) {
        httpResponse.setStatus(403);
        if (httpMethodArr != null && httpMethodArr.length > 0) {
            httpResponse.setHeader("Allow", TextUtils.join(", ", httpMethodArr));
        }
        return new BodyView(new StringBody(OptionsHandler.INVALID_CORS_REQUEST));
    }
}
