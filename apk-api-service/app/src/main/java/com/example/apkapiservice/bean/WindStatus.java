package com.example.apkapiservice.bean;

import java.util.Objects;

/**
 * 新风状态数据模型
 */
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

    public void setTypeTemp(boolean typeTemp) {
        this.typeTemp = typeTemp;
    }

    public float getShowTemp() {
        return this.showTemp;
    }

    public void setShowTemp(float showTemp) {
        this.showTemp = showTemp;
    }

    public float getWindHumidity() {
        return this.windHumidity;
    }

    public void setWindHumidity(float windHumidity) {
        this.windHumidity = windHumidity;
    }

    public int getPower() {
        return this.power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public int getMode() {
        return this.mode;
    }

    public void setMode(int mode) {
        this.mode = mode;
    }

    public int getWindSpeed() {
        return this.windSpeed;
    }

    public void setWindSpeed(int windSpeed) {
        this.windSpeed = windSpeed;
    }

    public int getHumiditySwitch() {
        return this.humiditySwitch;
    }

    public void setHumiditySwitch(int humiditySwitch) {
        this.humiditySwitch = humiditySwitch;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        WindStatus windStatus = (WindStatus) obj;
        boolean tempAndHumidityEqual = Float.compare(windStatus.showTemp, this.showTemp) == 0 
                && Float.compare(windStatus.windHumidity, this.windHumidity) == 0;
        boolean statusEqual = this.power == windStatus.power 
                && this.mode == windStatus.mode 
                && this.windSpeed == windStatus.windSpeed 
                && this.humiditySwitch == windStatus.humiditySwitch;
        
        if (this.typeTemp == windStatus.typeTemp && tempAndHumidityEqual) {
            return true;
        }
        return this.typeTemp == windStatus.typeTemp && statusEqual;
    }

    @Override
    public int hashCode() {
        return Objects.hash(typeTemp, showTemp, windHumidity, power, mode, windSpeed, humiditySwitch);
    }

    @Override
    public String toString() {
        return "WindStatus{" +
                "typeTemp=" + typeTemp +
                ", showTemp=" + showTemp +
                ", windHumidity=" + windHumidity +
                ", power=" + power +
                ", mode=" + mode +
                ", windSpeed=" + windSpeed +
                ", humiditySwitch=" + humiditySwitch +
                '}';
    }
}
