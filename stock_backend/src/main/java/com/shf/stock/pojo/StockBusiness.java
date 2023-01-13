package com.shf.stock.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * 主营业务表
 * @TableName stock_business
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StockBusiness implements Serializable {
    /**
     *  股票编码
     */
    private String secCode;

    /**
     * 股票名称
     */
    private String secName;

    /**
     * 行业板块代码
     */
    private String sectorCode;

    /**
     * 行业板块名称
     */
    private String sectorName;

    /**
     * 主营业务
     */
    private String business;

    /**
     * 更新时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}