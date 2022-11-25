package com.its.lilac.service;

import com.its.lilac.datamodel.LectureNoteDTO;
import com.its.lilac.repository.LectureNoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LectureNoteService {

    @Autowired
    private LectureNoteRepository m_lectureNoteRepository;

    public boolean addLectureNote(long memberId, String lecTitle, String lecContents) {
        return m_lectureNoteRepository.addLectureNote(memberId, lecTitle, lecContents) > 0;
    }

    public List<LectureNoteDTO> getLectureNoteList(long memberId) {
        return m_lectureNoteRepository.getLectureNoteList(memberId);
    }

    public boolean removeLectureNote(long lectureNoteId) {
        return m_lectureNoteRepository.removeLectureNote(lectureNoteId) > 0;
    }

    public boolean addLicenseSchedule(long licScheduleId, long lctNoteId) {
        return m_lectureNoteRepository.addLicenseSchedule(licScheduleId, lctNoteId) > 0;
    }
}
