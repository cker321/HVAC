package com.dnake.desktop.bean;

import java.util.Objects;

/* loaded from: classes.dex */
public class WindStatus {
    int humiditySwitch;
    int mode;
    int power;
    float showTemp;
    boolean typeTemp;
    float windHumidity;
    int windSpeed;

    public boolean isTypeTemp() {
        return this.typeTemp;
    }

    public void setTypeTemp(boolean z) {
        this.typeTemp = z;
    }

    public float getShowTemp() {
        return this.showTemp;
    }

    public void setShowTemp(float f) {
        this.showTemp = f;
    }

    public float getWindHumidity() {
        return this.windHumidity;
    }

    public void setWindHumidity(float f) {
        this.windHumidity = f;
    }

    public int getPower() {
        return this.power;
    }

    public void setPower(int i) {
        this.power = i;
    }

    public int getMode() {
        return this.mode;
    }

    public void setMode(int i) {
        this.mode = i;
    }

    public int getWindSpeed() {
        return this.windSpeed;
    }

    public void setWindSpeed(int i) {
        this.windSpeed = i;
    }

    public int getHumiditySwitch() {
        return this.humiditySwitch;
    }

    public void setHumiditySwitch(int i) {
        this.humiditySwitch = i;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        WindStatus windStatus = (WindStatus) obj;
        boolean z = Float.compare(windStatus.showTemp, this.showTemp) == 0 && Float.compare(windStatus.windHumidity, this.windHumidity) == 0;
        boolean z2 = this.power == windStatus.power && this.mode == windStatus.mode && this.windSpeed == windStatus.windSpeed && this.humiditySwitch == windStatus.humiditySwitch;
        if (this.typeTemp == windStatus.typeTemp && z) {
            return true;
        }
        return this.typeTemp == windStatus.typeTemp && z2;
    }

    public int hashCode() {
        return Objects.hash(Boolean.valueOf(this.typeTemp), Float.valueOf(this.showTemp), Float.valueOf(this.windHumidity), Integer.valueOf(this.power), Integer.valueOf(this.mode), Integer.valueOf(this.windSpeed), Integer.valueOf(this.humiditySwitch));
    }

    public String toString() {
        return "WindStatus{typeTemp=" + this.typeTemp + ", showTemp=" + this.showTemp + ", windHumidity=" + this.windHumidity + ", power=" + this.power + ", mode=" + this.mode + ", windSpeed=" + this.windSpeed + ", humiditySwitch=" + this.humiditySwitch + '}';
    }
}
