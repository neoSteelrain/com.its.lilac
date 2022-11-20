package com.its.lilac.controller.search;

import com.its.lilac.common.PAIGING_CONFIG;
import com.its.lilac.datamodel.PageDTO;
import com.its.lilac.datamodel.VideoDTO;
import com.its.lilac.service.YoutubeAPIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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


    /**
     * 유튜브API에 검색어를 설정해서 결과를 반환한다.
     * 뷰에서 ajax 호출결과로 HTML텍스트를 받아야 하기 때문에
     * ajax 클라이언트에 반환값을 바로 넘기지 않고, 중간에 템플릿페이지를 통해 뷰로 반환할 HTML 코드를 만든다.
     * 예외가 발생하면 갯수가 0 인 Video 리스트를 반환한다.
     * @param keyword 검색어
     * @param offset 페이징할 시작 페이지
     * @param videoCount 1개의 페이지에 보여줄 영상의 갯수
     * @param model 영상 리스트, 페이징 정보
     * @return HTML코드를 만들 템플릿페이지
     */
    @GetMapping("/keyword-search")
    public String searchKeyword(@RequestParam("keyword") String keyword,
                                @RequestParam(value = "offset", required = false, defaultValue = "1") int offset,
                                @RequestParam(value = "videoCount", required = false, defaultValue = "8") int videoCount,
                                Model model) {
        List<VideoDTO> videoDTOList = null;
        try {
            videoDTOList = m_youtubeService.searchKeyword(keyword, offset, videoCount);
            model.addAttribute("videoList", videoDTOList);
            model.addAttribute("videoPaging", m_youtubeService.getPagingParam(keyword, offset, videoCount));
        } catch (Exception ioe) {
            // 예외가 발생할 경우 검색결과가 없도록 보여준다.
            model.addAttribute("videoList", new ArrayList<VideoDTO>(0));
            ioe.printStackTrace();
        }
        return "/youtube/paging-template";
    }

    /**
     * 사용자가 선택한 영상을 플레이하기 위한 컨트롤러
     * 새로운 페이지로 이동하며 해당영상의 조회수를 증가시켜 준다
     * @param videoId 플레이할 영상의 ID
     * @param model 플레이할 영상의 정보
     * @return 영상을 플레이할 페이지
     */
    @GetMapping("/play")
    public String playVideo(@RequestParam("videoId") String videoId, Model model) {
        VideoDTO video = m_youtubeService.getVideoInfo(videoId);
        model.addAttribute("video", video);
        return "/youtube/video-play";
    }
}
