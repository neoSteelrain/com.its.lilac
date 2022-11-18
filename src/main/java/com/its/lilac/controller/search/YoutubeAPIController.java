package com.its.lilac.controller.search;


import com.google.api.services.youtube.model.SearchListResponse;
import com.its.lilac.datamodel.VideoDTO;
import com.its.lilac.service.YoutubeAPIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.List;

/**
 * 유튜브 관련 기능을 처리하는 컨트롤러
 * 호춯하는 API : https://www.googleapis.com/youtube/v3/search
 */
@Controller
@RequestMapping("/search/youtube")
public class YoutubeAPIController {

    @Autowired
    private YoutubeAPIService _youtubeService;


    /**
     * 사용자가 입력한 검색어를 키워드로 유튜브영상 리스트를 페이징하여 뷰로 반환한다.
     * @param keyword 검색 키워드
     * @param offset 시작 페이지
     * @param videoCount 페이지당 영상 갯수
     * @return 페이징된 영상 리스트
     * @throws IOException
     */
    @GetMapping("/keyword-search")
    @ResponseBody
    public String searchKeyword(@RequestParam("keyword") String keyword,
                                @RequestParam("offset")int offset,
                                @RequestParam("videoCount") int videoCount) throws IOException {
        List<VideoDTO> videoDTOList = _youtubeService.searchKeyword(keyword, offset, videoCount);

        return videoDTOList.toString();
    }
}
