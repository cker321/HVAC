package org.apache.commons.p006io.serialization;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* loaded from: classes.dex */
final class FullClassNameMatcher implements ClassNameMatcher {
    private final Set<String> classesSet;

    public FullClassNameMatcher(String... strArr) {
        this.classesSet = Collections.unmodifiableSet(new HashSet(Arrays.asList(strArr)));
    }

    @Override // org.apache.commons.p006io.serialization.ClassNameMatcher
    public boolean matches(String str) {
        return this.classesSet.contains(str);
    }
}
