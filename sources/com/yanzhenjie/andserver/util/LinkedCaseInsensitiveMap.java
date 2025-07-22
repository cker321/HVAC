package com.yanzhenjie.andserver.util;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/* loaded from: classes.dex */
public class LinkedCaseInsensitiveMap<V> implements Map<String, V>, Serializable, Cloneable {
    private final HashMap<String, String> mCaseInsensitiveKeys;
    private final Locale mLocale;
    private final LinkedHashMap<String, V> mSource;

    protected boolean removeEldestEntry(Map.Entry<String, V> entry) {
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // java.util.Map
    public /* bridge */ /* synthetic */ Object put(String str, Object obj) {
        return put2(str, (String) obj);
    }

    public LinkedCaseInsensitiveMap() {
        this((Locale) null);
    }

    public LinkedCaseInsensitiveMap(Locale locale) {
        this(16, locale);
    }

    public LinkedCaseInsensitiveMap(int i) {
        this(i, null);
    }

    public LinkedCaseInsensitiveMap(int i, Locale locale) {
        this.mSource = new LinkedHashMap<String, V>(i) { // from class: com.yanzhenjie.andserver.util.LinkedCaseInsensitiveMap.1
            @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
            public boolean containsKey(Object obj) {
                return LinkedCaseInsensitiveMap.this.containsKey(obj);
            }

            @Override // java.util.LinkedHashMap
            protected boolean removeEldestEntry(Map.Entry<String, V> entry) {
                boolean zRemoveEldestEntry = LinkedCaseInsensitiveMap.this.removeEldestEntry(entry);
                if (zRemoveEldestEntry) {
                    LinkedCaseInsensitiveMap.this.mCaseInsensitiveKeys.remove(LinkedCaseInsensitiveMap.this.convertKey(entry.getKey()));
                }
                return zRemoveEldestEntry;
            }
        };
        this.mCaseInsensitiveKeys = new HashMap<>(i);
        this.mLocale = locale == null ? Locale.getDefault() : locale;
    }

    private LinkedCaseInsensitiveMap(LinkedCaseInsensitiveMap<V> linkedCaseInsensitiveMap) {
        this.mSource = (LinkedHashMap) linkedCaseInsensitiveMap.mSource.clone();
        this.mCaseInsensitiveKeys = (HashMap) linkedCaseInsensitiveMap.mCaseInsensitiveKeys.clone();
        this.mLocale = linkedCaseInsensitiveMap.mLocale;
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
        return (obj instanceof String) && this.mCaseInsensitiveKeys.containsKey(convertKey((String) obj));
    }

    @Override // java.util.Map
    public boolean containsValue(Object obj) {
        return this.mSource.containsValue(obj);
    }

    @Override // java.util.Map
    public V get(Object obj) {
        String str;
        if (!(obj instanceof String) || (str = this.mCaseInsensitiveKeys.get(convertKey((String) obj))) == null) {
            return null;
        }
        return this.mSource.get(str);
    }

    @Override // java.util.Map
    public V getOrDefault(Object obj, V v) {
        String str;
        return (!(obj instanceof String) || (str = this.mCaseInsensitiveKeys.get(convertKey((String) obj))) == null) ? v : this.mSource.get(str);
    }

    /* renamed from: put, reason: avoid collision after fix types in other method */
    public V put2(String str, V v) {
        String strPut = this.mCaseInsensitiveKeys.put(convertKey(str), str);
        if (strPut != null && !strPut.equals(str)) {
            this.mSource.remove(strPut);
        }
        return this.mSource.put(str, v);
    }

    @Override // java.util.Map
    public void putAll(Map<? extends String, ? extends V> map) {
        if (map.isEmpty()) {
            return;
        }
        for (Map.Entry<? extends String, ? extends V> entry : map.entrySet()) {
            put2(entry.getKey(), (String) entry.getValue());
        }
    }

    @Override // java.util.Map
    public V remove(Object obj) {
        String strRemove;
        if (!(obj instanceof String) || (strRemove = this.mCaseInsensitiveKeys.remove(convertKey((String) obj))) == null) {
            return null;
        }
        return this.mSource.remove(strRemove);
    }

    @Override // java.util.Map
    public void clear() {
        this.mCaseInsensitiveKeys.clear();
        this.mSource.clear();
    }

    @Override // java.util.Map
    public Set<String> keySet() {
        return this.mSource.keySet();
    }

    @Override // java.util.Map
    public Collection<V> values() {
        return this.mSource.values();
    }

    @Override // java.util.Map
    public Set<Map.Entry<String, V>> entrySet() {
        return this.mSource.entrySet();
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public LinkedCaseInsensitiveMap<V> m86clone() {
        return new LinkedCaseInsensitiveMap<>(this);
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

    public Locale getLocale() {
        return this.mLocale;
    }

    protected String convertKey(String str) {
        return str.toLowerCase(getLocale());
    }
}
