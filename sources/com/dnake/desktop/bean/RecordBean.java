package com.dnake.desktop.bean;

import java.io.Serializable;
import java.util.Objects;

/* loaded from: classes.dex */
public class RecordBean implements Serializable {
    private float co2;
    private float humidity;
    private float pm25;
    private float temp;
    private float voc;

    public float getPm25() {
        return this.pm25;
    }

    public void setPm25(float f) {
        this.pm25 = f;
    }

    public float getCo2() {
        return this.co2;
    }

    public void setCo2(float f) {
        this.co2 = f;
    }

    public float getVoc() {
        return this.voc;
    }

    public void setVoc(float f) {
        this.voc = f;
    }

    public float getHumidity() {
        return this.humidity;
    }

    public void setHumidity(float f) {
        this.humidity = f;
    }

    public float getTemp() {
        return this.temp;
    }

    public void setTemp(float f) {
        this.temp = f;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        RecordBean recordBean = (RecordBean) obj;
        return Float.compare(recordBean.pm25, this.pm25) == 0 && Float.compare(recordBean.co2, this.co2) == 0 && Float.compare(recordBean.voc, this.voc) == 0 && Float.compare(recordBean.humidity, this.humidity) == 0 && Float.compare(recordBean.temp, this.temp) == 0;
    }

    public int hashCode() {
        return Objects.hash(Float.valueOf(this.pm25), Float.valueOf(this.co2), Float.valueOf(this.voc), Float.valueOf(this.humidity), Float.valueOf(this.temp));
    }

    public String toString() {
        return "RecordBean{pm25=" + this.pm25 + ", co2=" + this.co2 + ", voc=" + this.voc + ", humidity=" + this.humidity + ", temp=" + this.temp + '}';
    }
}
