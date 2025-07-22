package com.dnake.desktop.utils;

import android.content.Context;
import android.content.res.AssetManager;
import android.os.Environment;
import android.util.Log;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import org.eclipse.paho.client.mqttv3.MqttTopic;
import org.reactivestreams.Subscriber;

/* loaded from: classes.dex */
public class FileCopyUtil {
    private static final int BUFFER_SIZE = 8192;
    private static final String TAG = "FileCopyUtil";

    public static String getDbPath(Context context) {
        return Environment.getDataDirectory() + "/data/" + context.getPackageName() + "/databases/";
    }

    public static String getSelfPath(Context context, String str) {
        return Environment.getDataDirectory() + "/data/" + context.getPackageName() + MqttTopic.TOPIC_LEVEL_SEPARATOR + str + MqttTopic.TOPIC_LEVEL_SEPARATOR;
    }

    private static String getXmlPath(Context context) {
        return Environment.getDataDirectory() + "/data/" + context.getPackageName() + "/shared_prefs/";
    }

    public static boolean copyXmlFromRaw(Context context, InputStream inputStream) {
        return copyFileToApp(inputStream, getXmlPath(context), getXmlPath(context) + context.getPackageName() + "_preferences.xml");
    }

    public static boolean adjustFileIsExit(String str) {
        return new File(str).exists();
    }

    public static void tryCopyDbFileFromServer(Context context, String str, Subscriber<Boolean> subscriber) throws Throwable {
        try {
            AssetManager assets = context.getAssets();
            boolean z = false;
            for (String str2 : assets.list("")) {
                if (str2.equals(str)) {
                    z = true;
                }
            }
            if (z) {
                copyFileToApp(assets.open(str), getDbPath(context), str);
                Log.d(TAG, "Try to open file:" + str);
            }
        } catch (IOException e) {
            e.printStackTrace();
            subscriber.onNext(false);
        }
    }

    public static boolean copyFileToApp(InputStream inputStream, String str, String str2) throws Throwable {
        if (inputStream == null) {
            return false;
        }
        FileOutputStream fileOutputStream = null;
        try {
            try {
                File file = new File(str);
                if (!file.exists()) {
                    file.mkdir();
                }
                File file2 = new File(str + MqttTopic.TOPIC_LEVEL_SEPARATOR + str2);
                if (!file2.exists()) {
                    file2.createNewFile();
                }
                FileOutputStream fileOutputStream2 = new FileOutputStream(file2);
                try {
                    Log.i(TAG, "Copied " + IoUtils.copyAllBytes(inputStream, fileOutputStream2) + " bytes success!");
                    IoUtils.safeClose(inputStream);
                    IoUtils.safeClose(fileOutputStream2);
                    return true;
                } catch (IOException e) {
                    fileOutputStream = fileOutputStream2;
                    e = e;
                    e.printStackTrace();
                    IoUtils.safeClose(inputStream);
                    if (fileOutputStream == null) {
                        return false;
                    }
                    IoUtils.safeClose(fileOutputStream);
                    return false;
                } catch (Throwable th) {
                    fileOutputStream = fileOutputStream2;
                    th = th;
                    IoUtils.safeClose(inputStream);
                    if (fileOutputStream != null) {
                        IoUtils.safeClose(fileOutputStream);
                    }
                    throw th;
                }
            } catch (IOException e2) {
                e = e2;
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }
}
