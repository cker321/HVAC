package com.landleaf.smarthome.model;

import java.io.Serializable;

/* loaded from: classes.dex */
public class NewsModel implements Serializable {
    private String content;

    /* renamed from: id */
    private String f147id;
    private String sender;
    private String time;
    private String title;

    public String getId() {
        return this.f147id;
    }

    public void setId(String str) {
        this.f147id = str;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String str) {
        this.title = str;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String str) {
        this.content = str;
    }

    public String getSender() {
        return this.sender;
    }

    public void setSender(String str) {
        this.sender = str;
    }

    public String getTime() {
        return this.time;
    }

    public void setTime(String str) {
        this.time = str;
    }
}
