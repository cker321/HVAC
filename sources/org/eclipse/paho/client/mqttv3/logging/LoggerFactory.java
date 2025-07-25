package org.eclipse.paho.client.mqttv3.logging;

import java.lang.reflect.InvocationTargetException;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/* loaded from: classes.dex */
public class LoggerFactory {
    public static final String MQTT_CLIENT_MSG_CAT = "org.eclipse.paho.client.mqttv3.internal.nls.logcat";
    private static final String CLASS_NAME = LoggerFactory.class.getName();
    private static String overrideloggerClassName = null;
    private static String jsr47LoggerClassName = JSR47Logger.class.getName();

    public static Logger getLogger(String str, String str2) throws ClassNotFoundException {
        String str3 = overrideloggerClassName;
        if (str3 == null) {
            str3 = jsr47LoggerClassName;
        }
        Logger logger = getLogger(str3, ResourceBundle.getBundle(str), str2, null);
        if (logger != null) {
            return logger;
        }
        throw new MissingResourceException("Error locating the logging class", CLASS_NAME, str2);
    }

    private static Logger getLogger(String str, ResourceBundle resourceBundle, String str2, String str3) throws ClassNotFoundException {
        try {
            Class<?> cls = Class.forName(str);
            if (cls == null) {
                return null;
            }
            Logger logger = (Logger) cls.newInstance();
            logger.initialise(resourceBundle, str2, str3);
            return logger;
        } catch (ClassNotFoundException | ExceptionInInitializerError | IllegalAccessException | InstantiationException | NoClassDefFoundError | SecurityException unused) {
            return null;
        }
    }

    public static String getLoggingProperty(String str) throws IllegalAccessException, ClassNotFoundException, IllegalArgumentException, InvocationTargetException {
        try {
            Class<?> cls = Class.forName("java.util.logging.LogManager");
            return (String) cls.getMethod("getProperty", String.class).invoke(cls.getMethod("getLogManager", new Class[0]).invoke(null, null), str);
        } catch (Exception unused) {
            return null;
        }
    }

    public static void setLogger(String str) {
        overrideloggerClassName = str;
    }
}
