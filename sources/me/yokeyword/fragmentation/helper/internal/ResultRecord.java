package me.yokeyword.fragmentation.helper.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: classes.dex */
public final class ResultRecord implements Parcelable {
    public static final Parcelable.Creator<ResultRecord> CREATOR = new Parcelable.Creator<ResultRecord>() { // from class: me.yokeyword.fragmentation.helper.internal.ResultRecord.1
        @Override // android.os.Parcelable.Creator
        public ResultRecord createFromParcel(Parcel parcel) {
            return new ResultRecord(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public ResultRecord[] newArray(int i) {
            return new ResultRecord[i];
        }
    };
    public int requestCode;
    public Bundle resultBundle;
    public int resultCode;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public ResultRecord() {
        this.resultCode = 0;
    }

    protected ResultRecord(Parcel parcel) {
        this.resultCode = 0;
        this.requestCode = parcel.readInt();
        this.resultCode = parcel.readInt();
        this.resultBundle = parcel.readBundle(getClass().getClassLoader());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.requestCode);
        parcel.writeInt(this.resultCode);
        parcel.writeBundle(this.resultBundle);
    }
}
