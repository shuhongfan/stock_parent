package com.itheima.config;

import lombok.extern.slf4j.Slf4j;

import java.util.Map;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author by itheima
 * @Date 2022/3/21
 * @Description 自定义拒绝策略
 */
@Slf4j
public class StockTaskRejectedExecutionHandler implements RejectedExecutionHandler {
    /**
     * 具体执行拒绝策略的方法
     * @param r 当前封装的任务对象
     * @param executor 线程池对象
     */
    @Override
    public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {

       if( r instanceof MyStockRunable){
           MyStockRunable r1 = (MyStockRunable) r;
           Map map = r1.getInfo();
           System.out.println(map.get("type"));
           System.out.println(map.get("size"));
           //保存在数据库或者日志文件下
       }

        System.out.println("线程拒绝策略执行开始----");
        int queueSize = executor.getQueue().size();
        log.info("当前阻塞队列任务数：{}" , queueSize);
        log.info("当前活动线程数：{}" ,executor.getActiveCount());
        long completedTaskCount = executor.getCompletedTaskCount();
        log.info("线程池完成任务数：{}" ,completedTaskCount);
        //当所有任务都完成后，那么completedTaskCount=taskCount
        long taskCount = executor.getTaskCount();
        log.info("总线池总任务数：{}" ,taskCount);
        System.out.println("线程拒绝策略执行结束----");
    }


}
