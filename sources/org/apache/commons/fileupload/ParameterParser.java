package org.apache.commons.fileupload;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.fileupload.util.mime.MimeUtility;

/* loaded from: classes.dex */
public class ParameterParser {
    private char[] chars = null;
    private int pos = 0;
    private int len = 0;

    /* renamed from: i1 */
    private int f280i1 = 0;

    /* renamed from: i2 */
    private int f281i2 = 0;
    private boolean lowerCaseNames = false;

    private boolean hasChar() {
        return this.pos < this.len;
    }

    private String getToken(boolean z) {
        while (true) {
            int i = this.f280i1;
            if (i >= this.f281i2 || !Character.isWhitespace(this.chars[i])) {
                break;
            }
            this.f280i1++;
        }
        while (true) {
            int i2 = this.f281i2;
            if (i2 <= this.f280i1 || !Character.isWhitespace(this.chars[i2 - 1])) {
                break;
            }
            this.f281i2--;
        }
        if (z) {
            int i3 = this.f281i2;
            int i4 = this.f280i1;
            if (i3 - i4 >= 2) {
                char[] cArr = this.chars;
                if (cArr[i4] == '\"' && cArr[i3 - 1] == '\"') {
                    this.f280i1 = i4 + 1;
                    this.f281i2 = i3 - 1;
                }
            }
        }
        if (this.f281i2 <= this.f280i1) {
            return null;
        }
        char[] cArr2 = this.chars;
        int i5 = this.f280i1;
        return new String(cArr2, i5, this.f281i2 - i5);
    }

    private boolean isOneOf(char c, char[] cArr) {
        for (char c2 : cArr) {
            if (c == c2) {
                return true;
            }
        }
        return false;
    }

    private String parseToken(char[] cArr) {
        int i = this.pos;
        this.f280i1 = i;
        this.f281i2 = i;
        while (hasChar() && !isOneOf(this.chars[this.pos], cArr)) {
            this.f281i2++;
            this.pos++;
        }
        return getToken(false);
    }

    private String parseQuotedToken(char[] cArr) {
        int i = this.pos;
        this.f280i1 = i;
        this.f281i2 = i;
        boolean z = false;
        boolean z2 = false;
        while (hasChar()) {
            char c = this.chars[this.pos];
            if (!z && isOneOf(c, cArr)) {
                break;
            }
            if (!z2 && c == '\"') {
                z = !z;
            }
            z2 = !z2 && c == '\\';
            this.f281i2++;
            this.pos++;
        }
        return getToken(true);
    }

    public boolean isLowerCaseNames() {
        return this.lowerCaseNames;
    }

    public void setLowerCaseNames(boolean z) {
        this.lowerCaseNames = z;
    }

    public Map<String, String> parse(String str, char[] cArr) {
        if (cArr == null || cArr.length == 0) {
            return new HashMap();
        }
        char c = cArr[0];
        if (str != null) {
            int length = str.length();
            for (char c2 : cArr) {
                int iIndexOf = str.indexOf(c2);
                if (iIndexOf != -1 && iIndexOf < length) {
                    c = c2;
                    length = iIndexOf;
                }
            }
        }
        return parse(str, c);
    }

    public Map<String, String> parse(String str, char c) {
        if (str == null) {
            return new HashMap();
        }
        return parse(str.toCharArray(), c);
    }

    public Map<String, String> parse(char[] cArr, char c) {
        if (cArr == null) {
            return new HashMap();
        }
        return parse(cArr, 0, cArr.length, c);
    }

    public Map<String, String> parse(char[] cArr, int i, int i2, char c) {
        if (cArr == null) {
            return new HashMap();
        }
        HashMap map = new HashMap();
        this.chars = cArr;
        this.pos = i;
        this.len = i2;
        while (hasChar()) {
            String token = parseToken(new char[]{'=', c});
            String quotedToken = null;
            if (hasChar()) {
                int i3 = this.pos;
                if (cArr[i3] == '=') {
                    this.pos = i3 + 1;
                    quotedToken = parseQuotedToken(new char[]{c});
                    if (quotedToken != null) {
                        try {
                            quotedToken = MimeUtility.decodeText(quotedToken);
                        } catch (UnsupportedEncodingException unused) {
                        }
                    }
                }
            }
            if (hasChar()) {
                int i4 = this.pos;
                if (cArr[i4] == c) {
                    this.pos = i4 + 1;
                }
            }
            if (token != null && token.length() > 0) {
                if (this.lowerCaseNames) {
                    token = token.toLowerCase(Locale.ENGLISH);
                }
                map.put(token, quotedToken);
            }
        }
        return map;
    }
}
