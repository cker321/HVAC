package com.yanzhenjie.andserver.framework.mapping;

import com.yanzhenjie.andserver.util.Patterns;
import java.util.LinkedList;
import java.util.List;

/* loaded from: classes.dex */
public class Pair implements Patterns {
    private List<Rule> mRuleList = new LinkedList();

    public List<Rule> getRuleList() {
        return this.mRuleList;
    }

    public void addRule(String str) {
        if (str.matches(PAIR_NO_VALUE)) {
            String[] strArrSplit = str.split("=");
            Rule rule = new Rule();
            String str2 = strArrSplit[0];
            rule.setKey(str2.substring(0, str2.length() - 1));
            rule.setValue(strArrSplit[1]);
            rule.setNoValue(true);
            this.mRuleList.add(rule);
            return;
        }
        if (str.matches(PAIR_KEY_VALUE)) {
            String[] strArrSplit2 = str.split("=");
            Rule rule2 = new Rule();
            rule2.setKey(strArrSplit2[0]);
            rule2.setValue(strArrSplit2[1]);
            this.mRuleList.add(rule2);
            return;
        }
        if (str.matches(PAIR_NO_KEY)) {
            Rule rule3 = new Rule();
            rule3.setKey(str.substring(1));
            rule3.setNoKey(true);
            this.mRuleList.add(rule3);
            return;
        }
        if (str.matches(PAIR_KEY)) {
            Rule rule4 = new Rule();
            rule4.setKey(str);
            this.mRuleList.add(rule4);
        }
    }

    public static class Rule {
        private String key;
        private boolean noKey;
        private boolean noValue;
        private String value;

        public String getKey() {
            return this.key;
        }

        public void setKey(String str) {
            this.key = str;
        }

        public String getValue() {
            return this.value;
        }

        public void setValue(String str) {
            this.value = str;
        }

        public boolean isNoKey() {
            return this.noKey;
        }

        public void setNoKey(boolean z) {
            this.noKey = z;
        }

        public boolean isNoValue() {
            return this.noValue;
        }

        public void setNoValue(boolean z) {
            this.noValue = z;
        }
    }
}
