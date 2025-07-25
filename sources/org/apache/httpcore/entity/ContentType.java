package org.apache.httpcore.entity;

import com.yanzhenjie.andserver.util.MediaType;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import org.apache.httpcore.Consts;
import org.apache.httpcore.Header;
import org.apache.httpcore.HeaderElement;
import org.apache.httpcore.HttpEntity;
import org.apache.httpcore.NameValuePair;
import org.apache.httpcore.ParseException;
import org.apache.httpcore.message.BasicHeaderValueFormatter;
import org.apache.httpcore.message.BasicHeaderValueParser;
import org.apache.httpcore.message.BasicNameValuePair;
import org.apache.httpcore.message.ParserCursor;
import org.apache.httpcore.protocol.HTTP;
import org.apache.httpcore.util.Args;
import org.apache.httpcore.util.CharArrayBuffer;
import org.apache.httpcore.util.TextUtils;

/* loaded from: classes.dex */
public final class ContentType implements Serializable {
    public static final ContentType APPLICATION_OCTET_STREAM;
    private static final Map<String, ContentType> CONTENT_TYPE_MAP;
    public static final ContentType DEFAULT_BINARY;
    public static final ContentType DEFAULT_TEXT;
    public static final ContentType WILDCARD;
    private static final long serialVersionUID = -7768694718232371896L;
    private final Charset charset;
    private final String mimeType;
    private final NameValuePair[] params;
    public static final ContentType APPLICATION_ATOM_XML = create(MediaType.APPLICATION_ATOM_XML_VALUE, Consts.ISO_8859_1);
    public static final ContentType APPLICATION_FORM_URLENCODED = create(MediaType.APPLICATION_FORM_URLENCODED_VALUE, Consts.ISO_8859_1);
    public static final ContentType APPLICATION_JSON = create(MediaType.APPLICATION_JSON_VALUE, Consts.UTF_8);
    public static final ContentType APPLICATION_SOAP_XML = create("application/soap+xml", Consts.UTF_8);
    public static final ContentType APPLICATION_SVG_XML = create("application/svg+xml", Consts.ISO_8859_1);
    public static final ContentType APPLICATION_XHTML_XML = create(MediaType.APPLICATION_XHTML_XML_VALUE, Consts.ISO_8859_1);
    public static final ContentType APPLICATION_XML = create(MediaType.APPLICATION_XML_VALUE, Consts.ISO_8859_1);
    public static final ContentType IMAGE_BMP = create("image/bmp");
    public static final ContentType IMAGE_GIF = create(MediaType.IMAGE_GIF_VALUE);
    public static final ContentType IMAGE_JPEG = create(MediaType.IMAGE_JPEG_VALUE);
    public static final ContentType IMAGE_PNG = create(MediaType.IMAGE_PNG_VALUE);
    public static final ContentType IMAGE_SVG = create("image/svg+xml");
    public static final ContentType IMAGE_TIFF = create("image/tiff");
    public static final ContentType IMAGE_WEBP = create("image/webp");
    public static final ContentType MULTIPART_FORM_DATA = create("multipart/form-data", Consts.ISO_8859_1);
    public static final ContentType TEXT_HTML = create(MediaType.TEXT_HTML_VALUE, Consts.ISO_8859_1);
    public static final ContentType TEXT_PLAIN = create("text/plain", Consts.ISO_8859_1);
    public static final ContentType TEXT_XML = create(MediaType.TEXT_XML_VALUE, Consts.ISO_8859_1);

    static {
        Charset charset = (Charset) null;
        APPLICATION_OCTET_STREAM = create("application/octet-stream", charset);
        WILDCARD = create(MediaType.ALL_VALUE, charset);
        ContentType[] contentTypeArr = {APPLICATION_ATOM_XML, APPLICATION_FORM_URLENCODED, APPLICATION_JSON, APPLICATION_SVG_XML, APPLICATION_XHTML_XML, APPLICATION_XML, IMAGE_BMP, IMAGE_GIF, IMAGE_JPEG, IMAGE_PNG, IMAGE_SVG, IMAGE_TIFF, IMAGE_WEBP, MULTIPART_FORM_DATA, TEXT_HTML, TEXT_PLAIN, TEXT_XML};
        HashMap map = new HashMap();
        for (int i = 0; i < 17; i++) {
            ContentType contentType = contentTypeArr[i];
            map.put(contentType.getMimeType(), contentType);
        }
        CONTENT_TYPE_MAP = Collections.unmodifiableMap(map);
        DEFAULT_TEXT = TEXT_PLAIN;
        DEFAULT_BINARY = APPLICATION_OCTET_STREAM;
    }

    ContentType(String str, Charset charset) {
        this.mimeType = str;
        this.charset = charset;
        this.params = null;
    }

    ContentType(String str, Charset charset, NameValuePair[] nameValuePairArr) {
        this.mimeType = str;
        this.charset = charset;
        this.params = nameValuePairArr;
    }

    public String getMimeType() {
        return this.mimeType;
    }

    public Charset getCharset() {
        return this.charset;
    }

    public String getParameter(String str) {
        Args.notEmpty(str, "Parameter name");
        NameValuePair[] nameValuePairArr = this.params;
        if (nameValuePairArr == null) {
            return null;
        }
        for (NameValuePair nameValuePair : nameValuePairArr) {
            if (nameValuePair.getName().equalsIgnoreCase(str)) {
                return nameValuePair.getValue();
            }
        }
        return null;
    }

