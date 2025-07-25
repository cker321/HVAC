package org.apache.httpcore.impl.bootstrap;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import javax.net.ServerSocketFactory;
import javax.net.ssl.SSLContext;
import org.apache.httpcore.ConnectionReuseStrategy;
import org.apache.httpcore.ExceptionLogger;
import org.apache.httpcore.HttpConnectionFactory;
import org.apache.httpcore.HttpRequestInterceptor;
import org.apache.httpcore.HttpResponseFactory;
import org.apache.httpcore.HttpResponseInterceptor;
import org.apache.httpcore.config.ConnectionConfig;
import org.apache.httpcore.config.SocketConfig;
import org.apache.httpcore.impl.DefaultBHttpServerConnection;
import org.apache.httpcore.impl.DefaultBHttpServerConnectionFactory;
import org.apache.httpcore.impl.DefaultConnectionReuseStrategy;
import org.apache.httpcore.impl.DefaultHttpResponseFactory;
import org.apache.httpcore.protocol.HttpExpectationVerifier;
import org.apache.httpcore.protocol.HttpProcessor;
import org.apache.httpcore.protocol.HttpProcessorBuilder;
import org.apache.httpcore.protocol.HttpRequestHandler;
import org.apache.httpcore.protocol.HttpRequestHandlerMapper;
import org.apache.httpcore.protocol.HttpService;
import org.apache.httpcore.protocol.ResponseConnControl;
import org.apache.httpcore.protocol.ResponseContent;
import org.apache.httpcore.protocol.ResponseDate;
import org.apache.httpcore.protocol.ResponseServer;
import org.apache.httpcore.protocol.UriHttpRequestHandlerMapper;

/* loaded from: classes.dex */
public class ServerBootstrap {
    private ConnectionReuseStrategy connStrategy;
    private ConnectionConfig connectionConfig;
    private HttpConnectionFactory<? extends DefaultBHttpServerConnection> connectionFactory;
    private ExceptionLogger exceptionLogger;
    private HttpExpectationVerifier expectationVerifier;
    private Map<String, HttpRequestHandler> handlerMap;
    private HttpRequestHandlerMapper handlerMapper;
    private HttpProcessor httpProcessor;
    private int listenerPort;
    private InetAddress localAddress;
    private LinkedList<HttpRequestInterceptor> requestFirst;
    private LinkedList<HttpRequestInterceptor> requestLast;
    private HttpResponseFactory responseFactory;
    private LinkedList<HttpResponseInterceptor> responseFirst;
    private LinkedList<HttpResponseInterceptor> responseLast;
    private String serverInfo;
    private ServerSocketFactory serverSocketFactory;
    private SocketConfig socketConfig;
    private SSLContext sslContext;
    private SSLServerSetupHandler sslSetupHandler;

    private ServerBootstrap() {
    }

    public static ServerBootstrap bootstrap() {
        return new ServerBootstrap();
    }

    public final ServerBootstrap setListenerPort(int i) {
        this.listenerPort = i;
        return this;
    }

    public final ServerBootstrap setLocalAddress(InetAddress inetAddress) {
        this.localAddress = inetAddress;
        return this;
    }

    public final ServerBootstrap setSocketConfig(SocketConfig socketConfig) {
        this.socketConfig = socketConfig;
        return this;
    }

    public final ServerBootstrap setConnectionConfig(ConnectionConfig connectionConfig) {
        this.connectionConfig = connectionConfig;
        return this;
    }

    public final ServerBootstrap setHttpProcessor(HttpProcessor httpProcessor) {
        this.httpProcessor = httpProcessor;
        return this;
    }

    public final ServerBootstrap addInterceptorFirst(HttpResponseInterceptor httpResponseInterceptor) {
        if (httpResponseInterceptor == null) {
            return this;
        }
        if (this.responseFirst == null) {
            this.responseFirst = new LinkedList<>();
        }
        this.responseFirst.addFirst(httpResponseInterceptor);
        return this;
    }

