package com.shf.stock;

import com.shf.stock.service.StockTimerTaskService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class TestStockCollect {

    @Autowired
    private StockTimerTaskService stockTimerTaskService;

    @Test
    public void testCollectInner() {
        stockTimerTaskService.collectInnerMarketInfo();
    }

    @Test
    public void testCollectAShare() {
        stockTimerTaskService.collectAshareInfo();
    }

    @Test
    public void testCollect() {
        stockTimerTaskService.getStockSectorRtIndex();
    }
}
