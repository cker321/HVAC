package androidx.constraintlayout.solver.widgets.analyzer;

import androidx.constraintlayout.solver.widgets.ConstraintWidgetContainer;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes.dex */
class RunGroup {
    public static final int BASELINE = 2;
    public static final int END = 1;
    public static final int START = 0;
    public static int index;
    int direction;
    WidgetRun firstRun;
    int groupIndex;
    WidgetRun lastRun;
    public int position = 0;
    public boolean dual = false;
    ArrayList<WidgetRun> runs = new ArrayList<>();

    public RunGroup(WidgetRun widgetRun, int i) {
        this.firstRun = null;
        this.lastRun = null;
        this.groupIndex = 0;
        int i2 = index;
        this.groupIndex = i2;
        index = i2 + 1;
        this.firstRun = widgetRun;
        this.lastRun = widgetRun;
        this.direction = i;
    }

    public void add(WidgetRun widgetRun) {
        this.runs.add(widgetRun);
        this.lastRun = widgetRun;
    }

    private long traverseStart(DependencyNode dependencyNode, long j) {
        WidgetRun widgetRun = dependencyNode.run;
        if (widgetRun instanceof HelperReferences) {
            return j;
        }
        int size = dependencyNode.dependencies.size();
        long jMax = j;
        for (int i = 0; i < size; i++) {
            Dependency dependency = dependencyNode.dependencies.get(i);
            if (dependency instanceof DependencyNode) {
                DependencyNode dependencyNode2 = (DependencyNode) dependency;
                if (dependencyNode2.run != widgetRun) {
                    jMax = Math.max(jMax, traverseStart(dependencyNode2, dependencyNode2.margin + j));
                }
            }
        }
        if (dependencyNode != widgetRun.start) {
            return jMax;
        }
        long wrapDimension = j + widgetRun.getWrapDimension();
        return Math.max(Math.max(jMax, traverseStart(widgetRun.end, wrapDimension)), wrapDimension - widgetRun.end.margin);
    }

    private long traverseEnd(DependencyNode dependencyNode, long j) {
        WidgetRun widgetRun = dependencyNode.run;
        if (widgetRun instanceof HelperReferences) {
            return j;
        }
        int size = dependencyNode.dependencies.size();
        long jMin = j;
        for (int i = 0; i < size; i++) {
            Dependency dependency = dependencyNode.dependencies.get(i);
            if (dependency instanceof DependencyNode) {
                DependencyNode dependencyNode2 = (DependencyNode) dependency;
                if (dependencyNode2.run != widgetRun) {
                    jMin = Math.min(jMin, traverseEnd(dependencyNode2, dependencyNode2.margin + j));
                }
            }
        }
        if (dependencyNode != widgetRun.end) {
            return jMin;
        }
        long wrapDimension = j - widgetRun.getWrapDimension();
        return Math.min(Math.min(jMin, traverseEnd(widgetRun.start, wrapDimension)), wrapDimension - widgetRun.start.margin);
    }

