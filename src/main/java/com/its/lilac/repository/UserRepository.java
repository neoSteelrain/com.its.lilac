package com.its.lilac.repository;

import com.its.lilac.datamodel.UserDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class UserRepository {

    @Autowired
    private SqlSessionTemplate m_sql;

    public int checkDuplicatedEmail(String email) {
        return m_sql.selectOne("User.checkDuplicatedEmail", email);
    }

    public int userRegistration(UserDTO userDTO) {
        return m_sql.insert("User.userRegistration", userDTO);
    }

    public UserDTO userLogIn(String email, String password) {
        Map<String, String> param = new HashMap<>(2);
        param.put("email", email);
        param.put("password", password);
        return m_sql.selectOne("User.userLogIn", param);
    }
}
