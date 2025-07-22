package org.apache.httpcore.impl.p007io;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.httpcore.Header;
import org.apache.httpcore.HttpException;
import org.apache.httpcore.HttpMessage;
import org.apache.httpcore.ParseException;
import org.apache.httpcore.ProtocolException;
import org.apache.httpcore.config.MessageConstraints;
import org.apache.httpcore.message.BasicLineParser;
import org.apache.httpcore.message.LineParser;
import org.apache.httpcore.p008io.HttpMessageParser;
import org.apache.httpcore.p008io.SessionInputBuffer;
import org.apache.httpcore.params.HttpParamConfig;
import org.apache.httpcore.params.HttpParams;
import org.apache.httpcore.util.Args;
import org.apache.httpcore.util.CharArrayBuffer;

/* loaded from: classes.dex */
public abstract class AbstractMessageParser<T extends HttpMessage> implements HttpMessageParser<T> {
    private static final int HEADERS = 1;
    private static final int HEAD_LINE = 0;
    private final List<CharArrayBuffer> headerLines;
    protected final LineParser lineParser;
    private T message;
    private final MessageConstraints messageConstraints;
    private final SessionInputBuffer sessionBuffer;
    private int state;

    protected abstract T parseHead(SessionInputBuffer sessionInputBuffer) throws ParseException, IOException, HttpException;

    @Deprecated
    public AbstractMessageParser(SessionInputBuffer sessionInputBuffer, LineParser lineParser, HttpParams httpParams) {
        Args.notNull(sessionInputBuffer, "Session input buffer");
        Args.notNull(httpParams, "HTTP parameters");
        this.sessionBuffer = sessionInputBuffer;
        this.messageConstraints = HttpParamConfig.getMessageConstraints(httpParams);
        this.lineParser = lineParser == null ? BasicLineParser.INSTANCE : lineParser;
        this.headerLines = new ArrayList();
        this.state = 0;
    }

    public AbstractMessageParser(SessionInputBuffer sessionInputBuffer, LineParser lineParser, MessageConstraints messageConstraints) {
        this.sessionBuffer = (SessionInputBuffer) Args.notNull(sessionInputBuffer, "Session input buffer");
        this.lineParser = lineParser == null ? BasicLineParser.INSTANCE : lineParser;
        this.messageConstraints = messageConstraints == null ? MessageConstraints.DEFAULT : messageConstraints;
        this.headerLines = new ArrayList();
        this.state = 0;
    }

