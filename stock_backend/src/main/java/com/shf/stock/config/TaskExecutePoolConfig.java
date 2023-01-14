package com.shf.stock.config;

import com.shf.stock.config.vo.TaskThreadPoolInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

@Configuration
@Slf4j
public class TaskExecutePoolConfig {

    @Autowired
    private TaskThreadPoolInfo taskThreadPoolInfo;

    @Bean
    public ThreadPoolTaskExecutor threadPoolTaskExecutor() {
//        1. 构建线程池对象
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();

//        2. 设置参数
//        2.1 设置核心线程数
        executor.setCorePoolSize(taskThreadPoolInfo.getCorePoolSize());

//        2.2 设置最大线程数
        executor.setMaxPoolSize(threadPoolTaskExecutor().getMaxPoolSize());

//        2.3 设置线程的最大存活时间
        executor.setKeepAliveSeconds(taskThreadPoolInfo.getKeepAliveSeconds());

//        2.4 设置任务队列
        executor.setQueueCapacity(taskThreadPoolInfo.getQueueCapacity());

//        2.5 设置线程池的任务拒绝策略
        executor.setRejectedExecutionHandler(new StockTaskRejectedExecutionHandler());

//        3.初始化参数
        executor.initialize();

//        4. 返回
        return executor;
    }

    /**
     * 自定义线程拒绝策略
     *
     * @return
     */
    @Bean
    public RejectedExecutionHandler rejectedExecutionHandler() {
        return new RejectedExecutionHandler() {
            @Override
            public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
                log.info("股票任务出现异常，发送邮件");
            }
        };
    }
}
