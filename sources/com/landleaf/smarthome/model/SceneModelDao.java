package com.landleaf.smarthome.model;

import android.database.Cursor;
import android.database.sqlite.SQLiteStatement;
import com.landleaf.smarthome.device.AttributeTagConst;
import com.landleaf.smarthome.p003db.converter.DeviceConverter;
import java.util.List;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.Property;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.database.DatabaseStatement;
import org.greenrobot.greendao.internal.DaoConfig;

/* loaded from: classes.dex */
public class SceneModelDao extends AbstractDao<SceneModel, Long> {
    public static final String TABLENAME = "SCENE_MODEL";
    private final DeviceConverter actionsConverter;

    public static class Properties {
        public static final Property SceneID = new Property(0, Long.class, "sceneID", true, "_id");

        /* renamed from: Id */
        public static final Property f151Id = new Property(1, String.class, "id", false, "ID");
        public static final Property UpdateFlag = new Property(2, Integer.TYPE, "updateFlag", false, "UPDATE_FLAG");
        public static final Property Name = new Property(3, String.class, "name", false, "NAME");
        public static final Property Mode = new Property(4, Integer.TYPE, AttributeTagConst.SYS_MODE, false, "MODE");
        public static final Property SceneNo = new Property(5, Integer.TYPE, "sceneNo", false, "SCENE_NO");
        public static final Property Actions = new Property(6, String.class, "actions", false, "ACTIONS");
    }

    @Override // org.greenrobot.greendao.AbstractDao
    protected final boolean isEntityUpdateable() {
        return true;
    }

    public SceneModelDao(DaoConfig daoConfig) {
        super(daoConfig);
        this.actionsConverter = new DeviceConverter();
    }

    public SceneModelDao(DaoConfig daoConfig, DaoSession daoSession) {
        super(daoConfig, daoSession);
        this.actionsConverter = new DeviceConverter();
    }

    public static void createTable(Database database, boolean z) {
        database.execSQL("CREATE TABLE " + (z ? "IF NOT EXISTS " : "") + "\"SCENE_MODEL\" (\"_id\" INTEGER PRIMARY KEY AUTOINCREMENT ,\"ID\" TEXT,\"UPDATE_FLAG\" INTEGER NOT NULL ,\"NAME\" TEXT,\"MODE\" INTEGER NOT NULL ,\"SCENE_NO\" INTEGER NOT NULL ,\"ACTIONS\" TEXT);");
    }

    public static void dropTable(Database database, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("DROP TABLE ");
        sb.append(z ? "IF EXISTS " : "");
        sb.append("\"SCENE_MODEL\"");
        database.execSQL(sb.toString());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void bindValues(DatabaseStatement databaseStatement, SceneModel sceneModel) {
        databaseStatement.clearBindings();
        Long sceneID = sceneModel.getSceneID();
        if (sceneID != null) {
            databaseStatement.bindLong(1, sceneID.longValue());
        }
        String id = sceneModel.getId();
        if (id != null) {
            databaseStatement.bindString(2, id);
        }
        databaseStatement.bindLong(3, sceneModel.getUpdateFlag());
        String name = sceneModel.getName();
        if (name != null) {
            databaseStatement.bindString(4, name);
        }
        databaseStatement.bindLong(5, sceneModel.getMode());
        databaseStatement.bindLong(6, sceneModel.getSceneNo());
        List<DeviceModel> actions = sceneModel.getActions();
        if (actions != null) {
            databaseStatement.bindString(7, this.actionsConverter.convertToDatabaseValue(actions));
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final void bindValues(SQLiteStatement sQLiteStatement, SceneModel sceneModel) {
        sQLiteStatement.clearBindings();
        Long sceneID = sceneModel.getSceneID();
        if (sceneID != null) {
            sQLiteStatement.bindLong(1, sceneID.longValue());
        }
        String id = sceneModel.getId();
        if (id != null) {
            sQLiteStatement.bindString(2, id);
        }
        sQLiteStatement.bindLong(3, sceneModel.getUpdateFlag());
        String name = sceneModel.getName();
        if (name != null) {
            sQLiteStatement.bindString(4, name);
        }
        sQLiteStatement.bindLong(5, sceneModel.getMode());
        sQLiteStatement.bindLong(6, sceneModel.getSceneNo());
        List<DeviceModel> actions = sceneModel.getActions();
        if (actions != null) {
            sQLiteStatement.bindString(7, this.actionsConverter.convertToDatabaseValue(actions));
        }
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
    public SceneModel readEntity(Cursor cursor, int i) {
        int i2 = i + 0;
        Long lValueOf = cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2));
        int i3 = i + 1;
        String string = cursor.isNull(i3) ? null : cursor.getString(i3);
        int i4 = cursor.getInt(i + 2);
        int i5 = i + 3;
        String string2 = cursor.isNull(i5) ? null : cursor.getString(i5);
        int i6 = cursor.getInt(i + 4);
        int i7 = cursor.getInt(i + 5);
        int i8 = i + 6;
        return new SceneModel(lValueOf, string, i4, string2, i6, i7, cursor.isNull(i8) ? null : this.actionsConverter.convertToEntityProperty(cursor.getString(i8)));
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public void readEntity(Cursor cursor, SceneModel sceneModel, int i) {
        int i2 = i + 0;
        sceneModel.setSceneID(cursor.isNull(i2) ? null : Long.valueOf(cursor.getLong(i2)));
        int i3 = i + 1;
        sceneModel.setId(cursor.isNull(i3) ? null : cursor.getString(i3));
        sceneModel.setUpdateFlag(cursor.getInt(i + 2));
        int i4 = i + 3;
        sceneModel.setName(cursor.isNull(i4) ? null : cursor.getString(i4));
        sceneModel.setMode(cursor.getInt(i + 4));
        sceneModel.setSceneNo(cursor.getInt(i + 5));
        int i5 = i + 6;
        sceneModel.setActions(cursor.isNull(i5) ? null : this.actionsConverter.convertToEntityProperty(cursor.getString(i5)));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.greenrobot.greendao.AbstractDao
    public final Long updateKeyAfterInsert(SceneModel sceneModel, long j) {
        sceneModel.setSceneID(Long.valueOf(j));
        return Long.valueOf(j);
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public Long getKey(SceneModel sceneModel) {
        if (sceneModel != null) {
            return sceneModel.getSceneID();
        }
        return null;
    }

    @Override // org.greenrobot.greendao.AbstractDao
    public boolean hasKey(SceneModel sceneModel) {
        return sceneModel.getSceneID() != null;
    }
}
