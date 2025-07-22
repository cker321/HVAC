package com.dnake.desktop.bean;

import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes.dex */
public class SensorModel implements Parcelable {
    public static final Parcelable.Creator<SensorModel> CREATOR = new Parcelable.Creator<SensorModel>() { // from class: com.dnake.desktop.bean.SensorModel.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SensorModel createFromParcel(Parcel parcel) {
            return new SensorModel(parcel);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public SensorModel[] newArray(int i) {
            return new SensorModel[i];
        }
    };
    private static final int DEFAULT_DELAY = 800;
    private int delay;
    private String floorName;
    private boolean isSign;
    private SensorType sensorType;
    private byte slaveAddress;
    private String uniteName;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public SensorModel() {
    }

    public SensorModel(byte b, String str) {
        this.slaveAddress = b;
        this.uniteName = str;
    }

    public SensorModel(SensorType sensorType, byte b) {
        this.sensorType = sensorType;
        this.slaveAddress = b;
    }

    public SensorModel(SensorType sensorType, byte b, String str, boolean z, String str2) {
        this.sensorType = sensorType;
        this.slaveAddress = b;
        this.uniteName = str;
        this.isSign = z;
        this.floorName = str2;
    }

    public SensorModel(SensorType sensorType, byte b, String str, boolean z, int i, String str2) {
        this.sensorType = sensorType;
        this.slaveAddress = b;
        this.uniteName = str;
        this.isSign = z;
        this.delay = i;
        this.floorName = str2;
    }

    public SensorModel(SensorType sensorType, byte b, String str, boolean z, int i) {
        this.sensorType = sensorType;
        this.slaveAddress = b;
        this.uniteName = str;
        this.isSign = z;
        this.delay = i;
    }

    public SensorModel(SensorType sensorType, byte b, String str, boolean z) {
        this.sensorType = sensorType;
        this.slaveAddress = b;
        this.uniteName = str;
        this.isSign = z;
        this.delay = 800;
    }

    public int getDelay() {
        if (this.delay == 0) {
            this.delay = 800;
        }
        return this.delay;
    }

    public String getFloorName() {
        return this.floorName;
    }

    public void setFloorName(String str) {
        this.floorName = str;
    }

    public void setDelay(int i) {
        this.delay = i;
    }

    public boolean isSign() {
        return this.isSign;
    }

    public void setSign(boolean z) {
        this.isSign = z;
    }

    public SensorType getSensorType() {
        return this.sensorType;
    }

    public void setSensorType(SensorType sensorType) {
        this.sensorType = sensorType;
    }

    public byte getSlaveAddress() {
        return this.slaveAddress;
    }

    public void setSlaveAddress(byte b) {
        this.slaveAddress = b;
    }

    public String getUniteName() {
        return this.uniteName;
    }

    public void setUniteName(String str) {
        this.uniteName = str;
    }

    public String toString() {
        return "SensorModel{sensorType=" + this.sensorType + ", slaveAddress=" + ((int) this.slaveAddress) + ", uniteName='" + this.uniteName + "', isSign=" + this.isSign + ", delay=" + this.delay + '}';
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        SensorType sensorType = this.sensorType;
        parcel.writeInt(sensorType == null ? -1 : sensorType.ordinal());
        parcel.writeByte(this.slaveAddress);
        parcel.writeString(this.uniteName);
        parcel.writeByte(this.isSign ? (byte) 1 : (byte) 0);
        parcel.writeInt(this.delay);
        parcel.writeString(this.floorName);
    }

    private SensorModel(Parcel parcel) {
        int i = parcel.readInt();
        this.sensorType = i == -1 ? null : SensorType.values()[i];
        this.slaveAddress = parcel.readByte();
        this.uniteName = parcel.readString();
        this.isSign = parcel.readByte() != 0;
        this.delay = parcel.readInt();
        this.floorName = parcel.readString();
    }
}
