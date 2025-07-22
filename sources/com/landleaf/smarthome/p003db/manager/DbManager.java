package com.landleaf.smarthome.p003db.manager;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import com.landleaf.smarthome.model.DaoMaster;
import com.landleaf.smarthome.model.DaoSession;
import org.greenrobot.greendao.query.QueryBuilder;

/* loaded from: classes.dex */
public class DbManager {
    private static final String DB_NAME = "landleaf.db";
    private static Context context;
    private static volatile DaoMaster mDaoMaster;
    private static volatile DaoSession mDaoSession;
    private static volatile DbManager mDbManager;
    private static DaoMaster.DevOpenHelper mDevOpenHelper;

    private DbManager(Context context2) {
        context = context2;
        mDevOpenHelper = new DaoMaster.DevOpenHelper(context2, DB_NAME);
        getDaoMaster();
        getDaoSession();
    }

    public static DbManager getInstance() {
        if (mDbManager == null) {
            synchronized (DbManager.class) {
                if (mDbManager == null) {
                    mDbManager = new DbManager(context);
                }
            }
        }
        return mDbManager;
    }

    public static void setDebug() {
        QueryBuilder.LOG_SQL = true;
        QueryBuilder.LOG_VALUES = true;
    }

    public static SQLiteDatabase getReadableDatabase() {
        if (mDevOpenHelper == null) {
            getInstance();
        }
        return mDevOpenHelper.getReadableDatabase();
    }

    public static SQLiteDatabase getWritableDatabase() {
        if (mDevOpenHelper == null) {
            getInstance();
        }
        return mDevOpenHelper.getWritableDatabase();
    }

    public static DaoMaster getDaoMaster() {
        if (mDaoMaster == null) {
            synchronized (DbManager.class) {
                if (mDaoMaster == null) {
                    mDaoMaster = new DaoMaster(getWritableDatabase());
                }
            }
        }
        return mDaoMaster;
    }

    public static DaoSession getDaoSession() {
        if (mDaoSession == null) {
            synchronized (DbManager.class) {
                mDaoSession = getDaoMaster().newSession();
            }
        }
        return mDaoSession;
    }

    public void closeConnection() {
        closeHelper();
        closeDaoSession();
    }

    public void closeHelper() {
        DaoMaster.DevOpenHelper devOpenHelper = mDevOpenHelper;
        if (devOpenHelper != null) {
            devOpenHelper.close();
            mDevOpenHelper = null;
        }
    }

    public void closeDaoSession() {
        if (mDaoSession != null) {
            mDaoSession.clear();
            mDaoSession = null;
        }
    }
}
