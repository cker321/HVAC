package com.dnake.desktop.bean;

/* loaded from: classes.dex */
public class TicaOutStatus {
    private float firstCompressorCopingTemperature;
    private float firstCompressorStatus;
    private int firstCrankAxleHeatDistrictStatus;
    private int firstPypassValveStatus;
    private int fourWayValveStatus;

    /* renamed from: id */
    private int f99id;
    private float outdoorEnvironmentTemperature;
    private int powerElectromagneticValveStatus;
    private int programEdition;
    private int runMode;
    private float secondCompressorCopingTemperature;
    private float secondCompressorStatus;
    private int secondCrankAxleHeatDistrictStatus;
    private int secondPypassValveStatus;
    private int slaveAddr;
    private int superCoolElectromagneticValveStatus;
    private float systemComeSteamTemperature;
    private int systemHighPressure;
    private int systemLowPressure;
    private int unitAbility;
    private int unitType;

    public TicaOutStatus(int i, int i2) {
        this.f99id = i;
        this.slaveAddr = i2;
    }

    public int getSlaveAddr() {
        return this.slaveAddr;
    }

    public void setSlaveAddr(int i) {
        this.slaveAddr = i;
    }

    public int getId() {
        return this.f99id;
    }

    public void setId(int i) {
        this.f99id = i;
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

    public int getProgramEdition() {
        return this.programEdition;
    }

    public void setProgramEdition(int i) {
        this.programEdition = i;
    }

    public int getRunMode() {
        return this.runMode;
    }

    public void setRunMode(int i) {
        this.runMode = i;
    }

    public float getOutdoorEnvironmentTemperature() {
        return this.outdoorEnvironmentTemperature;
    }

    public void setOutdoorEnvironmentTemperature(float f) {
        this.outdoorEnvironmentTemperature = f;
    }

    public float getSystemComeSteamTemperature() {
        return this.systemComeSteamTemperature;
    }

    public void setSystemComeSteamTemperature(float f) {
        this.systemComeSteamTemperature = f;
    }

    public float getFirstCompressorCopingTemperature() {
        return this.firstCompressorCopingTemperature;
    }

    public void setFirstCompressorCopingTemperature(float f) {
        this.firstCompressorCopingTemperature = f;
    }

    public float getSecondCompressorCopingTemperature() {
        return this.secondCompressorCopingTemperature;
    }

    public void setSecondCompressorCopingTemperature(float f) {
        this.secondCompressorCopingTemperature = f;
    }

    public int getSystemHighPressure() {
        return this.systemHighPressure;
    }

    public void setSystemHighPressure(int i) {
        this.systemHighPressure = i;
    }

    public int getSystemLowPressure() {
        return this.systemLowPressure;
    }

    public void setSystemLowPressure(int i) {
        this.systemLowPressure = i;
    }

    public float getFirstCompressorStatus() {
        return this.firstCompressorStatus;
    }

    public void setFirstCompressorStatus(float f) {
        this.firstCompressorStatus = f;
    }

    public float getSecondCompressorStatus() {
        return this.secondCompressorStatus;
    }

    public void setSecondCompressorStatus(float f) {
        this.secondCompressorStatus = f;
    }

    public int getFirstPypassValveStatus() {
        return this.firstPypassValveStatus;
    }

    public void setFirstPypassValveStatus(int i) {
        this.firstPypassValveStatus = i;
    }

    public int getFirstCrankAxleHeatDistrictStatus() {
        return this.firstCrankAxleHeatDistrictStatus;
    }

    public void setFirstCrankAxleHeatDistrictStatus(int i) {
        this.firstCrankAxleHeatDistrictStatus = i;
    }

    public int getSecondCrankAxleHeatDistrictStatus() {
        return this.secondCrankAxleHeatDistrictStatus;
    }

    public void setSecondCrankAxleHeatDistrictStatus(int i) {
        this.secondCrankAxleHeatDistrictStatus = i;
    }

    public int getSuperCoolElectromagneticValveStatus() {
        return this.superCoolElectromagneticValveStatus;
    }

    public void setSuperCoolElectromagneticValveStatus(int i) {
        this.superCoolElectromagneticValveStatus = i;
    }

    public int getSecondPypassValveStatus() {
        return this.secondPypassValveStatus;
    }

    public void setSecondPypassValveStatus(int i) {
        this.secondPypassValveStatus = i;
    }

    public int getFourWayValveStatus() {
        return this.fourWayValveStatus;
    }

    public void setFourWayValveStatus(int i) {
        this.fourWayValveStatus = i;
    }

    public int getPowerElectromagneticValveStatus() {
        return this.powerElectromagneticValveStatus;
    }

    public void setPowerElectromagneticValveStatus(int i) {
        this.powerElectromagneticValveStatus = i;
    }

    public String toString() {
        return "TicaOutStatus{id=" + this.f99id + ", slaveAddr=" + this.slaveAddr + ", unitType=" + this.unitType + ", unitAbility=" + this.unitAbility + ", programEdition=" + this.programEdition + ", runMode=" + this.runMode + ", outdoorEnvironmentTemperature=" + this.outdoorEnvironmentTemperature + ", systemComeSteamTemperature=" + this.systemComeSteamTemperature + ", firstCompressorCopingTemperature=" + this.firstCompressorCopingTemperature + ", secondCompressorCopingTemperature=" + this.secondCompressorCopingTemperature + ", systemHighPressure=" + this.systemHighPressure + ", systemLowPressure=" + this.systemLowPressure + ", firstCompressorStatus=" + this.firstCompressorStatus + ", secondCompressorStatus=" + this.secondCompressorStatus + ", firstPypassValveStatus=" + this.firstPypassValveStatus + ", firstCrankAxleHeatDistrictStatus=" + this.firstCrankAxleHeatDistrictStatus + ", secondCrankAxleHeatDistrictStatus=" + this.secondCrankAxleHeatDistrictStatus + ", superCoolElectromagneticValveStatus=" + this.superCoolElectromagneticValveStatus + ", secondPypassValveStatus=" + this.secondPypassValveStatus + ", fourWayValveStatus=" + this.fourWayValveStatus + ", powerElectromagneticValveStatus=" + this.powerElectromagneticValveStatus + '}';
    }
}
