package com.yanzhenjie.andserver.http;

import android.text.TextUtils;
import com.yanzhenjie.andserver.DispatcherHandler;
import com.yanzhenjie.andserver.http.cookie.Cookie;
import com.yanzhenjie.andserver.http.cookie.CookieProcessor;
import com.yanzhenjie.andserver.http.cookie.StandardCookieProcessor;
import com.yanzhenjie.andserver.http.session.Session;
import com.yanzhenjie.andserver.http.session.SessionManager;
import com.yanzhenjie.andserver.util.HttpDateFormat;
import com.yanzhenjie.andserver.util.IOUtils;
import com.yanzhenjie.andserver.util.LinkedMultiValueMap;
import com.yanzhenjie.andserver.util.MediaType;
import com.yanzhenjie.andserver.util.MultiValueMap;
import com.yanzhenjie.andserver.util.UrlCoder;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;
import java.util.zip.GZIPInputStream;
import org.apache.commons.p006io.Charsets;
import org.apache.httpcore.Header;
import org.apache.httpcore.HttpEntity;
import org.apache.httpcore.HttpEntityEnclosingRequest;
import org.apache.httpcore.RequestLine;
import org.eclipse.paho.client.mqttv3.MqttTopic;

/* loaded from: classes.dex */
public class StandardRequest implements HttpRequest {
    private static final CookieProcessor COOKIE_PROCESSOR = new StandardCookieProcessor();
    private boolean isParsedAccept;
    private boolean isParsedLocale;
    private boolean isParsedParameter;
    private boolean isParsedQuery;
    private boolean isParsedUri;
    private List<MediaType> mAccepts;
    private HttpContext mContext;
    private DispatcherHandler mHandler;
    private List<Locale> mLocales;
    private MultiValueMap<String, String> mParameter;
    private MultiValueMap<String, String> mQuery;
    private org.apache.httpcore.HttpRequest mRequest;
    private RequestLine mRequestLine;
    private SessionManager mSessionManager;
    private Uri mUri;

