package org.greenrobot.greendao.test;

import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.DaoLog;
import org.greenrobot.greendao.InternalUnitTestDaoAccess;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.identityscope.IdentityScope;

/* loaded from: classes.dex */
public abstract class AbstractDaoTest<D extends AbstractDao<T, K>, T, K> extends DbTest {
    protected D dao;
    protected InternalUnitTestDaoAccess<T, K> daoAccess;
    protected final Class<D> daoClass;
    protected IdentityScope<K, T> identityScopeForDao;
    protected Property pkColumn;

    public AbstractDaoTest(Class<D> cls) {
        this(cls, true);
    }

    public AbstractDaoTest(Class<D> cls, boolean z) {
        super(z);
        this.daoClass = cls;
    }

    public void setIdentityScopeBeforeSetUp(IdentityScope<K, T> identityScope) {
        this.identityScopeForDao = identityScope;
    }

    @Override // org.greenrobot.greendao.test.DbTest
    protected void setUp() throws Exception {
        super.setUp();
        try {
            setUpTableForDao();
            InternalUnitTestDaoAccess<T, K> internalUnitTestDaoAccess = new InternalUnitTestDaoAccess<>(this.f319db, this.daoClass, this.identityScopeForDao);
            this.daoAccess = internalUnitTestDaoAccess;
            this.dao = internalUnitTestDaoAccess.getDao();
        } catch (Exception e) {
            throw new RuntimeException("Could not prepare DAO Test", e);
        }
    }

    protected void setUpTableForDao() throws Exception {
        try {
            this.daoClass.getMethod("createTable", Database.class, Boolean.TYPE).invoke(null, this.f319db, false);
        } catch (NoSuchMethodException unused) {
            DaoLog.m56i("No createTable method");
        }
    }

    protected void clearIdentityScopeIfAny() {
        IdentityScope<K, T> identityScope = this.identityScopeForDao;
        if (identityScope != null) {
            identityScope.clear();
            DaoLog.m52d("Identity scope cleared");
        } else {
            DaoLog.m52d("No identity scope to clear");
        }
    }

    protected void logTableDump() {
        logTableDump(this.dao.getTablename());
    }
}
