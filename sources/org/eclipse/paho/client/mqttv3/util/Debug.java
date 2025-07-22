package org.eclipse.paho.client.mqttv3.util;

import java.util.Enumeration;
import java.util.Properties;
import org.apache.commons.p006io.IOUtils;
import org.apache.httpcore.message.TokenParser;
import org.eclipse.paho.client.mqttv3.internal.ClientComms;
import org.eclipse.paho.client.mqttv3.logging.Logger;
import org.eclipse.paho.client.mqttv3.logging.LoggerFactory;

/* loaded from: classes.dex */
public class Debug {
    private static final String CLASS_NAME = ClientComms.class.getName();
    private static final String lineSep = System.getProperty("line.separator", IOUtils.LINE_SEPARATOR_UNIX);
    private static final String separator = "==============";
    private String clientID;
    private ClientComms comms;
    private Logger log;

    public Debug(String str, ClientComms clientComms) throws ClassNotFoundException {
        Logger logger = LoggerFactory.getLogger(LoggerFactory.MQTT_CLIENT_MSG_CAT, CLASS_NAME);
        this.log = logger;
        this.clientID = str;
        this.comms = clientComms;
        logger.setResourceName(str);
    }

    public void dumpClientDebug() {
        dumpClientComms();
        dumpConOptions();
        dumpClientState();
        dumpBaseDebug();
    }

    public void dumpBaseDebug() {
        dumpVersion();
        dumpSystemProperties();
        dumpMemoryTrace();
    }

    protected void dumpMemoryTrace() {
        this.log.dumpTrace();
    }

    protected void dumpVersion() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(String.valueOf(lineSep) + separator + " Version Info " + separator + lineSep);
        StringBuilder sb = new StringBuilder(String.valueOf(left("Version", 20, TokenParser.f302SP)));
        sb.append(":  ");
        sb.append(ClientComms.VERSION);
        sb.append(lineSep);
        stringBuffer.append(sb.toString());
        stringBuffer.append(String.valueOf(left("Build Level", 20, TokenParser.f302SP)) + ":  " + ClientComms.BUILD_LEVEL + lineSep);
        StringBuilder sb2 = new StringBuilder("==========================================");
        sb2.append(lineSep);
        stringBuffer.append(sb2.toString());
        this.log.fine(CLASS_NAME, "dumpVersion", stringBuffer.toString());
    }

    public void dumpSystemProperties() {
        this.log.fine(CLASS_NAME, "dumpSystemProperties", dumpProperties(System.getProperties(), "SystemProperties").toString());
    }

    public void dumpClientState() {
        ClientComms clientComms = this.comms;
        if (clientComms == null || clientComms.getClientState() == null) {
            return;
        }
        Properties debug = this.comms.getClientState().getDebug();
        this.log.fine(CLASS_NAME, "dumpClientState", dumpProperties(debug, String.valueOf(this.clientID) + " : ClientState").toString());
    }

    public void dumpClientComms() {
        ClientComms clientComms = this.comms;
        if (clientComms != null) {
            Properties debug = clientComms.getDebug();
            this.log.fine(CLASS_NAME, "dumpClientComms", dumpProperties(debug, String.valueOf(this.clientID) + " : ClientComms").toString());
        }
    }

    public void dumpConOptions() {
        ClientComms clientComms = this.comms;
        if (clientComms != null) {
            Properties debug = clientComms.getConOptions().getDebug();
            this.log.fine(CLASS_NAME, "dumpConOptions", dumpProperties(debug, String.valueOf(this.clientID) + " : Connect Options").toString());
        }
    }

    public static String dumpProperties(Properties properties, String str) {
        StringBuffer stringBuffer = new StringBuffer();
        Enumeration<?> enumerationPropertyNames = properties.propertyNames();
        stringBuffer.append(String.valueOf(lineSep) + separator + " " + str + " " + separator + lineSep);
        while (enumerationPropertyNames.hasMoreElements()) {
            String str2 = (String) enumerationPropertyNames.nextElement();
            stringBuffer.append(String.valueOf(left(str2, 28, TokenParser.f302SP)) + ":  " + properties.get(str2) + lineSep);
        }
        stringBuffer.append("==========================================" + lineSep);
        return stringBuffer.toString();
    }

    public static String left(String str, int i, char c) {
        if (str.length() >= i) {
            return str;
        }
        StringBuffer stringBuffer = new StringBuffer(i);
        stringBuffer.append(str);
        int length = i - str.length();
        while (true) {
            length--;
            if (length >= 0) {
                stringBuffer.append(c);
            } else {
                return stringBuffer.toString();
            }
        }
    }
}
