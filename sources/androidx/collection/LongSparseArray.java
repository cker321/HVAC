package androidx.collection;

/* loaded from: classes.dex */
public class LongSparseArray<E> implements Cloneable {
    private static final Object DELETED = new Object();
    private boolean mGarbage;
    private long[] mKeys;
    private int mSize;
    private Object[] mValues;

    public LongSparseArray() {
        this(10);
    }

    public LongSparseArray(int i) {
        this.mGarbage = false;
        if (i == 0) {
            this.mKeys = ContainerHelpers.EMPTY_LONGS;
            this.mValues = ContainerHelpers.EMPTY_OBJECTS;
        } else {
            int iIdealLongArraySize = ContainerHelpers.idealLongArraySize(i);
            this.mKeys = new long[iIdealLongArraySize];
            this.mValues = new Object[iIdealLongArraySize];
        }
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public LongSparseArray<E> m74clone() {
        try {
            LongSparseArray<E> longSparseArray = (LongSparseArray) super.clone();
            longSparseArray.mKeys = (long[]) this.mKeys.clone();
            longSparseArray.mValues = (Object[]) this.mValues.clone();
            return longSparseArray;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError(e);
        }
    }

    public E get(long j) {
        return get(j, null);
    }

    public E get(long j, E e) {
        int iBinarySearch = ContainerHelpers.binarySearch(this.mKeys, this.mSize, j);
        if (iBinarySearch >= 0) {
            Object[] objArr = this.mValues;
            if (objArr[iBinarySearch] != DELETED) {
                return (E) objArr[iBinarySearch];
            }
        }
        return e;
    }

    @Deprecated
    public void delete(long j) {
        remove(j);
    }

    public void remove(long j) {
        int iBinarySearch = ContainerHelpers.binarySearch(this.mKeys, this.mSize, j);
        if (iBinarySearch >= 0) {
            Object[] objArr = this.mValues;
            Object obj = objArr[iBinarySearch];
            Object obj2 = DELETED;
            if (obj != obj2) {
                objArr[iBinarySearch] = obj2;
                this.mGarbage = true;
            }
        }
    }

    public boolean remove(long j, Object obj) {
        int iIndexOfKey = indexOfKey(j);
        if (iIndexOfKey < 0) {
            return false;
        }
        E eValueAt = valueAt(iIndexOfKey);
        if (obj != eValueAt && (obj == null || !obj.equals(eValueAt))) {
            return false;
        }
        removeAt(iIndexOfKey);
        return true;
    }

    public void removeAt(int i) {
        Object[] objArr = this.mValues;
        Object obj = objArr[i];
        Object obj2 = DELETED;
        if (obj != obj2) {
            objArr[i] = obj2;
            this.mGarbage = true;
        }
    }

    public E replace(long j, E e) {
        int iIndexOfKey = indexOfKey(j);
        if (iIndexOfKey < 0) {
            return null;
        }
        Object[] objArr = this.mValues;
        E e2 = (E) objArr[iIndexOfKey];
        objArr[iIndexOfKey] = e;
        return e2;
    }

    public boolean replace(long j, E e, E e2) {
        int iIndexOfKey = indexOfKey(j);
        if (iIndexOfKey < 0) {
            return false;
        }
        Object obj = this.mValues[iIndexOfKey];
        if (obj != e && (e == null || !e.equals(obj))) {
            return false;
        }
        this.mValues[iIndexOfKey] = e2;
        return true;
    }

    /* renamed from: gc */
    private void m2gc() {
        int i = this.mSize;
        long[] jArr = this.mKeys;
        Object[] objArr = this.mValues;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            Object obj = objArr[i3];
            if (obj != DELETED) {
                if (i3 != i2) {
                    jArr[i2] = jArr[i3];
                    objArr[i2] = obj;
                    objArr[i3] = null;
                }
                i2++;
            }
        }
        this.mGarbage = false;
        this.mSize = i2;
    }

