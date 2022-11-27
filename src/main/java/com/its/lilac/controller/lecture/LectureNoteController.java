package com.its.lilac.controller.lecture;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.its.lilac.common.RESPONSEBODY_RESULT_STING;
import com.its.lilac.common.SESSION_KEY;
import com.its.lilac.datamodel.LectureNoteDTO;
import com.its.lilac.exception.LectureNoteException;
import com.its.lilac.service.LectureNoteService;
import org.apache.ibatis.annotations.One;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/lecture")
public class LectureNoteController {

    @Autowired
    private LectureNoteService m_lectureNoteService;


    /**
     * 회원의 강의노트 리스트를 반환한다.
     * @param memberId 회원 ID
     * @param model
     * @return ajax 응답으로 리턴할 페이지
     */
    @GetMapping("/lecture-note-list")
    public String getLectureNoteList(@RequestParam("memberId") long memberId, Model model){
        List<LectureNoteDTO> noteList = m_lectureNoteService.getLectureNoteList(memberId);
        if(noteList == null){
            noteList = new ArrayList<>(0);
        }
        model.addAttribute("memberId", memberId);
        model.addAttribute("noteList", noteList);
        return "/lecture/lecture-note";
    }

    @GetMapping(value = "/lecture-note-list-json", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getLectureNoteJsonList(HttpSession httpSession){
        Object tmp = httpSession.getAttribute(SESSION_KEY.MEMBER_ID);
        if(tmp == null)
              return RESPONSEBODY_RESULT_STING.NO;

        String result = null;
        ObjectMapper om = new ObjectMapper();
        long memberId = (long) httpSession.getAttribute(SESSION_KEY.MEMBER_ID);
        try{

            result = om.writerWithDefaultPrettyPrinter().writeValueAsString(m_lectureNoteService.getLectureNoteList(memberId));
        }catch(JsonProcessingException jpe){
            jpe.printStackTrace();
            result = RESPONSEBODY_RESULT_STING.ERROR;
        }
        return result;
    }

    /**
     * 강의노트 리스트에 강의노트를 추가한다.
     * @param lecTitle 강의노트 제목
     * @param lecContents 강의노트 설명
     * @param memberId 회원 ID
     * @return 추가 성공 : "YES", 실패 : "NO"
     */
    @PostMapping("/add-lecture_note")
    @ResponseBody
    public String addLectureNote(@RequestParam("lecTitle") String lecTitle,
                                @RequestParam("lecContents") String lecContents,
                                @RequestParam("memberId") long memberId){
        String m_lecTitle = lecTitle.trim();
        String m_lecContents = lecContents.trim();
        boolean isAdded = m_lectureNoteService.addLectureNote(memberId, m_lecTitle, m_lecContents);
        return isAdded ? RESPONSEBODY_RESULT_STING.YES : RESPONSEBODY_RESULT_STING.NO;
    }

    /**
     * 강의노트 리스트에서 강의노트를 삭제한다.
     * @param lectureNoteId 삭제할 강의노트 ID
     * @return 삭제 성공 : "YES", 실패 : "NO"
     */
    @GetMapping("/remove-lecture-note")
    @ResponseBody
    public String removeLectureNote(@RequestParam("lectureNoteId") long lectureNoteId){
        boolean isRemoved = m_lectureNoteService.removeLectureNote(lectureNoteId);
        return  isRemoved ? RESPONSEBODY_RESULT_STING.YES : RESPONSEBODY_RESULT_STING.NO;
    }

    @GetMapping("/add-license-note")
    @ResponseBody
    public String addLicenseToNote(@RequestParam("licenseCode") long licenseCode,
                                     @RequestParam("lectureNoteId") long lectureNoteId){
        boolean isAdded = m_lectureNoteService.addLicenseToNote(licenseCode, lectureNoteId);
        return isAdded ? RESPONSEBODY_RESULT_STING.YES : RESPONSEBODY_RESULT_STING.NO;
    }

    @GetMapping("/add-video")
    @ResponseBody
    public String addVideoToLectureNote(@RequestParam("videoId") String videoId,
                                        @RequestParam("lectureNoteId") long lectureNoteId,
                                        HttpSession httpSession){

        Object tmp = httpSession.getAttribute(SESSION_KEY.MEMBER_ID);
        if(tmp == null)
            throw new LectureNoteException("유튜브 영상을 강의노트에 추가하는 도중 예외 발생. 세션에 회원 ID 가 없습니다.");

        boolean isAdded = m_lectureNoteService.addVideoToLicenseNote(videoId, lectureNoteId, (long) tmp);
        return isAdded ? RESPONSEBODY_RESULT_STING.YES : RESPONSEBODY_RESULT_STING.NO;
    }
}
