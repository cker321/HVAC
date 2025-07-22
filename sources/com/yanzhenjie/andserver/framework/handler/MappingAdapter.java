package com.yanzhenjie.andserver.framework.handler;

import android.text.TextUtils;
import com.yanzhenjie.andserver.error.ContentNotAcceptableException;
import com.yanzhenjie.andserver.error.ContentNotSupportedException;
import com.yanzhenjie.andserver.error.HeaderValidateException;
import com.yanzhenjie.andserver.error.MethodNotSupportException;
import com.yanzhenjie.andserver.error.ParamValidateException;
import com.yanzhenjie.andserver.framework.mapping.Mapping;
import com.yanzhenjie.andserver.framework.mapping.Mime;
import com.yanzhenjie.andserver.framework.mapping.Pair;
import com.yanzhenjie.andserver.framework.mapping.Path;
import com.yanzhenjie.andserver.http.HttpContext;
import com.yanzhenjie.andserver.http.HttpMethod;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.util.MediaType;
import com.yanzhenjie.andserver.util.Patterns;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public abstract class MappingAdapter implements HandlerAdapter, Patterns {
    protected abstract Object getHost();

    protected abstract Map<Mapping, RequestHandler> getMappingMap();

    @Override // com.yanzhenjie.andserver.framework.handler.HandlerAdapter
    public boolean intercept(HttpRequest httpRequest) {
        List<Path.Segment> listPathToList = Path.pathToList(httpRequest.getPath());
        List<Mapping> exactMappings = getExactMappings(listPathToList);
        if (exactMappings.isEmpty()) {
            exactMappings = getBlurredMappings(listPathToList);
        }
        if (exactMappings.isEmpty()) {
            return false;
        }
        HttpMethod method = httpRequest.getMethod();
        if (method.equals(HttpMethod.OPTIONS)) {
            return true;
        }
        Mapping mappingFindMappingByMethod = findMappingByMethod(exactMappings, method);
        if (mappingFindMappingByMethod == null) {
            MethodNotSupportException methodNotSupportException = new MethodNotSupportException(method);
            methodNotSupportException.setMethods(findSupportMethods(exactMappings));
            throw methodNotSupportException;
        }
        Pair param = mappingFindMappingByMethod.getParam();
        if (param != null) {
            validateParams(param, httpRequest);
        }
        Pair header = mappingFindMappingByMethod.getHeader();
        if (header != null) {
            validateHeaders(header, httpRequest);
        }
        Mime consume = mappingFindMappingByMethod.getConsume();
        if (consume != null) {
            validateConsume(consume, httpRequest);
        }
        Mime produce = mappingFindMappingByMethod.getProduce();
        if (produce != null) {
            validateProduce(produce, httpRequest);
        }
        return true;
    }

    @Override // com.yanzhenjie.andserver.framework.handler.HandlerAdapter
    public RequestHandler getHandler(HttpRequest httpRequest) {
        List<Path.Segment> listPathToList = Path.pathToList(httpRequest.getPath());
        List<Mapping> exactMappings = getExactMappings(listPathToList);
        if (exactMappings.isEmpty()) {
            exactMappings = getBlurredMappings(listPathToList);
        }
        HttpMethod method = httpRequest.getMethod();
        Mapping mappingFindMappingByMethod = findMappingByMethod(exactMappings, method);
        if (method.equals(HttpMethod.OPTIONS) && mappingFindMappingByMethod == null) {
            return new OptionsHandler(httpRequest, exactMappings, getMappingMap());
        }
        Mime.Rule rule = null;
        if (mappingFindMappingByMethod == null) {
            return null;
        }
        Mime produce = mappingFindMappingByMethod.getProduce();
        if (produce != null) {
            Iterator<Mime.Rule> it = produce.getRuleList().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Mime.Rule next = it.next();
                if (!next.toString().startsWith("!")) {
                    rule = next;
                    break;
                }
            }
            httpRequest.setAttribute(HttpContext.RESPONSE_PRODUCE_TYPE, rule);
        }
        return getMappingMap().get(mappingFindMappingByMethod);
    }

    private List<Mapping> getExactMappings(List<Path.Segment> list) {
        ArrayList arrayList = new ArrayList();
        for (Mapping mapping : getMappingMap().keySet()) {
            Iterator<Path.Rule> it = mapping.getPath().getRuleList().iterator();
            while (it.hasNext()) {
                if (matchExactPath(it.next().getSegments(), list)) {
                    arrayList.add(mapping);
                }
            }
        }
        return arrayList;
    }

    private boolean matchExactPath(List<Path.Segment> list, List<Path.Segment> list2) {
        return list2.size() == list.size() && Path.listToPath(list).equals(Path.listToPath(list2));
    }

    private List<Mapping> getBlurredMappings(List<Path.Segment> list) {
        ArrayList arrayList = new ArrayList();
        for (Mapping mapping : getMappingMap().keySet()) {
            Iterator<Path.Rule> it = mapping.getPath().getRuleList().iterator();
            while (it.hasNext()) {
                if (matchBlurredPath(it.next().getSegments(), list)) {
                    arrayList.add(mapping);
                }
            }
        }
        return arrayList;
    }

    private boolean matchBlurredPath(List<Path.Segment> list, List<Path.Segment> list2) {
        if (list2.size() != list.size()) {
            return false;
        }
        for (int i = 0; i < list.size(); i++) {
            Path.Segment segment = list.get(i);
            if (!segment.equals(list2.get(i)) && !segment.isBlurred()) {
                return false;
            }
        }
        return true;
    }

    private void validateParams(Pair pair, HttpRequest httpRequest) {
        for (Pair.Rule rule : pair.getRuleList()) {
            String key = rule.getKey();
            List<String> parameterNames = httpRequest.getParameterNames();
            String value = rule.getValue();
            List<String> parameters = httpRequest.getParameters(key);
            if (rule.isNoKey()) {
                if (parameterNames.contains(key)) {
                    throw new ParamValidateException(String.format("The parameter [%s] is not allowed.", key));
                }
            } else if (rule.isNoValue()) {
                if (parameters.contains(value)) {
                    throw new ParamValidateException(String.format("The value of parameter %s cannot be %s.", key, value));
                }
            } else if (!TextUtils.isEmpty(key) && !TextUtils.isEmpty(value)) {
                if (!parameterNames.contains(key) || !parameters.contains(value)) {
                    throw new ParamValidateException(String.format("The value of parameter %s is missing or wrong.", key));
                }
            } else if (!TextUtils.isEmpty(key) && TextUtils.isEmpty(value) && !parameterNames.contains(key)) {
                throw new ParamValidateException(String.format("The parameter %s is missing.", key));
            }
        }
    }

    private void validateHeaders(Pair pair, HttpRequest httpRequest) {
        for (Pair.Rule rule : pair.getRuleList()) {
            String key = rule.getKey();
            List<String> headerNames = httpRequest.getHeaderNames();
            String value = rule.getValue();
            List<String> headers = httpRequest.getHeaders(key);
            if (rule.isNoKey()) {
                if (headerNames.contains(key)) {
                    throw new HeaderValidateException(String.format("The header [%s] is not allowed.", key));
                }
            } else if (rule.isNoValue()) {
                if (headers.contains(value)) {
                    throw new HeaderValidateException(String.format("The value of header %s cannot be %s.", key, value));
                }
            } else {
                if (!TextUtils.isEmpty(key) && !TextUtils.isEmpty(value) && (!headerNames.contains(key) || !headers.contains(value))) {
                    throw new HeaderValidateException(String.format("The value of header %s is missing or wrong.", key));
                }
                if (!TextUtils.isEmpty(key) && TextUtils.isEmpty(value) && !headerNames.contains(key)) {
                    throw new HeaderValidateException(String.format("The header %s is missing.", key));
                }
            }
        }
    }

    private void validateConsume(Mime mime, HttpRequest httpRequest) {
        List<Mime.Rule> ruleList = mime.getRuleList();
        MediaType contentType = httpRequest.getContentType();
        ArrayList arrayList = new ArrayList();
        Iterator<Mime.Rule> it = ruleList.iterator();
        while (true) {
            boolean z = true;
            if (it.hasNext()) {
                Mime.Rule next = it.next();
                String type = next.getType();
                boolean zStartsWith = type.startsWith("!");
                if (zStartsWith) {
                    type = type.substring(1);
                }
                MediaType mediaType = new MediaType(type, next.getSubtype());
                if (zStartsWith) {
                    if (mediaType.equalsExcludeParameter(contentType)) {
                        throw new ContentNotSupportedException(contentType);
                    }
                } else {
                    arrayList.add(mediaType);
                }
            } else {
                Iterator it2 = arrayList.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        z = false;
                        break;
                    } else if (((MediaType) it2.next()).includes(contentType)) {
                        break;
                    }
                }
                if (!z) {
                    throw new ContentNotSupportedException(contentType);
                }
                return;
            }
        }
    }

    private void validateProduce(Mime mime, HttpRequest httpRequest) {
        List<Mime.Rule> ruleList = mime.getRuleList();
        List<MediaType> accepts = httpRequest.getAccepts();
        for (Mime.Rule rule : ruleList) {
            String type = rule.getType();
            boolean zStartsWith = type.startsWith("!");
            if (zStartsWith) {
                type = type.substring(1);
            }
            MediaType mediaType = new MediaType(type, rule.getSubtype());
            boolean z = false;
            Iterator<MediaType> it = accepts.iterator();
            while (it.hasNext()) {
                if (it.next().includes(mediaType)) {
                    z = true;
                }
            }
            if (zStartsWith && z) {
                throw new ContentNotAcceptableException();
            }
            if (!zStartsWith && !z) {
                throw new ContentNotAcceptableException();
            }
        }
    }

    public static List<HttpMethod> findSupportMethods(List<Mapping> list) {
        ArrayList arrayList = new ArrayList();
        Iterator<Mapping> it = list.iterator();
        while (it.hasNext()) {
            arrayList.addAll(it.next().getMethod().getRuleList());
        }
        return arrayList;
    }

    public static Mapping findMappingByMethod(List<Mapping> list, HttpMethod httpMethod) {
        for (Mapping mapping : list) {
            if (mapping.getMethod().getRuleList().contains(httpMethod)) {
                return mapping;
            }
        }
        return null;
    }
}
