package com.yanzhenjie.andserver.server;

import android.content.Context;
import com.yanzhenjie.andserver.ComponentRegister;
import com.yanzhenjie.andserver.DispatcherHandler;
import com.yanzhenjie.andserver.SSLSocketInitializer;
import com.yanzhenjie.andserver.Server;
import com.yanzhenjie.andserver.server.BasicServer;
import java.io.IOException;
import java.net.InetAddress;
import java.util.concurrent.TimeUnit;
import javax.net.ServerSocketFactory;
import javax.net.ssl.SSLContext;
import org.apache.httpcore.protocol.HttpRequestHandler;

/* loaded from: classes.dex */
public class WebServer extends BasicServer<Builder> {
    private Context mContext;
    private String mGroup;

    public static Builder newBuilder(Context context, String str) {
        return new Builder(context, str);
    }

    private WebServer(Builder builder) {
        super(builder);
        this.mContext = builder.context;
        this.mGroup = builder.group;
    }

    @Override // com.yanzhenjie.andserver.server.BasicServer
    protected HttpRequestHandler requestHandler() throws IOException, ClassNotFoundException {
        DispatcherHandler dispatcherHandler = new DispatcherHandler(this.mContext);
        new ComponentRegister(this.mContext).register(dispatcherHandler, this.mGroup);
        return dispatcherHandler;
    }

    public static class Builder extends BasicServer.Builder<Builder, WebServer> implements Server.Builder<Builder, WebServer> {
        private Context context;
        private String group;

        @Override // com.yanzhenjie.andserver.Server.Builder
        public /* bridge */ /* synthetic */ Server.Builder inetAddress(InetAddress inetAddress) {
            return (Server.Builder) super.inetAddress(inetAddress);
        }

        @Override // com.yanzhenjie.andserver.Server.Builder
        public /* bridge */ /* synthetic */ Server.Builder listener(Server.ServerListener serverListener) {
            return (Server.Builder) super.listener(serverListener);
        }

        @Override // com.yanzhenjie.andserver.Server.Builder
        public /* bridge */ /* synthetic */ Server.Builder port(int i) {
            return (Server.Builder) super.port(i);
        }

        @Override // com.yanzhenjie.andserver.Server.Builder
        public /* bridge */ /* synthetic */ Server.Builder serverSocketFactory(ServerSocketFactory serverSocketFactory) {
            return (Server.Builder) super.serverSocketFactory(serverSocketFactory);
        }

        @Override // com.yanzhenjie.andserver.Server.Builder
        public /* bridge */ /* synthetic */ Server.Builder sslContext(SSLContext sSLContext) {
            return (Server.Builder) super.sslContext(sSLContext);
        }

        @Override // com.yanzhenjie.andserver.Server.Builder
        public /* bridge */ /* synthetic */ Server.Builder sslSocketInitializer(SSLSocketInitializer sSLSocketInitializer) {
            return (Server.Builder) super.sslSocketInitializer(sSLSocketInitializer);
        }

        @Override // com.yanzhenjie.andserver.Server.Builder
        public /* bridge */ /* synthetic */ Server.Builder timeout(int i, TimeUnit timeUnit) {
            return (Server.Builder) super.timeout(i, timeUnit);
        }

        private Builder(Context context, String str) {
            this.context = context;
            this.group = str;
        }

        @Override // com.yanzhenjie.andserver.server.BasicServer.Builder, com.yanzhenjie.andserver.Server.ProxyBuilder
        public WebServer build() {
            return new WebServer(this);
        }
    }
}
