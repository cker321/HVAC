package org.apache.httpcore.message;

import org.apache.httpcore.HeaderElement;
import org.apache.httpcore.NameValuePair;
import org.apache.httpcore.util.Args;
import org.apache.httpcore.util.CharArrayBuffer;

/* loaded from: classes.dex */
public class BasicHeaderValueFormatter implements HeaderValueFormatter {

    @Deprecated
    public static final BasicHeaderValueFormatter DEFAULT = new BasicHeaderValueFormatter();
    public static final BasicHeaderValueFormatter INSTANCE = new BasicHeaderValueFormatter();
    public static final String SEPARATORS = " ;,:@()<>\\\"/[]?={}\t";
    public static final String UNSAFE_CHARS = "\"\\";

    public static String formatElements(HeaderElement[] headerElementArr, boolean z, HeaderValueFormatter headerValueFormatter) {
        if (headerValueFormatter == null) {
            headerValueFormatter = INSTANCE;
        }
        return headerValueFormatter.formatElements(null, headerElementArr, z).toString();
    }

    @Override // org.apache.httpcore.message.HeaderValueFormatter
    public CharArrayBuffer formatElements(CharArrayBuffer charArrayBuffer, HeaderElement[] headerElementArr, boolean z) {
        Args.notNull(headerElementArr, "Header element array");
        int iEstimateElementsLen = estimateElementsLen(headerElementArr);
        if (charArrayBuffer == null) {
            charArrayBuffer = new CharArrayBuffer(iEstimateElementsLen);
        } else {
            charArrayBuffer.ensureCapacity(iEstimateElementsLen);
        }
        for (int i = 0; i < headerElementArr.length; i++) {
            if (i > 0) {
                charArrayBuffer.append(", ");
            }
            formatHeaderElement(charArrayBuffer, headerElementArr[i], z);
        }
        return charArrayBuffer;
    }

    protected int estimateElementsLen(HeaderElement[] headerElementArr) {
        if (headerElementArr == null || headerElementArr.length < 1) {
            return 0;
        }
        int length = (headerElementArr.length - 1) * 2;
        for (HeaderElement headerElement : headerElementArr) {
            length += estimateHeaderElementLen(headerElement);
        }
        return length;
    }

    public static String formatHeaderElement(HeaderElement headerElement, boolean z, HeaderValueFormatter headerValueFormatter) {
        if (headerValueFormatter == null) {
            headerValueFormatter = INSTANCE;
        }
        return headerValueFormatter.formatHeaderElement(null, headerElement, z).toString();
    }

    @Override // org.apache.httpcore.message.HeaderValueFormatter
    public CharArrayBuffer formatHeaderElement(CharArrayBuffer charArrayBuffer, HeaderElement headerElement, boolean z) {
        Args.notNull(headerElement, "Header element");
        int iEstimateHeaderElementLen = estimateHeaderElementLen(headerElement);
        if (charArrayBuffer == null) {
            charArrayBuffer = new CharArrayBuffer(iEstimateHeaderElementLen);
        } else {
            charArrayBuffer.ensureCapacity(iEstimateHeaderElementLen);
        }
        charArrayBuffer.append(headerElement.getName());
        String value = headerElement.getValue();
        if (value != null) {
            charArrayBuffer.append('=');
            doFormatValue(charArrayBuffer, value, z);
        }
        int parameterCount = headerElement.getParameterCount();
        if (parameterCount > 0) {
            for (int i = 0; i < parameterCount; i++) {
                charArrayBuffer.append("; ");
                formatNameValuePair(charArrayBuffer, headerElement.getParameter(i), z);
            }
        }
        return charArrayBuffer;
    }

    protected int estimateHeaderElementLen(HeaderElement headerElement) {
        if (headerElement == null) {
            return 0;
        }
        int length = headerElement.getName().length();
        String value = headerElement.getValue();
        if (value != null) {
            length += value.length() + 3;
        }
        int parameterCount = headerElement.getParameterCount();
        if (parameterCount > 0) {
            for (int i = 0; i < parameterCount; i++) {
                length += estimateNameValuePairLen(headerElement.getParameter(i)) + 2;
            }
        }
        return length;
    }

