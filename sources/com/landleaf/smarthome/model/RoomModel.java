package com.landleaf.smarthome.model;

import java.io.Serializable;
import java.util.List;
import org.greenrobot.greendao.DaoException;

/* loaded from: classes.dex */
public class RoomModel implements Serializable {
    private static final long serialVersionUID = -8437593358448407086L;
    private transient DaoSession daoSession;
    private List<DeviceModel> devices;
    private long floorId;

    /* renamed from: id */
    private Long f148id;
    private transient RoomModelDao myDao;
    private String roomName;
    private int roomType;
    private int sortNo;

    public RoomModel(Long l, String str, int i, int i2, long j) {
        this.f148id = null;
        this.f148id = l;
        this.roomName = str;
        this.roomType = i;
        this.sortNo = i2;
        this.floorId = j;
    }

    public RoomModel() {
        this.f148id = null;
    }

    public Long getId() {
        return this.f148id;
    }

    public void setId(Long l) {
        this.f148id = l;
    }

    public String getRoomName() {
        return this.roomName;
    }

    public void setRoomName(String str) {
        this.roomName = str;
    }

    public int getRoomType() {
        return this.roomType;
    }

    public void setRoomType(int i) {
        this.roomType = i;
    }

    public int getSortNo() {
        return this.sortNo;
    }

    public void setSortNo(int i) {
        this.sortNo = i;
    }

    public long getFloorId() {
        return this.floorId;
    }

    public void setFloorId(long j) {
        this.floorId = j;
    }

    public List<DeviceModel> getDevices() {
        if (this.devices == null) {
            DaoSession daoSession = this.daoSession;
            if (daoSession == null) {
                throw new DaoException("Entity is detached from DAO context");
            }
            List<DeviceModel> list_queryRoomModel_Devices = daoSession.getDeviceModelDao()._queryRoomModel_Devices(this.f148id);
            synchronized (this) {
                if (this.devices == null) {
                    this.devices = list_queryRoomModel_Devices;
                }
            }
        }
        return this.devices;
    }

    public synchronized void resetDevices() {
        this.devices = null;
    }

    public void delete() {
        RoomModelDao roomModelDao = this.myDao;
        if (roomModelDao == null) {
            throw new DaoException("Entity is detached from DAO context");
        }
        roomModelDao.delete(this);
    }

    public void refresh() {
        RoomModelDao roomModelDao = this.myDao;
        if (roomModelDao == null) {
            throw new DaoException("Entity is detached from DAO context");
        }
        roomModelDao.refresh(this);
    }

    public void update() {
        RoomModelDao roomModelDao = this.myDao;
        if (roomModelDao == null) {
            throw new DaoException("Entity is detached from DAO context");
        }
        roomModelDao.update(this);
    }

    public void __setDaoSession(DaoSession daoSession) {
        this.daoSession = daoSession;
        this.myDao = daoSession != null ? daoSession.getRoomModelDao() : null;
    }
}
