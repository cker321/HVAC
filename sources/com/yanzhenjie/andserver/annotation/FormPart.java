package com.yanzhenjie.andserver.annotation;

/* loaded from: classes.dex */
public @interface FormPart {
    String name() default "";

    boolean required() default true;

    String value() default "";
}
