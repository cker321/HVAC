package com.yanzhenjie.andserver.framework.handler;

import com.yanzhenjie.andserver.framework.cross.CrossOrigin;
import com.yanzhenjie.andserver.framework.mapping.Addition;
import com.yanzhenjie.andserver.framework.mapping.Mapping;

/* loaded from: classes.dex */
public interface MethodHandler extends RequestHandler {
    Addition getAddition();

    CrossOrigin getCrossOrigin();

    Mapping getMapping();
}
