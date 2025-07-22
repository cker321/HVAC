package com.landleaf.smarthome.net.hardware;

import android.content.Context;
import com.landleaf.smarthome.device.BaseLocalDeviceModel;
import com.landleaf.smarthome.device.ProductCodeAnnotation;
import com.landleaf.smarthome.model.DeviceAttribute;
import com.landleaf.smarthome.model.DeviceModel;
import dalvik.system.DexFile;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class ProtocolUtils {
    private static List<Class> baseClass;

    public static DeviceAttribute getAttData4Protocol(DeviceModel deviceModel, int i, int i2, Context context) {
        DeviceAttribute deviceAttribute = new DeviceAttribute();
        String attTag4Add = getAttTag4Add(deviceModel, i, context);
        String attValue4Add = getAttValue4Add(deviceModel, attTag4Add, i2, context);
        deviceAttribute.setAttrTag(attTag4Add);
        if (attValue4Add == null) {
            attValue4Add = String.valueOf(i2);
        }
        deviceAttribute.setAttrValue(attValue4Add);
        return deviceAttribute;
    }

    public static String getAttTag4Add(DeviceModel deviceModel, int i, Context context) {
        BaseLocalDeviceModel deviceModel4ProductTag = getDeviceModel4ProductTag(deviceModel.getProductCode(), context);
        if (deviceModel4ProductTag == null) {
            return null;
        }
        for (Map.Entry<String, Integer> entry : deviceModel4ProductTag.getAttTagAdd().entrySet()) {
            if (entry.getValue().intValue() == i) {
                return entry.getKey();
            }
        }
        return null;
    }

    public static String getAttValue4Add(DeviceModel deviceModel, String str, int i, Context context) {
        for (Map.Entry<String, DeviceAttribute> entry : getDeviceModel4ProductTag(deviceModel.getProductCode(), context).getAttValueAdd().entrySet()) {
            DeviceAttribute value = entry.getValue();
            if (value.getAttrTag().equals(str) && value.getAddValue() == i) {
                return entry.getKey();
            }
        }
        return null;
    }

    public static String getAttValue4Add(DeviceModel deviceModel, int i, int i2, Context context) {
        return getAttValue4Add(deviceModel, getAttTag4Add(deviceModel, i, context), i2, context);
    }

    public static int getAdd4AttTag(DeviceModel deviceModel, String str, Context context) {
        BaseLocalDeviceModel deviceModel4ProductTag = getDeviceModel4ProductTag(deviceModel.getProductCode(), context);
        if (deviceModel4ProductTag != null) {
            return deviceModel4ProductTag.getAttTagAdd().get(str).intValue();
        }
        return -1;
    }

    public static int getAdd4AttValue(DeviceModel deviceModel, String str, Context context) {
        BaseLocalDeviceModel deviceModel4ProductTag = getDeviceModel4ProductTag(deviceModel.getProductCode(), context);
        if (deviceModel4ProductTag != null) {
            return deviceModel4ProductTag.getAttValueAdd().get(str).getAddValue();
        }
        return -1;
    }

    public static BaseLocalDeviceModel getDeviceModel4ProductTag(int i, Context context) {
        for (Class cls : getAllClassByBase(context, BaseLocalDeviceModel.class)) {
            ProductCodeAnnotation productCodeAnnotation = (ProductCodeAnnotation) cls.getAnnotation(ProductCodeAnnotation.class);
            for (int i2 = 0; i2 < productCodeAnnotation.value().length; i2++) {
                if (productCodeAnnotation.value()[i2] == i) {
                    try {
                        return (BaseLocalDeviceModel) cls.getDeclaredMethod("getInstance", new Class[0]).invoke(null, new Object[0]);
                    } catch (Exception e) {
                        e.printStackTrace();
                        return null;
                    }
                }
            }
        }
        return null;
    }

    public static List<Class> getAllClassByBase(Context context, Class cls) throws ClassNotFoundException {
        List<Class> list = baseClass;
        if (list != null && list.size() > 0) {
            if (cls.isAssignableFrom(baseClass.get(0))) {
                return baseClass;
            }
            baseClass = null;
        }
        baseClass = new ArrayList();
        try {
            List<String> classes = getClasses(context, cls.getPackage().getName());
            for (int i = 0; i < classes.size(); i++) {
                Class<?> cls2 = Class.forName(classes.get(i));
                if (cls.isAssignableFrom(cls2) && !cls.equals(cls2)) {
                    baseClass.add(cls2);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return baseClass;
    }

    private static List<String> getClasses(Context context, String str) {
        ArrayList arrayList = new ArrayList();
        try {
            Enumeration<String> enumerationEntries = new DexFile(context.getPackageCodePath()).entries();
            while (enumerationEntries.hasMoreElements()) {
                String strNextElement = enumerationEntries.nextElement();
                if (strNextElement.contains(str)) {
                    arrayList.add(strNextElement);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arrayList;
    }

    public static List<Integer> getFaults4FaultAdds(int[] iArr) {
        if (iArr == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        double length = iArr.length;
        Double.isNaN(length);
        int iCeil = (int) Math.ceil(length / 16.0d);
        for (int i = 0; i < iCeil; i++) {
            int[] iArr2 = new int[16];
            int i2 = i * 16;
            System.arraycopy(iArr, i2, iArr2, 0, iArr.length - i2 >= 16 ? 16 : iArr.length - i2);
            StringBuffer stringBuffer = new StringBuffer();
            for (int i3 = 0; i3 < 16; i3++) {
                stringBuffer.append(Integer.valueOf(iArr2[i3]).intValue() > 0 ? 1 : 0);
            }
            arrayList.add(Integer.valueOf(stringBuffer.toString(), 2));
        }
        return arrayList;
    }
}
