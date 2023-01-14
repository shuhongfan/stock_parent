package com.itheima;

import com.itheima.config.MyStockRunable;
import com.itheima.service.StockTimerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.HashMap;
import java.util.concurrent.TimeUnit;


@SpringBootTest
@Slf4j
public class ThreadpooltestApplicationTests {
    @Autowired
    private StockTimerService stockTimerService;

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    /**
     * 线程池小于等于核心线程数的情况
     *
     * @throws InterruptedException
     */
    @Test
    public void test1() throws InterruptedException {
        //获取线程池中当前线程数
        int poolSize = threadPoolTaskExecutor.getThreadPoolExecutor().getPoolSize();
        System.out.println("当前线程数：" + poolSize);

        int size = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
        System.out.println("当前压入队列的任务数:" + size);

        //获取当前的活跃线程数（正在处理任务的线程数）
        int activeCount = threadPoolTaskExecutor.getThreadPoolExecutor().getActiveCount();
        System.out.println("正在处理任务的线程数：" + activeCount);

        //当前完成的任务数
        long completedTaskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
        System.out.println("完成任务数：" + completedTaskCount);

        //获取总任务数
        long taskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
        System.out.println("总任务数：" + taskCount);

        //先并发3个任务
        for (int i = 0; i < 3; i++) {
            threadPoolTaskExecutor.execute(() -> {
                stockTimerService.stockRtInto();
            });
        }

        //执行完毕后，核心线程数达到3
        //主线程休眠2秒中，保证其它3个线程处于空闲状态
        TimeUnit.SECONDS.sleep(2);
        for (int i = 0; i < 2; i++) {
            threadPoolTaskExecutor.execute(() -> {
                stockTimerService.stockRtInto();
            });
        }

        //此时核心线程数是5
        while (true) {
            //获取线程池中当前线程数
            int poolSize2 = threadPoolTaskExecutor.getThreadPoolExecutor().getPoolSize();
            System.out.println("当前线程数：" + poolSize2);
            int size2 = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
            System.out.println("当前压入队列的任务数:" + size2);
            //获取当前的活跃线程数（正在处理任务的线程数）
            int activeCount2 = threadPoolTaskExecutor.getThreadPoolExecutor().getActiveCount();
            System.out.println("正在处理任务的线程数：" + activeCount2);
            //当前完成的任务数
            long completedTaskCount2 = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
            System.out.println("完成任务数：" + completedTaskCount2);
            //获取总任务数
            long taskCount2 = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
            System.out.println("总任务数：" + taskCount2);
        }
    }


