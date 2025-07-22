package com.dnake.desktop;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import com.dnake.desktop.controller.DeviceApiController;
import com.dnake.desktop.dnake.v700.dxml;
import com.dnake.desktop.utils.NetUtils;
import com.yanzhenjie.andserver.AndServer;
import com.yanzhenjie.andserver.Server;
import java.net.InetAddress;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public class CoreService extends Service {
    private Server mServer;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public void onCreate() {
        this.mServer = AndServer.webServer(this)
            .port(8888)
            .timeout(10, TimeUnit.SECONDS)
            .registerController(new DeviceApiController()) // 注册新的DeviceApiController
            .listener(new Server.ServerListener() { // from class: com.dnake.desktop.CoreService.1
            @Override // com.yanzhenjie.andserver.Server.ServerListener
            public void onStarted() {
                InetAddress localIPAddress = NetUtils.getLocalIPAddress();
                if (localIPAddress != null) {
                    ServerManager.onServerStart(CoreService.this, localIPAddress.getHostAddress());
                    return;
                }
                dxml dxmlVar = new dxml();
                dxmlVar.load("/dnake/cfg/sys_lan.xml");
                ServerManager.onServerStart(CoreService.this, dxmlVar.getText("/sys/lan/ip", ""));
            }

            @Override // com.yanzhenjie.andserver.Server.ServerListener
            public void onStopped() {
                ServerManager.onServerStop(CoreService.this);
            }

            @Override // com.yanzhenjie.andserver.Server.ServerListener
            public void onException(Exception exc) {
                ServerManager.onServerError(CoreService.this, exc.getMessage());
            }
        }).build();
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        startServer();
        return 1;
    }

    @Override // android.app.Service
    public void onDestroy() {
        stopServer();
        super.onDestroy();
    }

    private void startServer() {
        this.mServer.startup();
    }

    private void stopServer() {
        this.mServer.shutdown();
    }
}
