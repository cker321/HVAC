package org.apache.httpcore.ssl;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import javax.net.ssl.SSLContext;
import org.eclipse.paho.client.mqttv3.internal.security.SSLSocketFactoryFactory;

/* loaded from: classes.dex */
public class SSLContexts {
    public static SSLContext createDefault() throws NoSuchAlgorithmException, SSLInitializationException, KeyManagementException {
        try {
            SSLContext sSLContext = SSLContext.getInstance(SSLSocketFactoryFactory.DEFAULT_PROTOCOL);
            sSLContext.init(null, null, null);
            return sSLContext;
        } catch (KeyManagementException e) {
            throw new SSLInitializationException(e.getMessage(), e);
        } catch (NoSuchAlgorithmException e2) {
            throw new SSLInitializationException(e2.getMessage(), e2);
        }
    }

    public static SSLContext createSystemDefault() throws SSLInitializationException {
        try {
            return SSLContext.getDefault();
        } catch (NoSuchAlgorithmException unused) {
            return createDefault();
        }
    }

    public static SSLContextBuilder custom() {
        return SSLContextBuilder.create();
    }
}
