package com.yanzhenjie.andserver.http.multipart;

import android.text.TextUtils;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.RequestWrapper;
import com.yanzhenjie.andserver.util.LinkedMultiValueMap;
import com.yanzhenjie.andserver.util.MultiValueMap;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class StandardMultipartRequest extends RequestWrapper implements MultipartRequest {
    private Map<String, String> mMultipartContentTypes;
    private MultiValueMap<String, MultipartFile> mMultipartFiles;
    private MultiValueMap<String, String> mMultipartParameters;
    private HttpRequest mRequest;

    public StandardMultipartRequest(HttpRequest httpRequest, MultiValueMap<String, MultipartFile> multiValueMap, MultiValueMap<String, String> multiValueMap2, Map<String, String> map) {
        super(httpRequest);
        this.mRequest = httpRequest;
        this.mMultipartFiles = new LinkedMultiValueMap(Collections.unmodifiableMap(multiValueMap));
        this.mMultipartParameters = new LinkedMultiValueMap(Collections.unmodifiableMap(multiValueMap2));
        this.mMultipartContentTypes = Collections.unmodifiableMap(map);
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartRequest
    public Iterator<String> getFileNames() {
        return this.mMultipartFiles.keySet().iterator();
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartRequest
    public MultipartFile getFile(String str) {
        return this.mMultipartFiles.getFirst(str);
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartRequest
    public List<MultipartFile> getFiles(String str) {
        List<MultipartFile> list = (List) this.mMultipartFiles.get(str);
        return list != null ? list : Collections.emptyList();
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartRequest
    public Map<String, MultipartFile> getFileMap() {
        return this.mMultipartFiles.toSingleValueMap();
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartRequest
    public MultiValueMap<String, MultipartFile> getMultiFileMap() {
        return this.mMultipartFiles;
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartRequest
    public String getMultipartContentType(String str) {
        MultipartFile file = getFile(str);
        return file == null ? this.mMultipartContentTypes.get(str) : file.getContentType().getType();
    }

    @Override // com.yanzhenjie.andserver.http.RequestWrapper, com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getParameterNames() {
        if (this.mMultipartParameters.isEmpty()) {
            return this.mRequest.getParameterNames();
        }
        LinkedList linkedList = new LinkedList();
        List<String> parameterNames = this.mRequest.getParameterNames();
        if (!parameterNames.isEmpty()) {
            linkedList.addAll(parameterNames);
        }
        linkedList.addAll(this.mMultipartParameters.keySet());
        return linkedList;
    }

    @Override // com.yanzhenjie.andserver.http.RequestWrapper, com.yanzhenjie.andserver.http.HttpRequest
    public String getParameter(String str) {
        String first = this.mMultipartParameters.getFirst(str);
        return TextUtils.isEmpty(first) ? this.mRequest.getParameter(str) : first;
    }

    @Override // com.yanzhenjie.andserver.http.RequestWrapper, com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getParameters(String str) {
        List<String> list = (List) this.mMultipartParameters.get(str);
        return list == null ? this.mRequest.getParameters(str) : list;
    }

    @Override // com.yanzhenjie.andserver.http.RequestWrapper, com.yanzhenjie.andserver.http.HttpRequest
    public MultiValueMap<String, String> getParameter() {
        return this.mMultipartParameters.isEmpty() ? this.mRequest.getParameter() : this.mMultipartParameters;
    }
}
