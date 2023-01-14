package com.shf.stock.job;

import com.shf.stock.service.StockTimerTaskService;
import com.xxl.job.core.handler.annotation.XxlJob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class StockTimerJob {

    @Autowired
    private StockTimerTaskService stockTimerTaskService;

    @XxlJob("hema_job_test")
    public void jobTest() {
        System.out.println("jobTest run.....");
    }

    /**
     * 采集大盘数据
     */
    @XxlJob("getInnerMarketInfos")
    public void getInnerMarketInfos() {
        stockTimerTaskService.collectInnerMarketInfo();
    }

    @XxlJob("getAshareInfos")
    public void getAshareInfos() {
        stockTimerTaskService.collectAshareInfo();
    }
}
