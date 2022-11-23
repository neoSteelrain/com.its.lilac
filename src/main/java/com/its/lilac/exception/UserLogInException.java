package com.its.lilac.exception;

public class UserLogInException extends RuntimeException{
    public UserLogInException(Exception e){
        super(e);
    }
}
