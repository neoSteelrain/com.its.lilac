package com.its.lilac.controller.lecture;

import com.its.lilac.common.RESPONSEBODY_RESULT_STING;
import com.its.lilac.datamodel.LectureNoteDTO;
import com.its.lilac.service.LectureNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/lecture")
public class LectureNoteController {

    @Autowired
    private LectureNoteService m_lectureNoteService;


    @GetMapping("/lecture-note-list")
    public String getLectureNoteList(@RequestParam("memberId") long memberId, Model model){
        List<LectureNoteDTO> noteList = m_lectureNoteService.getLectureNoteList(memberId);
        model.addAttribute("memberId", memberId);
        model.addAttribute("noteList", noteList);
        return "/lecture/lecture-note";
    }

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

    @GetMapping("/remove-lecture-note")
    @ResponseBody
    public String removeLectureNote(@RequestParam("lectureNoteId") long lectureNoteId){
        boolean isRemoved = m_lectureNoteService.removeLectureNote(lectureNoteId);
        return  isRemoved ? RESPONSEBODY_RESULT_STING.YES : RESPONSEBODY_RESULT_STING.NO;
    }

    @GetMapping("/add-schedule")
    @ResponseBody
    public String addLicenseSchedule(@RequestParam("license_schedule_id") long licScheduleId,
                              @RequestParam("lct_note_id") long lctNoteId){
        boolean isAdded = m_lectureNoteService.addLicenseSchedule(licScheduleId, lctNoteId);
        return isAdded ? RESPONSEBODY_RESULT_STING.YES : RESPONSEBODY_RESULT_STING.NO;
    }
}
