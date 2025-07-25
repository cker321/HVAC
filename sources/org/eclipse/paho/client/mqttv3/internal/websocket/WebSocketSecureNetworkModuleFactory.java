package org.eclipse.paho.client.mqttv3.internal.websocket;

import java.io.IOException;
import java.net.URI;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;
import javax.net.SocketFactory;
import javax.net.ssl.SSLSocketFactory;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.internal.ExceptionHelper;
import org.eclipse.paho.client.mqttv3.internal.NetworkModule;
import org.eclipse.paho.client.mqttv3.internal.security.SSLSocketFactoryFactory;
import org.eclipse.paho.client.mqttv3.spi.NetworkModuleFactory;

/* loaded from: classes.dex */
public class WebSocketSecureNetworkModuleFactory implements NetworkModuleFactory {
    @Override // org.eclipse.paho.client.mqttv3.spi.NetworkModuleFactory
    public void validateURI(URI uri) throws IllegalArgumentException {
    }

    @Override // org.eclipse.paho.client.mqttv3.spi.NetworkModuleFactory
    public Set<String> getSupportedUriSchemes() {
        return Collections.unmodifiableSet(new HashSet(Arrays.asList("wss")));
    }

    @Override // org.eclipse.paho.client.mqttv3.spi.NetworkModuleFactory
    public NetworkModule createNetworkModule(URI uri, MqttConnectOptions mqttConnectOptions, String str) throws NoSuchAlgorithmException, UnrecoverableKeyException, MqttException, IOException, KeyStoreException, CertificateException, KeyManagementException, IllegalArgumentException, NoSuchProviderException {
        SSLSocketFactoryFactory sSLSocketFactoryFactory;
        String[] enabledCipherSuites;
        String host = uri.getHost();
        int port = uri.getPort();
        int i = port == -1 ? 443 : port;
        SocketFactory socketFactory = mqttConnectOptions.getSocketFactory();
        if (socketFactory == null) {
            SSLSocketFactoryFactory sSLSocketFactoryFactory2 = new SSLSocketFactoryFactory();
            Properties sSLProperties = mqttConnectOptions.getSSLProperties();
            if (sSLProperties != null) {
                sSLSocketFactoryFactory2.initialize(sSLProperties, null);
            }
            sSLSocketFactoryFactory = sSLSocketFactoryFactory2;
            socketFactory = sSLSocketFactoryFactory2.createSocketFactory(null);
        } else {
            if (!(socketFactory instanceof SSLSocketFactory)) {
                throw ExceptionHelper.createMqttException(32105);
            }
            sSLSocketFactoryFactory = null;
        }
        WebSocketSecureNetworkModule webSocketSecureNetworkModule = new WebSocketSecureNetworkModule((SSLSocketFactory) socketFactory, uri.toString(), host, i, str, mqttConnectOptions.getCustomWebSocketHeaders());
        webSocketSecureNetworkModule.setSSLhandshakeTimeout(mqttConnectOptions.getConnectionTimeout());
        webSocketSecureNetworkModule.setSSLHostnameVerifier(mqttConnectOptions.getSSLHostnameVerifier());
        webSocketSecureNetworkModule.setHttpsHostnameVerificationEnabled(mqttConnectOptions.isHttpsHostnameVerificationEnabled());
        if (sSLSocketFactoryFactory != null && (enabledCipherSuites = sSLSocketFactoryFactory.getEnabledCipherSuites(null)) != null) {
            webSocketSecureNetworkModule.setEnabledCiphers(enabledCipherSuites);
        }
        return webSocketSecureNetworkModule;
    }
}
