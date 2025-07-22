package com.landleaf.smarthome.util;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.List;

/* loaded from: classes.dex */
public class JsonUtils {
    private static final Gson gson = new Gson();

    public static String objToJson(Object obj) {
        return gson.toJson(obj);
    }

    public static <T> T jsonToObj(String str, Class<T> cls) {
        try {
            return (T) gson.fromJson(str, (Class) cls);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static <T> T jsonToObj(String str, Type type) {
        try {
            return (T) gson.fromJson(str, type);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static <T> List<T> jsonToList(String str) {
        try {
            return (List) gson.fromJson(str, new TypeToken<List<T>>() { // from class: com.landleaf.smarthome.util.JsonUtils.1
            }.getType());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
