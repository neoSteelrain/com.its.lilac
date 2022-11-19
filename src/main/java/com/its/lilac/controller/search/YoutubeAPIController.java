package com.its.lilac.controller.search;


import com.google.api.services.youtube.model.SearchListResponse;
import com.its.lilac.datamodel.VideoDTO;
import com.its.lilac.service.YoutubeAPIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 유튜브 관련 기능을 처리하는 컨트롤러
 * 호춯하는 API : https://www.googleapis.com/youtube/v3/search
 */
@Controller
@RequestMapping("/search/youtube")
public class YoutubeAPIController {

    @Autowired
    private YoutubeAPIService m_youtubeService;



    @GetMapping("/keyword-search")
    @ResponseBody
    public List<VideoDTO> searchKeyword(@RequestParam("keyword") String keyword,
                                @RequestParam(value="offset", required=false, defaultValue="1")int offset,
                                @RequestParam(value="videoCount", required=false, defaultValue="8") int videoCount){
        List<VideoDTO> videoDTOList = null;
        try{
            videoDTOList = m_youtubeService.searchKeyword(keyword, offset, videoCount);
        }catch(Exception ioe){
        }
        return videoDTOList;
    }

    @GetMapping("/play")
    public String playVideo(@RequestParam("videoId") String videoId, Model model){
        VideoDTO video = m_youtubeService.getVideoInfo(videoId);
        model.addAttribute("video", video);
        return "/youtube/video-play";
    }
}
