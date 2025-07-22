package com.dnake.desktop.dnake.v700;

/* loaded from: classes.dex */
public class ioctl {
    private static int hooter_onoff = 100;

    public static void hooter(int i) {
        if (hooter_onoff != i) {
            dmsg dmsgVar = new dmsg();
            dxml dxmlVar = new dxml();
            dxmlVar.setInt("/params/onoff", i);
            dmsgVar.m11to("/control/hooter", dxmlVar.toString());
            hooter_onoff = i;
        }
    }
}
