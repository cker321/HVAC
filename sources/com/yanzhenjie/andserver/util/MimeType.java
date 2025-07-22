package com.yanzhenjie.andserver.util;

import android.text.TextUtils;
import com.yanzhenjie.andserver.error.InvalidMimeTypeException;
import java.io.Serializable;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;
import java.util.BitSet;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TreeSet;

/* loaded from: classes.dex */
public class MimeType implements Comparable<MimeType>, Serializable {
    private static final String PARAM_CHARSET = "charset";
    private static final BitSet TOKEN;
    protected static final String WILDCARD_TYPE = "*";
    private final Map<String, String> parameters;
    private final String subtype;
    private final String type;

    static {
        BitSet bitSet = new BitSet(128);
        for (int i = 0; i <= 31; i++) {
            bitSet.set(i);
        }
        bitSet.set(127);
        BitSet bitSet2 = new BitSet(128);
        bitSet2.set(40);
        bitSet2.set(41);
        bitSet2.set(60);
        bitSet2.set(62);
        bitSet2.set(64);
        bitSet2.set(44);
        bitSet2.set(59);
        bitSet2.set(58);
        bitSet2.set(92);
        bitSet2.set(34);
        bitSet2.set(47);
        bitSet2.set(91);
        bitSet2.set(93);
        bitSet2.set(63);
        bitSet2.set(61);
        bitSet2.set(123);
        bitSet2.set(125);
        bitSet2.set(32);
        bitSet2.set(9);
        BitSet bitSet3 = new BitSet(128);
        TOKEN = bitSet3;
        bitSet3.set(0, 128);
        TOKEN.andNot(bitSet);
        TOKEN.andNot(bitSet2);
    }

    public MimeType(String str) {
        this(str, WILDCARD_TYPE);
    }

    public MimeType(String str, String str2) {
        this(str, str2, (Map<String, String>) Collections.emptyMap());
    }

    public MimeType(String str, String str2, Charset charset) {
        this(str, str2, (Map<String, String>) Collections.singletonMap(PARAM_CHARSET, charset.name()));
    }

    public MimeType(MimeType mimeType, Charset charset) {
        this(mimeType.getType(), mimeType.getSubtype(), addCharsetParameter(charset, mimeType.getParameters()));
    }

    public MimeType(MimeType mimeType, Map<String, String> map) {
        this(mimeType.getType(), mimeType.getSubtype(), map);
    }

    public MimeType(String str, String str2, Map<String, String> map) {
        checkToken(str);
        checkToken(str2);
        this.type = str.toLowerCase(Locale.ENGLISH);
        this.subtype = str2.toLowerCase(Locale.ENGLISH);
        if (map != null && !map.isEmpty()) {
            LinkedCaseInsensitiveMap linkedCaseInsensitiveMap = new LinkedCaseInsensitiveMap(map.size(), Locale.ENGLISH);
            for (Map.Entry<String, String> entry : map.entrySet()) {
                String key = entry.getKey();
                String value = entry.getValue();
                checkParameters(key, value);
                linkedCaseInsensitiveMap.put((LinkedCaseInsensitiveMap) key, value);
            }
            this.parameters = Collections.unmodifiableMap(linkedCaseInsensitiveMap);
            return;
        }
        this.parameters = Collections.emptyMap();
    }

    private void checkToken(String str) {
        for (int i = 0; i < str.length(); i++) {
            char cCharAt = str.charAt(i);
            if (!TOKEN.get(cCharAt)) {
                throw new IllegalArgumentException("Invalid token character '" + cCharAt + "' in token \"" + str + "\"");
            }
        }
    }

    protected void checkParameters(String str, String str2) {
        Assert.hasLength(str, "'attribute' must not be empty.");
        Assert.hasLength(str2, "'value' must not be empty.");
        checkToken(str);
        if (PARAM_CHARSET.equals(str)) {
            Charset.forName(unquote(str2));
        } else {
            if (isQuotedString(str2)) {
                return;
            }
            checkToken(str2);
        }
    }

    private boolean isQuotedString(String str) {
        if (str.length() < 2) {
            return false;
        }
        return (str.startsWith("\"") && str.endsWith("\"")) || (str.startsWith("'") && str.endsWith("'"));
    }

    protected String unquote(String str) {
        if (str == null) {
            return null;
        }
        return isQuotedString(str) ? str.substring(1, str.length() - 1) : str;
    }

    public boolean isWildcardType() {
        return WILDCARD_TYPE.equals(getType());
    }

    public boolean isWildcardSubtype() {
        return WILDCARD_TYPE.equals(getSubtype()) || getSubtype().startsWith("*+");
    }

    public boolean isConcrete() {
        return (isWildcardType() || isWildcardSubtype()) ? false : true;
    }

    public String getType() {
        return this.type;
    }

    public String getSubtype() {
        return this.subtype;
    }

