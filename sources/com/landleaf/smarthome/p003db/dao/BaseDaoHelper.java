package com.landleaf.smarthome.p003db.dao;

import android.database.SQLException;
import com.landleaf.smarthome.p003db.manager.DbManager;
import java.util.ArrayList;
import java.util.List;
import org.greenrobot.greendao.AbstractDao;

/* loaded from: classes.dex */
public class BaseDaoHelper<T extends AbstractDao, R> {
    protected T dao;
    protected DbManager mManager = DbManager.getInstance();

    public BaseDaoHelper() {
    }

    public BaseDaoHelper(T t) {
        this.dao = t;
    }

    public boolean insertOneData(R r) {
        boolean z = this.dao.insertOrReplace(r) != -1;
        this.dao.detachAll();
        return z;
    }

    public void deleteAll() throws SQLException {
        this.dao.deleteAll();
        this.dao.detachAll();
    }

    public void insertDatas(List<R> list) {
        if (list == null || list.size() <= 0) {
            return;
        }
        this.dao.insertOrReplaceInTx(list);
        this.dao.detachAll();
    }

    public List<R> findAllData() {
        List<R> listLoadAll = this.dao.loadAll();
        return (listLoadAll == null || listLoadAll.size() == 0) ? new ArrayList() : listLoadAll;
    }

    public boolean updateModel(R r) {
        try {
            this.dao.update(r);
            this.dao.detachAll();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void deleteOneData(long j) {
        this.dao.deleteByKey(Long.valueOf(j));
        this.dao.detachAll();
    }

    public void deleteOneData(R r) {
        this.dao.delete(r);
        this.dao.detachAll();
    }

    public long getDataCount() {
        return this.dao.count();
    }
}
