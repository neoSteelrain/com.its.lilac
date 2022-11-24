package com.its.lilac.repository;

import com.its.lilac.datamodel.LectureNoteDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class LectureNoteRepository {

    @Autowired
    private SqlSessionTemplate m_sql;

    public int addLectureNote(long memberId, String lecTitle, String lecContents) {
        Map<String, Object> param = new HashMap<>(3);
        param.put("memberId", memberId);
        param.put("lecTitle", lecTitle);
        param.put("lecContents", lecContents);
        return m_sql.insert("Lecture.addLectureNote", param);
    }

    public List<LectureNoteDTO> getLectureNoteList(long memberId) {
        return m_sql.selectList("Lecture.getLectureNoteList", memberId);
    }
}
