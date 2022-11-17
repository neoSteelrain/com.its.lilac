package com.its.lilac.controller.search;


import com.google.api.services.youtube.model.SearchListResponse;
import com.its.lilac.service.YoutubeAPIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 유튜브 관련 기능을 처리하는 컨트롤러
 * 호춯하는 API : https://www.googleapis.com/youtube/v3/search
 */
@Controller
@RequestMapping("/search/youtube")
public class YoutubeAPIController {

    @Autowired
    private YoutubeAPIService youtubeService;


    @GetMapping("/keyword-search")
    @ResponseBody
    public SearchListResponse keywordSearch(@RequestParam("keyword") String keyword){
        SearchListResponse searchListResponse = youtubeService.keywordSearch(keyword);
        return searchListResponse;
    }
}
