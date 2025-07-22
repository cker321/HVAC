package com.yanzhenjie.andserver.http.session;

import android.content.Context;
import java.io.File;
import java.io.IOException;

/* loaded from: classes.dex */
public class StandardSessionManager implements SessionManager {
    private IdGenerator mIdGenerator = new StandardIdGenerator();
    private Store mStore;

    public StandardSessionManager(Context context) {
        this.mStore = new StandardStore(new File(context.getCacheDir(), "_andserver_session_"));
    }

    @Override // com.yanzhenjie.andserver.http.session.SessionManager
    public void add(Session session) throws IOException {
        if ((session instanceof StandardSession) && session.isNew()) {
            StandardSession standardSession = (StandardSession) session;
            standardSession.setNew(false);
            this.mStore.replace(standardSession);
        }
    }

    @Override // com.yanzhenjie.andserver.http.session.SessionManager
    public void changeSessionId(Session session) {
        if (session instanceof StandardSession) {
            ((StandardSession) session).setId(this.mIdGenerator.generateId());
        }
    }

    @Override // com.yanzhenjie.andserver.http.session.SessionManager
    public Session createSession() {
        StandardSession standardSessionNewSession = newSession();
        standardSessionNewSession.setId(this.mIdGenerator.generateId());
        return standardSessionNewSession;
    }

    @Override // com.yanzhenjie.andserver.http.session.SessionManager
    public Session findSession(String str) throws IOException, ClassNotFoundException {
        StandardSession session = this.mStore.getSession(str);
        if (session != null) {
            session.setLastAccessedTime(System.currentTimeMillis());
        }
        return session;
    }

    @Override // com.yanzhenjie.andserver.http.session.SessionManager
    public void remove(Session session) {
        if (session instanceof StandardSession) {
            this.mStore.remove((StandardSession) session);
        }
    }

    private StandardSession newSession() {
        StandardSession standardSession = new StandardSession();
        long jCurrentTimeMillis = System.currentTimeMillis();
        standardSession.setCreatedTime(jCurrentTimeMillis);
        standardSession.setLastAccessedTime(jCurrentTimeMillis);
        standardSession.setNew(true);
        standardSession.setValid(true);
        return standardSession;
    }
}
