package org.eclipse.paho.client.mqttv3.internal.websocket;

import com.landleaf.smarthome.device.AttributeValueConst;
import java.io.IOException;
import java.io.InputStream;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.net.SocketTimeoutException;
import org.eclipse.paho.client.mqttv3.logging.Logger;
import org.eclipse.paho.client.mqttv3.logging.LoggerFactory;

/* loaded from: classes.dex */
public class WebSocketReceiver implements Runnable {
    private static final String CLASS_NAME = WebSocketReceiver.class.getName();
    private InputStream input;
    private PipedOutputStream pipedOutputStream;
    private volatile boolean receiving;
    private Logger log = LoggerFactory.getLogger(LoggerFactory.MQTT_CLIENT_MSG_CAT, CLASS_NAME);
    private boolean running = false;
    private boolean stopping = false;
    private final Object lifecycle = new Object();
    private Thread receiverThread = null;

    public WebSocketReceiver(InputStream inputStream, PipedInputStream pipedInputStream) throws IOException {
        this.input = inputStream;
        PipedOutputStream pipedOutputStream = new PipedOutputStream();
        this.pipedOutputStream = pipedOutputStream;
        pipedInputStream.connect(pipedOutputStream);
    }

    public void start(String str) {
        this.log.fine(CLASS_NAME, "start", "855");
        synchronized (this.lifecycle) {
            if (!this.running) {
                this.running = true;
                Thread thread = new Thread(this, str);
                this.receiverThread = thread;
                thread.start();
            }
        }
    }

    public void stop() throws InterruptedException {
        Thread thread;
        boolean z = true;
        this.stopping = true;
        synchronized (this.lifecycle) {
            this.log.fine(CLASS_NAME, AttributeValueConst.SUSPEND, "850");
            if (this.running) {
                this.running = false;
                this.receiving = false;
                closeOutputStream();
            } else {
                z = false;
            }
        }
        if (z && !Thread.currentThread().equals(this.receiverThread) && (thread = this.receiverThread) != null) {
            try {
                thread.join();
            } catch (InterruptedException unused) {
            }
        }
        this.receiverThread = null;
        this.log.fine(CLASS_NAME, AttributeValueConst.SUSPEND, "851");
    }

    @Override // java.lang.Runnable
    public void run() throws InterruptedException, IOException {
        while (this.running && this.input != null) {
            try {
                this.log.fine(CLASS_NAME, "run", "852");
                this.receiving = this.input.available() > 0;
                WebSocketFrame webSocketFrame = new WebSocketFrame(this.input);
                if (!webSocketFrame.isCloseFlag()) {
                    for (int i = 0; i < webSocketFrame.getPayload().length; i++) {
                        this.pipedOutputStream.write(webSocketFrame.getPayload()[i]);
                    }
                    this.pipedOutputStream.flush();
                } else if (!this.stopping) {
                    throw new IOException("Server sent a WebSocket Frame with the Stop OpCode");
                }
                this.receiving = false;
            } catch (SocketTimeoutException unused) {
            } catch (IOException unused2) {
                stop();
            }
        }
    }

    private void closeOutputStream() throws IOException {
        try {
            this.pipedOutputStream.close();
        } catch (IOException unused) {
        }
    }

    public boolean isRunning() {
        return this.running;
    }

    public boolean isReceiving() {
        return this.receiving;
    }
}
