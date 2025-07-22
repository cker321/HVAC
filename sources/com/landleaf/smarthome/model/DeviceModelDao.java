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
public class DeviceModelDao extends AbstractDao<DeviceModel, Long> {
    public static final String TABLENAME = "DEVICE_MODEL";
    private Query<DeviceModel> roomModel_DevicesQuery;

    public static class Properties {

        /* renamed from: Id */
        public static final Property f144Id = new Property(0, Long.class, "id", true, "_id");
        public static final Property DeviceSn = new Property(1, String.class, "deviceSn", false, "DEVICE_SN");
        public static final Property DeviceName = new Property(2, String.class, "deviceName", false, "DEVICE_NAME");
        public static final Property Port = new Property(3, Integer.TYPE, "port", false, "PORT");
        public static final Property Protocol = new Property(4, Integer.TYPE, "protocol", false, "PROTOCOL");
        public static final Property SortNo = new Property(5, Integer.TYPE, "sortNo", false, "SORT_NO");
        public static final Property RoomId = new Property(6, Long.class, "roomId", false, "ROOM_ID");
        public static final Property ProductCode = new Property(7, Integer.TYPE, "productCode", false, "PRODUCT_CODE");
        public static final Property HvacFlag = new Property(8, Integer.TYPE, "hvacFlag", false, "HVAC_FLAG");
    }

    @Override // org.greenrobot.greendao.AbstractDao
    protected final boolean isEntityUpdateable() {
        return true;
    }

    public DeviceModelDao(DaoConfig daoConfig) {
        super(daoConfig);
    }

    public DeviceModelDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
    }

    public static void createTable(Database database, boolean z) {
        database.execSQL("CREATE TABLE " + (z ? "IF NOT EXISTS " : "") + "\"DEVICE_MODEL\" (\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT ,\"DEVICE_SN\" TEXT,\"DEVICE_NAME\" TEXT,\"PORT\" INTEGER NOT NULL ,\"PROTOCOL\" INTEGER NOT NULL ,\"SORT_NO\" INTEGER NOT NULL ,\"ROOM_ID\" INTEGER,\"PRODUCT_CODE\" INTEGER NOT NULL ,\"HVAC_FLAG\" INTEGER NOT NULL );");
    }

    public static void dropTable(Database database, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("DROP TABLE ");
        sb.append(z ? "IF EXISTS " : "");
        sb.append("\"DEVICE_MODEL\"");
        database.execSQL(sb.toString());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void bindValues(DatabaseStatement databaseStatement, DeviceModel deviceModel) {
        databaseStatement.clearBindings();
        Long id = deviceModel.getId();
        if (id != null) {
            databaseStatement.bindLong(1, id.longValue());
        }
        String deviceSn = deviceModel.getDeviceSn();
        if (deviceSn != null) {
            databaseStatement.bindString(2, deviceSn);
        }
        String deviceName = deviceModel.getDeviceName();
        if (deviceName != null) {
            databaseStatement.bindString(3, deviceName);
        }
        databaseStatement.bindLong(4, deviceModel.getPort());
        databaseStatement.bindLong(5, deviceModel.getProtocol());
        databaseStatement.bindLong(6, deviceModel.getSortNo());
        Long roomId = deviceModel.getRoomId();
        if (roomId != null) {
            databaseStatement.bindLong(7, roomId.longValue());
        }
        databaseStatement.bindLong(8, deviceModel.getProductCode());
        databaseStatement.bindLong(9, deviceModel.getHvacFlag());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void bindValues(SQLiteStatement sQLiteStatement, DeviceModel deviceModel) {
        sQLiteStatement.clearBindings();
        Long id = deviceModel.getId();
        if (id != null) {
            sQLiteStatement.bindLong(1, id.longValue());
        }
        String deviceSn = deviceModel.getDeviceSn();
        if (deviceSn != null) {
            sQLiteStatement.bindString(2, deviceSn);
        }
        String deviceName = deviceModel.getDeviceName();
        if (deviceName != null) {
            sQLiteStatement.bindString(3, deviceName);
        }
        sQLiteStatement.bindLong(4, deviceModel.getPort());
        sQLiteStatement.bindLong(5, deviceModel.getProtocol());
        sQLiteStatement.bindLong(6, deviceModel.getSortNo());
        Long roomId = deviceModel.getRoomId();
        if (roomId != null) {
            sQLiteStatement.bindLong(7, roomId.longValue());
        }
        sQLiteStatement.bindLong(8, deviceModel.getProductCode());
        sQLiteStatement.bindLong(9, deviceModel.getHvacFlag());
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
    public DeviceModel readEntity(Cursor cursor, int i) {
        int i2 = i + 0;
        Long lValueOf = cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2));
        int i3 = i + 1;
        String string = cursor.isNull(i3) ? null : cursor.getString(i3);
        int i4 = i + 2;
        String string2 = cursor.isNull(i4) ? null : cursor.getString(i4);
        int i5 = i + 6;
        return new DeviceModel(lValueOf, string, string2, cursor.getInt(i + 3), cursor.getInt(i + 4), cursor.getInt(i + 5), cursor.isNull(i5) ? null : Long.valueOf(cursor.getLong(i5)), cursor.getInt(i + 7), cursor.getInt(i + 8));
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public void readEntity(Cursor cursor, DeviceModel deviceModel, int i) {
        int i2 = i + 0;
        deviceModel.setId(cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2)));
        int i3 = i + 1;
        deviceModel.setDeviceSn(cursor.isNull(i3) ? null : cursor.getString(i3));
        int i4 = i + 2;
        deviceModel.setDeviceName(cursor.isNull(i4) ? null : cursor.getString(i4));
        deviceModel.setPort(cursor.getInt(i + 3));
        deviceModel.setProtocol(cursor.getInt(i + 4));
        deviceModel.setSortNo(cursor.getInt(i + 5));
        int i5 = i + 6;
        deviceModel.setRoomId(cursor.isNull(i5) ? null : Long.valueOf(cursor.getLong(i5)));
        deviceModel.setProductCode(cursor.getInt(i + 7));
        deviceModel.setHvacFlag(cursor.getInt(i + 8));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final Long updateKeyAfterInsert(DeviceModel deviceModel, long j) {
        deviceModel.setId(Long.valueOf(j));
        return Long.valueOf(j);
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public Long getKey(DeviceModel deviceModel) {
        if (deviceModel != null) {
            return deviceModel.getId();
        }
        return null;
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public boolean hasKey(DeviceModel deviceModel) {
        return deviceModel.getId() != null;
    }

    public List<DeviceModel> _queryRoomModel_Devices(Long l) {
        synchronized (this) {
            if (this.roomModel_DevicesQuery == null) {
                QueryBuilder<DeviceModel> queryBuilder = queryBuilder();
                queryBuilder.where(Properties.RoomId.m63eq(null), new WhereCondition[0]);
                this.roomModel_DevicesQuery = queryBuilder.build();
            }
        }
        Query<DeviceModel> queryForCurrentThread = this.roomModel_DevicesQuery.forCurrentThread();
        queryForCurrentThread.setParameter(0, (Object) l);
        return queryForCurrentThread.list();
    }
}
