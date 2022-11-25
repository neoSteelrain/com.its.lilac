package com.its.lilac.datamodel;

import lombok.Data;

/**
 * LicenseDTO 는 자격증을 나타내는 클래스
 * 자격증의 이름, 종목코드, 시험일정을 모두 가지고 있는 DTO
 */
@Data
public class LicenseDTO {
    private int license_code;
    private String license_name;
    // 자격증의 시험일정을 전부가지고 있는 클래스, API 호출의 결과 JSON을 역직렬화한 한것.
    private LicenseScheduleJsonDTO license_schedule_json;
    
    /*
     뷰에 사용할 필드들. DB와는 상관이 없다.
     */
    // 진행단계
    private String lic_step;
    // 종료일자
    private String lic_end_date;
    // 자격증 설명
    private String lic_desc;
}