    public final ServerBootstrap addInterceptorLast(HttpResponseInterceptor httpResponseInterceptor) {
        if (httpResponseInterceptor == null) {
            return this;
        }
        if (this.responseLast == null) {
            this.responseLast = new LinkedList<>();
        }
        this.responseLast.addLast(httpResponseInterceptor);
        return this;
    }

    public final ServerBootstrap addInterceptorFirst(HttpRequestInterceptor httpRequestInterceptor) {
        if (httpRequestInterceptor == null) {
            return this;
        }
        if (this.requestFirst == null) {
            this.requestFirst = new LinkedList<>();
        }
        this.requestFirst.addFirst(httpRequestInterceptor);
        return this;
    }

    public final ServerBootstrap addInterceptorLast(HttpRequestInterceptor httpRequestInterceptor) {
        if (httpRequestInterceptor == null) {
            return this;
        }
        if (this.requestLast == null) {
            this.requestLast = new LinkedList<>();
        }
        this.requestLast.addLast(httpRequestInterceptor);
        return this;
    }

    public final ServerBootstrap setServerInfo(String str) {
        this.serverInfo = str;
        return this;
    }

    public final ServerBootstrap setConnectionReuseStrategy(ConnectionReuseStrategy connectionReuseStrategy) {
        this.connStrategy = connectionReuseStrategy;
        return this;
    }

    public final ServerBootstrap setResponseFactory(HttpResponseFactory httpResponseFactory) {
        this.responseFactory = httpResponseFactory;
        return this;
    }

    public final ServerBootstrap setHandlerMapper(HttpRequestHandlerMapper httpRequestHandlerMapper) {
        this.handlerMapper = httpRequestHandlerMapper;
        return this;
    }

    public final ServerBootstrap registerHandler(String str, HttpRequestHandler httpRequestHandler) {
        if (str != null && httpRequestHandler != null) {
            if (this.handlerMap == null) {
                this.handlerMap = new HashMap();
            }
            this.handlerMap.put(str, httpRequestHandler);
        }
        return this;
    }

    public final ServerBootstrap setExpectationVerifier(HttpExpectationVerifier httpExpectationVerifier) {
        this.expectationVerifier = httpExpectationVerifier;
        return this;
    }

    public final ServerBootstrap setConnectionFactory(HttpConnectionFactory<? extends DefaultBHttpServerConnection> httpConnectionFactory) {
        this.connectionFactory = httpConnectionFactory;
        return this;
    }

    public final ServerBootstrap setSslSetupHandler(SSLServerSetupHandler sSLServerSetupHandler) {
        this.sslSetupHandler = sSLServerSetupHandler;
        return this;
    }

    public final ServerBootstrap setServerSocketFactory(ServerSocketFactory serverSocketFactory) {
        this.serverSocketFactory = serverSocketFactory;
        return this;
    }

    public final ServerBootstrap setSslContext(SSLContext sSLContext) {
        this.sslContext = sSLContext;
        return this;
    }

