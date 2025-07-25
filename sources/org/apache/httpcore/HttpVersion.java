package org.apache.httpcore;

/* loaded from: classes.dex */
public final class HttpVersion extends ProtocolVersion {
    public static final String HTTP = "HTTP";
    public static final HttpVersion HTTP_0_9 = new HttpVersion(0, 9);
    public static final HttpVersion HTTP_1_0 = new HttpVersion(1, 0);
    public static final HttpVersion HTTP_1_1 = new HttpVersion(1, 1);
    private static final long serialVersionUID = -5856653513894415344L;

    public HttpVersion(int i, int i2) {
        super(HTTP, i, i2);
    }

    @Override // org.apache.httpcore.ProtocolVersion
    public ProtocolVersion forVersion(int i, int i2) {
        if (i == this.major && i2 == this.minor) {
            return this;
        }
        if (i == 1) {
            if (i2 == 0) {
                return HTTP_1_0;
            }
            if (i2 == 1) {
                return HTTP_1_1;
            }
        }
        if (i == 0 && i2 == 9) {
            return HTTP_0_9;
        }
        return new HttpVersion(i, i2);
    }
}
