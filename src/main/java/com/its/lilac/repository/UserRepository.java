package com.its.lilac.repository;

import com.its.lilac.datamodel.UserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepository {

    @Autowired
    private SqlSessionTemplate m_sql;

    public int checkDuplicatedEmail(String email) {
        return m_sql.selectOne("Member.checkDuplicatedEmail", email);
    }

    public int userRegistration(UserDTO userDTO) {
        return m_sql.insert("Member.userRegistration", userDTO);
    }
}
