package com.dnake.desktop.event;

/* loaded from: classes.dex */
public class ErrorMsgEvent {
    private String msg;

    public ErrorMsgEvent(String str) {
        this.msg = str;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String str) {
        this.msg = str;
    }
}
