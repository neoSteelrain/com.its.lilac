package com.its.lilac.service;

import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;
import com.its.lilac.datamodel.VideoDTO;
import com.its.lilac.repository.YoutubeAPIRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@PropertySource(value = "classpath:/api-keys.properties")
@Service
public class YoutubeAPIService {

    @Autowired
    private YoutubeAPIRepository _youtubeRepository;

    @Value("${youtube.apikey}")
    private String _apiKey;


    public List<VideoDTO> searchKeyword(String keyword, int offset, int pageCount) {

        return getSearchList(keyword, offset, pageCount);
    }

    /**
     * 유튜브 API 응답을 DB에 저장하고 VideoDTO 리스트를 만들어서 컨트롤러에 반환한다.
     * @param keyword 검색어
     * @return 검색된 유튜브 동영상 리스트
     */
    private List<VideoDTO> getSearchList(String keyword, int offset, int videoCount){
        // 유튜브 API 호출
        //SearchListResponse res = getSearchListResponse(keyword, _apiKey);
        // API 호출결과를 DB에 저장
        // 일단 DB에 값을 넣기 위해 1번만 실행하고, 나중에 배치작업으로 DB에 넣어줘야 한다.
        // int cnt = saveVideoList(res);
        // DB에서 키워드로 검색하고 페이징처리해서 VideoDTO 리스트 만들어서 컨트롤러에 리턴,
        List<VideoDTO> videoDTOList = _youtubeRepository.getVideoListPaging(keyword, offset, videoCount);
        return videoDTOList;
    }

    /**
     * DB에서 키워드로 검색하여 페이징된 결과를 반환한다.
     * @param keyword 검색 키워드
     * @param offset 시작 페이지
     * @param videoCount 페이지당 영상 갯수
     */
    private List<VideoDTO> getVideoListPaging(String keyword, int offset, int videoCount){
        return _youtubeRepository.getVideoListPaging(keyword, offset, videoCount);
    }

    /**
     * 유튜브 검색결과를 DB에 저장한다.
     * @param searchListResponse 유튜브 API 반환값
     * @return insert 한 갯수
     */
    private int saveVideoList(SearchListResponse searchListResponse){
        List<SearchResult> list = searchListResponse.getItems();
        int rowCount = _youtubeRepository.saveVideoList(list);
//        for(SearchResult video : list){
//
//        }
        return rowCount;
    }

    /**
     * 유튜브 API를 호출하고 응답을 반환한다.
     *
     * 요청파라미터를 정의하는 방법은 아래의 링크에 정의되어 있다.
     * https://developers.google.com/youtube/v3/docs/search/list
     *
     * 모든 필드를 반환하는 것이 아니고 내가 필요한 필드들만 골라 받을 수 있다.
     * setFields 메소드에 문자열로 받고 싶은 필드들을 정의한다.
     * 정의할 수 있는 필드들은 아래의 링크에 정의되어 있다.
     * https://developers.google.com/youtube/v3/docs/search
     * @param keyword 검색어
     * @param apiKey API 인증키
     * @return 검색결과
     */
    private SearchListResponse getSearchListResponse(String keyword, String apiKey){
        SearchListResponse response = null;
        try{
            // 유튜브 객체 생성
            YouTube youtube = new YouTube.Builder(new NetHttpTransport(), GsonFactory.getDefaultInstance(), new HttpRequestInitializer() {
                public void initialize(HttpRequest request) throws IOException {
                }
            }).setApplicationName("lilac").build();

            // 키워드, 요청파라미터, 응답필드 설정
            YouTube.Search.List search = youtube.search().list("id,snippet");
            search.setKey(apiKey);
            search.setQ(keyword);
            search.setType("video");
            search.setMaxResults(50l);
            search.setOrder("date");
            search.setVideoDefinition("high");
            search.setVideoEmbeddable("true");
            
            // 응답필드 설정
            search.setFields("items(id/kind,id/videoId,id/playlistId,snippet/title,snippet/thumbnails/high/url,snippet/publishedAt,snippet/channelId,snippet/description,snippet/channelTitle)");
            response = search.execute(); // API 호출

        }catch(Exception e){
            e.printStackTrace();
         }
        return response;
    }
}
