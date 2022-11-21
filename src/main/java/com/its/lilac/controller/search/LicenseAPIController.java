package com.its.lilac.controller.search;

import com.its.lilac.datamodel.LicenseInfoDTO;
import com.its.lilac.datamodel.LicenseScheduleDTO;
import com.its.lilac.service.LicenseAPIService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/search/license")
public class LicenseAPIController {

    @Autowired
    private LicenseAPIService m_licenseAPIService;



    /**
     * 사용자가 검색한 자격증이름에 해당하는 자격증 종류를 반환한다.
     * @param keyword 검색하려는 자격증 이름
     * @return 자격증이름으로 검색된 자격증 목록
     */
    @GetMapping("/schedules-keyword")
    public String getLicenseInfo(@RequestParam("keyword") String keyword, Model model){
        model.addAttribute("lic-schedules", m_licenseAPIService.getLicenseSchedulesByKeyword(keyword));
        return "/license/license-template";
    }

/*
    @GetMapping("/schedules-code")
    public List<LicenseScheduleDTO> getLicenseSchedules(@RequestParam("licenseCode") int licenseCode){
        return m_licenseAPIService.getLicenseSchedules(licenseCode);
    }*/
}
