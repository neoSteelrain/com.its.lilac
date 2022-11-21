package com.its.lilac.controller;

import com.its.lilac.datamodel.LicenseInfoDTO;
import com.its.lilac.datamodel.VideoDTO;
import com.its.lilac.service.LicenseAPIService;
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

    @Autowired
    private LicenseAPIService m_licenseAPIService;

    /**
     * 랜딩페이지로 가는 컨트롤러
     * 첫화면에서 보여줄 정보는 관리자가 설정한
     * 추천 유튜브영상 목록을 포함한다.
     * @param model
     * @return
     */
    @GetMapping("/")
    public String index(Model model){
        // 추천영상 목록세팅
        model.addAttribute("videoList", getRecommendedVideoList());
        // 검색분류 세팅
        model.addAttribute("licenseList", getLicenseList());
        return "/index";
    }

    /**
     * 추천 영상 목록을 가져온다.
     * @return 관리자가 설정한 추천영상목록
     */
    private List<VideoDTO> getRecommendedVideoList(){
        return m_youtubeAPIService.getRecommendedVideoList();
    }

    /**
     * DB에 등록된 자격증 목록을 가져온다.
     * @return 자격증 리스트
     */
    private List<LicenseInfoDTO> getLicenseList(){
        return m_licenseAPIService.getLicenseList();
    }
}
