package com.yanzhenjie.andserver.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.PARAMETER})
@Retention(RetentionPolicy.SOURCE)
/* loaded from: classes.dex */
public @interface RequestParam {
    String defaultValue() default "";

    String name() default "";

    boolean required() default true;

    String value() default "";
}
