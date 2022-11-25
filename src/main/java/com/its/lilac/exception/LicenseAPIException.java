package com.its.lilac.exception;

public class LicenseAPIException extends RuntimeException{
    public LicenseAPIException(Throwable e){
        super(e);
    }

    public LicenseAPIException(String msg, Throwable e){
        super(msg, e);
    }
}
