package com.yanzhenjie.andserver.http;

import android.text.TextUtils;
import android.webkit.URLUtil;
import com.yanzhenjie.andserver.util.LinkedMultiValueMap;
import com.yanzhenjie.andserver.util.MultiValueMap;
import com.yanzhenjie.andserver.util.Patterns;
import com.yanzhenjie.andserver.util.UrlCoder;
import java.net.URI;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import org.apache.commons.p006io.Charsets;
import org.eclipse.paho.client.mqttv3.MqttTopic;

/* loaded from: classes.dex */
public class Uri implements Patterns {
    private final String mFragment;
    private final String mHost;
    private final String mPath;
    private final int mPort;
    private final String mQuery;
    private final String mScheme;

    public static Builder newBuilder(String str) {
        return new Builder(str);
    }

    private Uri(Builder builder) {
        this.mScheme = builder.mScheme;
        this.mHost = builder.mHost;
        this.mPort = builder.mPort;
        this.mPath = path(builder.mPath);
        this.mQuery = query(builder.mQuery);
        this.mFragment = builder.mFragment;
    }

    public String getScheme() {
        return this.mScheme;
    }

    public String getHost() {
        return this.mHost;
    }

    public int getPort() {
        return this.mPort;
    }

    public String getPath() {
        return this.mPath;
    }

    public List<String> copyPath() {
        return convertPath(this.mPath);
    }

    public String getQuery() {
        return this.mQuery;
    }

    public MultiValueMap<String, String> getParams() {
        return convertQuery(this.mQuery);
    }

    public String getFragment() {
        return this.mFragment;
    }

    public Builder builder() {
        return new Builder(toString());
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (!TextUtils.isEmpty(this.mScheme)) {
            sb.append(this.mScheme);
            sb.append(":");
        }
        if (!TextUtils.isEmpty(this.mHost) && this.mPort > 0) {
            sb.append("//");
            sb.append(this.mHost);
            sb.append(":");
            sb.append(this.mPort);
        }
        if (!TextUtils.isEmpty(this.mPath)) {
            sb.append(this.mPath);
        }
        if (!TextUtils.isEmpty(this.mQuery)) {
            sb.append("?");
            sb.append(this.mQuery);
        }
        if (!TextUtils.isEmpty(this.mFragment)) {
            sb.append(MqttTopic.MULTI_LEVEL_WILDCARD);
            sb.append(this.mFragment);
        }
        return sb.toString();
    }

    public Uri location(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (URLUtil.isNetworkUrl(str)) {
            return newBuilder(str).build();
        }
        URI uriCreate = URI.create(str);
        if (str.startsWith(MqttTopic.TOPIC_LEVEL_SEPARATOR)) {
            return builder().setPath(uriCreate.getPath()).setQuery(uriCreate.getQuery()).setFragment(uriCreate.getFragment()).build();
        }
        if (str.contains("../")) {
            List<String> listConvertPath = convertPath(getPath());
            List<String> listConvertPath2 = convertPath(uriCreate.getPath());
            List<String> listSubList = listConvertPath2.subList(listConvertPath2.lastIndexOf("..") + 1, listConvertPath2.size());
            if (!listConvertPath.isEmpty()) {
                List<String> listSubList2 = listConvertPath.subList(0, (listConvertPath.size() - r3) - 2);
                listSubList2.addAll(listSubList);
                return builder().setPath(TextUtils.join(MqttTopic.TOPIC_LEVEL_SEPARATOR, listSubList2)).setQuery(uriCreate.getQuery()).setFragment(uriCreate.getFragment()).build();
            }
            return builder().setPath(TextUtils.join(MqttTopic.TOPIC_LEVEL_SEPARATOR, listSubList)).setQuery(uriCreate.getQuery()).setFragment(uriCreate.getFragment()).build();
        }
        List<String> listConvertPath3 = convertPath(getPath());
        listConvertPath3.addAll(convertPath(uriCreate.getPath()));
        return builder().setPath(TextUtils.join(MqttTopic.TOPIC_LEVEL_SEPARATOR, listConvertPath3)).setQuery(uriCreate.getQuery()).setFragment(uriCreate.getFragment()).build();
    }

    public static class Builder {
        private String mFragment;
        private String mHost;
        private List<String> mPath;
        private int mPort;
        private MultiValueMap<String, String> mQuery;
        private String mScheme;

        private Builder(String str) {
            URI uriCreate = URI.create(str);
            this.mScheme = uriCreate.getScheme();
            this.mHost = uriCreate.getHost();
            this.mPort = uriCreate.getPort();
            this.mPath = Uri.convertPath(uriCreate.getPath());
            this.mQuery = Uri.convertQuery(uriCreate.getQuery());
            this.mFragment = uriCreate.getFragment();
        }

        public Builder setScheme(String str) {
            this.mScheme = str;
            return this;
        }

        public Builder setHost(String str) {
            this.mHost = str;
            return this;
        }

        public Builder setPort(int i) {
            this.mPort = i;
            return this;
        }

        public Builder addPath(int i) {
            return addPath(Integer.toString(i));
        }

        public Builder addPath(long j) {
            return addPath(Long.toString(j));
        }

        public Builder addPath(boolean z) {
            return addPath(Boolean.toString(z));
        }

        public Builder addPath(char c) {
            return addPath(String.valueOf(c));
        }

