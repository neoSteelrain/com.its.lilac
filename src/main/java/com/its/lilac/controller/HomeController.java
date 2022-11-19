package com.its.lilac.controller;

import com.its.lilac.datamodel.VideoDTO;
import com.its.lilac.service.YoutubeAPIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private YoutubeAPIService m_youtubeAPIService;

    /**
     * 랜딩페이지로 가는 컨트롤러
     * 첫화면에서 보여줄 정보는 관리자가 설정한
     * 추천 유튜브영상 목록을 포함한다.
     * @param model
     * @return
     */
    @GetMapping("/")
    public String index(Model model){
        model.addAttribute("videoList", getRecommendedVideoList());
        return "/index";
    }

    /**
     * 추천 영상 목록을 가져온다.
     * @return 관리자가 설정한 추천영상목록
     */
    public List<VideoDTO> getRecommendedVideoList(){
        return m_youtubeAPIService.getRecommendedVideoList();
    }
}
