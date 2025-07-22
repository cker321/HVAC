package com.landleaf.smarthome.model;

import java.io.Serializable;
import java.util.List;

/* loaded from: classes.dex */
public class SceneModel implements Serializable {
    private static final long serialVersionUID = 6394048211422324403L;
    private List<DeviceModel> actions;

    /* renamed from: id */
    private String f150id;
    private int mode;
    private String name;
    private Long sceneID;
    private int sceneNo;
    private int updateFlag;

    public SceneModel(Long l, String str, int i, String str2, int i2, int i3, List<DeviceModel> list) {
        this.sceneID = null;
        this.sceneID = l;
        this.f150id = str;
        this.updateFlag = i;
        this.name = str2;
        this.mode = i2;
        this.sceneNo = i3;
        this.actions = list;
    }

    public SceneModel() {
        this.sceneID = null;
    }

    public Long getSceneID() {
        return this.sceneID;
    }

    public void setSceneID(Long l) {
        this.sceneID = l;
    }

    public String getId() {
        return this.f150id;
    }

    public void setId(String str) {
        this.f150id = str;
    }

    public int getUpdateFlag() {
        return this.updateFlag;
    }

    public void setUpdateFlag(int i) {
        this.updateFlag = i;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String str) {
        this.name = str;
    }

    public List<DeviceModel> getActions() {
        return this.actions;
    }

    public void setActions(List<DeviceModel> list) {
        this.actions = list;
    }

    public int getMode() {
        return this.mode;
    }

    public void setMode(int i) {
        this.mode = i;
    }

    public int getSceneNo() {
        return this.sceneNo;
    }

    public void setSceneNo(int i) {
        this.sceneNo = i;
    }
}
