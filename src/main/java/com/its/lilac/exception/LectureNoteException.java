package com.its.lilac.exception;

public class LectureNoteException extends RuntimeException{
    public LectureNoteException(Throwable e){
        super(e);
    }

    public LectureNoteException(String msg, Throwable e){
        super(msg,e);
    }

    public LectureNoteException(String msg){
        super(msg);
    }
}