    public final ServerBootstrap setExceptionLogger(ExceptionLogger exceptionLogger) {
        this.exceptionLogger = exceptionLogger;
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v2, types: [org.apache.httpcore.protocol.HttpRequestHandlerMapper] */
    /* JADX WARN: Type inference failed for: r1v24, types: [org.apache.httpcore.protocol.UriHttpRequestHandlerMapper] */
    /* JADX WARN: Type inference failed for: r1v3 */
    public HttpServer create() {
        HttpProcessor httpProcessorBuild = this.httpProcessor;
        if (httpProcessorBuild == null) {
            HttpProcessorBuilder httpProcessorBuilderCreate = HttpProcessorBuilder.create();
            LinkedList<HttpRequestInterceptor> linkedList = this.requestFirst;
            if (linkedList != null) {
                Iterator<HttpRequestInterceptor> it = linkedList.iterator();
                while (it.hasNext()) {
                    httpProcessorBuilderCreate.addFirst(it.next());
                }
            }
            LinkedList<HttpResponseInterceptor> linkedList2 = this.responseFirst;
            if (linkedList2 != null) {
                Iterator<HttpResponseInterceptor> it2 = linkedList2.iterator();
                while (it2.hasNext()) {
                    httpProcessorBuilderCreate.addFirst(it2.next());
                }
            }
            String str = this.serverInfo;
            if (str == null) {
                str = "Apache-HttpCore/1.1";
            }
            httpProcessorBuilderCreate.addAll(new ResponseDate(), new ResponseServer(str), new ResponseContent(), new ResponseConnControl());
            LinkedList<HttpRequestInterceptor> linkedList3 = this.requestLast;
            if (linkedList3 != null) {
                Iterator<HttpRequestInterceptor> it3 = linkedList3.iterator();
                while (it3.hasNext()) {
                    httpProcessorBuilderCreate.addLast(it3.next());
                }
            }
            LinkedList<HttpResponseInterceptor> linkedList4 = this.responseLast;
            if (linkedList4 != null) {
                Iterator<HttpResponseInterceptor> it4 = linkedList4.iterator();
                while (it4.hasNext()) {
                    httpProcessorBuilderCreate.addLast(it4.next());
                }
            }
            httpProcessorBuild = httpProcessorBuilderCreate.build();
        }
        HttpProcessor httpProcessor = httpProcessorBuild;
        ?? uriHttpRequestHandlerMapper = this.handlerMapper;
        if (uriHttpRequestHandlerMapper == 0) {
            uriHttpRequestHandlerMapper = new UriHttpRequestHandlerMapper();
            Map<String, HttpRequestHandler> map = this.handlerMap;
            if (map != null) {
                for (Map.Entry<String, HttpRequestHandler> entry : map.entrySet()) {
                    uriHttpRequestHandlerMapper.register(entry.getKey(), entry.getValue());
                }
            }
        }
        HttpRequestHandlerMapper httpRequestHandlerMapper = uriHttpRequestHandlerMapper;
        ConnectionReuseStrategy connectionReuseStrategy = this.connStrategy;
        if (connectionReuseStrategy == null) {
            connectionReuseStrategy = DefaultConnectionReuseStrategy.INSTANCE;
        }
        ConnectionReuseStrategy connectionReuseStrategy2 = connectionReuseStrategy;
        HttpResponseFactory httpResponseFactory = this.responseFactory;
        if (httpResponseFactory == null) {
            httpResponseFactory = DefaultHttpResponseFactory.INSTANCE;
        }
        HttpService httpService = new HttpService(httpProcessor, connectionReuseStrategy2, httpResponseFactory, httpRequestHandlerMapper, this.expectationVerifier);
        ServerSocketFactory serverSocketFactory = this.serverSocketFactory;
        if (serverSocketFactory == null) {
            SSLContext sSLContext = this.sslContext;
            if (sSLContext != null) {
                serverSocketFactory = sSLContext.getServerSocketFactory();
            } else {
                serverSocketFactory = ServerSocketFactory.getDefault();
            }
        }
        ServerSocketFactory serverSocketFactory2 = serverSocketFactory;
        HttpConnectionFactory defaultBHttpServerConnectionFactory = this.connectionFactory;
        if (defaultBHttpServerConnectionFactory == null) {
            if (this.connectionConfig != null) {
                defaultBHttpServerConnectionFactory = new DefaultBHttpServerConnectionFactory(this.connectionConfig);
            } else {
                defaultBHttpServerConnectionFactory = DefaultBHttpServerConnectionFactory.INSTANCE;
            }
        }
        HttpConnectionFactory httpConnectionFactory = defaultBHttpServerConnectionFactory;
        ExceptionLogger exceptionLogger = this.exceptionLogger;
        if (exceptionLogger == null) {
            exceptionLogger = ExceptionLogger.NO_OP;
        }
        ExceptionLogger exceptionLogger2 = exceptionLogger;
        int iMax = Math.max(this.listenerPort, 0);
        InetAddress inetAddress = this.localAddress;
        SocketConfig socketConfig = this.socketConfig;
        if (socketConfig == null) {
            socketConfig = SocketConfig.DEFAULT;
        }
        return new HttpServer(iMax, inetAddress, socketConfig, serverSocketFactory2, httpService, httpConnectionFactory, this.sslSetupHandler, exceptionLogger2);
    }
}
