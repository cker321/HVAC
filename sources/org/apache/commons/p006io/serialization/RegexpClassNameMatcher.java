package org.apache.commons.p006io.serialization;

import java.util.regex.Pattern;

/* loaded from: classes.dex */
final class RegexpClassNameMatcher implements ClassNameMatcher {
    private final Pattern pattern;

    public RegexpClassNameMatcher(String str) {
        this(Pattern.compile(str));
    }

    public RegexpClassNameMatcher(Pattern pattern) {
        if (pattern == null) {
            throw new IllegalArgumentException("Null pattern");
        }
        this.pattern = pattern;
    }

    @Override // org.apache.commons.p006io.serialization.ClassNameMatcher
    public boolean matches(String str) {
        return this.pattern.matcher(str).matches();
    }
}
