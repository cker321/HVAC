package org.apache.httpcore.message;

import java.io.Serializable;
import org.apache.httpcore.FormattedHeader;
import org.apache.httpcore.HeaderElement;
import org.apache.httpcore.ParseException;
import org.apache.httpcore.util.Args;
import org.apache.httpcore.util.CharArrayBuffer;

/* loaded from: classes.dex */
public class BufferedHeader implements FormattedHeader, Cloneable, Serializable {
    private static final long serialVersionUID = -2768352615787625448L;
    private final CharArrayBuffer buffer;
    private final String name;
    private final int valuePos;

    public BufferedHeader(CharArrayBuffer charArrayBuffer) throws ParseException {
        Args.notNull(charArrayBuffer, "Char array buffer");
        int iIndexOf = charArrayBuffer.indexOf(58);
        if (iIndexOf == -1) {
            throw new ParseException("Invalid header: " + charArrayBuffer.toString());
        }
        String strSubstringTrimmed = charArrayBuffer.substringTrimmed(0, iIndexOf);
        if (strSubstringTrimmed.isEmpty()) {
            throw new ParseException("Invalid header: " + charArrayBuffer.toString());
        }
        this.buffer = charArrayBuffer;
        this.name = strSubstringTrimmed;
        this.valuePos = iIndexOf + 1;
    }

    @Override // org.apache.httpcore.NameValuePair
    public String getName() {
        return this.name;
    }

    @Override // org.apache.httpcore.NameValuePair
    public String getValue() {
        CharArrayBuffer charArrayBuffer = this.buffer;
        return charArrayBuffer.substringTrimmed(this.valuePos, charArrayBuffer.length());
    }

    @Override // org.apache.httpcore.Header
    public HeaderElement[] getElements() throws ParseException {
        ParserCursor parserCursor = new ParserCursor(0, this.buffer.length());
        parserCursor.updatePos(this.valuePos);
        return BasicHeaderValueParser.INSTANCE.parseElements(this.buffer, parserCursor);
    }

    @Override // org.apache.httpcore.FormattedHeader
    public int getValuePos() {
        return this.valuePos;
    }

    @Override // org.apache.httpcore.FormattedHeader
    public CharArrayBuffer getBuffer() {
        return this.buffer;
    }

    public String toString() {
        return this.buffer.toString();
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