    public void put(long j, E e) {
        int iBinarySearch = ContainerHelpers.binarySearch(this.mKeys, this.mSize, j);
        if (iBinarySearch >= 0) {
            this.mValues[iBinarySearch] = e;
            return;
        }
        int iBinarySearch2 = iBinarySearch ^ (-1);
        if (iBinarySearch2 < this.mSize) {
            Object[] objArr = this.mValues;
            if (objArr[iBinarySearch2] == DELETED) {
                this.mKeys[iBinarySearch2] = j;
                objArr[iBinarySearch2] = e;
                return;
            }
        }
        if (this.mGarbage && this.mSize >= this.mKeys.length) {
            m2gc();
            iBinarySearch2 = ContainerHelpers.binarySearch(this.mKeys, this.mSize, j) ^ (-1);
        }
        int i = this.mSize;
        if (i >= this.mKeys.length) {
            int iIdealLongArraySize = ContainerHelpers.idealLongArraySize(i + 1);
            long[] jArr = new long[iIdealLongArraySize];
            Object[] objArr2 = new Object[iIdealLongArraySize];
            long[] jArr2 = this.mKeys;
            System.arraycopy(jArr2, 0, jArr, 0, jArr2.length);
            Object[] objArr3 = this.mValues;
            System.arraycopy(objArr3, 0, objArr2, 0, objArr3.length);
            this.mKeys = jArr;
            this.mValues = objArr2;
        }
        int i2 = this.mSize;
        if (i2 - iBinarySearch2 != 0) {
            long[] jArr3 = this.mKeys;
            int i3 = iBinarySearch2 + 1;
            System.arraycopy(jArr3, iBinarySearch2, jArr3, i3, i2 - iBinarySearch2);
            Object[] objArr4 = this.mValues;
            System.arraycopy(objArr4, iBinarySearch2, objArr4, i3, this.mSize - iBinarySearch2);
        }
        this.mKeys[iBinarySearch2] = j;
        this.mValues[iBinarySearch2] = e;
        this.mSize++;
    }

    public void putAll(LongSparseArray<? extends E> longSparseArray) {
        int size = longSparseArray.size();
        for (int i = 0; i < size; i++) {
            put(longSparseArray.keyAt(i), longSparseArray.valueAt(i));
        }
    }

    public E putIfAbsent(long j, E e) {
        E e2 = get(j);
        if (e2 == null) {
            put(j, e);
        }
        return e2;
    }

    public int size() {
        if (this.mGarbage) {
            m2gc();
        }
        return this.mSize;
    }

    public boolean isEmpty() {
        return size() == 0;
    }

    public long keyAt(int i) {
        if (this.mGarbage) {
            m2gc();
        }
        return this.mKeys[i];
    }

    public E valueAt(int i) {
        if (this.mGarbage) {
            m2gc();
        }
        return (E) this.mValues[i];
    }

    public void setValueAt(int i, E e) {
        if (this.mGarbage) {
            m2gc();
        }
        this.mValues[i] = e;
    }

    public int indexOfKey(long j) {
        if (this.mGarbage) {
            m2gc();
        }
        return ContainerHelpers.binarySearch(this.mKeys, this.mSize, j);
    }

    public int indexOfValue(E e) {
        if (this.mGarbage) {
            m2gc();
        }
        for (int i = 0; i < this.mSize; i++) {
            if (this.mValues[i] == e) {
                return i;
            }
        }
        return -1;
    }

    public boolean containsKey(long j) {
        return indexOfKey(j) >= 0;
    }

    public boolean containsValue(E e) {
        return indexOfValue(e) >= 0;
    }

    public void clear() {
        int i = this.mSize;
        Object[] objArr = this.mValues;
        for (int i2 = 0; i2 < i; i2++) {
            objArr[i2] = null;
        }
        this.mSize = 0;
        this.mGarbage = false;
    }

    public void append(long j, E e) {
        int i = this.mSize;
        if (i != 0 && j <= this.mKeys[i - 1]) {
            put(j, e);
            return;
        }
        if (this.mGarbage && this.mSize >= this.mKeys.length) {
            m2gc();
        }
        int i2 = this.mSize;
        if (i2 >= this.mKeys.length) {
            int iIdealLongArraySize = ContainerHelpers.idealLongArraySize(i2 + 1);
            long[] jArr = new long[iIdealLongArraySize];
            Object[] objArr = new Object[iIdealLongArraySize];
            long[] jArr2 = this.mKeys;
            System.arraycopy(jArr2, 0, jArr, 0, jArr2.length);
            Object[] objArr2 = this.mValues;
            System.arraycopy(objArr2, 0, objArr, 0, objArr2.length);
            this.mKeys = jArr;
            this.mValues = objArr;
        }
        this.mKeys[i2] = j;
        this.mValues[i2] = e;
        this.mSize = i2 + 1;
    }

    public String toString() {
        if (size() <= 0) {
            return "{}";
        }
        StringBuilder sb = new StringBuilder(this.mSize * 28);
        sb.append('{');
        for (int i = 0; i < this.mSize; i++) {
            if (i > 0) {
                sb.append(", ");
            }
            sb.append(keyAt(i));
            sb.append('=');
            E eValueAt = valueAt(i);
            if (eValueAt != this) {
                sb.append(eValueAt);
            } else {
                sb.append("(this Map)");
            }
        }
        sb.append('}');
        return sb.toString();
    }
}
