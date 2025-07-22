package com.yanzhenjie.andserver.util.comparator;

import com.yanzhenjie.andserver.util.Assert;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public class CompoundComparator<T> implements Comparator<T>, Serializable {
    private final List<InvertibleComparator> comparators;

    public CompoundComparator() {
        this.comparators = new ArrayList();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public CompoundComparator(Comparator... comparatorArr) {
        Assert.notNull(comparatorArr, "Comparators must not be null");
        this.comparators = new ArrayList(comparatorArr.length);
        for (Comparator comparator : comparatorArr) {
            addComparator(comparator);
        }
    }

    public void addComparator(Comparator<? extends T> comparator) {
        if (comparator instanceof InvertibleComparator) {
            this.comparators.add((InvertibleComparator) comparator);
        } else {
            this.comparators.add(new InvertibleComparator(comparator));
        }
    }

    public void addComparator(Comparator<? extends T> comparator, boolean z) {
        this.comparators.add(new InvertibleComparator(comparator, z));
    }

    public void setComparator(int i, Comparator<? extends T> comparator) {
        if (comparator instanceof InvertibleComparator) {
            this.comparators.set(i, (InvertibleComparator) comparator);
        } else {
            this.comparators.set(i, new InvertibleComparator(comparator));
        }
    }

    public void setComparator(int i, Comparator<T> comparator, boolean z) {
        this.comparators.set(i, new InvertibleComparator(comparator, z));
    }

    public void invertOrder() {
        Iterator<InvertibleComparator> it = this.comparators.iterator();
        while (it.hasNext()) {
            it.next().invertOrder();
        }
    }

    public void invertOrder(int i) {
        this.comparators.get(i).invertOrder();
    }

    public void setAscendingOrder(int i) {
        this.comparators.get(i).setAscending(true);
    }

    public void setDescendingOrder(int i) {
        this.comparators.get(i).setAscending(false);
    }

    public int getComparatorCount() {
        return this.comparators.size();
    }

    @Override // java.util.Comparator
    public int compare(T t, T t2) {
        Assert.state(this.comparators.size() > 0, "No sort definitions have been added to this CompoundComparator to compare");
        Iterator<InvertibleComparator> it = this.comparators.iterator();
        while (it.hasNext()) {
            int iCompare = it.next().compare(t, t2);
            if (iCompare != 0) {
                return iCompare;
            }
        }
        return 0;
    }

    @Override // java.util.Comparator
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof CompoundComparator) {
            return this.comparators.equals(((CompoundComparator) obj).comparators);
        }
        return false;
    }

    public int hashCode() {
        return this.comparators.hashCode();
    }

    public String toString() {
        return "CompoundComparator: " + this.comparators;
    }
}
