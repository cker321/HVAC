package org.apache.commons.p006io.filefilter;

import java.util.List;

/* loaded from: classes.dex */
public interface ConditionalFileFilter {
    void addFileFilter(IOFileFilter iOFileFilter);

    List<IOFileFilter> getFileFilters();

    boolean removeFileFilter(IOFileFilter iOFileFilter);

    void setFileFilters(List<IOFileFilter> list);
}
