package com.shf.stock.common.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author by itheima
 * @Date 2022/2/28
 * @Description 股票板块domain
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StockBlockDomain {
    /**
     * 公司数量
     */
    private Integer companyNum;
    /**
     * 交易量
     */
    private Long tradeAmt;
    /**
     * 板块编码
     */
    private String code;
    /**
     * 平均价
     */
    private BigDecimal avgPrice;
    /**
     * 板块名称
     */
    private String name;
    /**
     * 当前日期
     */
    private String curDate;
    /**
     *交易金额
     */
    private BigDecimal tradeVol;
    private String updownRate;
}
