package com.its.lilac.datamodel;

import lombok.Data;

@Data
public class LicenseScheduleDTO {
    private long license_schedule_id;
    private String license_title;
    private LicenseRawDataDTO license_schedule_json;
    private int license_code;
    // 진행단계
    private String lic_step;
    // 종료일자
    private String lic_end_date;
    // 자격증 설명
    private String lic_desc;
}
