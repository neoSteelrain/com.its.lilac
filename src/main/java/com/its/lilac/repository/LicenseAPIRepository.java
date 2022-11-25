package com.its.lilac.repository;

import com.its.lilac.datamodel.LicenseDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LicenseAPIRepository {

    @Autowired
    private SqlSessionTemplate m_sql;

    public List<LicenseDTO> getLicenseInfoList() {
        return m_sql.selectList("License.licenseCodeList");
    }

    public List<LicenseDTO> getLicenseInfoList(String keyword){
        return m_sql.selectList("License.licenseListByKeyword", keyword);
    }

    public LicenseDTO getLicenseInfo(int licenseCode) {
        return m_sql.selectOne("License.licenseInfoByCode", licenseCode);
    }
}
