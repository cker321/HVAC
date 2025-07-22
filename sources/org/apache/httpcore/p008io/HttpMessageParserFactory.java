package org.apache.httpcore.p008io;

import org.apache.httpcore.HttpMessage;
import org.apache.httpcore.config.MessageConstraints;

/* loaded from: classes.dex */
public interface HttpMessageParserFactory<T extends HttpMessage> {
    HttpMessageParser<T> create(SessionInputBuffer sessionInputBuffer, MessageConstraints messageConstraints);
}
