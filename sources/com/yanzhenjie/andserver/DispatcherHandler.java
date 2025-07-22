package com.yanzhenjie.andserver;

import android.content.Context;
import android.util.Log;
import com.yanzhenjie.andserver.error.NotFoundException;
import com.yanzhenjie.andserver.error.ServerInternalException;
import com.yanzhenjie.andserver.framework.ExceptionResolver;
import com.yanzhenjie.andserver.framework.HandlerInterceptor;
import com.yanzhenjie.andserver.framework.MessageConverter;
import com.yanzhenjie.andserver.framework.ModifiedInterceptor;
import com.yanzhenjie.andserver.framework.body.StringBody;
import com.yanzhenjie.andserver.framework.config.Multipart;
import com.yanzhenjie.andserver.framework.handler.HandlerAdapter;
import com.yanzhenjie.andserver.framework.handler.RequestHandler;
import com.yanzhenjie.andserver.framework.view.ViewResolver;
import com.yanzhenjie.andserver.http.RequestDispatcher;
import com.yanzhenjie.andserver.http.RequestWrapper;
import com.yanzhenjie.andserver.http.StandardContext;
import com.yanzhenjie.andserver.http.StandardRequest;
import com.yanzhenjie.andserver.http.StandardResponse;
import com.yanzhenjie.andserver.http.cookie.Cookie;
import com.yanzhenjie.andserver.http.multipart.MultipartRequest;
import com.yanzhenjie.andserver.http.multipart.MultipartResolver;
import com.yanzhenjie.andserver.http.multipart.StandardMultipartResolver;
import com.yanzhenjie.andserver.http.session.Session;
import com.yanzhenjie.andserver.http.session.SessionManager;
import com.yanzhenjie.andserver.http.session.StandardSessionManager;
import com.yanzhenjie.andserver.register.Register;
import com.yanzhenjie.andserver.util.Assert;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.apache.httpcore.HttpRequest;
import org.apache.httpcore.HttpResponse;
import org.apache.httpcore.protocol.HttpContext;
import org.apache.httpcore.protocol.HttpRequestHandler;
import org.eclipse.paho.client.mqttv3.MqttTopic;

/* loaded from: classes.dex */
public class DispatcherHandler implements HttpRequestHandler, Register {
    private final Context mContext;
    private MessageConverter mConverter;
    private Multipart mMultipart;
    private SessionManager mSessionManager;
    private List<HandlerAdapter> mAdapterList = new LinkedList();
    private List<HandlerInterceptor> mInterceptorList = new LinkedList();
    private ViewResolver mViewResolver = new ViewResolver();
    private ExceptionResolver mResolver = new ExceptionResolver.ResolverWrapper(ExceptionResolver.DEFAULT);

    public DispatcherHandler(Context context) {
        this.mContext = context;
        this.mSessionManager = new StandardSessionManager(context);
        this.mInterceptorList.add(new ModifiedInterceptor());
    }

    @Override // com.yanzhenjie.andserver.register.Register
    public void addAdapter(HandlerAdapter handlerAdapter) {
        Assert.notNull(handlerAdapter, "The adapter cannot be null.");
        if (this.mAdapterList.contains(handlerAdapter)) {
            return;
        }
        this.mAdapterList.add(handlerAdapter);
    }

    @Override // com.yanzhenjie.andserver.register.Register
    public void addInterceptor(HandlerInterceptor handlerInterceptor) {
        Assert.notNull(handlerInterceptor, "The interceptor cannot be null.");
        if (this.mInterceptorList.contains(handlerInterceptor)) {
            return;
        }
        this.mInterceptorList.add(handlerInterceptor);
    }

    @Override // com.yanzhenjie.andserver.register.Register
    public void setConverter(MessageConverter messageConverter) {
        this.mConverter = messageConverter;
        this.mViewResolver = new ViewResolver(messageConverter);
    }

    @Override // com.yanzhenjie.andserver.register.Register
    public void setResolver(ExceptionResolver exceptionResolver) {
        Assert.notNull(exceptionResolver, "The exceptionResolver cannot be null.");
        this.mResolver = new ExceptionResolver.ResolverWrapper(exceptionResolver);
    }

    @Override // com.yanzhenjie.andserver.register.Register
    public void setMultipart(Multipart multipart) {
        this.mMultipart = multipart;
    }

