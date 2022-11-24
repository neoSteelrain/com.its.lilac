package com.its.lilac.service;

import com.its.lilac.repository.LectureNoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LectureNoteService {

    @Autowired
    private LectureNoteRepository m_lectureNoteRepository;

    public boolean addLectureNote(long memberId, String lecTitle, String lecContents) {
        return m_lectureNoteRepository.addLectureNote(memberId, lecTitle, lecContents) > 0;
    }
}
