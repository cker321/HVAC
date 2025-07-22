package com.yanzhenjie.andserver.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

@Deprecated
/* loaded from: classes.dex */
public abstract class CollectionUtils {
    public static boolean isEmpty(Collection<?> collection) {
        return collection == null || collection.isEmpty();
    }

    public static boolean isEmpty(Map<?, ?> map) {
        return map == null || map.isEmpty();
    }

    public static List arrayToList(Object obj) {
        return Arrays.asList(ObjectUtils.toObjectArray(obj));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <E> void mergeArrayIntoCollection(Object obj, Collection<E> collection) {
        if (collection == 0) {
            throw new IllegalArgumentException("Collection must not be null");
        }
        for (Object obj2 : ObjectUtils.toObjectArray(obj)) {
            collection.add(obj2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <K, V> void mergePropertiesIntoMap(Properties properties, Map<K, V> map) {
        if (map == 0) {
            throw new IllegalArgumentException("Map must not be null");
        }
        if (properties != null) {
            Enumeration<?> enumerationPropertyNames = properties.propertyNames();
            while (enumerationPropertyNames.hasMoreElements()) {
                String str = (String) enumerationPropertyNames.nextElement();
                Object property = properties.get(str);
                if (property == null) {
                    property = properties.getProperty(str);
                }
                map.put(str, property);
            }
        }
    }

    public static boolean contains(Iterator<?> it, Object obj) {
        if (it == null) {
            return false;
        }
        while (it.hasNext()) {
            if (ObjectUtils.nullSafeEquals(it.next(), obj)) {
                return true;
            }
        }
        return false;
    }

    public static boolean contains(Enumeration<?> enumeration, Object obj) {
        if (enumeration == null) {
            return false;
        }
        while (enumeration.hasMoreElements()) {
            if (ObjectUtils.nullSafeEquals(enumeration.nextElement(), obj)) {
                return true;
            }
        }
        return false;
    }

    public static boolean containsInstance(Collection<?> collection, Object obj) {
        if (collection == null) {
            return false;
        }
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            if (it.next() == obj) {
                return true;
            }
        }
        return false;
    }

    public static boolean containsAny(Collection<?> collection, Collection<?> collection2) {
        if (!isEmpty(collection) && !isEmpty(collection2)) {
            Iterator<?> it = collection2.iterator();
            while (it.hasNext()) {
                if (collection.contains(it.next())) {
                    return true;
                }
            }
        }
        return false;
    }

    public static <E> E findFirstMatch(Collection<?> collection, Collection<E> collection2) {
        if (!isEmpty(collection) && !isEmpty((Collection<?>) collection2)) {
            for (E e : collection2) {
                if (collection.contains(e)) {
                    return e;
                }
            }
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <T> T findValueOfType(Collection<?> collection, Class<T> cls) {
        if (isEmpty(collection)) {
            return null;
        }
        T t = null;
        for (Object obj : collection) {
            if (cls == null || cls.isInstance(obj)) {
                if (t != null) {
                    return null;
                }
                t = obj;
            }
        }
        return t;
    }

    public static Object findValueOfType(Collection<?> collection, Class<?>[] clsArr) {
        if (!isEmpty(collection) && !ObjectUtils.isEmpty((Object[]) clsArr)) {
            for (Class<?> cls : clsArr) {
                Object objFindValueOfType = findValueOfType(collection, cls);
                if (objFindValueOfType != null) {
                    return objFindValueOfType;
                }
            }
        }
        return null;
    }

    public static boolean hasUniqueObject(Collection<?> collection) {
        if (isEmpty(collection)) {
            return false;
        }
        Object obj = null;
        boolean z = false;
        for (Object obj2 : collection) {
            if (!z) {
                obj = obj2;
                z = true;
            } else if (obj != obj2) {
                return false;
            }
        }
        return true;
    }

    public static Class<?> findCommonElementType(Collection<?> collection) {
        if (isEmpty(collection)) {
            return null;
        }
        Class<?> cls = null;
        for (Object obj : collection) {
            if (obj != null) {
                if (cls == null) {
                    cls = obj.getClass();
                } else if (cls != obj.getClass()) {
                    return null;
                }
            }
        }
        return cls;
    }

    public static <A, E extends A> A[] toArray(Enumeration<E> enumeration, A[] aArr) {
        ArrayList arrayList = new ArrayList();
        while (enumeration.hasMoreElements()) {
            arrayList.add(enumeration.nextElement());
        }
        return (A[]) arrayList.toArray(aArr);
    }

    public static <E> Iterator<E> toIterator(Enumeration<E> enumeration) {
        return new EnumerationIterator(enumeration);
    }

    public static <K, V> MultiValueMap<K, V> toMultiValueMap(Map<K, List<V>> map) {
        return new MultiValueMapAdapter(map);
    }

    public static <K, V> MultiValueMap<K, V> unmodifiableMultiValueMap(MultiValueMap<? extends K, ? extends V> multiValueMap) {
        Assert.notNull(multiValueMap, "'map' must not be null");
        LinkedHashMap linkedHashMap = new LinkedHashMap(multiValueMap.size());
        for (Map.Entry<? extends K, ? extends V> entry : multiValueMap.entrySet()) {
            linkedHashMap.put(entry.getKey(), Collections.unmodifiableList((List) entry.getValue()));
        }
        return toMultiValueMap(Collections.unmodifiableMap(linkedHashMap));
    }

    private static class EnumerationIterator<E> implements Iterator<E> {
        private final Enumeration<E> enumeration;

        public EnumerationIterator(Enumeration<E> enumeration) {
            this.enumeration = enumeration;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.enumeration.hasMoreElements();
        }

        @Override // java.util.Iterator
        public E next() {
            return this.enumeration.nextElement();
        }

        @Override // java.util.Iterator
        public void remove() throws UnsupportedOperationException {
            throw new UnsupportedOperationException("Not supported");
        }
    }

    private static class MultiValueMapAdapter<K, V> implements MultiValueMap<K, V>, Serializable {
        private final Map<K, List<V>> mMap;

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Map
        public /* bridge */ /* synthetic */ Object put(Object obj, Object obj2) {
            return put((MultiValueMapAdapter<K, V>) obj, (List) obj2);
        }

        public MultiValueMapAdapter(Map<K, List<V>> map) {
            Assert.notNull(map, "'map' must not be null");
            this.mMap = map;
        }

        @Override // com.yanzhenjie.andserver.util.MultiValueMap
        public void add(K k, V v) {
            List<V> linkedList = this.mMap.get(k);
            if (linkedList == null) {
                linkedList = new LinkedList<>();
                this.mMap.put(k, linkedList);
            }
            linkedList.add(v);
        }

        @Override // com.yanzhenjie.andserver.util.MultiValueMap
        public V getFirst(K k) {
            List<V> list = this.mMap.get(k);
            if (list != null) {
                return list.get(0);
            }
            return null;
        }

        @Override // com.yanzhenjie.andserver.util.MultiValueMap
        public void set(K k, V v) {
            LinkedList linkedList = new LinkedList();
            linkedList.add(v);
            this.mMap.put(k, linkedList);
        }

        @Override // com.yanzhenjie.andserver.util.MultiValueMap
        public void setAll(Map<K, V> map) {
            for (Map.Entry<K, V> entry : map.entrySet()) {
                set(entry.getKey(), entry.getValue());
            }
        }

        @Override // com.yanzhenjie.andserver.util.MultiValueMap
        public Map<K, V> toSingleValueMap() {
            LinkedHashMap linkedHashMap = new LinkedHashMap(this.mMap.size());
            for (Map.Entry<K, List<V>> entry : this.mMap.entrySet()) {
                linkedHashMap.put(entry.getKey(), entry.getValue().get(0));
            }
            return linkedHashMap;
        }

        @Override // java.util.Map
        public int size() {
            return this.mMap.size();
        }

        @Override // java.util.Map
        public boolean isEmpty() {
            return this.mMap.isEmpty();
        }

        @Override // java.util.Map
        public boolean containsKey(Object obj) {
            return this.mMap.containsKey(obj);
        }

        @Override // java.util.Map
        public boolean containsValue(Object obj) {
            return this.mMap.containsValue(obj);
        }

        @Override // java.util.Map
        public List<V> get(Object obj) {
            return this.mMap.get(obj);
        }

        public List<V> put(K k, List<V> list) {
            return this.mMap.put(k, list);
        }

        @Override // java.util.Map
        public List<V> remove(Object obj) {
            return this.mMap.remove(obj);
        }

        @Override // java.util.Map
        public void putAll(Map<? extends K, ? extends List<V>> map) {
            this.mMap.putAll(map);
        }

        @Override // java.util.Map
        public void clear() {
            this.mMap.clear();
        }

        @Override // java.util.Map
        public Set<K> keySet() {
            return this.mMap.keySet();
        }

        @Override // java.util.Map
        public Collection<List<V>> values() {
            return this.mMap.values();
        }

        @Override // java.util.Map
        public Set<Map.Entry<K, List<V>>> entrySet() {
            return this.mMap.entrySet();
        }

        @Override // java.util.Map
        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return this.mMap.equals(obj);
        }

        @Override // java.util.Map
        public int hashCode() {
            return this.mMap.hashCode();
        }

        public String toString() {
            return this.mMap.toString();
        }
    }
}
