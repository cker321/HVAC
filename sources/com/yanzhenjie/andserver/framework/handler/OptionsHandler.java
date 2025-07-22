package com.yanzhenjie.andserver.framework.handler;

import android.text.TextUtils;
import com.yanzhenjie.andserver.error.NotFoundException;
import com.yanzhenjie.andserver.framework.body.StringBody;
import com.yanzhenjie.andserver.framework.cross.CrossOrigin;
import com.yanzhenjie.andserver.framework.mapping.Addition;
import com.yanzhenjie.andserver.framework.mapping.Mapping;
import com.yanzhenjie.andserver.framework.view.BodyView;
import com.yanzhenjie.andserver.framework.view.View;
import com.yanzhenjie.andserver.http.HttpHeaders;
import com.yanzhenjie.andserver.http.HttpMethod;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.HttpResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

/* loaded from: classes.dex */
public class OptionsHandler implements MethodHandler {
    public static final String INVALID_CORS_REQUEST = "Invalid CORS request.";
    private MethodHandler mHandler;
    private Mapping mMapping;
    private Map<Mapping, RequestHandler> mMappingMap;
    private List<Mapping> mMappings;

    public OptionsHandler(HttpRequest httpRequest, List<Mapping> list, Map<Mapping, RequestHandler> map) {
        this.mMappings = list;
        this.mMappingMap = map;
        this.mMapping = list.get(0);
        String header = httpRequest.getHeader(HttpHeaders.Access_Control_Request_Method);
        if (!TextUtils.isEmpty(header)) {
            Mapping mappingFindMappingByMethod = MappingAdapter.findMappingByMethod(this.mMappings, HttpMethod.reverse(header));
            if (mappingFindMappingByMethod != null) {
                this.mMapping = mappingFindMappingByMethod;
            }
        }
        this.mHandler = (MethodHandler) this.mMappingMap.get(this.mMapping);
    }

    @Override // com.yanzhenjie.andserver.framework.handler.MethodHandler
    public Addition getAddition() {
        return this.mHandler.getAddition();
    }

    @Override // com.yanzhenjie.andserver.framework.handler.MethodHandler
    public CrossOrigin getCrossOrigin() {
        return this.mHandler.getCrossOrigin();
    }

    @Override // com.yanzhenjie.andserver.framework.handler.MethodHandler
    public Mapping getMapping() {
        return this.mMapping;
    }

    @Override // com.yanzhenjie.andserver.framework.handler.RequestHandler
    public View handle(HttpRequest httpRequest, HttpResponse httpResponse) throws Throwable {
        String header = httpRequest.getHeader(HttpHeaders.ORIGIN);
        if (TextUtils.isEmpty(header)) {
            return invalidCORS(httpResponse);
        }
        String header2 = httpRequest.getHeader(HttpHeaders.Access_Control_Request_Method);
        if (TextUtils.isEmpty(header2)) {
            return invalidCORS(httpResponse);
        }
        HttpMethod httpMethodReverse = HttpMethod.reverse(header2);
        Mapping mappingFindMappingByMethod = MappingAdapter.findMappingByMethod(this.mMappings, httpMethodReverse);
        if (mappingFindMappingByMethod == null) {
            return invalidCORS(httpResponse);
        }
        MethodHandler methodHandler = (MethodHandler) this.mMappingMap.get(mappingFindMappingByMethod);
        if (methodHandler == null) {
            throw new NotFoundException();
        }
        CrossOrigin crossOrigin = methodHandler.getCrossOrigin();
        if (crossOrigin == null) {
            return invalidCORS(httpResponse);
        }
        ArrayList arrayList = new ArrayList();
        Collections.addAll(arrayList, crossOrigin.getMethods());
        List<HttpMethod> ruleList = mappingFindMappingByMethod.getMethod().getRuleList();
        if (arrayList.isEmpty()) {
            arrayList.addAll(ruleList);
        }
        if (!arrayList.contains(httpMethodReverse)) {
            return invalidCORS(httpResponse);
        }
        List listAsList = Arrays.asList(crossOrigin.getOrigins());
        if (!listAsList.isEmpty() && !listAsList.contains("*") && !listAsList.contains(header)) {
            return invalidCORS(httpResponse);
        }
        List<String> listAsList2 = Arrays.asList(crossOrigin.getAllowedHeaders());
        ArrayList arrayList2 = new ArrayList();
        String header3 = httpRequest.getHeader(HttpHeaders.Access_Control_Request_Headers);
        ArrayList<String> arrayList3 = new ArrayList();
        if (!TextUtils.isEmpty(header3)) {
            StringTokenizer stringTokenizer = new StringTokenizer(header3, ",");
            while (stringTokenizer.hasMoreTokens()) {
                String strTrim = stringTokenizer.nextToken().trim();
                if (strTrim.length() > 0) {
                    arrayList3.add(strTrim);
                }
            }
        }
        if (listAsList2.contains("*")) {
            if (arrayList3.size() > 0) {
                arrayList2.addAll(arrayList3);
            }
        } else if (listAsList2.size() > 0) {
            if (arrayList3.size() > 0) {
                for (String str : listAsList2) {
                    for (String str2 : arrayList3) {
                        if (str.equalsIgnoreCase(str2)) {
                            arrayList2.add(str2);
                        }
                    }
                }
                if (arrayList2.isEmpty()) {
                    return invalidCORS(httpResponse);
                }
            }
        } else if (arrayList3.size() > 0) {
            arrayList2.addAll(arrayList3);
        }
        String[] exposedHeaders = crossOrigin.getExposedHeaders();
        httpResponse.setHeader(HttpHeaders.Access_Control_Allow_Origin, header);
        httpResponse.setHeader(HttpHeaders.Access_Control_Allow_Methods, TextUtils.join(", ", arrayList));
        if (arrayList2.size() > 0) {
            httpResponse.setHeader(HttpHeaders.Access_Control_Allow_Headers, TextUtils.join(", ", arrayList2));
        }
        if (exposedHeaders.length > 0) {
            httpResponse.setHeader(HttpHeaders.Access_Control_Expose_Headers, TextUtils.join(", ", exposedHeaders));
        }
        httpResponse.setHeader(HttpHeaders.Access_Control_Allow_Credentials, Boolean.toString(crossOrigin.isAllowCredentials()));
        httpResponse.setHeader(HttpHeaders.Access_Control_Max_Age, Long.toString(crossOrigin.getMaxAge()));
        httpResponse.setHeader("Allow", TextUtils.join(", ", HttpMethod.values()));
        httpResponse.setHeader("Vary", HttpHeaders.ORIGIN);
        return new BodyView(new StringBody("OK"));
    }

    private View invalidCORS(HttpResponse httpResponse) {
        httpResponse.setStatus(403);
        httpResponse.setHeader("Allow", TextUtils.join(", ", HttpMethod.values()));
        return new BodyView(new StringBody(INVALID_CORS_REQUEST));
    }

    @Override // com.yanzhenjie.andserver.framework.ETag
    public String getETag(HttpRequest httpRequest) throws Throwable {
        return this.mHandler.getETag(httpRequest);
    }

    @Override // com.yanzhenjie.andserver.framework.LastModified
    public long getLastModified(HttpRequest httpRequest) throws Throwable {
        return this.mHandler.getLastModified(httpRequest);
    }
}
