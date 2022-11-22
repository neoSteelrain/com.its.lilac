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
     * 사용자가 검색한 자격증이름에 해당하는 자격증 시험일정 리스트를 반환한다.
     * @param keyword 검색하려는 자격증 이름
     * @param model 뷰에 반환할 자격증 시험일정 리스트
     * @return 자격증이름으로 검색된 자격증 시험일정 리스트
     */
    @GetMapping("/schedules-keyword")
    public String getLicenseSchedulesByKeyword(@RequestParam("keyword") String keyword, Model model){
        // 입력문자열에 공백이 있으면 안되므로 trim 처리
        model.addAttribute("licSchedules", m_licenseAPIService.getLicenseSchedulesByKeyword(keyword.trim()));
        return "/license/license-template";
    }

    /**
     * 사용자가 입력한 자격증분류코드에 해당하는 자격증 시험일정 리스트를 반환한다.
     * 리스트형식이지만 실제로는 1개만 검색된다.
     * @param licenseCode 자격증 코드
     * @param model 뷰에 반환할 자격증 시험일정 리스트
     * @return 자격증이름으로 검색된 자격증 시험일정 리스트
     */
    @GetMapping("/schedules-category")
    public String getLicenseSchedulesByCode(@RequestParam("licenseCode") int licenseCode, Model model){
        if(licenseCode <= 0) {
            return "/license/license-template";
        }
        model.addAttribute("licSchedules", m_licenseAPIService.getLicenseSchedulesByCode(licenseCode));
        return "/license/license-template";
    }
}
