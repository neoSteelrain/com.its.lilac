package com.its.lilac.service;

import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.SearchListResponse;
import org.springframework.stereotype.Service;

import java.io.IOException;


@Service
public class YoutubeAPIService {


    public SearchListResponse keywordSearch(String keyword){
//        String youtubeKey = YoutubeConfig.getInstance().getYoutubeAPIKey();
        String youtubeKey = "AIzaSyCGdoJmpUtkWH-fbB5BvvrUR2DgWR8iUo4";
        return getSearchListResponse(keyword, youtubeKey);
    }

    private SearchListResponse getSearchListResponse(String keyword, String apiKey){
        SearchListResponse response = null;
        try{
            // 유튜브 객체 생성
            YouTube youtube = new YouTube.Builder(new NetHttpTransport(), GsonFactory.getDefaultInstance(), new HttpRequestInitializer() {
                public void initialize(HttpRequest request) throws IOException {
                }
            }).setApplicationName("lilac").build();

            // 키워드 설정
            YouTube.Search.List search = youtube.search().list("id,snippet");
            search.setKey(apiKey);
            search.setQ(keyword);
            search.setType("video");
            /*
            구글문서에 따르면 효율을 올리기 위해 결과로 받을 필드들을 정의하라고 한다.
            모든 필드를 반환하는 것이 아니고 내가 필요한 필드들만 골라 받을 수 있다는 것!
             */
            search.setFields("items(id/kind,id/videoId,snippet/title,snippet/thumbnails/high/url)");
            search.setMaxResults(25L); // 반환되는 영상의 갯수
            response = search.execute(); // API 호출

        }catch(Exception e){
            e.printStackTrace();
        }
        return response;
    }

}
