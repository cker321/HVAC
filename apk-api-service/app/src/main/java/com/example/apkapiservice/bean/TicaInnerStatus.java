package com.example.apkapiservice.bean;

import java.util.Objects;

/**
 * 空调内机状态数据模型
 */
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

    public TicaInnerStatus(int machineNo, String roomName, String deviceSn) {
        this.machineNo = machineNo;
        this.roomName = roomName;
        this.deviceSn = deviceSn;
    }

    public TicaInnerStatus(int machineNo, String roomName) {
        this.machineNo = machineNo;
        this.roomName = roomName;
    }

    public String getDeviceSn() {
        return this.deviceSn;
    }

    public void setDeviceSn(String deviceSn) {
        this.deviceSn = deviceSn;
    }

    public int getMachineNo() {
        return this.machineNo;
    }

    public void setMachineNo(int machineNo) {
        this.machineNo = machineNo;
    }

    public String getRoomName() {
        return this.roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getUnitType() {
        return this.unitType;
    }

    public void setUnitType(int unitType) {
        this.unitType = unitType;
    }

    public int getUnitAbility() {
        return this.unitAbility;
    }

    public void setUnitAbility(int unitAbility) {
        this.unitAbility = unitAbility;
    }

    public float getProgramEdition() {
        return this.programEdition;
    }

    public void setProgramEdition(float programEdition) {
        this.programEdition = programEdition;
    }

    public float getIntakeTemperature() {
        return this.intakeTemperature;
    }

    public void setIntakeTemperature(float intakeTemperature) {
        this.intakeTemperature = intakeTemperature;
    }

    public float getMidDiskTemperature() {
        return this.midDiskTemperature;
    }

    public void setMidDiskTemperature(float midDiskTemperature) {
        this.midDiskTemperature = midDiskTemperature;
    }

    public float getOutletTemperature() {
        return this.outletTemperature;
    }

    public void setOutletTemperature(float outletTemperature) {
        this.outletTemperature = outletTemperature;
    }

    public float getReturnAirTemperature() {
        return this.returnAirTemperature;
    }

    public void setReturnAirTemperature(float returnAirTemperature) {
        this.returnAirTemperature = returnAirTemperature;
    }

    public int getWindSpeedStatus() {
        return this.windSpeedStatus;
    }

    public void setWindSpeedStatus(int windSpeedStatus) {
        this.windSpeedStatus = windSpeedStatus;
    }

    public int getElectricAuxiliaryHeatingStatus() {
        return this.electricAuxiliaryHeatingStatus;
    }

    public void setElectricAuxiliaryHeatingStatus(int electricAuxiliaryHeatingStatus) {
        this.electricAuxiliaryHeatingStatus = electricAuxiliaryHeatingStatus;
    }

    public int getModeRun() {
        return this.modeRun;
    }

    public void setModeRun(int modeRun) {
        this.modeRun = modeRun;
    }

    public int getWaterPumpStatus() {
        return this.waterPumpStatus;
    }

    public void setWaterPumpStatus(int waterPumpStatus) {
        this.waterPumpStatus = waterPumpStatus;
    }

    public int getTH1Error() {
        return this.TH1Error;
    }

    public void setTH1Error(int TH1Error) {
        this.TH1Error = TH1Error;
    }

    public int getTH2Error() {
        return this.TH2Error;
    }

    public void setTH2Error(int TH2Error) {
        this.TH2Error = TH2Error;
    }

    public int getTH3Error() {
        return this.TH3Error;
    }

    public void setTH3Error(int TH3Error) {
        this.TH3Error = TH3Error;
    }

    public int getTH4Error() {
        return this.TH4Error;
    }

    public void setTH4Error(int TH4Error) {
        this.TH4Error = TH4Error;
    }

    public int getPatternConflict() {
        return this.patternConflict;
    }

    public void setPatternConflict(int patternConflict) {
        this.patternConflict = patternConflict;
    }

    public int getCommunicationFailure() {
        return this.communicationFailure;
    }

    public void setCommunicationFailure(int communicationFailure) {
        this.communicationFailure = communicationFailure;
    }

    public int getWaterLevelFailure() {
        return this.waterLevelFailure;
    }

    public void setWaterLevelFailure(int waterLevelFailure) {
        this.waterLevelFailure = waterLevelFailure;
    }

    public int getSettingMode() {
        return this.settingMode;
    }

    public void setSettingMode(int settingMode) {
        this.settingMode = settingMode;
    }

    public int getSettingTemp() {
        return this.settingTemp;
    }

    public void setSettingTemp(int settingTemp) {
        this.settingTemp = settingTemp;
    }

    public int getSettingWindSpeed() {
        return this.settingWindSpeed;
    }

    public void setSettingWindSpeed(int settingWindSpeed) {
        this.settingWindSpeed = settingWindSpeed;
    }

    public boolean isSwingSetting() {
        return this.swingSetting;
    }

    public void setSwingSetting(boolean swingSetting) {
        this.swingSetting = swingSetting;
    }

    public boolean isSleepSetting() {
        return this.sleepSetting;
    }

    public void setSleepSetting(boolean sleepSetting) {
        this.sleepSetting = sleepSetting;
    }

    public boolean isElectricAuxiliaryHeatingSetting() {
        return this.electricAuxiliaryHeatingSetting;
    }

    public void setElectricAuxiliaryHeatingSetting(boolean electricAuxiliaryHeatingSetting) {
        this.electricAuxiliaryHeatingSetting = electricAuxiliaryHeatingSetting;
    }

    public boolean isPowerSetting() {
        return this.powerSetting;
    }

    public void setPowerSetting(boolean powerSetting) {
        this.powerSetting = powerSetting;
    }

    public TicaInnerStatus clone() {
        try {
            return (TicaInnerStatus) super.clone();
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        TicaInnerStatus ticaInnerStatus = (TicaInnerStatus) obj;
        return this.machineNo == ticaInnerStatus.machineNo 
                && Float.compare(ticaInnerStatus.returnAirTemperature, this.returnAirTemperature) == 0 
                && this.settingMode == ticaInnerStatus.settingMode 
                && this.settingTemp == ticaInnerStatus.settingTemp 
                && this.settingWindSpeed == ticaInnerStatus.settingWindSpeed 
                && this.powerSetting == ticaInnerStatus.powerSetting;
    }

    @Override
    public int hashCode() {
        return Objects.hash(machineNo, roomName, returnAirTemperature, settingMode, settingTemp, settingWindSpeed, powerSetting, deviceSn);
    }

    @Override
    public String toString() {
        return "TicaInnerStatus{" +
                "machineNo=" + machineNo +
                ", roomName='" + roomName + '\'' +
                ", deviceSn='" + deviceSn + '\'' +
                ", returnAirTemperature=" + returnAirTemperature +
                ", settingMode=" + settingMode +
                ", settingTemp=" + settingTemp +
                ", settingWindSpeed=" + settingWindSpeed +
                ", powerSetting=" + powerSetting +
                '}';
    }
}