    /**
     * 并发任务数大于核心线程数，且小于等于核心线程数+队列长度
     *
     * @throws InterruptedException
     */
//    @Test
//    public  void test2() throws InterruptedException {
//        //获取线程池中当前线
//        for (int i = 0; i < 15; i++) {
//            threadPoolTaskExecutor.execute(()->{
//                stockTimerService.stockRtInto();
//            });
//        }
//        //此时核心线程数是5
//        while (true){
//            //获取线程池中当前线程数
//            int poolSize2 = threadPoolTaskExecutor.getThreadPoolExecutor().getPoolSize();
//            System.out.println("当前线程数："+poolSize2);
//            int size2 = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
//            System.out.println("当前压入队列的任务数:"+size2);
//            //获取当前的活跃线程数（正在处理任务的线程数）
//            int activeCount2 = threadPoolTaskExecutor.getThreadPoolExecutor().getActiveCount();
//            System.out.println("正在处理任务的线程数："+activeCount2);
//            //当前完成的任务数
//            long completedTaskCount2 = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
//            System.out.println("完成任务数："+completedTaskCount2);
//            //获取总任务数
//            long taskCount2 = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
//            System.out.println("总任务数："+taskCount2);
//            TimeUnit.MILLISECONDS.sleep(50);
//        }
//    }
    @Test
    public void contextLoads() throws InterruptedException {
        //线程池初始化线程数为0
        log.info("线程池初始化大小:{}", threadPoolTaskExecutor.getPoolSize());
        for (int i = 0; i < 15; i++) {
            threadPoolTaskExecutor.execute(() -> {
                stockTimerService.stockRtInto();
            });
            //获取线程池内最新的线程数量
            //发现在没有达到核心线程数时，哪怕有新的任务，也依旧开启新的线程执行
            log.info("当前线池内的程数为：{}", threadPoolTaskExecutor.getPoolSize());
        }
        log.info("########任务线程构建完毕");


        while (true) {
            int queueSize = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
            log.info("当前阻塞队列任务数：{}", queueSize);
            log.info("当前活动线程数：{}", threadPoolTaskExecutor.getActiveCount());
            long completedTaskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
            log.info("线程池完成任务数：{}", completedTaskCount);
            //当所有任务都完成后，那么completedTaskCount=taskCount
            long taskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
            log.info("总线池总任务数：{}", taskCount);
            try {
                Thread.sleep(800);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            //获取线程池内最新的线程数量
            log.info("当前线池内的程数为：{}", threadPoolTaskExecutor.getPoolSize());
            log.info("############################");
        }
    }

    /**
     * 测试并发线程任务大于核心线程数+任务队列长度 且小于等于 最大线程数+任务队列长度
     *
     * @throws InterruptedException
     */
    @Test
    public void contextLoads3() throws InterruptedException {
        //线程池初始化线程数为0   5--》核心线程处理 后10--》要入队列 最后的5：有新建的临时线程处理
        log.info("线程池初始化大小:{}", threadPoolTaskExecutor.getPoolSize());
        for (int i = 0; i < 20; i++) {
            threadPoolTaskExecutor.execute(() -> {
                stockTimerService.stockRtInto();
            });
            //获取线程池内最新的线程数量
            //发现在没有达到核心线程数时，哪怕有新的任务，也依旧开启新的线程执行
            log.info("当前线池内的程数为：{}", threadPoolTaskExecutor.getPoolSize());
        }
        log.info("########任务线程构建完毕");


        while (true) {
            int queueSize = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
            log.info("当前阻塞队列任务数：{}", queueSize);
            log.info("当前活动线程数：{}", threadPoolTaskExecutor.getActiveCount());
            long completedTaskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
            log.info("线程池完成任务数：{}", completedTaskCount);
            //当所有任务都完成后，那么completedTaskCount=taskCount
            long taskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
            log.info("总线池总任务数：{}", taskCount);
            try {
                Thread.sleep(800);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            //获取线程池内最新的线程数量
            log.info("当前线池内的程数为：{}", threadPoolTaskExecutor.getPoolSize());
            log.info("############################");
        }
    }

    /**
     * 测试并发线程任务大于（最大线程数+任务队列长度）21
     *
     * @throws InterruptedException
     */
    @Test
    public void contextLoads4() throws InterruptedException {
        //线程池初始化线程数为0   5--》核心线程处理 || 后10--》要入队列 || 最后的5：有新建的临时线程处理 || 最后一个触发拒绝策略（默认抛出异常，终止程序）
        log.info("线程池初始化大小:{}", threadPoolTaskExecutor.getPoolSize());
        for (int i = 0; i < 21; i++) {
            HashMap<Object, Object> map = new HashMap<>();
            map.put("type", "handler stock");
            map.put("size", 10);
            threadPoolTaskExecutor.execute(new MyStockRunable(map, stockTimerService));
            //获取线程池内最新的线程数量
            //发现在没有达到核心线程数时，哪怕有新的任务，也依旧开启新的线程执行
            log.info("当前线池内的程数为：{}", threadPoolTaskExecutor.getPoolSize());
        }
        log.info("########任务线程构建完毕");


        while (true) {
            int queueSize = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
            log.info("当前阻塞队列任务数：{}", queueSize);
            log.info("当前活动线程数：{}", threadPoolTaskExecutor.getActiveCount());
            long completedTaskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
            log.info("线程池完成任务数：{}", completedTaskCount);
            //当所有任务都完成后，那么completedTaskCount=taskCount
            long taskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
            log.info("总线池总任务数：{}", taskCount);
            try {
                Thread.sleep(800);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            //获取线程池内最新的线程数量
            log.info("当前线池内的程数为：{}", threadPoolTaskExecutor.getPoolSize());
            log.info("############################");
        }
    }

    @Test
    public void getCpuCores() {
        int cors = Runtime.getRuntime().availableProcessors();
        System.out.println(cors);
    }
}
