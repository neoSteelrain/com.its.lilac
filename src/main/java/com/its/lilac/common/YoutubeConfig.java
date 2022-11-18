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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

@PropertySource("classpath:/api-keys.properties")
public class YoutubeConfig {

    @Autowired
    private static Environment environment;

    @Bean
    public static String getYoutubeApiKey(){
        return environment.getProperty("youtube.apikey");
    }
}
*/
