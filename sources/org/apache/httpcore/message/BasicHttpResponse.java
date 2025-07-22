package org.apache.httpcore.message;

import java.util.Locale;
import org.apache.httpcore.HttpEntity;
import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.HttpVersion;
import org.apache.httpcore.ProtocolVersion;
import org.apache.httpcore.ReasonPhraseCatalog;
import org.apache.httpcore.StatusLine;
import org.apache.httpcore.util.Args;
import org.apache.httpcore.util.TextUtils;

/* loaded from: classes.dex */
public class BasicHttpResponse extends AbstractHttpMessage implements HttpResponse {
    private int code;
    private HttpEntity entity;
    private Locale locale;
    private final ReasonPhraseCatalog reasonCatalog;
    private String reasonPhrase;
    private StatusLine statusline;
    private ProtocolVersion ver;

    public BasicHttpResponse(StatusLine statusLine, ReasonPhraseCatalog reasonPhraseCatalog, Locale locale) {
        this.statusline = (StatusLine) Args.notNull(statusLine, "Status line");
        this.ver = statusLine.getProtocolVersion();
        this.code = statusLine.getStatusCode();
        this.reasonPhrase = statusLine.getReasonPhrase();
        this.reasonCatalog = reasonPhraseCatalog;
        this.locale = locale;
    }

    public BasicHttpResponse(StatusLine statusLine) {
        this.statusline = (StatusLine) Args.notNull(statusLine, "Status line");
        this.ver = statusLine.getProtocolVersion();
        this.code = statusLine.getStatusCode();
        this.reasonPhrase = statusLine.getReasonPhrase();
        this.reasonCatalog = null;
        this.locale = null;
    }

    public BasicHttpResponse(ProtocolVersion protocolVersion, int i, String str) {
        Args.notNegative(i, "Status code");
        this.statusline = null;
        this.ver = protocolVersion;
        this.code = i;
        this.reasonPhrase = str;
        this.reasonCatalog = null;
        this.locale = null;
    }

    @Override // org.apache.httpcore.HttpMessage
    public ProtocolVersion getProtocolVersion() {
        return this.ver;
    }

    @Override // org.apache.httpcore.HttpResponse
    public StatusLine getStatusLine() {
        if (this.statusline == null) {
            ProtocolVersion protocolVersion = this.ver;
            if (protocolVersion == null) {
                protocolVersion = HttpVersion.HTTP_1_1;
            }
            int i = this.code;
            String reason = this.reasonPhrase;
            if (reason == null) {
                reason = getReason(i);
            }
            this.statusline = new BasicStatusLine(protocolVersion, i, reason);
        }
        return this.statusline;
    }

    @Override // org.apache.httpcore.HttpResponse
    public HttpEntity getEntity() {
        return this.entity;
    }

    @Override // org.apache.httpcore.HttpResponse
    public Locale getLocale() {
        return this.locale;
    }

    @Override // org.apache.httpcore.HttpResponse
    public void setStatusLine(StatusLine statusLine) {
        this.statusline = (StatusLine) Args.notNull(statusLine, "Status line");
        this.ver = statusLine.getProtocolVersion();
        this.code = statusLine.getStatusCode();
        this.reasonPhrase = statusLine.getReasonPhrase();
    }

    @Override // org.apache.httpcore.HttpResponse
    public void setStatusLine(ProtocolVersion protocolVersion, int i) {
        Args.notNegative(i, "Status code");
        this.statusline = null;
        this.ver = protocolVersion;
        this.code = i;
        this.reasonPhrase = null;
    }

    @Override // org.apache.httpcore.HttpResponse
    public void setStatusLine(ProtocolVersion protocolVersion, int i, String str) {
        Args.notNegative(i, "Status code");
        this.statusline = null;
        this.ver = protocolVersion;
        this.code = i;
        this.reasonPhrase = str;
    }

    @Override // org.apache.httpcore.HttpResponse
    public void setStatusCode(int i) {
        Args.notNegative(i, "Status code");
        this.statusline = null;
        this.code = i;
        this.reasonPhrase = null;
    }

    @Override // org.apache.httpcore.HttpResponse
    public void setReasonPhrase(String str) {
        this.statusline = null;
        if (TextUtils.isBlank(str)) {
            str = null;
        }
        this.reasonPhrase = str;
    }

    @Override // org.apache.httpcore.HttpResponse
    public void setEntity(HttpEntity httpEntity) {
        this.entity = httpEntity;
    }

    @Override // org.apache.httpcore.HttpResponse
    public void setLocale(Locale locale) {
        this.locale = (Locale) Args.notNull(locale, "Locale");
        this.statusline = null;
    }

    protected String getReason(int i) {
        ReasonPhraseCatalog reasonPhraseCatalog = this.reasonCatalog;
        if (reasonPhraseCatalog == null) {
            return null;
        }
        Locale locale = this.locale;
        if (locale == null) {
            locale = Locale.getDefault();
        }
        return reasonPhraseCatalog.getReason(i, locale);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getStatusLine());
        sb.append(TokenParser.f302SP);
        sb.append(this.headergroup);
        if (this.entity != null) {
            sb.append(TokenParser.f302SP);
            sb.append(this.entity);
        }
        return sb.toString();
    }
}
