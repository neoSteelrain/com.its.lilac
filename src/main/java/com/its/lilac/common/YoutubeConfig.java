/*package com.its.lilac.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource(value = "/api-keys.properties")
public class YoutubeConfig{

    @Value("${youtube.apikey}")
    private String apiKey;

    public String getApiKey(){
        return apiKey;
    }
}*/

/*
package com.its.lilac.common;

import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@PropertySource("classpath:/api-keys..properties")
public class YoutubeConfig {

    //@Autowired
    private Environment env;

    private YoutubeConfig(){
    }

    private static class YoutubeConfigHelper{
        private static final YoutubeConfig INSTANCE = new YoutubeConfig();
    }

    public static YoutubeConfig getInstance(){
        return YoutubeConfigHelper.INSTANCE;
    }

    public String getYoutubeAPIKey(){
        return env.getProperty("youtube.apikey");
    }
}
*/
