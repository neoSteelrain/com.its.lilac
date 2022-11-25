package com.its.lilac.exception;

import java.rmi.server.ExportException;

public class LicenseException extends RuntimeException{
    public LicenseException(Exception e){
        super(e);
    }

    public LicenseException(String msg,Exception e){
        super(msg,e);
    }
}
