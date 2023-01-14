package com.itheima.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * @author by itheima
 * @Date 2022/1/7
 * @Description
 */
@Service
@Slf4j
public class StockTimerService {
    /**
     * 拉取股票服务
     */
    public void stockRtInto() {
        //模拟网络I/O  1000毫秒
        try {
            TimeUnit.MILLISECONDS.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
