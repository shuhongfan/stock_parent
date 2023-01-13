package com.shf.stock.config.vo;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;

@ConfigurationProperties(prefix = "stock")
@Data
public class StockInfoConfig {

    /**
     * a股大盘ID集合
     */
    private List<String> inner;

    /**
     * 外盘ID集合
     */
    private List<String> outer;

    /**
     * 股票涨幅区间顺序定义
     */
    private List<String> upDownRange;

    //大盘参数获取url
    private String marketUrl;

    //板块参数获取url
    private String blockUrl;
}
