package org.greenrobot.greendao.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.FIELD})
@Retention(RetentionPolicy.SOURCE)
/* renamed from: org.greenrobot.greendao.annotation.Id */
/* loaded from: classes.dex */
public @interface InterfaceC0874Id {
    boolean autoincrement() default false;
}
