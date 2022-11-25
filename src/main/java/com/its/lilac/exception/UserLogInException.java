package com.its.lilac.exception;

public class UserLogInException extends RuntimeException{
    public UserLogInException(Throwable e){
        super(e);
    }

    public UserLogInException(String msg, Throwable e){
        super(msg, e);
    }
}
