package org.greenrobot.greendao;

import java.util.HashMap;
import java.util.Map;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.identityscope.IdentityScopeType;
import org.greenrobot.greendao.internal.DaoConfig;

/* loaded from: classes.dex */
public abstract class AbstractDaoMaster {
    protected final Map<Class<? extends AbstractDao<?, ?>>, DaoConfig> daoConfigMap = new HashMap();

    /* renamed from: db */
    protected final Database f313db;
    protected final int schemaVersion;

    public abstract AbstractDaoSession newSession();

    public abstract AbstractDaoSession newSession(IdentityScopeType identityScopeType);

    public AbstractDaoMaster(Database database, int i) {
        this.f313db = database;
        this.schemaVersion = i;
    }

    protected void registerDaoClass(Class<? extends AbstractDao<?, ?>> cls) {
        this.daoConfigMap.put(cls, new DaoConfig(this.f313db, cls));
    }

    public int getSchemaVersion() {
        return this.schemaVersion;
    }

    public Database getDatabase() {
        return this.f313db;
    }
}
