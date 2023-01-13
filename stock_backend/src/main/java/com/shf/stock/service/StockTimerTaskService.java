package com.shf.stock.service;

/**
 * 定义采集股票信息的服务
 */
public interface StockTimerTaskService {

//    股票国内大盘数据采集
    void collectInnerMarketInfo();

    //    股票实时数据采集
    void collectAshareInfo();

    /**
     * 获取板块数据
     */
    void getStockSectorRtIndex();
}