    public StandardRequest(org.apache.httpcore.HttpRequest httpRequest, HttpContext httpContext, DispatcherHandler dispatcherHandler, SessionManager sessionManager) {
        this.mRequest = httpRequest;
        this.mContext = httpContext;
        this.mHandler = dispatcherHandler;
        this.mRequestLine = httpRequest.getRequestLine();
        this.mSessionManager = sessionManager;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public HttpMethod getMethod() {
        return HttpMethod.reverse(this.mRequestLine.getMethod());
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getURI() {
        if (this.isParsedUri) {
            return this.mUri.toString();
        }
        String uri = this.mRequestLine.getUri();
        return TextUtils.isEmpty(uri) ? MqttTopic.TOPIC_LEVEL_SEPARATOR : uri;
    }

    private void parseUri() {
        if (this.isParsedUri) {
            return;
        }
        this.mUri = Uri.newBuilder(getURI()).build();
        if (this.isParsedUri) {
            return;
        }
        this.isParsedUri = true;
    }

    public void setPath(String str) {
        parseUri();
        this.mUri = this.mUri.builder().setPath(str).build();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getPath() {
        parseUri();
        return this.mUri.getPath();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getQueryNames() {
        parseQuery();
        return new LinkedList(this.mQuery.keySet());
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getQuery(String str) {
        parseQuery();
        return this.mQuery.getFirst(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getQueries(String str) {
        parseQuery();
        List<String> list = (List) this.mQuery.get(str);
        return (list == null || list.isEmpty()) ? Collections.emptyList() : list;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public MultiValueMap<String, String> getQuery() {
        parseQuery();
        return this.mQuery;
    }

    private void parseQuery() {
        if (this.isParsedQuery) {
            return;
        }
        parseUri();
        this.mQuery = this.mUri.getParams();
        this.isParsedQuery = true;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getHeaderNames() {
        Header[] allHeaders = this.mRequest.getAllHeaders();
        if (allHeaders == null || allHeaders.length == 0) {
            return Collections.emptyList();
        }
        ArrayList arrayList = new ArrayList();
        for (Header header : allHeaders) {
            arrayList.add(header.getName());
        }
        return arrayList;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getHeader(String str) {
        Header firstHeader = this.mRequest.getFirstHeader(str);
        if (firstHeader == null) {
            return null;
        }
        return firstHeader.getValue();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getHeaders(String str) {
        Header[] headers = this.mRequest.getHeaders(str);
        if (headers == null || headers.length == 0) {
            return Collections.emptyList();
        }
        ArrayList arrayList = new ArrayList();
        for (Header header : headers) {
            arrayList.add(header.getValue());
        }
        return arrayList;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public long getDateHeader(String str) {
        Header firstHeader = this.mRequest.getFirstHeader(str);
        if (firstHeader == null) {
            return -1L;
        }
        String value = firstHeader.getValue();
        long date = HttpDateFormat.parseDate(value);
        if (date != -1) {
            return date;
        }
        throw new IllegalStateException(String.format("The %s cannot be converted to date.", value));
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public int getIntHeader(String str) {
        Header firstHeader = this.mRequest.getFirstHeader(str);
        if (firstHeader == null) {
            return -1;
        }
        try {
            return Integer.parseInt(firstHeader.getValue());
        } catch (NumberFormatException e) {
            throw new IllegalStateException(e.getMessage(), e);
        }
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public MediaType getAccept() {
        List<MediaType> accepts = getAccepts();
        if (accepts.isEmpty()) {
            return null;
        }
        return accepts.get(0);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<MediaType> getAccepts() {
        parseAccept();
        return this.mAccepts;
    }

    private void parseAccept() {
        if (this.isParsedAccept) {
            return;
        }
        this.mAccepts = new ArrayList();
        Header[] headers = this.mRequest.getHeaders("Accept");
        if (headers != null && headers.length > 0) {
            for (Header header : headers) {
                this.mAccepts.addAll(MediaType.parseMediaTypes(header.getValue()));
            }
        }
        if (this.mAccepts.isEmpty()) {
            this.mAccepts.add(MediaType.ALL);
        }
        this.isParsedAccept = true;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public Locale getAcceptLanguage() {
        return getAcceptLanguages().get(0);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<Locale> getAcceptLanguages() {
        parseLocale();
        return this.mLocales;
    }

    private void parseLocale() {
        if (this.isParsedLocale) {
            return;
        }
        this.mLocales = new ArrayList();
        Header[] headers = this.mRequest.getHeaders("Accept-Language");
        if (headers != null && headers.length > 0) {
            for (Header header : headers) {
                Iterator<AcceptLanguage> it = AcceptLanguage.parse(header.getValue()).iterator();
                while (it.hasNext()) {
                    this.mLocales.add(it.next().getLocale());
                }
            }
        }
        if (this.mLocales.isEmpty()) {
            this.mLocales.add(Locale.getDefault());
        }
        this.isParsedLocale = true;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getCookieValue(String str) {
        Cookie cookie = getCookie(str);
        if (cookie != null) {
            return cookie.getValue();
        }
        return null;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public Cookie getCookie(String str) {
        List<Cookie> cookies = getCookies();
        if (cookies.isEmpty()) {
            return null;
        }
        for (Cookie cookie : cookies) {
            if (str.equalsIgnoreCase(cookie.getName())) {
                return cookie;
            }
        }
        return null;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<Cookie> getCookies() {
        return COOKIE_PROCESSOR.parseCookieHeader(this.mRequest.getHeaders(HttpHeaders.COOKIE));
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public long getContentLength() {
        String header = getHeader("Content-Length");
        if (TextUtils.isEmpty(header)) {
            return -1L;
        }
        try {
            return Long.parseLong(header);
        } catch (NumberFormatException unused) {
            return -1L;
        }
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public MediaType getContentType() {
        String header = getHeader("Content-Type");
        if (TextUtils.isEmpty(header)) {
            return null;
        }
        return MediaType.valueOf(header);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getParameterNames() {
        parseParameter();
        LinkedList linkedList = new LinkedList(this.mParameter.keySet());
        List<String> queryNames = getQueryNames();
        if (!queryNames.isEmpty()) {
            linkedList.addAll(queryNames);
        }
        return linkedList;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String getParameter(String str) {
        parseParameter();
        String first = this.mParameter.getFirst(str);
        return TextUtils.isEmpty(first) ? getQuery(str) : first;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public List<String> getParameters(String str) {
        parseParameter();
        List<String> list = (List) this.mParameter.get(str);
        return (list == null || list.isEmpty()) ? getQueries(str) : list;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public MultiValueMap<String, String> getParameter() {
        parseParameter();
        return this.mParameter.isEmpty() ? getQuery() : this.mParameter;
    }

    private void parseParameter() {
        if (this.isParsedParameter) {
            return;
        }
        if (!getMethod().allowBody()) {
            this.mParameter = new LinkedMultiValueMap();
            return;
        }
        if (MediaType.APPLICATION_FORM_URLENCODED.includes(getContentType())) {
            try {
                RequestBody body = getBody();
                this.mParameter = parseParameters(body == null ? "" : body.string());
            } catch (Exception unused) {
            }
        }
        if (this.mParameter == null) {
            this.mParameter = new LinkedMultiValueMap();
        }
        this.isParsedParameter = true;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public RequestBody getBody() {
        HttpEntity entity;
        if (getMethod().allowBody()) {
            org.apache.httpcore.HttpRequest httpRequest = this.mRequest;
            if (!(httpRequest instanceof HttpEntityEnclosingRequest) || (entity = ((HttpEntityEnclosingRequest) httpRequest).getEntity()) == null) {
                return null;
            }
            return new EntityToBody(entity);
        }
        throw new UnsupportedOperationException("This method does not allow body.");
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public Session getValidSession() {
        Session session = getSession();
        if (session == null || session.isValid()) {
            session = this.mSessionManager.createSession();
        }
        setAttribute(HttpContext.REQUEST_CREATED_SESSION, session);
        return session;
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public Session getSession() {
        String value;
        Object attribute = getAttribute(HttpContext.REQUEST_CREATED_SESSION);
        if (attribute instanceof Session) {
            return (Session) attribute;
        }
        List<Cookie> cookies = getCookies();
        if (cookies.isEmpty()) {
            return null;
        }
        Iterator<Cookie> it = cookies.iterator();
        while (true) {
            if (!it.hasNext()) {
                value = null;
                break;
            }
            Cookie next = it.next();
            if (HttpRequest.SESSION_NAME.equalsIgnoreCase(next.getName())) {
                value = next.getValue();
                break;
            }
        }
        if (TextUtils.isEmpty(value)) {
            return null;
        }
        try {
            return this.mSessionManager.findSession(value);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } catch (ClassNotFoundException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public String changeSessionId() {
        Session session = getSession();
        if (session == null) {
            throw new IllegalStateException("No session associated with this request.");
        }
        this.mSessionManager.changeSessionId(session);
        return session.getId();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public boolean isSessionValid() {
        Session session = getSession();
        return session != null && session.isValid();
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public RequestDispatcher getRequestDispatcher(String str) {
        return this.mHandler.getRequestDispatcher(this, str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpRequest
    public HttpContext getContext() {
        return this.mContext;
    }

    @Override // com.yanzhenjie.andserver.http.HttpContext
    public Object getAttribute(String str) {
        return this.mContext.getAttribute(str);
    }

    @Override // com.yanzhenjie.andserver.http.HttpContext
    public void setAttribute(String str, Object obj) {
        this.mContext.setAttribute(str, obj);
    }

    @Override // com.yanzhenjie.andserver.http.HttpContext
    public Object removeAttribute(String str) {
        return this.mContext.removeAttribute(str);
    }

    private static MultiValueMap<String, String> parseParameters(String str) {
        LinkedMultiValueMap linkedMultiValueMap = new LinkedMultiValueMap();
        StringTokenizer stringTokenizer = new StringTokenizer(str, "&");
        while (stringTokenizer.hasMoreElements()) {
            String strNextToken = stringTokenizer.nextToken();
            int iIndexOf = strNextToken.indexOf("=");
            if (iIndexOf > 0 && iIndexOf < strNextToken.length() - 1) {
                linkedMultiValueMap.add(strNextToken.substring(0, iIndexOf), UrlCoder.urlDecode(strNextToken.substring(iIndexOf + 1), Charsets.UTF_8));
            }
        }
        return linkedMultiValueMap;
    }

    private static class EntityToBody implements RequestBody {
        private HttpEntity mEntity;

        private EntityToBody(HttpEntity httpEntity) {
            this.mEntity = httpEntity;
        }

        @Override // com.yanzhenjie.andserver.http.RequestBody
        public String contentEncoding() {
            Header contentType = this.mEntity.getContentType();
            return contentType == null ? "" : contentType.getValue();
        }

        @Override // com.yanzhenjie.andserver.http.RequestBody
        public long length() {
            return this.mEntity.getContentLength();
        }

        @Override // com.yanzhenjie.andserver.http.RequestBody
        public MediaType contentType() {
            Header contentType = this.mEntity.getContentType();
            if (contentType == null) {
                return null;
            }
            return MediaType.valueOf(contentType.getValue());
        }

        @Override // com.yanzhenjie.andserver.http.RequestBody
        public InputStream stream() throws UnsupportedOperationException, IOException {
            InputStream content = this.mEntity.getContent();
            return contentEncoding().toLowerCase().contains("gzip") ? new GZIPInputStream(content) : content;
        }

        @Override // com.yanzhenjie.andserver.http.RequestBody
        public String string() throws IOException {
            MediaType mediaTypeContentType = contentType();
            Charset charset = mediaTypeContentType == null ? null : mediaTypeContentType.getCharset();
            if (charset == null) {
                return IOUtils.toString(stream());
            }
            return IOUtils.toString(stream(), charset);
        }
    }
}
