package com.example.apkapiservice.utils;

/**
 * JSON响应工具类
 * 用于统一API接口的返回格式
 */
public class JsonResponse {
    private int code;
    private String message;
    private Object data;
    
    public JsonResponse(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }
    
    /**
     * 成功响应
     * 
     * @param message 成功消息
     * @param data 响应数据
     * @return JSON响应对象
     */
    public static JsonResponse success(String message, Object data) {
        return new JsonResponse(200, message, data);
    }
    
    /**
     * 成功响应（无数据）
     * 
     * @param message 成功消息
     * @return JSON响应对象
     */
    public static JsonResponse success(String message) {
        return success(message, null);
    }
    
    /**
     * 错误响应
     * 
     * @param message 错误消息
     * @return JSON响应对象
     */
    public static JsonResponse error(String message) {
        return new JsonResponse(500, message, null);
    }
    
    /**
     * 错误响应
     * 
     * @param code 错误码
     * @param message 错误消息
     * @return JSON响应对象
     */
    public static JsonResponse error(int code, String message) {
        return new JsonResponse(code, message, null);
    }
    
    public int getCode() {
        return code;
    }
    
    public void setCode(int code) {
        this.code = code;
    }
    
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
    
    public Object getData() {
        return data;
    }
    
    public void setData(Object data) {
        this.data = data;
    }
}
