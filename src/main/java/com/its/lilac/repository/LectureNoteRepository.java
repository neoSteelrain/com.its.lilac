package com.its.lilac.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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
}
