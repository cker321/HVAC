package org.apache.commons.p006io.serialization;

import org.apache.commons.p006io.FilenameUtils;

/* loaded from: classes.dex */
final class WildcardClassNameMatcher implements ClassNameMatcher {
    private final String pattern;

    public WildcardClassNameMatcher(String str) {
        this.pattern = str;
    }

    @Override // org.apache.commons.p006io.serialization.ClassNameMatcher
    public boolean matches(String str) {
        return FilenameUtils.wildcardMatch(str, this.pattern);
    }
}
