package com.landleaf.smarthome.model;

import java.io.Serializable;
import java.util.List;
import org.greenrobot.greendao.DaoException;

/* loaded from: classes.dex */
public class FloorModel implements Serializable {
    private static final long serialVersionUID = 4542190871187698712L;
    private transient DaoSession daoSession;
    private int floor;

    /* renamed from: id */
    private Long f145id;
    private transient FloorModelDao myDao;
    private String name;
    private List<RoomModel> rooms;

    public FloorModel(Long l, String str, int i) {
        this.f145id = null;
        this.f145id = l;
        this.name = str;
        this.floor = i;
    }

    public FloorModel() {
        this.f145id = null;
    }

    public Long getId() {
        return this.f145id;
    }

    public void setId(Long l) {
        this.f145id = l;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public int getFloor() {
        return this.floor;
    }

    public void setFloor(int i) {
        this.floor = i;
    }

    public List<RoomModel> getRooms() {
        if (this.rooms == null) {
            DaoSession daoSession = this.daoSession;
            if (daoSession == null) {
                throw new DaoException("Entity is detached from DAO context");
            }
            List<RoomModel> list_queryFloorModel_Rooms = daoSession.getRoomModelDao()._queryFloorModel_Rooms(this.f145id.longValue());
            synchronized (this) {
                if (this.rooms == null) {
                    this.rooms = list_queryFloorModel_Rooms;
                }
            }
        }
        return this.rooms;
    }

    public synchronized void resetRooms() {
        this.rooms = null;
    }

    public void delete() {
        FloorModelDao floorModelDao = this.myDao;
        if (floorModelDao == null) {
            throw new DaoException("Entity is detached from DAO context");
        }
        floorModelDao.delete(this);
    }

    public void refresh() {
        FloorModelDao floorModelDao = this.myDao;
        if (floorModelDao == null) {
            throw new DaoException("Entity is detached from DAO context");
        }
        floorModelDao.refresh(this);
    }

    public void update() {
        FloorModelDao floorModelDao = this.myDao;
        if (floorModelDao == null) {
            throw new DaoException("Entity is detached from DAO context");
        }
        floorModelDao.update(this);
    }

    public void __setDaoSession(DaoSession daoSession) {
        this.daoSession = daoSession;
        this.myDao = daoSession != null ? daoSession.getFloorModelDao() : null;
    }
}
