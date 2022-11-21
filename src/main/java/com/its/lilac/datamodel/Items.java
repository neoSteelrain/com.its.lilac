package com.its.lilac.datamodel;

import lombok.Data;

@Data
public class Items {
    private String pracPassDt;
    private String pracExamEndDt;
    private String pracExamStartDt;
    private String pracRegEndDt;
    private String pracRegStartDt;
    private String docPassDt;
    private String docExamEndDt;
    private String docExamStartDt;
    private String docRegEndDt;
    private String docRegStartDt;
    private String description;
    private String qualgbNm;
    private String qualgbCd;
    private int implSeq;
    private String implYy;
}
