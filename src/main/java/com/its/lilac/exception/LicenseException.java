package com.its.lilac.exception;

import java.rmi.server.ExportException;

public class LicenseException extends RuntimeException{
    public LicenseException(Throwable e){
        super(e);
    }

    public LicenseException(String msg,Throwable e){
        super(msg,e);
    }
}
