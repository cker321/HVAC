package com.yanzhenjie.andserver.util;

import android.text.TextUtils;
import java.util.Collection;
import java.util.Map;

/* loaded from: classes.dex */
public abstract class Assert {
    public static void state(boolean z, String str) {
        if (!z) {
            throw new IllegalStateException(str);
        }
    }

    public static void isTrue(boolean z, String str) {
        if (!z) {
            throw new IllegalArgumentException(str);
        }
    }

    public static void isNull(Object obj, String str) {
        if (obj != null) {
            throw new IllegalArgumentException(str);
        }
    }

    public static void notNull(Object obj, String str) {
        if (obj == null) {
            throw new IllegalArgumentException(str);
        }
    }

    public static void hasLength(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException(str2);
        }
    }

    public static void hasText(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException(str2);
        }
    }

    public static void doesNotContain(String str, String str2, String str3) {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2) && str.contains(str2)) {
            throw new IllegalArgumentException(str3);
        }
    }

    public static void notEmpty(Object[] objArr, String str) {
        if (objArr == null || objArr.length == 0) {
            throw new IllegalArgumentException(str);
        }
    }

    public static void noNullElements(Object[] objArr, String str) {
        if (objArr != null) {
            for (Object obj : objArr) {
                if (obj == null) {
                    throw new IllegalArgumentException(str);
                }
            }
        }
    }

    public static void notEmpty(Collection<?> collection, String str) {
        if (collection == null || collection.isEmpty()) {
            throw new IllegalArgumentException(str);
        }
    }

    public static void notEmpty(Map<?, ?> map, String str) {
        if (map == null || map.isEmpty()) {
            throw new IllegalArgumentException(str);
        }
    }

    public static void isInstanceOf(Class<?> cls, Object obj, String str) {
        notNull(cls, "Type to check against must not be null");
        if (cls.isInstance(obj)) {
            return;
        }
        instanceCheckFailed(cls, obj, str);
    }

    public static void isInstanceOf(Class<?> cls, Object obj) {
        isInstanceOf(cls, obj, "");
    }

    public static void isAssignable(Class<?> cls, Class<?> cls2, String str) {
        notNull(cls, "Super type to check against must not be null");
        if (cls2 == null || !cls.isAssignableFrom(cls2)) {
            assignableCheckFailed(cls, cls2, str);
        }
    }

    public static void isAssignable(Class<?> cls, Class<?> cls2) {
        isAssignable(cls, cls2, "");
    }

    private static void instanceCheckFailed(Class<?> cls, Object obj, String str) {
        String strMessageWithTypeName;
        String name = obj != null ? obj.getClass().getName() : "null";
        boolean z = true;
        if (TextUtils.isEmpty(str)) {
            strMessageWithTypeName = "";
        } else if (endsWithSeparator(str)) {
            strMessageWithTypeName = str + " ";
        } else {
            strMessageWithTypeName = messageWithTypeName(str, name);
            z = false;
        }
        if (z) {
            strMessageWithTypeName = strMessageWithTypeName + "Object of class [" + name + "] must be an instance of " + cls;
        }
        throw new IllegalArgumentException(strMessageWithTypeName);
    }

    private static void assignableCheckFailed(Class<?> cls, Class<?> cls2, String str) {
        String strMessageWithTypeName;
        boolean z = true;
        if (TextUtils.isEmpty(str)) {
            strMessageWithTypeName = "";
        } else if (endsWithSeparator(str)) {
            strMessageWithTypeName = str + " ";
        } else {
            strMessageWithTypeName = messageWithTypeName(str, cls2);
            z = false;
        }
        if (z) {
            strMessageWithTypeName = strMessageWithTypeName + cls2 + " is not assignable to " + cls;
        }
        throw new IllegalArgumentException(strMessageWithTypeName);
    }

    private static boolean endsWithSeparator(String str) {
        return str.endsWith(":") || str.endsWith(";") || str.endsWith(",") || str.endsWith(".");
    }

    private static String messageWithTypeName(String str, Object obj) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(str.endsWith(" ") ? "" : ": ");
        sb.append(obj);
        return sb.toString();
    }
}
