package com.landleaf.smarthome.p003db.converter;

import com.google.gson.reflect.TypeToken;
import com.landleaf.smarthome.model.DeviceModel;
import com.landleaf.smarthome.util.JsonUtils;
import java.util.List;
import org.greenrobot.greendao.converter.PropertyConverter;

/* loaded from: classes.dex */
public class DeviceConverter implements PropertyConverter<List<DeviceModel>, String> {
    @Override // org.greenrobot.greendao.converter.PropertyConverter
    public List<DeviceModel> convertToEntityProperty(String str) {
        return (List) JsonUtils.jsonToObj(str, new TypeToken<List<DeviceModel>>() { // from class: com.landleaf.smarthome.db.converter.DeviceConverter.1
        }.getType());
    }

    @Override // org.greenrobot.greendao.converter.PropertyConverter
    public String convertToDatabaseValue(List<DeviceModel> list) {
        return JsonUtils.objToJson(list);
    }
}
