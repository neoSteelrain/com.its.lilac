package com.its.lilac.datamodel;

import lombok.Data;

import java.util.List;

@Data
public class Body {
    private int totalCount;
    private int pageNo;
    private int numOfRows;
    private List<Items> items;
}
