package org.eclipse.paho.client.mqttv3.internal;

import java.io.IOException;
import java.util.ArrayList;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SNIHostName;
import javax.net.ssl.SSLParameters;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.logging.Logger;
import org.eclipse.paho.client.mqttv3.logging.LoggerFactory;

/* loaded from: classes.dex */
public class SSLNetworkModule extends TCPNetworkModule {
    private static final String CLASS_NAME = SSLNetworkModule.class.getName();
    private String[] enabledCiphers;
    private int handshakeTimeoutSecs;
    private String host;
    private HostnameVerifier hostnameVerifier;
    private boolean httpsHostnameVerificationEnabled;
    private Logger log;
    private int port;

    public SSLNetworkModule(SSLSocketFactory sSLSocketFactory, String str, int i, String str2) throws ClassNotFoundException {
        super(sSLSocketFactory, str, i, str2);
        Logger logger = LoggerFactory.getLogger(LoggerFactory.MQTT_CLIENT_MSG_CAT, CLASS_NAME);
        this.log = logger;
        this.httpsHostnameVerificationEnabled = false;
        this.host = str;
        this.port = i;
        logger.setResourceName(str2);
    }

    public String[] getEnabledCiphers() {
        return this.enabledCiphers;
    }

    public void setEnabledCiphers(String[] strArr) {
        if (strArr != null) {
            this.enabledCiphers = (String[]) strArr.clone();
        }
        if (this.socket == null || this.enabledCiphers == null) {
            return;
        }
        if (this.log.isLoggable(5)) {
            String str = "";
            for (int i = 0; i < this.enabledCiphers.length; i++) {
                if (i > 0) {
                    str = String.valueOf(str) + ",";
                }
                str = String.valueOf(str) + this.enabledCiphers[i];
            }
            this.log.fine(CLASS_NAME, "setEnabledCiphers", "260", new Object[]{str});
        }
        ((SSLSocket) this.socket).setEnabledCipherSuites(this.enabledCiphers);
    }

    public void setSSLhandshakeTimeout(int i) {
        super.setConnectTimeout(i);
        this.handshakeTimeoutSecs = i;
    }

    public HostnameVerifier getSSLHostnameVerifier() {
        return this.hostnameVerifier;
    }

    public void setSSLHostnameVerifier(HostnameVerifier hostnameVerifier) {
        this.hostnameVerifier = hostnameVerifier;
    }

    public boolean isHttpsHostnameVerificationEnabled() {
        return this.httpsHostnameVerificationEnabled;
    }

    public void setHttpsHostnameVerificationEnabled(boolean z) {
        this.httpsHostnameVerificationEnabled = z;
    }

    @Override // org.eclipse.paho.client.mqttv3.internal.TCPNetworkModule, org.eclipse.paho.client.mqttv3.internal.NetworkModule
    public void start() throws MqttException, IOException {
        super.start();
        setEnabledCiphers(this.enabledCiphers);
        int soTimeout = this.socket.getSoTimeout();
        this.socket.setSoTimeout(this.handshakeTimeoutSecs * 1000);
        try {
            SSLParameters sSLParameters = new SSLParameters();
            ArrayList arrayList = new ArrayList(1);
            arrayList.add(new SNIHostName(this.host));
            sSLParameters.setServerNames(arrayList);
            ((SSLSocket) this.socket).setSSLParameters(sSLParameters);
        } catch (NoClassDefFoundError unused) {
        }
        if (this.httpsHostnameVerificationEnabled) {
            try {
                SSLParameters sSLParameters2 = new SSLParameters();
                sSLParameters2.setEndpointIdentificationAlgorithm("HTTPS");
                ((SSLSocket) this.socket).setSSLParameters(sSLParameters2);
            } catch (NoSuchMethodError unused2) {
            }
        }
        ((SSLSocket) this.socket).startHandshake();
        if (this.hostnameVerifier != null && !this.httpsHostnameVerificationEnabled) {
            SSLSession session = ((SSLSocket) this.socket).getSession();
            if (!this.hostnameVerifier.verify(this.host, session)) {
                session.invalidate();
                this.socket.close();
                throw new SSLPeerUnverifiedException("Host: " + this.host + ", Peer Host: " + session.getPeerHost());
            }
        }
        this.socket.setSoTimeout(soTimeout);
    }

    @Override // org.eclipse.paho.client.mqttv3.internal.TCPNetworkModule, org.eclipse.paho.client.mqttv3.internal.NetworkModule
    public String getServerURI() {
        return "ssl://" + this.host + ":" + this.port;
    }
}
