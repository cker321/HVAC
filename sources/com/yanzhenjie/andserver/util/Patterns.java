package com.yanzhenjie.andserver.util;

import org.eclipse.paho.client.mqttv3.MqttTopic;

/* loaded from: classes.dex */
public interface Patterns {
    public static final String FORWARD = "forward:(.)*";
    public static final String PAIR_KEY;
    public static final String PAIR_KEY_VALUE;
    public static final String PAIR_NO_KEY;
    public static final String PAIR_NO_VALUE;
    public static final String PAIR_VALUE = "(.)*";
    public static final String PATH;
    public static final String PATH_1;
    public static final String REDIRECT = "redirect:(.)*";
    public static final String WORD = "[a-zA-Z0-9_\\-\\.]%s";
    public static final String PATH_0 = String.format(WORD, "*");

    static {
        String str = String.format(WORD, MqttTopic.SINGLE_LEVEL_WILDCARD);
        PATH_1 = str;
        PATH = String.format("(/%s)|((/%s)+)", PATH_0, str);
        String str2 = String.format(WORD, MqttTopic.SINGLE_LEVEL_WILDCARD);
        PAIR_KEY = str2;
        PAIR_KEY_VALUE = String.format("(%s)(=)(%s)", str2, PAIR_VALUE);
        PAIR_NO_KEY = String.format("!%s", PAIR_KEY);
        PAIR_NO_VALUE = String.format("(%s)(!=)(%s)", PAIR_KEY, PATH_1);
    }
}
