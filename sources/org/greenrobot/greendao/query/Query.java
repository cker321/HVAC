package org.greenrobot.greendao.query;

import java.util.Date;
import java.util.List;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.DaoException;
import org.greenrobot.greendao.p009rx.RxQuery;
import rx.schedulers.Schedulers;

/* loaded from: classes.dex */
public class Query<T> extends AbstractQueryWithLimit<T> {
    private final QueryData<T> queryData;
    private volatile RxQuery rxTxIo;
    private volatile RxQuery rxTxPlain;

    /* synthetic */ Query(QueryData queryData, AbstractDao abstractDao, String str, String[] strArr, int i, int i2, C08791 c08791) {
        this(queryData, abstractDao, str, strArr, i, i2);
    }

    @Override // org.greenrobot.greendao.query.AbstractQueryWithLimit
    public /* bridge */ /* synthetic */ void setLimit(int i) {
        super.setLimit(i);
    }

    @Override // org.greenrobot.greendao.query.AbstractQueryWithLimit
    public /* bridge */ /* synthetic */ void setOffset(int i) {
        super.setOffset(i);
    }

    private static final class QueryData<T2> extends AbstractQueryData<T2, Query<T2>> {
        private final int limitPosition;
        private final int offsetPosition;

        QueryData(AbstractDao<T2, ?> abstractDao, String str, String[] strArr, int i, int i2) {
            super(abstractDao, str, strArr);
            this.limitPosition = i;
            this.offsetPosition = i2;
        }

        @Override // org.greenrobot.greendao.query.AbstractQueryData
        public Query<T2> createQuery() {
            return new Query<>(this, this.dao, this.sql, (String[]) this.initialValues.clone(), this.limitPosition, this.offsetPosition);
        }
    }

    public static <T2> Query<T2> internalCreate(AbstractDao<T2, ?> abstractDao, String str, Object[] objArr) {
        return create(abstractDao, str, objArr, -1, -1);
    }

    static <T2> Query<T2> create(AbstractDao<T2, ?> abstractDao, String str, Object[] objArr, int i, int i2) {
        return new QueryData(abstractDao, str, toStringArray(objArr), i, i2).forCurrentThread();
    }

    private Query(QueryData<T> queryData, AbstractDao<T, ?> abstractDao, String str, String[] strArr, int i, int i2) {
        super(abstractDao, str, strArr, i, i2);
        this.queryData = queryData;
    }

    public Query<T> forCurrentThread() {
        return (Query) this.queryData.forCurrentThread(this);
    }

    public List<T> list() {
        checkThread();
        return this.daoAccess.loadAllAndCloseCursor(this.dao.getDatabase().rawQuery(this.sql, this.parameters));
    }

    public LazyList<T> listLazy() {
        checkThread();
        return new LazyList<>(this.daoAccess, this.dao.getDatabase().rawQuery(this.sql, this.parameters), true);
    }

    public LazyList<T> listLazyUncached() {
        checkThread();
        return new LazyList<>(this.daoAccess, this.dao.getDatabase().rawQuery(this.sql, this.parameters), false);
    }

    public CloseableListIterator<T> listIterator() {
        return listLazyUncached().listIteratorAutoClose();
    }

    public T unique() {
        checkThread();
        return this.daoAccess.loadUniqueAndCloseCursor(this.dao.getDatabase().rawQuery(this.sql, this.parameters));
    }

    public T uniqueOrThrow() {
        T tUnique = unique();
        if (tUnique != null) {
            return tUnique;
        }
        throw new DaoException("No entity found for query");
    }

    @Override // org.greenrobot.greendao.query.AbstractQueryWithLimit, org.greenrobot.greendao.query.AbstractQuery
    public Query<T> setParameter(int i, Object obj) {
        return (Query) super.setParameter(i, obj);
    }

    @Override // org.greenrobot.greendao.query.AbstractQuery
    public Query<T> setParameter(int i, Date date) {
        return (Query) super.setParameter(i, date);
    }

    @Override // org.greenrobot.greendao.query.AbstractQuery
    public Query<T> setParameter(int i, Boolean bool) {
        return (Query) super.setParameter(i, bool);
    }

    public RxQuery __internalRxPlain() {
        if (this.rxTxPlain == null) {
            this.rxTxPlain = new RxQuery(this);
        }
        return this.rxTxPlain;
    }

    public RxQuery __InternalRx() {
        if (this.rxTxIo == null) {
            this.rxTxIo = new RxQuery(this, Schedulers.io());
        }
        return this.rxTxIo;
    }
}
