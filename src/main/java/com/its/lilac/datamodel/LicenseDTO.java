package com.its.lilac.datamodel;

import lombok.Data;

@Data
public class LicenseDTO {
    private int license_code;
    private String license_name;
    private LicenseScheduleJsonDTO license_schedule_json;
    
    // 뷰에 사용할 필드들. DB와는 상관이 없다.
    // 진행단계
    private String lic_step;
    // 종료일자
    private String lic_end_date;
    // 자격증 설명
    private String lic_desc;
}
