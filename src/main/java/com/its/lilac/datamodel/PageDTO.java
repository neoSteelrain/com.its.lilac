package com.its.lilac.datamodel;

import lombok.Data;

@Data
public class PageDTO {
    private int page; // 현재 페이지
    private int maxPage; // 필요한 페이지 갯수
    private int startPage; // 시작 페이지
    private int endPage; // 끝 페이지
}

/*
// 진행단계
    private String lic_step;
    // 종료일자
    private String lic_end_date;
    // 자격증 설명
    private String lic_desc;
 */