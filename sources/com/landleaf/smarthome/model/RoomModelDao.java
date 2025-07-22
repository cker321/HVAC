package com.landleaf.smarthome.model;

import android.database.Cursor;
import android.database.sqlite.SQLiteStatement;
import java.util.List;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.database.DatabaseStatement;
import org.greenrobot.greendao.internal.DaoConfig;
import org.greenrobot.greendao.query.Query;
import org.greenrobot.greendao.query.QueryBuilder;
import org.greenrobot.greendao.query.WhereCondition;

/* loaded from: classes.dex */
public class RoomModelDao extends AbstractDao<RoomModel, Long> {
    public static final String TABLENAME = "ROOM_MODEL";
    private DaoSession daoSession;
    private Query<RoomModel> floorModel_RoomsQuery;

    public static class Properties {

        /* renamed from: Id */
        public static final Property f149Id = new Property(0, Long.class, "id", true, "_id");
        public static final Property RoomName = new Property(1, String.class, "roomName", false, "ROOM_NAME");
        public static final Property RoomType = new Property(2, Integer.TYPE, "roomType", false, "ROOM_TYPE");
        public static final Property SortNo = new Property(3, Integer.TYPE, "sortNo", false, "SORT_NO");
        public static final Property FloorId = new Property(4, Long.TYPE, "floorId", false, "FLOOR_ID");
    }

    @Override // org.greenrobot.greendao.AbstractDao
    protected final boolean isEntityUpdateable() {
        return true;
    }

    public RoomModelDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public RoomModelDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
        this.daoSession = daoSession;
    }

    public static void createTable(Database database, boolean z) {
        database.execSQL("CREATE TABLE " + (z ? "IF NOT EXISTS " : "") + "\"ROOM_MODEL\" (\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT ,\"ROOM_NAME\" TEXT,\"ROOM_TYPE\" INTEGER NOT NULL ,\"SORT_NO\" INTEGER NOT NULL ,\"FLOOR_ID\" INTEGER NOT NULL );");
    }

    public static void dropTable(Database database, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("DROP TABLE ");
        sb.append(z ? "IF EXISTS " : "");
        sb.append("\"ROOM_MODEL\"");
        database.execSQL(sb.toString());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void bindValues(DatabaseStatement databaseStatement, RoomModel roomModel) {
        databaseStatement.clearBindings();
        Long id = roomModel.getId();
        if (id != null) {
            databaseStatement.bindLong(1, id.longValue());
        }
        String roomName = roomModel.getRoomName();
        if (roomName != null) {
            databaseStatement.bindString(2, roomName);
        }
        databaseStatement.bindLong(3, roomModel.getRoomType());
        databaseStatement.bindLong(4, roomModel.getSortNo());
        databaseStatement.bindLong(5, roomModel.getFloorId());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void bindValues(SQLiteStatement sQLiteStatement, RoomModel roomModel) {
        sQLiteStatement.clearBindings();
        Long id = roomModel.getId();
        if (id != null) {
            sQLiteStatement.bindLong(1, id.longValue());
        }
        String roomName = roomModel.getRoomName();
        if (roomName != null) {
            sQLiteStatement.bindString(2, roomName);
        }
        sQLiteStatement.bindLong(3, roomModel.getRoomType());
        sQLiteStatement.bindLong(4, roomModel.getSortNo());
        sQLiteStatement.bindLong(5, roomModel.getFloorId());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void attachEntity(RoomModel roomModel) {
        super.attachEntity((RoomModelDao) roomModel);
        roomModel.__setDaoSession(this.daoSession);
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
    public RoomModel readEntity(Cursor cursor, int i) {
        int i2 = i + 0;
        Long lValueOf = cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2));
        int i3 = i + 1;
        return new RoomModel(lValueOf, cursor.isNull(i3) ? null : cursor.getString(i3), cursor.getInt(i + 2), cursor.getInt(i + 3), cursor.getLong(i + 4));
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public void readEntity(Cursor cursor, RoomModel roomModel, int i) {
        int i2 = i + 0;
        roomModel.setId(cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2)));
        int i3 = i + 1;
        roomModel.setRoomName(cursor.isNull(i3) ? null : cursor.getString(i3));
        roomModel.setRoomType(cursor.getInt(i + 2));
        roomModel.setSortNo(cursor.getInt(i + 3));
        roomModel.setFloorId(cursor.getLong(i + 4));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final Long updateKeyAfterInsert(RoomModel roomModel, long j) {
        roomModel.setId(Long.valueOf(j));
        return Long.valueOf(j);
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public Long getKey(RoomModel roomModel) {
        if (roomModel != null) {
            return roomModel.getId();
        }
        return null;
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public boolean hasKey(RoomModel roomModel) {
        return roomModel.getId() != null;
    }

    public List<RoomModel> _queryFloorModel_Rooms(long j) {
        synchronized (this) {
            if (this.floorModel_RoomsQuery == null) {
                QueryBuilder<RoomModel> queryBuilder = queryBuilder();
                queryBuilder.where(Properties.FloorId.m63eq(null), new WhereCondition[0]);
                this.floorModel_RoomsQuery = queryBuilder.build();
            }
        }
        Query<RoomModel> queryForCurrentThread = this.floorModel_RoomsQuery.forCurrentThread();
        queryForCurrentThread.setParameter(0, (Object) Long.valueOf(j));
        return queryForCurrentThread.list();
    }
}