    public long computeWrapSize(ConstraintWidgetContainer constraintWidgetContainer, int i) {
        long wrapDimension;
        int i2;
        WidgetRun widgetRun = this.firstRun;
        if (widgetRun instanceof ChainRun) {
            if (((ChainRun) widgetRun).orientation != i) {
                return 0L;
            }
        } else if (i == 0) {
            if (!(widgetRun instanceof HorizontalWidgetRun)) {
                return 0L;
            }
        } else if (!(widgetRun instanceof VerticalWidgetRun)) {
            return 0L;
        }
        DependencyNode dependencyNode = i == 0 ? constraintWidgetContainer.horizontalRun.start : constraintWidgetContainer.verticalRun.start;
        DependencyNode dependencyNode2 = i == 0 ? constraintWidgetContainer.horizontalRun.end : constraintWidgetContainer.verticalRun.end;
        boolean zContains = this.firstRun.start.targets.contains(dependencyNode);
        boolean zContains2 = this.firstRun.end.targets.contains(dependencyNode2);
        long wrapDimension2 = this.firstRun.getWrapDimension();
        if (zContains && zContains2) {
            long jTraverseStart = traverseStart(this.firstRun.start, 0L);
            long jTraverseEnd = traverseEnd(this.firstRun.end, 0L);
            long j = jTraverseStart - wrapDimension2;
            if (j >= (-this.firstRun.end.margin)) {
                j += this.firstRun.end.margin;
            }
            long j2 = ((-jTraverseEnd) - wrapDimension2) - this.firstRun.start.margin;
            if (j2 >= this.firstRun.start.margin) {
                j2 -= this.firstRun.start.margin;
            }
            float biasPercent = this.firstRun.widget.getBiasPercent(i);
            float f = biasPercent > 0.0f ? (long) ((j2 / biasPercent) + (j / (1.0f - biasPercent))) : 0L;
            wrapDimension = this.firstRun.start.margin + ((long) ((f * biasPercent) + 0.5f)) + wrapDimension2 + ((long) ((f * (1.0f - biasPercent)) + 0.5f));
            i2 = this.firstRun.end.margin;
        } else {
            if (zContains) {
                return Math.max(traverseStart(this.firstRun.start, this.firstRun.start.margin), this.firstRun.start.margin + wrapDimension2);
            }
            if (zContains2) {
                return Math.max(-traverseEnd(this.firstRun.end, this.firstRun.end.margin), (-this.firstRun.end.margin) + wrapDimension2);
            }
            wrapDimension = this.firstRun.start.margin + this.firstRun.getWrapDimension();
            i2 = this.firstRun.end.margin;
        }
        return wrapDimension - i2;
    }

    private boolean defineTerminalWidget(WidgetRun widgetRun, int i) {
        if (!widgetRun.widget.isTerminalWidget[i]) {
            return false;
        }
        for (Dependency dependency : widgetRun.start.dependencies) {
            if (dependency instanceof DependencyNode) {
                DependencyNode dependencyNode = (DependencyNode) dependency;
                if (dependencyNode.run != widgetRun && dependencyNode == dependencyNode.run.start) {
                    if (widgetRun instanceof ChainRun) {
                        Iterator<WidgetRun> it = ((ChainRun) widgetRun).widgets.iterator();
                        while (it.hasNext()) {
                            defineTerminalWidget(it.next(), i);
                        }
                    } else if (!(widgetRun instanceof HelperReferences)) {
                        widgetRun.widget.isTerminalWidget[i] = false;
                    }
                    defineTerminalWidget(dependencyNode.run, i);
                }
            }
        }
        for (Dependency dependency2 : widgetRun.end.dependencies) {
            if (dependency2 instanceof DependencyNode) {
                DependencyNode dependencyNode2 = (DependencyNode) dependency2;
                if (dependencyNode2.run != widgetRun && dependencyNode2 == dependencyNode2.run.start) {
                    if (widgetRun instanceof ChainRun) {
                        Iterator<WidgetRun> it2 = ((ChainRun) widgetRun).widgets.iterator();
                        while (it2.hasNext()) {
                            defineTerminalWidget(it2.next(), i);
                        }
                    } else if (!(widgetRun instanceof HelperReferences)) {
                        widgetRun.widget.isTerminalWidget[i] = false;
                    }
                    defineTerminalWidget(dependencyNode2.run, i);
                }
            }
        }
        return false;
    }

    public void defineTerminalWidgets(boolean z, boolean z2) {
        if (z) {
            WidgetRun widgetRun = this.firstRun;
            if (widgetRun instanceof HorizontalWidgetRun) {
                defineTerminalWidget(widgetRun, 0);
            }
        }
        if (z2) {
            WidgetRun widgetRun2 = this.firstRun;
            if (widgetRun2 instanceof VerticalWidgetRun) {
                defineTerminalWidget(widgetRun2, 1);
            }
        }
    }
}
