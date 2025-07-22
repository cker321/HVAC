package com.yanzhenjie.andserver.register;

import com.yanzhenjie.andserver.framework.ExceptionResolver;
import com.yanzhenjie.andserver.framework.HandlerInterceptor;
import com.yanzhenjie.andserver.framework.MessageConverter;
import com.yanzhenjie.andserver.framework.config.Multipart;
import com.yanzhenjie.andserver.framework.handler.HandlerAdapter;

/* loaded from: classes.dex */
public interface Register {
    void addAdapter(HandlerAdapter handlerAdapter);

    void addInterceptor(HandlerInterceptor handlerInterceptor);

    void setConverter(MessageConverter messageConverter);

    void setMultipart(Multipart multipart);

    void setResolver(ExceptionResolver exceptionResolver);
}
