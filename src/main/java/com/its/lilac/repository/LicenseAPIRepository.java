package com.its.lilac.repository;

import com.its.lilac.datamodel.LicenseInfoDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LicenseAPIRepository {

    @Autowired
    private SqlSessionTemplate m_sql;

    public List<LicenseInfoDTO> getLicenseCode(String licenseName) {
        return m_sql.selectOne("licenseCode", licenseName);
    }
}
