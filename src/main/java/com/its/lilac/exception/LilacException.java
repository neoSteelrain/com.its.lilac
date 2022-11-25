package com.its.lilac.exception;

public class LilacException extends RuntimeException {

    public LilacException(Throwable e){
        super(e);
    }

    public LilacException(String msg, Throwable e){
        super(msg, e);
    }
}
