package com.google.gson.internal.reflect;

import java.lang.reflect.AccessibleObject;

/* loaded from: classes.dex */
final class PreJava9ReflectionAccessor extends ReflectionAccessor {
    PreJava9ReflectionAccessor() {
    }

    @Override // com.google.gson.internal.reflect.ReflectionAccessor
    public void makeAccessible(AccessibleObject accessibleObject) throws SecurityException {
        accessibleObject.setAccessible(true);
    }
}
