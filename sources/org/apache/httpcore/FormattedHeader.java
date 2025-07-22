package org.apache.httpcore;

import org.apache.httpcore.util.CharArrayBuffer;

/* loaded from: classes.dex */
public interface FormattedHeader extends Header {
    CharArrayBuffer getBuffer();

    int getValuePos();
}
