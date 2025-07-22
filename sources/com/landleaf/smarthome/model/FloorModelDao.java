package com.landleaf.smarthome.model;

import android.database.Cursor;
import android.database.sqlite.SQLiteStatement;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.database.DatabaseStatement;
import org.greenrobot.greendao.internal.DaoConfig;

/* loaded from: classes.dex */
public class FloorModelDao extends AbstractDao<FloorModel, Long> {
    public static final String TABLENAME = "FLOOR_MODEL";
    private DaoSession daoSession;

    public static class Properties {

        /* renamed from: Id */
        public static final Property f146Id = new Property(0, Long.class, "id", true, "_id");
        public static final Property Name = new Property(1, String.class, "name", false, "NAME");
        public static final Property Floor = new Property(2, Integer.TYPE, "floor", false, "FLOOR");
    }

    @Override // org.greenrobot.greendao.AbstractDao
    protected final boolean isEntityUpdateable() {
        return true;
    }

    public FloorModelDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public FloorModelDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
        this.daoSession = daoSession;
    }

    public static void createTable(Database database, boolean z) {
        database.execSQL("CREATE TABLE " + (z ? "IF NOT EXISTS " : "") + "\"FLOOR_MODEL\" (\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT ,\"NAME\" TEXT,\"FLOOR\" INTEGER NOT NULL );");
    }

    public static void dropTable(Database database, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("DROP TABLE ");
        sb.append(z ? "IF EXISTS " : "");
        sb.append("\"FLOOR_MODEL\"");
        database.execSQL(sb.toString());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void bindValues(DatabaseStatement databaseStatement, FloorModel floorModel) {
        databaseStatement.clearBindings();
        Long id = floorModel.getId();
        if (id != null) {
            databaseStatement.bindLong(1, id.longValue());
        }
        String name = floorModel.getName();
        if (name != null) {
            databaseStatement.bindString(2, name);
        }
        databaseStatement.bindLong(3, floorModel.getFloor());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void bindValues(SQLiteStatement sQLiteStatement, FloorModel floorModel) {
        sQLiteStatement.clearBindings();
        Long id = floorModel.getId();
        if (id != null) {
            sQLiteStatement.bindLong(1, id.longValue());
        }
        String name = floorModel.getName();
        if (name != null) {
            sQLiteStatement.bindString(2, name);
        }
        sQLiteStatement.bindLong(3, floorModel.getFloor());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void attachEntity(FloorModel floorModel) {
        super.attachEntity((FloorModelDao) floorModel);
        floorModel.__setDaoSession(this.daoSession);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.greenrobot.greendao.AbstractDao
    public Long readKey(Cursor cursor, int i) {
        int i2 = i + 0;
        if (cursor.isNull(i2)) {
            return null;
        }
        return Long.valueOf(cursor.getLong(i2));
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.greenrobot.greendao.AbstractDao
    public FloorModel readEntity(Cursor cursor, int i) {
        int i2 = i + 0;
        int i3 = i + 1;
        return new FloorModel(cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2)), cursor.isNull(i3) ? null : cursor.getString(i3), cursor.getInt(i + 2));
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public void readEntity(Cursor cursor, FloorModel floorModel, int i) {
        int i2 = i + 0;
        floorModel.setId(cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2)));
        int i3 = i + 1;
        floorModel.setName(cursor.isNull(i3) ? null : cursor.getString(i3));
        floorModel.setFloor(cursor.getInt(i + 2));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final Long updateKeyAfterInsert(FloorModel floorModel, long j) {
        floorModel.setId(Long.valueOf(j));
        return Long.valueOf(j);
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public Long getKey(FloorModel floorModel) {
        if (floorModel != null) {
            return floorModel.getId();
        }
        return null;
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public boolean hasKey(FloorModel floorModel) {
        return floorModel.getId() != null;
    }
}
