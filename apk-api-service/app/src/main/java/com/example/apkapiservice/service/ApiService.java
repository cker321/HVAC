package com.example.apkapiservice.service;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;

import androidx.annotation.Nullable;
import androidx.core.app.NotificationCompat;

import com.example.apkapiservice.MainActivity;
import com.example.apkapiservice.R;
import com.example.apkapiservice.controller.AirControlHandler;
import com.example.apkapiservice.controller.WindControlHandler;
import com.example.apkapiservice.server.HttpApiServer;

/**
 * API服务
 * 负责启动和管理HTTP API服务器
 */
public class ApiService extends Service {
    private static final String TAG = "ApiService";
    private static final int NOTIFICATION_ID = 1001;
    private static final String CHANNEL_ID = "api_service_channel";
    private static final String CHANNEL_NAME = "API Service Channel";
    
    private HttpApiServer apiServer;
    private boolean isRunning = false;
    
    @Override
    public void onCreate() {
        super.onCreate();
        Log.i(TAG, "API服务创建");
        
        // 初始化控制处理器
        AirControlHandler.getInstance();
        WindControlHandler.getInstance();
        
        // 创建HTTP服务器
        try {
            apiServer = new HttpApiServer(8080, this);
            Log.i(TAG, "HTTP API服务器创建成功，端口：8080");
        } catch (Exception e) {
            Log.e(TAG, "HTTP API服务器创建失败", e);
        }
    }
    
    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        Log.i(TAG, "API服务启动");
        
        // 在Android 5.0（API 21）及以上版本使用前台服务
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            try {
                // 创建通知渠道（Android 8.0及以上需要）
                createNotificationChannel();
                
                // 创建前台服务通知
                Notification notification = createNotification();
                startForeground(NOTIFICATION_ID, notification);
                Log.i(TAG, "前台服务启动成功");
            } catch (Exception e) {
                Log.e(TAG, "启动前台服务失败: " + e.getMessage());
            }
        } else {
            Log.i(TAG, "当前系统版本不支持前台服务，使用普通服务模式");
        }
        
        // 启动HTTP服务器
        startApiServer();
        
        return START_STICKY;
    }
    
    @Override
    public void onDestroy() {
        Log.i(TAG, "API服务销毁");
        
        // 停止HTTP服务器
        stopApiServer();
        
        super.onDestroy();
    }
    
    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
    
    /**
     * 启动API服务器
     */
    private void startApiServer() {
        if (apiServer != null && !isRunning) {
            try {
                apiServer.start();
                isRunning = true;
                Log.i(TAG, "HTTP API服务器已启动");
            } catch (Exception e) {
                Log.e(TAG, "HTTP API服务器启动失败", e);
            }
        }
    }
    
    /**
     * 停止API服务器
     */
    private void stopApiServer() {
        if (apiServer != null && isRunning) {
            apiServer.stop();
            isRunning = false;
            Log.i(TAG, "HTTP API服务器已停止");
        }
    }
    
    /**
     * 创建通知渠道（Android 8.0及以上需要）
     */
    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(
                    CHANNEL_ID,
                    CHANNEL_NAME,
                    NotificationManager.IMPORTANCE_LOW
            );
            channel.setDescription("API服务通知渠道");
            
            NotificationManager notificationManager = getSystemService(NotificationManager.class);
            if (notificationManager != null) {
                notificationManager.createNotificationChannel(channel);
            }
        }
    }
    
    /**
     * 创建前台服务通知
     */
    private Notification createNotification() {
        Intent notificationIntent = new Intent(this, MainActivity.class);
        PendingIntent pendingIntent = PendingIntent.getActivity(
                this,
                0,
                notificationIntent,
                PendingIntent.FLAG_IMMUTABLE
        );
        
        NotificationCompat.Builder builder = new NotificationCompat.Builder(this, CHANNEL_ID)
                .setContentTitle("API服务")
                .setContentText("API服务正在运行")
                .setSmallIcon(R.drawable.ic_notification)
                .setContentIntent(pendingIntent)
                .setPriority(NotificationCompat.PRIORITY_LOW);
        
        return builder.build();
    }
}
