package com.its.lilac.exception;


public class YoutubeAPIException extends RuntimeException{
    public YoutubeAPIException(Throwable e){
        super(e);
    }
    public YoutubeAPIException(String msg, Throwable e)
    {
        super(msg, e);
    }
}
