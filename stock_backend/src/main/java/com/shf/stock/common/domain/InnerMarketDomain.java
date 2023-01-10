package com.shf.stock.common.domain;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class InnerMarketDomain {
    /*
     jdbc:bigint--->java:long
    */
    private Long tradeAmt;
    /*
        jdbc:decimal --->java:BigDecimal
     */
    private BigDecimal preClosePrice;
    private String code;
    private String name;
    private String curDate;
    private BigDecimal openPrice;
    private Long tradeVol;
    private BigDecimal upDown;
    private BigDecimal tradePrice;
}
