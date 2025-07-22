package com.landleaf.smarthome.net.http;

import java.io.Serializable;

/* loaded from: classes.dex */
public class NetResponse<T> implements Serializable {
    public int code;
    public T data;
    public boolean isSuccess;
    public String message;
}
