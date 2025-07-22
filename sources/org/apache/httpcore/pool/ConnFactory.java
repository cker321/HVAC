package org.apache.httpcore.pool;

import java.io.IOException;

/* loaded from: classes.dex */
public interface ConnFactory<T, C> {
    C create(T t) throws IOException;
}
