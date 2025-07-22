package com.landleaf.smarthome.p003db.manager;

import android.database.Cursor;
import android.database.SQLException;
import android.text.TextUtils;
import android.util.Log;
import com.landleaf.smarthome.model.DaoMaster;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.internal.DaoConfig;

/* loaded from: classes.dex */
public class MigrationHelper {
    private static final String CONVERSION_CLASS_NOT_FOUND_EXCEPTION = "MIGRATION HELPER - CLASS DOESN'T MATCH WITH THE CURRENT PARAMETERS";
    private static MigrationHelper instance;

    public static MigrationHelper getInstance() {
        if (instance == null) {
            instance = new MigrationHelper();
        }
        return instance;
    }

    public void migrate(Database database, Class<? extends AbstractDao<?, ?>>... clsArr) throws SQLException {
        generateTempTables(database, clsArr);
        DaoMaster.dropAllTables(database, true);
        DaoMaster.createAllTables(database, false);
        restoreData(database, clsArr);
    }

    private void generateTempTables(Database database, Class<? extends AbstractDao<?, ?>>... clsArr) throws SQLException {
        for (Class<? extends AbstractDao<?, ?>> cls : clsArr) {
            DaoConfig daoConfig = new DaoConfig(database, cls);
            String str = daoConfig.tablename;
            String strConcat = daoConfig.tablename.concat("_TEMP");
            ArrayList arrayList = new ArrayList();
            StringBuilder sb = new StringBuilder();
            sb.append("CREATE TABLE ");
            sb.append(strConcat);
            sb.append(" (");
            String str2 = "";
            for (int i = 0; i < daoConfig.properties.length; i++) {
                String str3 = daoConfig.properties[i].columnName;
                if (getColumns(database, str).contains(str3)) {
                    arrayList.add(str3);
                    String typeByClass = null;
                    try {
                        typeByClass = getTypeByClass(daoConfig.properties[i].type);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    sb.append(str2);
                    sb.append(str3);
                    sb.append(" ");
                    sb.append(typeByClass);
                    if (daoConfig.properties[i].primaryKey) {
                        sb.append(" PRIMARY KEY");
                    }
                    str2 = ",";
                }
            }
            sb.append(");");
            database.execSQL(sb.toString());
            database.execSQL("INSERT INTO " + strConcat + " (" + TextUtils.join(",", arrayList) + ") SELECT " + TextUtils.join(",", arrayList) + " FROM " + str + ";");
        }
    }

    private void restoreData(Database database, Class<? extends AbstractDao<?, ?>>... clsArr) throws SQLException {
        for (Class<? extends AbstractDao<?, ?>> cls : clsArr) {
            DaoConfig daoConfig = new DaoConfig(database, cls);
            String str = daoConfig.tablename;
            String strConcat = daoConfig.tablename.concat("_TEMP");
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < daoConfig.properties.length; i++) {
                String str2 = daoConfig.properties[i].columnName;
                if (getColumns(database, strConcat).contains(str2)) {
                    arrayList.add(str2);
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append("DROP TABLE ");
            sb.append(strConcat);
            database.execSQL("INSERT INTO " + str + " (" + TextUtils.join(",", arrayList) + ") SELECT " + TextUtils.join(",", arrayList) + " FROM " + strConcat + ";");
            database.execSQL(sb.toString());
        }
    }

    private String getTypeByClass(Class<?> cls) throws Exception {
        if (cls.equals(String.class)) {
            return "TEXT";
        }
        if (cls.equals(Long.class) || cls.equals(Integer.class) || cls.equals(Long.TYPE)) {
            return "INTEGER";
        }
        if (cls.equals(Boolean.class)) {
            return "BOOLEAN";
        }
        Exception exc = new Exception(CONVERSION_CLASS_NOT_FOUND_EXCEPTION.concat(" - Class: ").concat(cls.toString()));
        exc.printStackTrace();
        throw exc;
    }

    private List<String> getColumns(Database database, String str) {
        ArrayList arrayList = new ArrayList();
        Cursor cursorRawQuery = null;
        try {
            try {
                cursorRawQuery = database.rawQuery("SELECT * FROM " + str + " limit 1", null);
                if (cursorRawQuery != null) {
                    arrayList = new ArrayList(Arrays.asList(cursorRawQuery.getColumnNames()));
                }
            } catch (Exception e) {
                Log.v(str, e.getMessage(), e);
                e.printStackTrace();
                if (cursorRawQuery != null) {
                }
            }
            return arrayList;
        } finally {
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
        }
    }
}
