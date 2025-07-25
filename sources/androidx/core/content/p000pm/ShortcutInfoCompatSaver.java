package androidx.core.content.p000pm;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public abstract class ShortcutInfoCompatSaver<T> {
    public abstract T addShortcuts(List<ShortcutInfoCompat> list);

    public abstract T removeAllShortcuts();

    public abstract T removeShortcuts(List<String> list);

    public List<ShortcutInfoCompat> getShortcuts() throws Exception {
        return new ArrayList();
    }

    public static class NoopImpl extends ShortcutInfoCompatSaver<Void> {
        @Override // androidx.core.content.p000pm.ShortcutInfoCompatSaver
        /* renamed from: addShortcuts, reason: avoid collision after fix types in other method */
        public Void addShortcuts2(List<ShortcutInfoCompat> list) {
            return null;
        }

        @Override // androidx.core.content.p000pm.ShortcutInfoCompatSaver
        public Void removeAllShortcuts() {
            return null;
        }

        @Override // androidx.core.content.p000pm.ShortcutInfoCompatSaver
        /* renamed from: removeShortcuts, reason: avoid collision after fix types in other method */
        public Void removeShortcuts2(List<String> list) {
            return null;
        }

        @Override // androidx.core.content.p000pm.ShortcutInfoCompatSaver
        public /* bridge */ /* synthetic */ Void addShortcuts(List list) {
            return addShortcuts2((List<ShortcutInfoCompat>) list);
        }

        @Override // androidx.core.content.p000pm.ShortcutInfoCompatSaver
        public /* bridge */ /* synthetic */ Void removeShortcuts(List list) {
            return removeShortcuts2((List<String>) list);
        }
    }
}
