package com.yanzhenjie.andserver.util;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public class LinkedMultiValueMap<K, V> implements MultiValueMap<K, V>, Cloneable {
    private final Map<K, List<V>> mSource;

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.Map
    public /* bridge */ /* synthetic */ Object put(Object obj, Object obj2) {
        return put((LinkedMultiValueMap<K, V>) obj, (List) obj2);
    }

    public LinkedMultiValueMap() {
        this.mSource = new LinkedHashMap();
    }

    public LinkedMultiValueMap(int i) {
        this.mSource = new LinkedHashMap(i);
    }

    public LinkedMultiValueMap(Map<K, List<V>> map) {
        this.mSource = new LinkedHashMap(map);
    }

    @Override // com.yanzhenjie.andserver.util.MultiValueMap
    public void add(K k, V v) {
        List<V> linkedList = this.mSource.get(k);
        if (linkedList == null) {
            linkedList = new LinkedList<>();
            this.mSource.put(k, linkedList);
        }
        linkedList.add(v);
    }

    @Override // com.yanzhenjie.andserver.util.MultiValueMap
    public V getFirst(K k) {
        List<V> list = this.mSource.get(k);
        if (list != null) {
            return list.get(0);
        }
        return null;
    }

    @Override // com.yanzhenjie.andserver.util.MultiValueMap
    public void set(K k, V v) {
        LinkedList linkedList = new LinkedList();
        linkedList.add(v);
        this.mSource.put(k, linkedList);
    }

    @Override // com.yanzhenjie.andserver.util.MultiValueMap
    public void setAll(Map<K, V> map) {
        for (Map.Entry<K, V> entry : map.entrySet()) {
            set(entry.getKey(), entry.getValue());
        }
    }

    @Override // com.yanzhenjie.andserver.util.MultiValueMap
    public Map<K, V> toSingleValueMap() {
        LinkedHashMap linkedHashMap = new LinkedHashMap(this.mSource.size());
        for (Map.Entry<K, List<V>> entry : this.mSource.entrySet()) {
            linkedHashMap.put(entry.getKey(), entry.getValue().get(0));
        }
        return linkedHashMap;
    }

    @Override // java.util.Map
    public int size() {
        return this.mSource.size();
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        return this.mSource.isEmpty();
    }

    @Override // java.util.Map
    public boolean containsKey(Object obj) {
        return this.mSource.containsKey(obj);
    }

    @Override // java.util.Map
    public boolean containsValue(Object obj) {
        return this.mSource.containsValue(obj);
    }

    @Override // java.util.Map
    public List<V> get(Object obj) {
        return this.mSource.get(obj);
    }

    public List<V> put(K k, List<V> list) {
        return this.mSource.put(k, list);
    }

    @Override // java.util.Map
    public List<V> remove(Object obj) {
        return this.mSource.remove(obj);
    }

    @Override // java.util.Map
    public void putAll(Map<? extends K, ? extends List<V>> map) {
        this.mSource.putAll(map);
    }

    @Override // java.util.Map
    public void clear() {
        this.mSource.clear();
    }

    @Override // java.util.Map
    public Set<K> keySet() {
        return this.mSource.keySet();
    }

    @Override // java.util.Map
    public Collection<List<V>> values() {
        return this.mSource.values();
    }

    @Override // java.util.Map
    public Set<Map.Entry<K, List<V>>> entrySet() {
        return this.mSource.entrySet();
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public LinkedMultiValueMap<K, V> m87clone() {
        return new LinkedMultiValueMap<>(this);
    }

    @Override // java.util.Map
    public boolean equals(Object obj) {
        return this.mSource.equals(obj);
    }

    @Override // java.util.Map
    public int hashCode() {
        return this.mSource.hashCode();
    }

    public String toString() {
        return this.mSource.toString();
    }

    public LinkedMultiValueMap<K, V> deepCopy() {
        LinkedMultiValueMap<K, V> linkedMultiValueMap = new LinkedMultiValueMap<>(this.mSource.size());
        for (Map.Entry<K, List<V>> entry : this.mSource.entrySet()) {
            linkedMultiValueMap.put((LinkedMultiValueMap<K, V>) entry.getKey(), (List) new LinkedList(entry.getValue()));
        }
        return linkedMultiValueMap;
    }
}
