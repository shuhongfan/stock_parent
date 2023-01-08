package com.shf.stock.pojo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * 股票大盘数据详情表
 * @TableName stock_market_index_info
 */
@Data
public class StockMarketIndexInfo implements Serializable {
    /**
     * 主键字段（无业务意义）
     */
    private String id;

    /**
     * 大盘ID
     */
    private String markId;

    /**
     * 当前时间
     */
    private Date curTime;

    /**
     * 指数名称
     */
    private String markName;

    /**
     * 当前点数
     */
    private BigDecimal curPoint;

    /**
     * 当前价格
     */
    private BigDecimal currentPrice;

    /**
     * 涨跌率
     */
    private BigDecimal updownRate;

    /**
     * 成交量（多少手）
     */
    private Long tradeAccount;

    /**
     * 成交额(万元)
     */
    private Long tradeVolume;

    private static final long serialVersionUID = 1L;
}