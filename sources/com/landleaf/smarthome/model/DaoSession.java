package com.landleaf.smarthome.model;

import java.util.Map;
import org.greenrobot.greendao.AbstractDao;
import org.greenrobot.greendao.AbstractDaoSession;
import org.greenrobot.greendao.database.Database;
import org.greenrobot.greendao.identityscope.IdentityScopeType;
import org.greenrobot.greendao.internal.DaoConfig;

/* loaded from: classes.dex */
public class DaoSession extends AbstractDaoSession {
    private final DeviceModelDao deviceModelDao;
    private final DaoConfig deviceModelDaoConfig;
    private final FloorModelDao floorModelDao;
    private final DaoConfig floorModelDaoConfig;
    private final RoomModelDao roomModelDao;
    private final DaoConfig roomModelDaoConfig;
    private final SceneModelDao sceneModelDao;
    private final DaoConfig sceneModelDaoConfig;

    public DaoSession(Database database, IdentityScopeType identityScopeType, Map<Class<? extends AbstractDao<?, ?>>, DaoConfig> map) {
        super(database);
        DaoConfig daoConfigM92clone = map.get(DeviceModelDao.class).clone();
        this.deviceModelDaoConfig = daoConfigM92clone;
        daoConfigM92clone.initIdentityScope(identityScopeType);
        DaoConfig daoConfigM92clone2 = map.get(FloorModelDao.class).clone();
        this.floorModelDaoConfig = daoConfigM92clone2;
        daoConfigM92clone2.initIdentityScope(identityScopeType);
        DaoConfig daoConfigM92clone3 = map.get(RoomModelDao.class).clone();
        this.roomModelDaoConfig = daoConfigM92clone3;
        daoConfigM92clone3.initIdentityScope(identityScopeType);
        DaoConfig daoConfigM92clone4 = map.get(SceneModelDao.class).clone();
        this.sceneModelDaoConfig = daoConfigM92clone4;
        daoConfigM92clone4.initIdentityScope(identityScopeType);
        this.deviceModelDao = new DeviceModelDao(this.deviceModelDaoConfig, this);
        this.floorModelDao = new FloorModelDao(this.floorModelDaoConfig, this);
        this.roomModelDao = new RoomModelDao(this.roomModelDaoConfig, this);
        this.sceneModelDao = new SceneModelDao(this.sceneModelDaoConfig, this);
        registerDao(DeviceModel.class, this.deviceModelDao);
        registerDao(FloorModel.class, this.floorModelDao);
        registerDao(RoomModel.class, this.roomModelDao);
        registerDao(SceneModel.class, this.sceneModelDao);
    }

    public void clear() {
        this.deviceModelDaoConfig.clearIdentityScope();
        this.floorModelDaoConfig.clearIdentityScope();
        this.roomModelDaoConfig.clearIdentityScope();
        this.sceneModelDaoConfig.clearIdentityScope();
    }

    public DeviceModelDao getDeviceModelDao() {
        return this.deviceModelDao;
    }

    public FloorModelDao getFloorModelDao() {
        return this.floorModelDao;
    }

    public RoomModelDao getRoomModelDao() {
        return this.roomModelDao;
    }

    public SceneModelDao getSceneModelDao() {
        return this.sceneModelDao;
    }
}
