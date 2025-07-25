package org.apache.commons.p006io.filefilter;

import java.io.File;
import java.io.Serializable;

/* loaded from: classes.dex */
public class FalseFileFilter implements IOFileFilter, Serializable {
    public static final IOFileFilter FALSE;
    public static final IOFileFilter INSTANCE;
    private static final long serialVersionUID = 6210271677940926200L;

    @Override // org.apache.commons.p006io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        return false;
    }

    @Override // org.apache.commons.p006io.filefilter.IOFileFilter, java.io.FilenameFilter
    public boolean accept(File file, String str) {
        return false;
    }

    static {
        FalseFileFilter falseFileFilter = new FalseFileFilter();
        FALSE = falseFileFilter;
        INSTANCE = falseFileFilter;
    }

    protected FalseFileFilter() {
    }
}
