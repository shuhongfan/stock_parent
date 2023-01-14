package com.itheima.config;

import com.itheima.service.StockTimerService;

import java.util.Map;

/**
 * @author by itheima
 * @Date 2022/3/21
 * @Description
 */
public class MyStockRunable implements Runnable{

    private Map info;

    private StockTimerService stockTimerService;

    public MyStockRunable(Map info, StockTimerService stockTimerService) {
        this.info = info;
        this.stockTimerService = stockTimerService;
    }

    @Override
    public void run() {
        stockTimerService.stockRtInto();
    }

    public Map getInfo() {
        return info;
    }
}