    public static Header[] parseHeaders(SessionInputBuffer sessionInputBuffer, int i, int i2, LineParser lineParser) throws IOException, HttpException {
        ArrayList arrayList = new ArrayList();
        if (lineParser == null) {
            lineParser = BasicLineParser.INSTANCE;
        }
        return parseHeaders(sessionInputBuffer, i, i2, lineParser, arrayList);
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x008d, code lost:
    
        r8 = new org.apache.httpcore.Header[r12.size()];
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0097, code lost:
    
        if (r5 >= r12.size()) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x009f, code lost:
    
        r8[r5] = r11.parseHeader(r12.get(r5));
     */
    /* JADX WARN: Code restructure failed: missing block: B:42:0x00a5, code lost:
    
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00a8, code lost:
    
        r8 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00b2, code lost:
    
        throw new org.apache.httpcore.ProtocolException(r8.getMessage());
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00b3, code lost:
    
        return r8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct code enable 'Show inconsistent code' option in preferences
    */
    public static org.apache.httpcore.Header[] parseHeaders(org.apache.httpcore.p008io.SessionInputBuffer r8, int r9, int r10, org.apache.httpcore.message.LineParser r11, java.util.List<org.apache.httpcore.util.CharArrayBuffer> r12) throws java.io.IOException, org.apache.httpcore.HttpException {
        /*
            java.lang.String r0 = "Session input buffer"
            org.apache.httpcore.util.Args.notNull(r8, r0)
            java.lang.String r0 = "Line parser"
            org.apache.httpcore.util.Args.notNull(r11, r0)
            java.lang.String r0 = "Header line list"
            org.apache.httpcore.util.Args.notNull(r12, r0)
            r0 = 0
            r1 = r0
            r2 = r1
        L12:
            if (r1 != 0) goto L1c
            org.apache.httpcore.util.CharArrayBuffer r1 = new org.apache.httpcore.util.CharArrayBuffer
            r3 = 64
            r1.<init>(r3)
            goto L1f
        L1c:
            r1.clear()
        L1f:
            int r3 = r8.readLine(r1)
            r4 = -1
            r5 = 0
            if (r3 == r4) goto L8d
            int r3 = r1.length()
            r4 = 1
            if (r3 >= r4) goto L2f
            goto L8d
        L2f:
            char r3 = r1.charAt(r5)
            r6 = 9
            r7 = 32
            if (r3 == r7) goto L3f
            char r3 = r1.charAt(r5)
            if (r3 != r6) goto L77
        L3f:
            if (r2 == 0) goto L77
        L41:
            int r3 = r1.length()
            if (r5 >= r3) goto L53
            char r3 = r1.charAt(r5)
            if (r3 == r7) goto L50
            if (r3 == r6) goto L50
            goto L53
        L50:
            int r5 = r5 + 1
            goto L41
        L53:
            if (r10 <= 0) goto L6b
            int r3 = r2.length()
            int r3 = r3 + r4
            int r4 = r1.length()
            int r3 = r3 + r4
            int r3 = r3 - r5
            if (r3 > r10) goto L63
            goto L6b
        L63:
            org.apache.httpcore.MessageConstraintException r8 = new org.apache.httpcore.MessageConstraintException
            java.lang.String r9 = "Maximum line length limit exceeded"
            r8.<init>(r9)
            throw r8
        L6b:
            r2.append(r7)
            int r3 = r1.length()
            int r3 = r3 - r5
            r2.append(r1, r5, r3)
            goto L7c
        L77:
            r12.add(r1)
            r2 = r1
            r1 = r0
        L7c:
            if (r9 <= 0) goto L12
            int r3 = r12.size()
            if (r3 >= r9) goto L85
            goto L12
        L85:
            org.apache.httpcore.MessageConstraintException r8 = new org.apache.httpcore.MessageConstraintException
            java.lang.String r9 = "Maximum header count exceeded"
            r8.<init>(r9)
            throw r8
        L8d:
            int r8 = r12.size()
            org.apache.httpcore.Header[] r8 = new org.apache.httpcore.Header[r8]
        L93:
            int r9 = r12.size()
            if (r5 >= r9) goto Lb3
            java.lang.Object r9 = r12.get(r5)
            org.apache.httpcore.util.CharArrayBuffer r9 = (org.apache.httpcore.util.CharArrayBuffer) r9
            org.apache.httpcore.Header r9 = r11.parseHeader(r9)     // Catch: org.apache.httpcore.ParseException -> La8
            r8[r5] = r9     // Catch: org.apache.httpcore.ParseException -> La8
            int r5 = r5 + 1
            goto L93
        La8:
            r8 = move-exception
            org.apache.httpcore.ProtocolException r9 = new org.apache.httpcore.ProtocolException
            java.lang.String r8 = r8.getMessage()
            r9.<init>(r8)
            throw r9
        Lb3:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.httpcore.impl.p007io.AbstractMessageParser.parseHeaders(org.apache.httpcore.io.SessionInputBuffer, int, int, org.apache.httpcore.message.LineParser, java.util.List):org.apache.httpcore.Header[]");
    }

    @Override // org.apache.httpcore.p008io.HttpMessageParser
    public T parse() throws IOException, HttpException {
        int i = this.state;
        if (i == 0) {
            try {
                this.message = (T) parseHead(this.sessionBuffer);
                this.state = 1;
            } catch (ParseException e) {
                throw new ProtocolException(e.getMessage(), e);
            }
        } else if (i != 1) {
            throw new IllegalStateException("Inconsistent parser state");
        }
        this.message.setHeaders(parseHeaders(this.sessionBuffer, this.messageConstraints.getMaxHeaderCount(), this.messageConstraints.getMaxLineLength(), this.lineParser, this.headerLines));
        T t = this.message;
        this.message = null;
        this.headerLines.clear();
        this.state = 0;
        return t;
    }
}
