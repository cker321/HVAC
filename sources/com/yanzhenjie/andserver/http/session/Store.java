package com.yanzhenjie.andserver.http.session;

import java.io.IOException;

/* loaded from: classes.dex */
interface Store {
    StandardSession getSession(String str) throws IOException, ClassNotFoundException;

    boolean remove(StandardSession standardSession);

    boolean replace(StandardSession standardSession) throws IOException;
}
