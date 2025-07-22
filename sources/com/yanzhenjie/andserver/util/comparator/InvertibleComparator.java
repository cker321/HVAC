package com.yanzhenjie.andserver.util.comparator;

import androidx.appcompat.widget.ActivityChooserView;
import com.yanzhenjie.andserver.util.Assert;
import java.io.Serializable;
import java.util.Comparator;

/* loaded from: classes.dex */
public class InvertibleComparator<T> implements Comparator<T>, Serializable {
    private boolean ascending = true;
    private final Comparator<T> comparator;

    public InvertibleComparator(Comparator<T> comparator) {
        Assert.notNull(comparator, "Comparator must not be null.");
        this.comparator = comparator;
    }

    public InvertibleComparator(Comparator<T> comparator, boolean z) {
        Assert.notNull(comparator, "Comparator must not be null.");
        this.comparator = comparator;
        setAscending(z);
    }

    public void setAscending(boolean z) {
        this.ascending = z;
    }

    public boolean isAscending() {
        return this.ascending;
    }

    public void invertOrder() {
        this.ascending = !this.ascending;
    }

    @Override // java.util.Comparator
    public int compare(T t, T t2) {
        int iCompare = this.comparator.compare(t, t2);
        if (iCompare != 0) {
            return !this.ascending ? Integer.MIN_VALUE == iCompare ? ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED : iCompare * (-1) : iCompare;
        }
        return 0;
    }

    @Override // java.util.Comparator
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof InvertibleComparator)) {
            return false;
        }
        InvertibleComparator invertibleComparator = (InvertibleComparator) obj;
        return this.comparator.equals(invertibleComparator.comparator) && this.ascending == invertibleComparator.ascending;
    }

    public int hashCode() {
        return this.comparator.hashCode();
    }

    public String toString() {
        return "InvertibleComparator: [" + this.comparator + "]; ascending=" + this.ascending;
    }
}
