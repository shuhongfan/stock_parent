package com.shf.stock.common.domain;

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
}
