package org.eclipse.paho.client.mqttv3.internal;

import com.landleaf.smarthome.device.AttributeValueConst;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttToken;
import org.eclipse.paho.client.mqttv3.internal.wire.MqttAck;
import org.eclipse.paho.client.mqttv3.internal.wire.MqttInputStream;
import org.eclipse.paho.client.mqttv3.internal.wire.MqttPubAck;
import org.eclipse.paho.client.mqttv3.internal.wire.MqttPubComp;
import org.eclipse.paho.client.mqttv3.internal.wire.MqttPubRec;
import org.eclipse.paho.client.mqttv3.internal.wire.MqttWireMessage;
import org.eclipse.paho.client.mqttv3.logging.Logger;
import org.eclipse.paho.client.mqttv3.logging.LoggerFactory;

/* loaded from: classes.dex */
public class CommsReceiver implements Runnable {
    private static final String CLASS_NAME = CommsReceiver.class.getName();
    private ClientComms clientComms;
    private ClientState clientState;

    /* renamed from: in */
    private MqttInputStream f308in;
    private Future<?> receiverFuture;
    private String threadName;
    private CommsTokenStore tokenStore;
    private Logger log = LoggerFactory.getLogger(LoggerFactory.MQTT_CLIENT_MSG_CAT, CLASS_NAME);
    private State current_state = State.STOPPED;
    private State target_state = State.STOPPED;
    private final Object lifecycle = new Object();
    private Thread recThread = null;

    private enum State {
        STOPPED,
        RUNNING,
        STARTING,
        RECEIVING;

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static State[] valuesCustom() {
            State[] stateArrValuesCustom = values();
            int length = stateArrValuesCustom.length;
            State[] stateArr = new State[length];
            System.arraycopy(stateArrValuesCustom, 0, stateArr, 0, length);
            return stateArr;
        }
    }

    public CommsReceiver(ClientComms clientComms, ClientState clientState, CommsTokenStore commsTokenStore, InputStream inputStream) {
        this.clientState = null;
        this.clientComms = null;
        this.tokenStore = null;
        this.f308in = new MqttInputStream(clientState, inputStream);
        this.clientComms = clientComms;
        this.clientState = clientState;
        this.tokenStore = commsTokenStore;
        this.log.setResourceName(clientComms.getClient().getClientId());
    }

    public void start(String str, ExecutorService executorService) {
        this.threadName = str;
        this.log.fine(CLASS_NAME, "start", "855");
        synchronized (this.lifecycle) {
            if (this.current_state == State.STOPPED && this.target_state == State.STOPPED) {
                this.target_state = State.RUNNING;
                if (executorService == null) {
                    new Thread(this).start();
                } else {
                    this.receiverFuture = executorService.submit(this);
                }
            }
        }
        while (!isRunning()) {
            try {
                Thread.sleep(100L);
            } catch (Exception unused) {
            }
        }
    }

    public void stop() {
        synchronized (this.lifecycle) {
            if (this.receiverFuture != null) {
                this.receiverFuture.cancel(true);
            }
            this.log.fine(CLASS_NAME, AttributeValueConst.SUSPEND, "850");
            if (isRunning()) {
                this.target_state = State.STOPPED;
            }
        }
        while (isRunning()) {
            try {
                Thread.sleep(100L);
            } catch (Exception unused) {
            }
        }
        this.log.fine(CLASS_NAME, AttributeValueConst.SUSPEND, "851");
    }

    @Override // java.lang.Runnable
    public void run() {
        State state;
        State state2;
        Thread threadCurrentThread = Thread.currentThread();
        this.recThread = threadCurrentThread;
        threadCurrentThread.setName(this.threadName);
        synchronized (this.lifecycle) {
            this.current_state = State.RUNNING;
        }
        try {
            synchronized (this.lifecycle) {
                state = this.target_state;
            }
            MqttToken token = null;
            while (state == State.RUNNING && this.f308in != null) {
                try {
                    try {
                        this.log.fine(CLASS_NAME, "run", "852");
                        if (this.f308in.available() > 0) {
                            synchronized (this.lifecycle) {
                                this.current_state = State.RECEIVING;
                            }
                        }
                        MqttWireMessage mqttWireMessage = this.f308in.readMqttWireMessage();
                        synchronized (this.lifecycle) {
                            this.current_state = State.RUNNING;
                        }
                        if (mqttWireMessage instanceof MqttAck) {
                            token = this.tokenStore.getToken(mqttWireMessage);
                            if (token != null) {
                                synchronized (token) {
                                    this.clientState.notifyReceivedAck((MqttAck) mqttWireMessage);
                                }
                            } else {
                                if (!(mqttWireMessage instanceof MqttPubRec) && !(mqttWireMessage instanceof MqttPubComp) && !(mqttWireMessage instanceof MqttPubAck)) {
                                    throw new MqttException(6);
                                }
                                this.log.fine(CLASS_NAME, "run", "857");
                            }
                        } else if (mqttWireMessage != null) {
                            this.clientState.notifyReceivedMsg(mqttWireMessage);
                        } else if (!this.clientComms.isConnected() && !this.clientComms.isConnecting()) {
                            throw new IOException("Connection is lost.");
                        }
                        synchronized (this.lifecycle) {
                            this.current_state = State.RUNNING;
                        }
                    } catch (IOException e) {
                        this.log.fine(CLASS_NAME, "run", "853");
                        if (this.target_state != State.STOPPED) {
                            synchronized (this.lifecycle) {
                                this.target_state = State.STOPPED;
                                if (!this.clientComms.isDisconnecting()) {
                                    this.clientComms.shutdownConnection(token, new MqttException(32109, e));
                                }
                            }
                        }
                        synchronized (this.lifecycle) {
                            this.current_state = State.RUNNING;
                        }
                    } catch (MqttException e2) {
                        this.log.fine(CLASS_NAME, "run", "856", null, e2);
                        synchronized (this.lifecycle) {
                            this.target_state = State.STOPPED;
                            this.clientComms.shutdownConnection(token, e2);
                            synchronized (this.lifecycle) {
                                this.current_state = State.RUNNING;
                            }
                        }
                    }
                    synchronized (this.lifecycle) {
                        state2 = this.target_state;
                    }
                    state = state2;
                } catch (Throwable th) {
                    synchronized (this.lifecycle) {
                        this.current_state = State.RUNNING;
                        throw th;
                    }
                }
            }
            synchronized (this.lifecycle) {
                this.current_state = State.STOPPED;
            }
            this.recThread = null;
            this.log.fine(CLASS_NAME, "run", "854");
        } catch (Throwable th2) {
            synchronized (this.lifecycle) {
                this.current_state = State.STOPPED;
                throw th2;
            }
        }
    }

    public boolean isRunning() {
        boolean z;
        synchronized (this.lifecycle) {
            z = (this.current_state == State.RUNNING || this.current_state == State.RECEIVING) && this.target_state == State.RUNNING;
        }
        return z;
    }

    public boolean isReceiving() {
        boolean z;
        synchronized (this.lifecycle) {
            z = this.current_state == State.RECEIVING;
        }
        return z;
    }
}
