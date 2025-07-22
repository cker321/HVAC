package com.yanzhenjie.andserver.framework.mapping;

import android.text.TextUtils;
import com.yanzhenjie.andserver.util.Patterns;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import org.eclipse.paho.client.mqttv3.MqttTopic;

/* loaded from: classes.dex */
public class Path implements Patterns {
    private List<Rule> mRuleList = new LinkedList();

    public List<Rule> getRuleList() {
        return this.mRuleList;
    }

    public void addRule(String str) {
        Rule rule = new Rule();
        rule.setSegments(pathToList(str));
        this.mRuleList.add(rule);
    }

    public static class Rule {
        private List<Segment> mSegments;

        public List<Segment> getSegments() {
            return this.mSegments;
        }

        public void setSegments(List<Segment> list) {
            this.mSegments = list;
        }
    }

    public static class Segment {
        private final boolean isBlurred;
        private final String value;

        public Segment(String str, boolean z) {
            this.value = str;
            this.isBlurred = z;
        }

        public String getValue() {
            return this.value;
        }

        public boolean isBlurred() {
            return this.isBlurred;
        }

        public boolean equals(Object obj) {
            if (obj instanceof Segment) {
                return this.value.equals(((Segment) obj).value);
            }
            return false;
        }

        public String toString() {
            return this.value;
        }
    }

    public static List<Segment> pathToList(String str) {
        int i;
        LinkedList linkedList = new LinkedList();
        if (!TextUtils.isEmpty(str)) {
            while (str.startsWith(MqttTopic.TOPIC_LEVEL_SEPARATOR)) {
                str = str.substring(1);
            }
            while (true) {
                if (!str.endsWith(MqttTopic.TOPIC_LEVEL_SEPARATOR)) {
                    break;
                }
                str = str.substring(0, str.length() - 1);
            }
            for (String str2 : str.split(MqttTopic.TOPIC_LEVEL_SEPARATOR)) {
                linkedList.add(new Segment(str2, str2.contains("{")));
            }
        }
        return Collections.unmodifiableList(linkedList);
    }

    public static String listToPath(List<Segment> list) {
        StringBuilder sb = new StringBuilder("");
        if (list.isEmpty()) {
            sb.append(MqttTopic.TOPIC_LEVEL_SEPARATOR);
        }
        for (Segment segment : list) {
            sb.append(MqttTopic.TOPIC_LEVEL_SEPARATOR);
            sb.append(segment.getValue());
        }
        return sb.toString();
    }

    public static boolean matches(String str, String str2) {
        if (str.equals(str2)) {
            return true;
        }
        List<Segment> listPathToList = pathToList(str);
        List<Segment> listPathToList2 = pathToList(str2);
        if (listPathToList.size() != listPathToList2.size()) {
            return false;
        }
        for (int i = 0; i < listPathToList.size(); i++) {
            Segment segment = listPathToList.get(i);
            if (!segment.equals(listPathToList2.get(i)) && !segment.isBlurred()) {
                return false;
            }
        }
        return true;
    }
}
