package com.landleaf.smarthome.p003db.dao;

import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.model.DeviceModelDao;
import com.landleaf.smarthome.p003db.manager.DbManager;
import org.greenrobot.greendao.query.WhereCondition;

/* loaded from: classes.dex */
public class DeviceDaoHelper extends BaseDaoHelper<DeviceModelDao, DeviceModel> {
    public DeviceDaoHelper() {
        DbManager.getInstance();
        this.dao = DbManager.getDaoSession().getDeviceModelDao();
    }

    public DeviceModel findDevice4Sn(String str) {
        return ((DeviceModelDao) this.dao).queryBuilder().where(DeviceModelDao.Properties.DeviceSn.m63eq(str), new WhereCondition[0]).unique();
    }
}
