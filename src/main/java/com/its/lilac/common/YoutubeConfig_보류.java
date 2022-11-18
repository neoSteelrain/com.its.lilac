package com.its.lilac.common;

import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@PropertySource("classpath:/api-keys.properties")
public class YoutubeConfig_보류 {

//    @Autowired
    private Environment env;

    private YoutubeConfig_보류(){
    }

    private static class YoutubeConfigHelper{
        private static final YoutubeConfig_보류 INSTANCE = new YoutubeConfig_보류();
    }

    public static YoutubeConfig_보류 getInstance(){
        return YoutubeConfigHelper.INSTANCE;
    }

    public String getYoutubeAPIKey(){
        return env.getProperty("youtube.apikey");
    }
}