    public static String formatParameters(NameValuePair[] nameValuePairArr, boolean z, HeaderValueFormatter headerValueFormatter) {
        if (headerValueFormatter == null) {
            headerValueFormatter = INSTANCE;
        }
        return headerValueFormatter.formatParameters(null, nameValuePairArr, z).toString();
    }

    @Override // org.apache.httpcore.message.HeaderValueFormatter
    public CharArrayBuffer formatParameters(CharArrayBuffer charArrayBuffer, NameValuePair[] nameValuePairArr, boolean z) {
        Args.notNull(nameValuePairArr, "Header parameter array");
        int iEstimateParametersLen = estimateParametersLen(nameValuePairArr);
        if (charArrayBuffer == null) {
            charArrayBuffer = new CharArrayBuffer(iEstimateParametersLen);
        } else {
            charArrayBuffer.ensureCapacity(iEstimateParametersLen);
        }
        for (int i = 0; i < nameValuePairArr.length; i++) {
            if (i > 0) {
                charArrayBuffer.append("; ");
            }
            formatNameValuePair(charArrayBuffer, nameValuePairArr[i], z);
        }
        return charArrayBuffer;
    }

    protected int estimateParametersLen(NameValuePair[] nameValuePairArr) {
        if (nameValuePairArr == null || nameValuePairArr.length < 1) {
            return 0;
        }
        int length = (nameValuePairArr.length - 1) * 2;
        for (NameValuePair nameValuePair : nameValuePairArr) {
            length += estimateNameValuePairLen(nameValuePair);
        }
        return length;
    }

    public static String formatNameValuePair(NameValuePair nameValuePair, boolean z, HeaderValueFormatter headerValueFormatter) {
        if (headerValueFormatter == null) {
            headerValueFormatter = INSTANCE;
        }
        return headerValueFormatter.formatNameValuePair(null, nameValuePair, z).toString();
    }

    @Override // org.apache.httpcore.message.HeaderValueFormatter
    public CharArrayBuffer formatNameValuePair(CharArrayBuffer charArrayBuffer, NameValuePair nameValuePair, boolean z) {
        Args.notNull(nameValuePair, "Name / value pair");
        int iEstimateNameValuePairLen = estimateNameValuePairLen(nameValuePair);
        if (charArrayBuffer == null) {
            charArrayBuffer = new CharArrayBuffer(iEstimateNameValuePairLen);
        } else {
            charArrayBuffer.ensureCapacity(iEstimateNameValuePairLen);
        }
        charArrayBuffer.append(nameValuePair.getName());
        String value = nameValuePair.getValue();
        if (value != null) {
            charArrayBuffer.append('=');
            doFormatValue(charArrayBuffer, value, z);
        }
        return charArrayBuffer;
    }

    protected int estimateNameValuePairLen(NameValuePair nameValuePair) {
        if (nameValuePair == null) {
            return 0;
        }
        int length = nameValuePair.getName().length();
        String value = nameValuePair.getValue();
        return value != null ? length + value.length() + 3 : length;
    }

    protected void doFormatValue(CharArrayBuffer charArrayBuffer, String str, boolean z) {
        if (!z) {
            for (int i = 0; i < str.length() && !z; i++) {
                z = isSeparator(str.charAt(i));
            }
        }
        if (z) {
            charArrayBuffer.append(TokenParser.DQUOTE);
        }
        for (int i2 = 0; i2 < str.length(); i2++) {
            char cCharAt = str.charAt(i2);
            if (isUnsafe(cCharAt)) {
                charArrayBuffer.append('\\');
            }
            charArrayBuffer.append(cCharAt);
        }
        if (z) {
            charArrayBuffer.append(TokenParser.DQUOTE);
        }
    }

    protected boolean isSeparator(char c) {
        return SEPARATORS.indexOf(c) >= 0;
    }

    protected boolean isUnsafe(char c) {
        return UNSAFE_CHARS.indexOf(c) >= 0;
    }
}