    @Override // org.apache.httpcore.protocol.HttpRequestHandler
    public void handle(HttpRequest httpRequest, HttpResponse httpResponse, HttpContext httpContext) {
        handle(new StandardRequest(httpRequest, new StandardContext(httpContext), this, this.mSessionManager), new StandardResponse(httpResponse));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handle(com.yanzhenjie.andserver.http.HttpRequest httpRequest, com.yanzhenjie.andserver.http.HttpResponse httpResponse) {
        HandlerAdapter handlerAdapter;
        boolean z;
        StandardMultipartResolver standardMultipartResolver = new StandardMultipartResolver();
        try {
            if (standardMultipartResolver.isMultipart(httpRequest)) {
                configMultipart(standardMultipartResolver);
                httpRequest = standardMultipartResolver.resolveMultipart(httpRequest);
            }
            handlerAdapter = getHandlerAdapter(httpRequest);
        } catch (Throwable th) {
            try {
                try {
                    this.mResolver.onResolve(httpRequest, httpResponse, th);
                } catch (Exception e) {
                    ServerInternalException serverInternalException = new ServerInternalException(e);
                    httpResponse.setStatus(500);
                    httpResponse.setBody(new StringBody(serverInternalException.getMessage()));
                }
                processSession(httpRequest, httpResponse);
                if (!(httpRequest instanceof MultipartRequest)) {
                    return;
                }
            } finally {
                if (httpRequest instanceof MultipartRequest) {
                    standardMultipartResolver.cleanupMultipart((MultipartRequest) httpRequest);
                }
            }
        }
        if (handlerAdapter == null) {
            throw new NotFoundException(httpRequest.getPath());
        }
        RequestHandler handler = handlerAdapter.getHandler(httpRequest);
        if (handler == null) {
            throw new NotFoundException(httpRequest.getPath());
        }
        if (preHandle(httpRequest, httpResponse, handler)) {
            if (z) {
                return;
            } else {
                return;
            }
        }
        httpRequest.setAttribute(com.yanzhenjie.andserver.http.HttpContext.ANDROID_CONTEXT, this.mContext);
        httpRequest.setAttribute(com.yanzhenjie.andserver.http.HttpContext.HTTP_MESSAGE_CONVERTER, this.mConverter);
        this.mViewResolver.resolve(handler.handle(httpRequest, httpResponse), httpRequest, httpResponse);
        processSession(httpRequest, httpResponse);
        if (!(httpRequest instanceof MultipartRequest)) {
            return;
        }
        standardMultipartResolver.cleanupMultipart((MultipartRequest) httpRequest);
    }

    private void configMultipart(MultipartResolver multipartResolver) {
        Multipart multipart = this.mMultipart;
        if (multipart != null) {
            long allFileMaxSize = multipart.getAllFileMaxSize();
            if (allFileMaxSize == -1 || allFileMaxSize > 0) {
                multipartResolver.setAllFileMaxSize(allFileMaxSize);
            }
            long fileMaxSize = this.mMultipart.getFileMaxSize();
            if (fileMaxSize == -1 || fileMaxSize > 0) {
                multipartResolver.setFileMaxSize(fileMaxSize);
            }
            int maxInMemorySize = this.mMultipart.getMaxInMemorySize();
            if (maxInMemorySize > 0) {
                multipartResolver.setMaxInMemorySize(maxInMemorySize);
            }
            File uploadTempDir = this.mMultipart.getUploadTempDir();
            if (uploadTempDir != null) {
                multipartResolver.setUploadTempDir(uploadTempDir);
            }
        }
    }

    private HandlerAdapter getHandlerAdapter(com.yanzhenjie.andserver.http.HttpRequest httpRequest) {
        for (HandlerAdapter handlerAdapter : this.mAdapterList) {
            if (handlerAdapter.intercept(httpRequest)) {
                return handlerAdapter;
            }
        }
        return null;
    }

    private boolean preHandle(com.yanzhenjie.andserver.http.HttpRequest httpRequest, com.yanzhenjie.andserver.http.HttpResponse httpResponse, RequestHandler requestHandler) throws Exception {
        Iterator<HandlerInterceptor> it = this.mInterceptorList.iterator();
        while (it.hasNext()) {
            if (it.next().onIntercept(httpRequest, httpResponse, requestHandler)) {
                return true;
            }
        }
        return false;
    }

    public RequestDispatcher getRequestDispatcher(com.yanzhenjie.andserver.http.HttpRequest httpRequest, String str) {
        com.yanzhenjie.andserver.http.HttpRequest request = httpRequest;
        while (request instanceof RequestWrapper) {
            request = ((RequestWrapper) httpRequest).getRequest();
        }
        ((StandardRequest) request).setPath(str);
        if (getHandlerAdapter(request) == null) {
            throw new NotFoundException(httpRequest.getPath());
        }
        return new RequestDispatcher() { // from class: com.yanzhenjie.andserver.DispatcherHandler.1
            @Override // com.yanzhenjie.andserver.http.RequestDispatcher
            public void forward(com.yanzhenjie.andserver.http.HttpRequest httpRequest2, com.yanzhenjie.andserver.http.HttpResponse httpResponse) {
                DispatcherHandler.this.handle(httpRequest2, httpResponse);
            }
        };
    }

    private void processSession(com.yanzhenjie.andserver.http.HttpRequest httpRequest, com.yanzhenjie.andserver.http.HttpResponse httpResponse) {
        Object attribute = httpRequest.getAttribute(com.yanzhenjie.andserver.http.HttpContext.REQUEST_CREATED_SESSION);
        if (attribute instanceof Session) {
            Session session = (Session) attribute;
            try {
                this.mSessionManager.add(session);
            } catch (IOException e) {
                Log.e(AndServer.TAG, "Session persistence failed.", e);
            }
            Cookie cookie = new Cookie(com.yanzhenjie.andserver.http.HttpRequest.SESSION_NAME, session.getId());
            cookie.setPath(MqttTopic.TOPIC_LEVEL_SEPARATOR);
            cookie.setHttpOnly(true);
            httpResponse.addCookie(cookie);
        }
    }
}