    public Charset getCharset() {
        String parameter = getParameter(PARAM_CHARSET);
        if (parameter != null) {
            return Charset.forName(unquote(parameter));
        }
        return null;
    }

    public String getParameter(String str) {
        return this.parameters.get(str);
    }

    public Map<String, String> getParameters() {
        return this.parameters;
    }

    public boolean includes(MimeType mimeType) {
        if (mimeType == null) {
            return false;
        }
        if (isWildcardType()) {
            return true;
        }
        if (getType().equals(mimeType.getType())) {
            if (getSubtype().equals(mimeType.getSubtype())) {
                return true;
            }
            if (isWildcardSubtype()) {
                int iIndexOf = getSubtype().indexOf(43);
                if (iIndexOf == -1) {
                    return true;
                }
                int iIndexOf2 = mimeType.getSubtype().indexOf(43);
                if (iIndexOf2 != -1) {
                    String strSubstring = getSubtype().substring(0, iIndexOf);
                    if (getSubtype().substring(iIndexOf + 1).equals(mimeType.getSubtype().substring(iIndexOf2 + 1)) && WILDCARD_TYPE.equals(strSubstring)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public boolean isCompatibleWith(MimeType mimeType) {
        if (mimeType == null) {
            return false;
        }
        if (isWildcardType() || mimeType.isWildcardType()) {
            return true;
        }
        if (getType().equals(mimeType.getType())) {
            if (getSubtype().equals(mimeType.getSubtype())) {
                return true;
            }
            if (isWildcardSubtype() || mimeType.isWildcardSubtype()) {
                int iIndexOf = getSubtype().indexOf(43);
                int iIndexOf2 = mimeType.getSubtype().indexOf(43);
                if (iIndexOf == -1 && iIndexOf2 == -1) {
                    return true;
                }
                if (iIndexOf != -1 && iIndexOf2 != -1) {
                    String strSubstring = getSubtype().substring(0, iIndexOf);
                    String strSubstring2 = mimeType.getSubtype().substring(0, iIndexOf2);
                    if (getSubtype().substring(iIndexOf + 1).equals(mimeType.getSubtype().substring(iIndexOf2 + 1)) && (WILDCARD_TYPE.equals(strSubstring) || WILDCARD_TYPE.equals(strSubstring2))) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public boolean equals(Object obj) {
        if (equalsExcludeParameter(obj)) {
            return parametersAreEqual((MimeType) obj);
        }
        return false;
    }

    public boolean equalsExcludeParameter(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof MimeType)) {
            return false;
        }
        MimeType mimeType = (MimeType) obj;
        return this.type.equalsIgnoreCase(mimeType.type) && this.subtype.equalsIgnoreCase(mimeType.subtype);
    }

    private boolean parametersAreEqual(MimeType mimeType) {
        if (this.parameters.size() != mimeType.parameters.size()) {
            return false;
        }
        for (String str : this.parameters.keySet()) {
            if (!mimeType.parameters.containsKey(str)) {
                return false;
            }
            if (PARAM_CHARSET.equals(str)) {
                Charset charset = getCharset();
                return charset != null && charset.equals(mimeType.getCharset());
            }
            String str2 = this.parameters.get(str);
            String str3 = mimeType.parameters.get(str);
            if (str2 == null || !str2.equals(str3)) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        return (((this.type.hashCode() * 31) + this.subtype.hashCode()) * 31) + this.parameters.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        appendTo(sb);
        return sb.toString();
    }

    protected void appendTo(StringBuilder sb) {
        sb.append(this.type);
        sb.append(org.apache.commons.p006io.IOUtils.DIR_SEPARATOR_UNIX);
        sb.append(this.subtype);
        appendTo(this.parameters, sb);
    }

    private void appendTo(Map<String, String> map, StringBuilder sb) {
        for (Map.Entry<String, String> entry : map.entrySet()) {
            sb.append(';');
            sb.append(entry.getKey());
            sb.append('=');
            sb.append(entry.getValue());
        }
    }

    @Override // java.lang.Comparable
    public int compareTo(MimeType mimeType) {
        int iCompareToIgnoreCase = getType().compareToIgnoreCase(mimeType.getType());
        if (iCompareToIgnoreCase != 0) {
            return iCompareToIgnoreCase;
        }
        int iCompareToIgnoreCase2 = getSubtype().compareToIgnoreCase(mimeType.getSubtype());
        if (iCompareToIgnoreCase2 != 0) {
            return iCompareToIgnoreCase2;
        }
        int size = getParameters().size() - mimeType.getParameters().size();
        if (size != 0) {
            return size;
        }
        TreeSet treeSet = new TreeSet(String.CASE_INSENSITIVE_ORDER);
        treeSet.addAll(getParameters().keySet());
        TreeSet treeSet2 = new TreeSet(String.CASE_INSENSITIVE_ORDER);
        treeSet2.addAll(mimeType.getParameters().keySet());
        Iterator it = treeSet.iterator();
        Iterator it2 = treeSet2.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            String str2 = (String) it2.next();
            int iCompareToIgnoreCase3 = str.compareToIgnoreCase(str2);
            if (iCompareToIgnoreCase3 != 0) {
                return iCompareToIgnoreCase3;
            }
            String str3 = getParameters().get(str);
            String str4 = mimeType.getParameters().get(str2);
            if (str4 == null) {
                str4 = "";
            }
            int iCompareTo = str3.compareTo(str4);
            if (iCompareTo != 0) {
                return iCompareTo;
            }
        }
        return 0;
    }

    public static MimeType valueOf(String str) {
        if (TextUtils.isEmpty(str)) {
            throw new InvalidMimeTypeException(str, "[mimeType] must not be empty");
        }
        int iIndexOf = str.indexOf(59);
        String strTrim = (iIndexOf >= 0 ? str.substring(0, iIndexOf) : str).trim();
        if (strTrim.isEmpty()) {
            throw new InvalidMimeTypeException(str, "'contentType' must not be empty");
        }
        if (WILDCARD_TYPE.equals(strTrim)) {
            strTrim = MediaType.ALL_VALUE;
        }
        int iIndexOf2 = strTrim.indexOf(47);
        if (iIndexOf2 == -1) {
            throw new InvalidMimeTypeException(str, "does not contain '/'");
        }
        if (iIndexOf2 == strTrim.length() - 1) {
            throw new InvalidMimeTypeException(str, "does not contain subtype after '/'");
        }
        String strSubstring = strTrim.substring(0, iIndexOf2);
        String strSubstring2 = strTrim.substring(iIndexOf2 + 1, strTrim.length());
        if (WILDCARD_TYPE.equals(strSubstring) && !WILDCARD_TYPE.equals(strSubstring2)) {
            throw new InvalidMimeTypeException(str, "wildcard type is legal only in '*/*' (all mime types)");
        }
        LinkedHashMap linkedHashMap = null;
        while (true) {
            int i = iIndexOf + 1;
            int i2 = i;
            boolean z = false;
            while (i2 < str.length()) {
                char cCharAt = str.charAt(i2);
                if (cCharAt == ';') {
                    if (!z) {
                        break;
                    }
                } else if (cCharAt == '\"') {
                    z = !z;
                }
                i2++;
            }
            String strTrim2 = str.substring(i, i2).trim();
            if (strTrim2.length() > 0) {
                if (linkedHashMap == null) {
                    linkedHashMap = new LinkedHashMap(4);
                }
                int iIndexOf3 = strTrim2.indexOf(61);
                if (iIndexOf3 >= 0) {
                    linkedHashMap.put(strTrim2.substring(0, iIndexOf3), strTrim2.substring(iIndexOf3 + 1, strTrim2.length()));
                }
            }
            if (i2 >= str.length()) {
                try {
                    return new MimeType(strSubstring, strSubstring2, linkedHashMap);
                } catch (UnsupportedCharsetException e) {
                    throw new InvalidMimeTypeException(str, "unsupported charset '" + e.getCharsetName() + "'");
                } catch (IllegalArgumentException e2) {
                    throw new InvalidMimeTypeException(str, e2.getMessage());
                }
            }
            iIndexOf = i2;
        }
    }

    public static String toString(Collection<? extends MimeType> collection) {
        StringBuilder sb = new StringBuilder();
        Iterator<? extends MimeType> it = collection.iterator();
        while (it.hasNext()) {
            it.next().appendTo(sb);
            if (it.hasNext()) {
                sb.append(", ");
            }
        }
        return sb.toString();
    }

    private static Map<String, String> addCharsetParameter(Charset charset, Map<String, String> map) {
        LinkedHashMap linkedHashMap = new LinkedHashMap(map);
        linkedHashMap.put(PARAM_CHARSET, charset.name());
        return linkedHashMap;
    }

    public static class SpecificityComparator<T extends MimeType> implements Comparator<T> {
        @Override // java.util.Comparator
        public int compare(T t, T t2) {
            if (t.isWildcardType() && !t2.isWildcardType()) {
                return 1;
            }
            if (t2.isWildcardType() && !t.isWildcardType()) {
                return -1;
            }
            if (!t.getType().equals(t2.getType())) {
                return 0;
            }
            if (t.isWildcardSubtype() && !t2.isWildcardSubtype()) {
                return 1;
            }
            if (t2.isWildcardSubtype() && !t.isWildcardSubtype()) {
                return -1;
            }
            if (t.getSubtype().equals(t2.getSubtype())) {
                return compareParameters(t, t2);
            }
            return 0;
        }

        protected int compareParameters(T t, T t2) {
            int size = t.getParameters().size();
            int size2 = t2.getParameters().size();
            if (size2 < size) {
                return -1;
            }
            return size2 == size ? 0 : 1;
        }
    }
}