        public Builder addPath(double d) {
            return addPath(Double.toString(d));
        }

        public Builder addPath(float f) {
            return addPath(Float.toString(f));
        }

        public Builder addPath(CharSequence charSequence) {
            this.mPath.add(charSequence.toString());
            return this;
        }

        public Builder addPath(String str) {
            this.mPath.add(str);
            return this;
        }

        public Builder setPath(String str) {
            this.mPath = Uri.convertPath(str);
            return this;
        }

        public Builder clearPath() {
            this.mPath.clear();
            return this;
        }

        public Builder addQuery(String str, int i) {
            return addQuery(str, Integer.toString(i));
        }

        public Builder addQuery(String str, long j) {
            return addQuery(str, Long.toString(j));
        }

        public Builder addQuery(String str, boolean z) {
            return addQuery(str, Boolean.toString(z));
        }

        public Builder addQuery(String str, char c) {
            return addQuery(str, String.valueOf(c));
        }

        public Builder addQuery(String str, double d) {
            return addQuery(str, Double.toString(d));
        }

        public Builder addQuery(String str, float f) {
            return addQuery(str, Float.toString(f));
        }

        public Builder addQuery(String str, short s) {
            return addQuery(str, Integer.toString(s));
        }

        public Builder addQuery(String str, CharSequence charSequence) {
            this.mQuery.add(str, charSequence.toString());
            return this;
        }

        public Builder addQuery(String str, String str2) {
            this.mQuery.add(str, str2);
            return this;
        }

        public Builder addQuery(String str, List<String> list) {
            Iterator<String> it = list.iterator();
            while (it.hasNext()) {
                this.mQuery.add(str, it.next());
            }
            return this;
        }

        public Builder setQuery(String str) {
            this.mQuery = Uri.convertQuery(str);
            return this;
        }

        public Builder setQuery(MultiValueMap<String, String> multiValueMap) {
            this.mQuery = multiValueMap;
            return this;
        }

        public Builder removeQuery(String str) {
            this.mQuery.remove(str);
            return this;
        }

        public Builder clearQuery() {
            this.mQuery.clear();
            return this;
        }

        public Builder setFragment(String str) {
            this.mFragment = str;
            return this;
        }

        public Uri build() {
            return new Uri(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static List<String> convertPath(String str) {
        while (str.startsWith(MqttTopic.TOPIC_LEVEL_SEPARATOR)) {
            str = str.substring(1);
        }
        while (str.endsWith(MqttTopic.TOPIC_LEVEL_SEPARATOR)) {
            str = str.substring(0, str.length() - 1);
        }
        LinkedList linkedList = new LinkedList();
        if (!TextUtils.isEmpty(str)) {
            while (str.startsWith(MqttTopic.TOPIC_LEVEL_SEPARATOR)) {
                str = str.substring(1);
            }
            Collections.addAll(linkedList, str.split(MqttTopic.TOPIC_LEVEL_SEPARATOR));
        }
        return linkedList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static MultiValueMap<String, String> convertQuery(String str) {
        LinkedMultiValueMap linkedMultiValueMap = new LinkedMultiValueMap();
        if (!TextUtils.isEmpty(str)) {
            if (str.startsWith("?")) {
                str = str.substring(1);
            }
            StringTokenizer stringTokenizer = new StringTokenizer(str, "&");
            while (stringTokenizer.hasMoreElements()) {
                String strNextToken = stringTokenizer.nextToken();
                int iIndexOf = strNextToken.indexOf("=");
                if (iIndexOf > 0 && iIndexOf < strNextToken.length() - 1) {
                    linkedMultiValueMap.add(strNextToken.substring(0, iIndexOf), UrlCoder.urlDecode(strNextToken.substring(iIndexOf + 1), Charsets.UTF_8));
                }
            }
        }
        return linkedMultiValueMap;
    }

    private static String path(List<String> list) {
        if (list == null || list.isEmpty()) {
            return MqttTopic.TOPIC_LEVEL_SEPARATOR;
        }
        StringBuilder sb = new StringBuilder();
        for (String str : list) {
            sb.append(MqttTopic.TOPIC_LEVEL_SEPARATOR);
            sb.append(str);
        }
        return sb.toString();
    }

    private static String query(MultiValueMap<String, String> multiValueMap) {
        StringBuilder sb = new StringBuilder();
        Iterator<Map.Entry<String, String>> it = multiValueMap.entrySet().iterator();
        if (it.hasNext()) {
            Map.Entry<String, String> next = it.next();
            String key = next.getKey();
            List<String> list = (List) next.getValue();
            if (list != null && !list.isEmpty()) {
                for (String str : list) {
                    sb.append(key);
                    sb.append("=");
                    sb.append(str);
                }
            } else {
                sb.append(key);
                sb.append("=");
            }
        }
        while (it.hasNext()) {
            Map.Entry<String, String> next2 = it.next();
            String key2 = next2.getKey();
            List<String> list2 = (List) next2.getValue();
            if (list2 != null && !list2.isEmpty()) {
                for (String str2 : list2) {
                    sb.append("&");
                    sb.append(key2);
                    sb.append("=");
                    sb.append(str2);
                }
            } else {
                sb.append("&");
                sb.append(key2);
                sb.append("=");
            }
        }
        return sb.toString();
    }
}
