package org.apache.commons.p006io.filefilter;

import java.io.File;
import java.io.Serializable;

/* loaded from: classes.dex */
public class CanWriteFileFilter extends AbstractFileFilter implements Serializable {
    public static final IOFileFilter CANNOT_WRITE;
    public static final IOFileFilter CAN_WRITE;
    private static final long serialVersionUID = 5132005214688990379L;

    static {
        CanWriteFileFilter canWriteFileFilter = new CanWriteFileFilter();
        CAN_WRITE = canWriteFileFilter;
        CANNOT_WRITE = new NotFileFilter(canWriteFileFilter);
    }

    protected CanWriteFileFilter() {
    }

    @Override // org.apache.commons.p006io.filefilter.AbstractFileFilter, org.apache.commons.p006io.filefilter.IOFileFilter, java.io.FileFilter
    public boolean accept(File file) {
        return file.canWrite();
    }
}
