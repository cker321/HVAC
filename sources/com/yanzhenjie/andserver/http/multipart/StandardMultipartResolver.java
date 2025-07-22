package com.yanzhenjie.andserver.http.multipart;

import android.text.TextUtils;
import android.util.Log;
import com.yanzhenjie.andserver.AndServer;
import com.yanzhenjie.andserver.error.MaxUploadSizeExceededException;
import com.yanzhenjie.andserver.error.MultipartException;
import com.yanzhenjie.andserver.http.HttpRequest;
import com.yanzhenjie.andserver.http.RequestBody;
import com.yanzhenjie.andserver.util.Assert;
import com.yanzhenjie.andserver.util.LinkedMultiValueMap;
import com.yanzhenjie.andserver.util.MediaType;
import com.yanzhenjie.andserver.util.MultiValueMap;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.p006io.Charsets;

/* loaded from: classes.dex */
public class StandardMultipartResolver implements MultipartResolver {
    private DiskFileItemFactory mFileItemFactory;
    private FileUpload mFileUpload;

    public StandardMultipartResolver() {
        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        this.mFileItemFactory = diskFileItemFactory;
        this.mFileUpload = new FileUpload(diskFileItemFactory);
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartResolver
    public void setAllFileMaxSize(long j) {
        this.mFileUpload.setSizeMax(j);
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartResolver
    public void setFileMaxSize(long j) {
        this.mFileUpload.setFileSizeMax(j);
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartResolver
    public void setMaxInMemorySize(int i) {
        this.mFileItemFactory.setSizeThreshold(i);
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartResolver
    public void setUploadTempDir(File file) {
        if (!file.exists() && !file.mkdirs()) {
            throw new IllegalArgumentException("Given uploadTempDir [" + file + "] could not be created.");
        }
        this.mFileItemFactory.setRepository(file);
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartResolver
    public boolean isMultipart(HttpRequest httpRequest) {
        RequestBody body;
        return httpRequest.getMethod().allowBody() && (body = httpRequest.getBody()) != null && FileUploadBase.isMultipartContent(new BodyContext(body));
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartResolver
    public MultipartRequest resolveMultipart(HttpRequest httpRequest) throws MultipartException {
        if (httpRequest instanceof MultipartRequest) {
            return (MultipartRequest) httpRequest;
        }
        MultipartParsingResult request = parseRequest(httpRequest);
        return new StandardMultipartRequest(httpRequest, request.getMultipartFiles(), request.getMultipartParameters(), request.getMultipartContentTypes());
    }

    @Override // com.yanzhenjie.andserver.http.multipart.MultipartResolver
    public void cleanupMultipart(MultipartRequest multipartRequest) {
        if (multipartRequest != null) {
            try {
                Iterator<MultipartFile> it = multipartRequest.getMultiFileMap().values().iterator();
                while (it.hasNext()) {
                    for (MultipartFile multipartFile : (List) it.next()) {
                        if (multipartFile instanceof StandardMultipartFile) {
                            ((StandardMultipartFile) multipartFile).getFileItem().delete();
                        }
                    }
                }
            } catch (Throwable unused) {
                Log.w(AndServer.TAG, "Failed to perform multipart cleanup for servlet request.");
            }
        }
    }

    private MultipartParsingResult parseRequest(HttpRequest httpRequest) throws MultipartException {
        String strDetermineEncoding = determineEncoding(httpRequest);
        FileUpload fileUploadPrepareFileUpload = prepareFileUpload(strDetermineEncoding);
        try {
            RequestBody body = httpRequest.getBody();
            Assert.notNull(body, "The body cannot be null.");
            return parseFileItems(fileUploadPrepareFileUpload.parseRequest(new BodyContext(body)), strDetermineEncoding);
        } catch (FileUploadBase.FileSizeLimitExceededException e) {
            throw new MaxUploadSizeExceededException(fileUploadPrepareFileUpload.getFileSizeMax(), e);
        } catch (FileUploadBase.SizeLimitExceededException e2) {
            throw new MaxUploadSizeExceededException(fileUploadPrepareFileUpload.getSizeMax(), e2);
        } catch (FileUploadException e3) {
            throw new MultipartException("Failed to parse multipart servlet request.", e3);
        }
    }

    private String determineEncoding(HttpRequest httpRequest) {
        MediaType contentType = httpRequest.getContentType();
        if (contentType == null) {
            return Charsets.UTF_8.name();
        }
        Charset charset = contentType.getCharset();
        if (charset == null) {
            charset = Charsets.UTF_8;
        }
        return charset.name();
    }

    private FileUpload prepareFileUpload(String str) {
        FileUpload fileUpload = this.mFileUpload;
        if (str.equalsIgnoreCase(fileUpload.getHeaderEncoding())) {
            return fileUpload;
        }
        FileUpload fileUpload2 = new FileUpload(this.mFileItemFactory);
        fileUpload2.setSizeMax(this.mFileUpload.getSizeMax());
        fileUpload2.setFileSizeMax(this.mFileUpload.getFileSizeMax());
        fileUpload2.setHeaderEncoding(str);
        return fileUpload2;
    }

    protected MultipartParsingResult parseFileItems(List<FileItem> list, String str) {
        String string;
        LinkedMultiValueMap linkedMultiValueMap = new LinkedMultiValueMap();
        LinkedMultiValueMap linkedMultiValueMap2 = new LinkedMultiValueMap();
        HashMap map = new HashMap();
        for (FileItem fileItem : list) {
            if (fileItem.isFormField()) {
                String strDetermineEncoding = determineEncoding(fileItem.getContentType(), str);
                if (strDetermineEncoding != null) {
                    try {
                        string = fileItem.getString(strDetermineEncoding);
                    } catch (UnsupportedEncodingException unused) {
                        string = fileItem.getString();
                    }
                } else {
                    string = fileItem.getString();
                }
                List list2 = linkedMultiValueMap2.get((Object) fileItem.getFieldName());
                if (list2 == null) {
                    LinkedList linkedList = new LinkedList();
                    linkedList.add(string);
                    linkedMultiValueMap2.put((LinkedMultiValueMap) fileItem.getFieldName(), (String) linkedList);
                } else {
                    list2.add(string);
                }
                map.put(fileItem.getFieldName(), fileItem.getContentType());
            } else {
                StandardMultipartFile standardMultipartFileCreateMultipartFile = createMultipartFile(fileItem);
                linkedMultiValueMap.add(standardMultipartFileCreateMultipartFile.getName(), standardMultipartFileCreateMultipartFile);
            }
        }
        return new MultipartParsingResult(linkedMultiValueMap, linkedMultiValueMap2, map);
    }

    protected StandardMultipartFile createMultipartFile(FileItem fileItem) {
        return new StandardMultipartFile(fileItem);
    }

    private String determineEncoding(String str, String str2) {
        Charset charset;
        return (TextUtils.isEmpty(str) || (charset = MediaType.parseMediaType(str).getCharset()) == null) ? str2 : charset.name();
    }

    protected static class MultipartParsingResult {
        private final Map<String, String> multipartContentTypes;
        private final MultiValueMap<String, MultipartFile> multipartFiles;
        private final MultiValueMap<String, String> multipartParameters;

        public MultipartParsingResult(MultiValueMap<String, MultipartFile> multiValueMap, MultiValueMap<String, String> multiValueMap2, Map<String, String> map) {
            this.multipartFiles = multiValueMap;
            this.multipartParameters = multiValueMap2;
            this.multipartContentTypes = map;
        }

        public MultiValueMap<String, MultipartFile> getMultipartFiles() {
            return this.multipartFiles;
        }

        public MultiValueMap<String, String> getMultipartParameters() {
            return this.multipartParameters;
        }

        public Map<String, String> getMultipartContentTypes() {
            return this.multipartContentTypes;
        }
    }
}