    public String toString() {
        CharArrayBuffer charArrayBuffer = new CharArrayBuffer(64);
        charArrayBuffer.append(this.mimeType);
        if (this.params != null) {
            charArrayBuffer.append("; ");
            BasicHeaderValueFormatter.INSTANCE.formatParameters(charArrayBuffer, this.params, false);
        } else if (this.charset != null) {
            charArrayBuffer.append(HTTP.CHARSET_PARAM);
            charArrayBuffer.append(this.charset.name());
        }
        return charArrayBuffer.toString();
    }

    private static boolean valid(String str) {
        for (int i = 0; i < str.length(); i++) {
            char cCharAt = str.charAt(i);
            if (cCharAt == '\"' || cCharAt == ',' || cCharAt == ';') {
                return false;
            }
        }
        return true;
    }

    public static ContentType create(String str, Charset charset) {
        String lowerCase = ((String) Args.notBlank(str, "MIME type")).toLowerCase(Locale.ROOT);
        Args.check(valid(lowerCase), "MIME type may not contain reserved characters");
        return new ContentType(lowerCase, charset);
    }

    public static ContentType create(String str) {
        return create(str, (Charset) null);
    }

    public static ContentType create(String str, String str2) throws UnsupportedCharsetException {
        return create(str, !TextUtils.isBlank(str2) ? Charset.forName(str2) : null);
    }

    private static ContentType create(HeaderElement headerElement, boolean z) {
        return create(headerElement.getName(), headerElement.getParameters(), z);
    }

    private static ContentType create(String str, NameValuePair[] nameValuePairArr, boolean z) {
        Charset charsetForName;
        int length = nameValuePairArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            NameValuePair nameValuePair = nameValuePairArr[i];
            if (nameValuePair.getName().equalsIgnoreCase("charset")) {
                String value = nameValuePair.getValue();
                if (!TextUtils.isBlank(value)) {
                    try {
                        charsetForName = Charset.forName(value);
                    } catch (UnsupportedCharsetException e) {
                        if (z) {
                            throw e;
                        }
                        charsetForName = null;
                        if (nameValuePairArr == null || nameValuePairArr.length <= 0) {
                            nameValuePairArr = null;
                        }
                        return new ContentType(str, charsetForName, nameValuePairArr);
                    }
                }
            } else {
                i++;
            }
        }
    }

    public static ContentType create(String str, NameValuePair... nameValuePairArr) throws UnsupportedCharsetException {
        Args.check(valid(((String) Args.notBlank(str, "MIME type")).toLowerCase(Locale.ROOT)), "MIME type may not contain reserved characters");
        return create(str, nameValuePairArr, true);
    }

    public static ContentType parse(String str) throws ParseException, UnsupportedCharsetException {
        Args.notNull(str, "Content type");
        CharArrayBuffer charArrayBuffer = new CharArrayBuffer(str.length());
        charArrayBuffer.append(str);
        HeaderElement[] elements = BasicHeaderValueParser.INSTANCE.parseElements(charArrayBuffer, new ParserCursor(0, str.length()));
        if (elements.length > 0) {
            return create(elements[0], true);
        }
        throw new ParseException("Invalid content type: " + str);
    }

    public static ContentType get(HttpEntity httpEntity) throws ParseException, UnsupportedCharsetException {
        Header contentType;
        if (httpEntity != null && (contentType = httpEntity.getContentType()) != null) {
            HeaderElement[] elements = contentType.getElements();
            if (elements.length > 0) {
                return create(elements[0], true);
            }
        }
        return null;
    }

    public static ContentType getLenient(HttpEntity httpEntity) {
        Header contentType;
        if (httpEntity != null && (contentType = httpEntity.getContentType()) != null) {
            try {
                HeaderElement[] elements = contentType.getElements();
                if (elements.length > 0) {
                    return create(elements[0], false);
                }
            } catch (ParseException unused) {
            }
        }
        return null;
    }

    public static ContentType getOrDefault(HttpEntity httpEntity) throws ParseException, UnsupportedCharsetException {
        ContentType contentType = get(httpEntity);
        return contentType != null ? contentType : DEFAULT_TEXT;
    }

    public static ContentType getLenientOrDefault(HttpEntity httpEntity) throws ParseException, UnsupportedCharsetException {
        ContentType contentType = get(httpEntity);
        return contentType != null ? contentType : DEFAULT_TEXT;
    }

    public static ContentType getByMimeType(String str) {
        if (str == null) {
            return null;
        }
        return CONTENT_TYPE_MAP.get(str);
    }

    public ContentType withCharset(Charset charset) {
        return create(getMimeType(), charset);
    }

    public ContentType withCharset(String str) {
        return create(getMimeType(), str);
    }

    public ContentType withParameters(NameValuePair... nameValuePairArr) throws UnsupportedCharsetException {
        if (nameValuePairArr.length == 0) {
            return this;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        NameValuePair[] nameValuePairArr2 = this.params;
        if (nameValuePairArr2 != null) {
            for (NameValuePair nameValuePair : nameValuePairArr2) {
                linkedHashMap.put(nameValuePair.getName(), nameValuePair.getValue());
            }
        }
        for (NameValuePair nameValuePair2 : nameValuePairArr) {
            linkedHashMap.put(nameValuePair2.getName(), nameValuePair2.getValue());
        }
        ArrayList arrayList = new ArrayList(linkedHashMap.size() + 1);
        if (this.charset != null && !linkedHashMap.containsKey("charset")) {
            arrayList.add(new BasicNameValuePair("charset", this.charset.name()));
        }
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            arrayList.add(new BasicNameValuePair((String) entry.getKey(), (String) entry.getValue()));
        }
        return create(getMimeType(), (NameValuePair[]) arrayList.toArray(new NameValuePair[arrayList.size()]), true);
    }
}
