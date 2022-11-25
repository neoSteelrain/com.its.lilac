package com.its.lilac.repository;

import com.its.lilac.datamodel.LicenseCategoryDTO;
import com.its.lilac.datamodel.LicenseDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class LicenseAPIRepository {

    @Autowired
    private SqlSessionTemplate m_sql;

    public List<LicenseCategoryDTO> getLicenseCategoryList() {
        return m_sql.selectList("License.licenseCodeList");
    }

    public List<LicenseDTO> getLicenseInfoList(String keyword){
        return m_sql.selectList("License.licenseListByKeyword", keyword);
    }

    public LicenseDTO getLicenseInfo(int licenseCode) {
        return m_sql.selectOne("License.licenseInfoByCode", licenseCode);
    }

    public int updateLicenseJson(int lic_code, String jsonString) {
        Map<String, Object> param = new HashMap<>(2);
        param.put("lic_code", lic_code);
        param.put("jsonString", jsonString);
        return m_sql.update("License.updateLicenseJson", param);
    }
}
