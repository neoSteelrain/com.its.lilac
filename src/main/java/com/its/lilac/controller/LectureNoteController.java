package com.its.lilac.controller;

import com.its.lilac.common.RESPONSEBODY_RESULT_STING;
import com.its.lilac.service.LectureNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/lecture")
public class LectureNoteController {

    @Autowired
    private LectureNoteService m_lectureNoteService;


    @GetMapping("/lecture-note-list")
    public String getLectureNoteList(@RequestParam("memberId") String memberId, Model model){
        model.addAttribute("memberId", memberId);
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
}
