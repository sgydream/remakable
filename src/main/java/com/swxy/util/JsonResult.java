package com.swxy.util;

import java.io.Serializable;

public class JsonResult implements Serializable {

    private static final long serialVersionUID = -598253683001447009L;
    public static String STATE_SUCCESS="1";
    public static String STATE_ERROR="-1";
    private String state;
    private String message;
    private Object data;

    public JsonResult(String state,String message,Object data) {
        this.data=data;
        this.message=message;
        this.state=state;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
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
