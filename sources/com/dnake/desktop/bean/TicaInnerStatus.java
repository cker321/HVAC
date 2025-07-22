package com.dnake.desktop.bean;

import java.util.Objects;

/* loaded from: classes.dex */
public class TicaInnerStatus implements Cloneable {
    private int TH1Error;
    private int TH2Error;
    private int TH3Error;
    private int TH4Error;
    private int communicationFailure;
    private String deviceSn;
    private boolean electricAuxiliaryHeatingSetting;
    private int electricAuxiliaryHeatingStatus;
    private float intakeTemperature;
    private int machineNo;
    private float midDiskTemperature;
    private int modeRun;
    private float outletTemperature;
    private int patternConflict;
    private boolean powerSetting;
    private float programEdition;
    private float returnAirTemperature;
    private String roomName;
    private int settingMode;
    private int settingTemp;
    private int settingWindSpeed;
    private boolean sleepSetting;
    private boolean swingSetting;
    private int unitAbility;
    private int unitType;
    private int waterLevelFailure;
    private int waterPumpStatus;
    private int windSpeedStatus;

    public TicaInnerStatus() {
    }

    public TicaInnerStatus(int i, String str, String str2) {
        this.machineNo = i;
        this.roomName = str;
        this.deviceSn = str2;
    }

    public TicaInnerStatus(int i, String str) {
        this.machineNo = i;
        this.roomName = str;
    }

    public String getDeviceSn() {
        return this.deviceSn;
    }

    public void setDeviceSn(String str) {
        this.deviceSn = str;
    }

    public int getMachineNo() {
        return this.machineNo;
    }

    public void setMachineNo(int i) {
        this.machineNo = i;
    }

    public String getRoomName() {
        return this.roomName;
    }

    public void setRoomName(String str) {
        this.roomName = str;
    }

    public int getUnitType() {
        return this.unitType;
    }

    public void setUnitType(int i) {
        this.unitType = i;
    }

    public int getUnitAbility() {
        return this.unitAbility;
    }

    public void setUnitAbility(int i) {
        this.unitAbility = i;
    }

    public float getProgramEdition() {
        return this.programEdition;
    }

    public void setProgramEdition(float f) {
        this.programEdition = f;
    }

    public float getIntakeTemperature() {
        return this.intakeTemperature;
    }

    public void setIntakeTemperature(float f) {
        this.intakeTemperature = f;
    }

    public float getMidDiskTemperature() {
        return this.midDiskTemperature;
    }

    public void setMidDiskTemperature(float f) {
        this.midDiskTemperature = f;
    }

    public float getOutletTemperature() {
        return this.outletTemperature;
    }

    public void setOutletTemperature(float f) {
        this.outletTemperature = f;
    }

    public float getReturnAirTemperature() {
        return this.returnAirTemperature;
    }

    public void setReturnAirTemperature(float f) {
        this.returnAirTemperature = f;
    }

    public int getWindSpeedStatus() {
        return this.windSpeedStatus;
    }

    public void setWindSpeedStatus(int i) {
        this.windSpeedStatus = i;
    }

    public int isElectricAuxiliaryHeatingStatus() {
        return this.electricAuxiliaryHeatingStatus;
    }

    public void setElectricAuxiliaryHeatingStatus(int i) {
        this.electricAuxiliaryHeatingStatus = i;
    }

    public int getModeRun() {
        return this.modeRun;
    }

    public void setModeRun(int i) {
        this.modeRun = i;
    }

    public int isWaterPumpStatus() {
        return this.waterPumpStatus;
    }

    public void setWaterPumpStatus(int i) {
        this.waterPumpStatus = i;
    }

    public int isTH1Error() {
        return this.TH1Error;
    }

    public void setTH1Error(int i) {
        this.TH1Error = i;
    }

    public int isTH2Error() {
        return this.TH2Error;
    }

    public void setTH2Error(int i) {
        this.TH2Error = i;
    }

    public int isTH3Error() {
        return this.TH3Error;
    }

    public void setTH3Error(int i) {
        this.TH3Error = i;
    }

    public int isTH4Error() {
        return this.TH4Error;
    }

    public void setTH4Error(int i) {
        this.TH4Error = i;
    }

    public int isPatternConflict() {
        return this.patternConflict;
    }

    public void setPatternConflict(int i) {
        this.patternConflict = i;
    }

    public int isCommunicationFailure() {
        return this.communicationFailure;
    }

    public void setCommunicationFailure(int i) {
        this.communicationFailure = i;
    }

    public int isWaterLevelFailure() {
        return this.waterLevelFailure;
    }

    public void setWaterLevelFailure(int i) {
        this.waterLevelFailure = i;
    }

    public int getSettingMode() {
        return this.settingMode;
    }

    public void setSettingMode(int i) {
        this.settingMode = i;
    }

    public int getSettingTemp() {
        return this.settingTemp;
    }

    public void setSettingTemp(int i) {
        this.settingTemp = i;
    }

    public int getSettingWindSpeed() {
        return this.settingWindSpeed;
    }

    public void setSettingWindSpeed(int i) {
        this.settingWindSpeed = i;
    }

    public boolean isSwingSetting() {
        return this.swingSetting;
    }

    public void setSwingSetting(boolean z) {
        this.swingSetting = z;
    }

    public boolean isSleepSetting() {
        return this.sleepSetting;
    }

    public void setSleepSetting(boolean z) {
        this.sleepSetting = z;
    }

    public boolean isElectricAuxiliaryHeatingSetting() {
        return this.electricAuxiliaryHeatingSetting;
    }

    public void setElectricAuxiliaryHeatingSetting(boolean z) {
        this.electricAuxiliaryHeatingSetting = z;
    }

    public boolean isPowerSetting() {
        return this.powerSetting;
    }

    public void setPowerSetting(boolean z) {
        this.powerSetting = z;
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public TicaInnerStatus m81clone() {
        try {
            return (TicaInnerStatus) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        TicaInnerStatus ticaInnerStatus = (TicaInnerStatus) obj;
        return this.machineNo == ticaInnerStatus.machineNo && Float.compare(ticaInnerStatus.returnAirTemperature, this.returnAirTemperature) == 0 && this.settingMode == ticaInnerStatus.settingMode && this.settingTemp == ticaInnerStatus.settingTemp && this.settingWindSpeed == ticaInnerStatus.settingWindSpeed && this.powerSetting == ticaInnerStatus.powerSetting;
    }

    public int hashCode() {
        return Objects.hash(Integer.valueOf(this.machineNo), this.roomName, Float.valueOf(this.returnAirTemperature), Integer.valueOf(this.settingMode), Integer.valueOf(this.settingTemp), Integer.valueOf(this.settingWindSpeed), Boolean.valueOf(this.powerSetting), this.deviceSn);
    }

    public String toString() {
        return "TicaInnerStatus{machineNo=" + this.machineNo + ", roomName='" + this.roomName + ", deviceSn='" + this.deviceSn + ", returnAirTemperature=" + this.returnAirTemperature + ", settingMode=" + this.settingMode + ", settingTemp=" + this.settingTemp + ", settingWindSpeed=" + this.settingWindSpeed + ", powerSetting=" + this.powerSetting + '}';
    }
}
