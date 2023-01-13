---
typora-copy-images-to: img
---

# 今日指数-day06

## 今日目标

~~~tex
1.分析并理解当前股票采集功能存在的问题;
2.理解XXLJOB的基本使用和使用场景;
  2.1 掌握xxljob的基本使用;
  2.2 理解cron表达式;
3.理解xxljob集成到项目的基本流程;
  3.1 自定义任务执行器;
  3.2 分析国内大盘的开盘周期，自定义适合的cron表达式;
  3.3 完成大盘、股票流水、板块数据定义采集功能; 
4.多线程优化股票流水采集功能;
5.理解线程池基本工作原理和参数设置原则;
6.RestTemplate集成HttpClinet连接池(扩展);
~~~

## 1.分析数据采集存在的问题

#### 1）股票流水数据采集问题

~~~tex
当前我们仅仅完成了股票数据瞬时的采集工作，但是实际上在每一个股票工作日，每时每刻都会产生数据，所以我们需要定时定量的采集股票最新的数据；
~~~

![image-20220107021843687](img/image-20220107021843687.png)

#### 2）数据库批量插入耗时问题

~~~tex
目前，股票或者板块的数据在批量插入时是串行执行的，显然I/O时间成本比较高，所以，我们可引入多线程并发插入，提高操作效率；
~~~

![image-20220113122232308](img/image-20220113122232308.png)

#### 3）线程复用和挤压问题

~~~tex
1.当前项目是单体架构，股票数据采集线程和主业务线程共享，可能会因为股票采集线程长时占用，导致主业务线程无法正常提供有效服务的情况（主业务线程饥饿）；
2.构建和销毁线程带来的开销非常大，我们尽量提高线程的复用性；
-->我们使用线程池加以隔离；
~~~

![image-20220113125101929](img/image-20220113125101929.png)

## 2.定时任务框架-xxljob

~~~tex
针对股票流水的采集问题，我们的方案是定时（间隔一分钟）拉取股票实时数据，
所以我们就有必要学习相关定时任务的一些框架知识了，当前我们的项目中采用了xxljob实现股票数据定时采集；
~~~

### 2.1 Xxljob介绍

#### 1）xxljob概述

~~~json
官方地址：http://www.xuxueli.com/xxl-job
XXL-JOB是一个轻量级分布式任务调度平台，其核心设计目标是开发迅速、学习简单、轻量级、易扩展。现已开放源代码并接入多家公司线上产品线，开箱即用。
目前已有多家公司接入xxl-job，包括比较知名的大众点评，京东，优信二手车，北京尚德，360金融 (360)，联想集团 (联想)，易信 (网易)等;
~~~

#### 2）XXL-JOB特性

![image-20220102152510062](img/image-20220102152510062.png)

更多详情见官网.

#### 3) 整体架构

![xxljob精简架构图](img/xxljob精简架构图.png)

#### 4）入门资料准备

![image-20220102145924817](img/image-20220102145924817.png)

![image-20220102150051903](img/image-20220102150051903.png)

考虑到网络原因，我们选择gitee下的开源地址下载：

![image-20220102150328790](img/image-20220102150328790.png)

选择最新的2.30版本下载；

资料已经下载：**day06\资料\xxljob\xxl-job-2.3.0.zip**

### 2.2 xxljob快速入门

#### 1）导入xxljob工程

![image-20220102153303653](img/image-20220102153303653.png)

#### 2）配置数据库

![image-20220115095650494](img/image-20220115095650494.png)

##### 1.初始化SQL脚本

将xxljob提供的初始化SQL脚本导入数据库：

![image-20220102153736369](img/image-20220102153736369.png)

整体如下：

![image-20220102153808757](img/image-20220102153808757.png)

注意：

如果表xxl_job_registry导入过程报Specified key was too long; max key length is 767 bytes错误，则尝试将联合主键关联的varchar改小一些即可：

~~~sql
CREATE TABLE `xxl_job_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
> 1071 - Specified key was too long; max key length is 767 bytes
> 时间: 0s
解决：将varchar修改为100即可;
使用的字符集为（utf8mb4），这个指每个字符最大的字节数为4，所以很明显 4*255 > 767
~~~

##### 2.配置数据库环境

![image-20220102154202964](img/image-20220102154202964.png)

##### 3.配置任务注册中心

![image-20220102154349558](img/image-20220102154349558.png)

认证注册中心端口保证与admin端口一致即可；

#### 3）启动任务调度中心

运行xxl-job-admin工程main方法启动：

![image-20220102160615377](img/image-20220102160615377.png)

访问管理界面：http://localhost:8082/xxl-job-admin/

登录用户名：admin   密码：123456

![image-20220102160725139](img/image-20220102160725139.png)

当前我们重点关注：执行器管理和任务管理；

#### 4）配置执行器工程

在xxl-job-executor-sample-springboot工程修改端口号和任务注册中心端口号：

~~~properties
# web port
server.port=8083
### xxl-job admin address list, such as "http://address" or "http://address01,http://address02"
xxl.job.admin.addresses=http://127.0.0.1:8082/xxl-job-admin
# 当前任务执行器启动时，会独立一个端口9999用于与任务管理中心交互，改端口也可改动
xxl.job.executor.port=9999
~~~

该工程默认导入了xxl-core核心包：

~~~xml
<!-- xxl-job-core -->
<dependency>
    <groupId>com.xuxueli</groupId>
    <artifactId>xxl-job-core</artifactId>
    <version>${project.parent.version}</version>
</dependency>
~~~

默认已经配置好xxl-job相关支持:

~~~java
package com.xxl.job.executor.core.config;
@Configuration
public class XxlJobConfig {
    private Logger logger = LoggerFactory.getLogger(XxlJobConfig.class);

    @Value("${xxl.job.admin.addresses}")
    private String adminAddresses;

    @Value("${xxl.job.accessToken}")
    private String accessToken;

    @Value("${xxl.job.executor.appname}")
    private String appname;

    @Value("${xxl.job.executor.address}")
    private String address;

    @Value("${xxl.job.executor.ip}")
    private String ip;

    @Value("${xxl.job.executor.port}")
    private int port;

    @Value("${xxl.job.executor.logpath}")
    private String logPath;

    @Value("${xxl.job.executor.logretentiondays}")
    private int logRetentionDays;
    @Bean
    public XxlJobSpringExecutor xxlJobExecutor() {
        logger.info(">>>>>>>>>>> xxl-job config init.");
        XxlJobSpringExecutor xxlJobSpringExecutor = new XxlJobSpringExecutor();
        xxlJobSpringExecutor.setAdminAddresses(adminAddresses);
        xxlJobSpringExecutor.setAppname(appname);
        xxlJobSpringExecutor.setAddress(address);
        xxlJobSpringExecutor.setIp(ip);
        xxlJobSpringExecutor.setPort(port);
        xxlJobSpringExecutor.setAccessToken(accessToken);
        xxlJobSpringExecutor.setLogPath(logPath);
        xxlJobSpringExecutor.setLogRetentionDays(logRetentionDays);
        return xxlJobSpringExecutor;
    }
}
~~~

定义可执行的任务：

~~~java
package com.xxl.job.executor.service.jobhandler;
@Component
public class SampleXxlJob {
    private static Logger logger = LoggerFactory.getLogger(SampleXxlJob.class);


    /**
     * 1、简单任务示例（Bean模式）
     */
    @XxlJob("demoJobHandler")
    public void demoJobHandler() throws Exception {
       //todo 打印时间
       System.out.println("hello xxljob.....");
    }

	//.....省略......

    /**
     * 5、生命周期任务示例：任务初始化与销毁时，支持自定义相关逻辑；
     */
    @XxlJob(value = "demoJobHandler2", init = "init", destroy = "destroy")
    public void demoJobHandler2() throws Exception {
        XxlJobHelper.log("XXL-JOB, Hello World.");
    }
    public void init(){
        logger.info("init");
    }
    public void destroy(){
        logger.info("destory");
    }
}
~~~

 @XxlJob中的value值就是定时任务的一个标识，注解作用的方法，就是定时任务的逻辑，在该类下，我们可以注入自定义的job服务，然后通过注解作用的方法被调用执行；

#### 5）配置并启动任务执行器

![image-20220102162510380](img/image-20220102162510380.png)

接下来，我们将xxl-job-executor-sample-springboot工程下的demoJobHandler任务，可视化配置，并启动：

![image-20220102163055618](img/image-20220102163055618.png)

接下来，输入JobHanler，输入的名称保证与@xxljob注解下的value值一致即可：

![image-20220102163222124](img/image-20220102163222124.png)

启动任务查看执行效果：

![image-20220102163302810](img/image-20220102163302810.png)

![image-20220102163455786](img/image-20220102163455786.png)

当然，我们也可以随时停止正在被执行的任务：

### 2.3 cron表达式

参考cron在线表达式：https://www.matools.com/cron/

#### 1）cron表达式作用

~~~tex
xxl-job中的cron表达式是用来控制触发任务使用的，表达式包含7个部分分别从秒、分、时、日、月、星期、年七个时间维度来确定任务何时每多长时间执行一次。
~~~

#### 2）取值范围

~~~json
cron表达式格式：
*    *    *    *    *    *    *
-    -    -    -    -    -    -
|    |    |    |    |    |    |
|    |    |    |    |    |    + year [optional]
|    |    |    |    |    +----- day of week (0 - 7) (Sunday=0 or 7) 周1-》1 
|    |    |    |    +---------- month (1 - 12)
|    |    |    +--------------- day of month (1 - 31)
|    |    +-------------------- hour (0 - 23)
|    +------------------------- min (0 - 59)
+------------------------------ second (0 - 59)
~~~

| 字段    | 允许值                               | 允许的特殊字符         |
| ----- | --------------------------------- | --------------- |
| 秒     | 0-59                              | , - * /         |
| 分     | 0-59                              | , - * /         |
| 小时    | 0-23                              | , - * /         |
| 月内日期  | 1-31                              | , - * ? / L W C |
| 月     | 1-12 或者 JAN-DEC                   | , - * /         |
| 周内日期  | 1-7 或者 SUN-SAT（注意：周日是1，周一为2，周六位7） | , - * ? / L C # |
| 年（可选） | 留空, 1970-2099                     | , - * /         |

#### 3）特殊字段含义

| 特殊字符 | 意义                                       |
| ---- | :--------------------------------------- |
| *    | 匹配所有的值。如：*在分钟的字段域里表示 每分钟                 |
| ?    | 只在日期域和星期域中使用。它被用来指定“非明确的值” 不关心           |
| -    | 指定一个范围。如：“10-12”在小时域意味着“10点、11点、12点”     |
| ,    | 指定几个可选值。如：“MON,WED,FRI”在星期域里表示“星期一、星期三、星期五” |
| /    | 指定增量。如：“0/15”在秒域意思是每分钟的0，15，30和45秒。“5/15”在分钟域表示每小时的5，20，35和50。符号“*”在“/”前面（如：*/10）等价于0在“/”前面（如：0/10） |
| L    | 表示day-of-month和day-of-week域，但在两个字段中的意思不同，例如day-of-month域中表示一个月的最后一天。如果在day-of-week域表示‘7’或者‘SAT’，如果在day-of-week域中前面加上数字，它表示一个月的最后几天，例如‘6L’就表示一个月的最后一个星期五 |
| W    | 只允许日期域出现。这个字符用于指定日期的最近工作日。例如：如果你在日期域中写 “15W”，表示：这个月15号最近的工作日。所以，如果15号是周六，则任务会在14号触发。如果15好是周日，则任务会在周一也就是16号触发。如果是在日期域填写“1W”即使1号是周六，那么任务也只会在下周一，也就是3号触发，“W”字符指定的最近工作日是不能够跨月份的。字符“W”只能配合一个单独的数值使用，不能够是一个数字段，如：1-15W是错误的 |
| LW   | L和W可以在日期域中联合使用，LW表示这个月最后一周的工作日           |
| #    | 只允许在星期域中出现。这个字符用于指定本月的某某天。例如：“6#3”表示本月第三周的星期五（6表示星期五，3表示第三周）。“2#1”表示本月第一周的星期一。“4#5”表示第五周的星期三 |

#### 4）cron表达式阅读练习

~~~tex
（1）0 0 2 1 * ? 表示在每月的1日的凌晨2点调整任务

（2）0 15 10 ? * MON-FRI 表示周一到周五每天上午10:15执行作业

（3）0 15 10 ? 6L 2002-2006 表示2002-2006年的每个月的最后一个星期五上午10:15执行作

（4）0 0 10,14,16 * * ? 每天上午10点，下午2点，4点

（5）0 0/30 9-17 * * ? 朝九晚五工作时间内每半小时

（6）0 0 12 ? * WED 表示每个星期三中午12点

（7）0 15 10 * * ? 每天上午10:15触发

（8）0 * 14 * * ? 在每天下午2点到下午2:59期间的每1分钟触发

（9）0 0/5 14,18 * * ? 在每天下午2点到2:55期间和下午6点到6:55期间的每5分钟触发

（10）0 0-5 14 * * ? 在每天下午2点到下午2:05期间的每1分钟触发

（11）0 15 10 ? * MON-FRI 周一至周五的上午10:15触发 ★★★

（12）0 15 10 L * ? 每月最后一日的上午10:15触发

（13）0 15 10 ? * 6L 每月的最后一个星期五上午10:15触发
~~~

## 3.项目集成xxljob

### 3.1 今日指数集成xxljob监控平台

#### 1）导入admin工程资料

将**day06\资料\heima-admin\stock_xxljob_admin**工程复制到stock_parent下：

![image-20220102165810029](img/image-20220102165810029.png)

然后在stock_parent下pom中聚合该工程：

~~~xml
<modules>
    <module>stock_xxljob_admin</module>
    <module>stock_backend</module>
</modules>
~~~

#### 2）stock_xxljob_admin启动

访问：http://localhost:8082/heima-job-admin/

![image-20220102170057714](img/image-20220102170057714.png)

### 3.2 定义股票数据采集执行器

我们按照xxl-job-executor-sample-springboot给我们提供的流程整合xxljob;

1）stock_backend工程引入核心依赖

~~~xml
<!--引入xxljob核心依赖-->
<dependency>
    <groupId>com.xuxueli</groupId>
    <artifactId>xxl-job-core</artifactId>
</dependency>
~~~

2）yml配置

~~~yml
# XXJOB参数配置
xxl:
  job:
    accessToken:
    admin:
      addresses: http://127.0.0.1:8082/heima-job-admin
    executor:
      appname: heima-stock-job-executor
      address:
      ip:
      port: 6666
      logpath: /joblog
      logretentiondays: 30
~~~

3）定义xxljob 核心配合bean

我们直接将xxl-job-executor-sample-springboot工程下的XxlJobConfig类复制过来即可：

~~~java
package com.itheima.stock.job.xxljobconfig;

import com.xxl.job.core.executor.impl.XxlJobSpringExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * xxl-job config
 *
 * @author xuxueli 2017-04-28
 */
@Configuration
public class XxlJobConfig {
    private Logger logger = LoggerFactory.getLogger(XxlJobConfig.class);

    @Value("${xxl.job.admin.addresses}")
    private String adminAddresses;

    @Value("${xxl.job.accessToken}")
    private String accessToken;

    @Value("${xxl.job.executor.appname}")
    private String appname;

    @Value("${xxl.job.executor.address}")
    private String address;

    @Value("${xxl.job.executor.ip}")
    private String ip;

    @Value("${xxl.job.executor.port}")
    private int port;

    @Value("${xxl.job.executor.logpath}")
    private String logPath;

    @Value("${xxl.job.executor.logretentiondays}")
    private int logRetentionDays;


    @Bean
    public XxlJobSpringExecutor xxlJobExecutor() {
        logger.info(">>>>>>>>>>> xxl-job config init.");
        XxlJobSpringExecutor xxlJobSpringExecutor = new XxlJobSpringExecutor();
        xxlJobSpringExecutor.setAdminAddresses(adminAddresses);
        xxlJobSpringExecutor.setAppname(appname);
        xxlJobSpringExecutor.setAddress(address);
        xxlJobSpringExecutor.setIp(ip);
        xxlJobSpringExecutor.setPort(port);
        xxlJobSpringExecutor.setAccessToken(accessToken);
        xxlJobSpringExecutor.setLogPath(logPath);
        xxlJobSpringExecutor.setLogRetentionDays(logRetentionDays);
        return xxlJobSpringExecutor;
    }
}
~~~

4）定义任务处理器jobhandler

~~~java
package com.itheima.stock.job.jobhandler;

import com.xxl.job.core.handler.annotation.XxlJob;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 定义股票相关数据的定时任务
 * @author laofang
 */
@Component
public class StockJob {
    private static Logger logger = LoggerFactory.getLogger(StockJob.class);

    @XxlJob("hema_job_test")
    public void jobTest(){
        System.out.println("jobTest run.....");
    }

    public void init(){
        logger.info("init");
    }

    public void destroy(){
        logger.info("destory");
    }
}
~~~

5）启动backend工程并配置执行器信息

![image-20220102173324451](img/image-20220102173324451.png)

此时，需要在任务中心执行中手动添加执行器信息：

![image-20220102173608629](img/image-20220102173608629.png)

页面刷新后，我们就可以看到自己定义的执行器装填了：

注意事项

![image-20220102173656778](img/image-20220102173656778.png)

然后定义测试任务，并启动：

![image-20220102173905786](img/image-20220102173905786.png)

当然执行器也可手动录入:

![image-20220115103627215](img/image-20220115103627215.png)

任务顺利启动：

![image-20220102174009795](img/image-20220102174009795.png)

### 3.3 定义大盘数据采集任务

#### 1）定义采集国内大盘的任务

~~~java
/**
 * 定义股票相关数据的定时任务
 * @author laofang
 */
@Component
public class StockJob {

    /**
     * 注入股票定时任务服务bean
     */
    @Autowired
    private StockTimerTaskService stockTimerTaskService;


    /**
     * 定义定时任务，采集国内大盘数据
     */
    @XxlJob("getStockInnerMarketInfos")
    public void getStockInnerMarketInfos(){
        stockTimerTaskService.getInnerMarketInfo();
    }
    //.....
}    
~~~

#### 2）国内大盘任务cron表达式分析

分析：

~~~tex
国内大盘开盘周期是从周1到周5，每天上午的9:30~11:30,每天下午的1:00~3:00
任务周期整体还是比较复杂的，我们可以将任务整体按照半个小时分片处理，
这样每个前半个小时就对应的是：10:00~10:30、11:00~11:30,13:00~13:30,14:00~14:30
		后半个小时对应的是：9:30~10:00、10:30~11:00,13:30~14:00,14:30~15:00
整体来看，前半个小时的cron任务是：每周一到周五的（10、11、13、14）时的前半个小时，每间隔一分钟执行一次；
        后半个小时的cron任务是：每周一到周五的（9、10、13、14）时的后半个小时，每间隔一分钟执行一次；
~~~

![image-20220107121100108](img/image-20220107121100108.png)

#### 3）配置cron表达式

【1】前半小时配置：

![1644400601026](img/1644400601026.png)

【2】后半小时配置：

![1644400807703](img/1644400807703.png)

### 3.4 国内股票数据采集任务实现

~~~java
    /**
     * 定时采集A股数据
     */
    @XxlJob("getStockInfos")
    public void getStockInfos(){
        stockTimerTaskService.getStockRtIndex();
    }
~~~

xxljob日期配置策略与国内大盘方式一致！

### 3.5 国内板块数据采集任务实现

~~~java
    /**
     * 板块定时任务
     */
    @XxlJob("getStockBlockInfoTask")
    public void getStockBlockInfoTask(){
        stockTimerTaskService.getStockSectorRtIndex();
    }
~~~

xxljob日期配置策略与国内大盘方式一致！

## 4.股票采集服务线程池优化

### 4.1 今日指数集成线程池

#### 1）技术选型背景

~~~tex
目前，股票或者板块的数据在批量插入时是串行执行的，显然数据库I/0时间成本比较高，所以，我们可引入多线程并发插入，提高操作效率，但是随着而来的问题如下：
    1.当前项目是单体架构，股票数据采集线程和主业务线程共享，如果股票线程长时间占用CPU，会造成主业务线程无法正常提供有效服务（线程挤压问题），这时，我们可以通过线程池与主业务进行隔离；
    2.线程频繁的创建和销毁会带来非常大的性能开销，我们尽量提高线程的复用性；
~~~

![image-20220113125101929](img/image-20220113125101929.png)

#### 2）yml参数配置

~~~yml
# 定时任务线程池基础参数
task:
  pool:
    corePoolSize: 5 # 核心线程数
    maxPoolSize: 20 # 设置最大线程数
    keepAliveSeconds: 300 # 设置线程活跃时间
    queueCapacity: 100 # 设置队列容量
~~~

#### 3）定义参数实体bean

~~~java
package com.itheima.stock.common.domain;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author by itheima
 * @Date 2021/12/13
 * @Description
 */
@ConfigurationProperties(prefix = "task.pool")
@Data
public class TaskThreadPoolInfo {
    /**
     *  核心线程数（获取硬件）：线程池创建时候初始化的线程数
     */
    private Integer corePoolSize;
    private Integer maxPoolSize;
    private Integer keepAliveSeconds;
    private Integer queueCapacity;
}
~~~

#### 4）配置线程池

~~~java
package com.itheima.stock.config;

import com.itheima.stock.common.domain.TaskThreadPoolInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author by itheima
 * @Date 2021/12/13
 * @Description
 */
@Configuration
@EnableConfigurationProperties(TaskThreadPoolInfo.class)
@Slf4j
public class TaskExecutePool {
    private TaskThreadPoolInfo info;

    public TaskExecutePool(TaskThreadPoolInfo info) {
        this.info = info;
    }

    /**
     * 定义任务执行器
     * @return
     */
    @Bean(name = "threadPoolTaskExecutor",destroyMethod = "shutdown")
    public ThreadPoolTaskExecutor threadPoolTaskExecutor(){
         //构建线程池对象
         ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
         //核心线程数：核心线程数（获取硬件）：线程池创建时候初始化的线程数
         taskExecutor.setCorePoolSize(info.getCorePoolSize());
         //最大线程数：只有在缓冲队列满了之后才会申请超过核心线程数的线程
         taskExecutor.setMaxPoolSize(info.getMaxPoolSize());
         //缓冲队列：用来缓冲执行任务的队列
         taskExecutor.setQueueCapacity(info.getQueueCapacity());
         //允许线程的空闲时间：当超过了核心线程出之外的线程在空闲时间到达之后会被销毁
         taskExecutor.setKeepAliveSeconds(info.getKeepAliveSeconds());
         //线程名称前缀
         taskExecutor.setThreadNamePrefix("StockThread-");
         //设置拒绝策略
          taskExecutor.setRejectedExecutionHandler(rejectedExecutionHandler());
         //参数初始化
         taskExecutor.initialize();
         return taskExecutor;
    }

    /**
     * 自定义线程拒绝策略
     * @return
     */
    @Bean
    public RejectedExecutionHandler rejectedExecutionHandler(){
        RejectedExecutionHandler errorHandler = new RejectedExecutionHandler() {
            @Override
            public void rejectedExecution(Runnable runnable, ThreadPoolExecutor executor) {
                //TODO 可自定义Runable实现类，传入参数，做到不同任务，不同处理
                log.info("股票任务出现异常:发送邮件");
            }
        };
        return errorHandler;
    }
}
~~~

### 4.2 股票和板块数据异步采集

在StockTimerServiceImpl中注入线程池bean：

~~~java
    /**
     * 注入线程池对象
     */
    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;
~~~

股票数据采集异步执行：

~~~java

    /**
     * 批量获取股票分时数据详情信息
     * http://hq.sinajs.cn/list=sz000002,sh600015
     */
    @Override
    public void getStockRtIndex() {
        //1.获取所有股票的id TODO 缓存优化
        List<String> stockIds=stockBusinessMapper.findAllStockIds();//40--->3000
        //深证：A：以0开头 上证：6开头
        stockIds = stockIds.stream().map(id -> {
            id = id.startsWith("6") ? "sh" + id : "sz" + id;
            return id;
        }).collect(Collectors.toList());
        //设置请求头数据
        HttpHeaders headers = new HttpHeaders();
        headers.add("Referer","https://finance.sina.com.cn/stock/");
        headers.add("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36");
        HttpEntity<String> entity = new HttpEntity<>(headers);

        //要求：将集合分组，每组的集合长度为20
        Lists.partition(stockIds,20).forEach(ids->{
           //每个分片的数据开启一个线程异步执行任务
           threadPoolTaskExecutor.execute(()->{
               //拼接获取A股信息的url地址
               String stockRtUrl=stockInfoConfig.getMarketUrl()+String.join(",",ids);
               //发送请求获取数据
//               String result = restTemplate.getForObject(stockRtUrl, String.class);
               String result=restTemplate.postForObject(stockRtUrl,entity,String.class);
               //解析获取股票数据
               List<StockRtInfo> list = parserStockInfoUtil.parser4StockOrMarketInfo(result, 3);
               //分批次批量插入
               log.info("当前股票数据：{}",list);
               stockRtInfoMapper.insertBatch(list);
           });
        });
    }
~~~

板块数据异步采集：

~~~java
    /**
     * 获取板块实时数据
     * http://vip.stock.finance.sina.com.cn/q/view/newSinaHy.php
     */
    @Override
    public void getStockSectorRtIndex() {
        //发送板块数据请求
        String result = restTemplate.getForObject(stockInfoConfig.getBlockUrl(), String.class);
        //响应结果转板块集合数据
        List<StockBlockRtInfo> infos = parserStockInfoUtil.parse4StockBlock(result);
        log.info("板块数据量：{}",infos.size());
        //数据分片保存到数据库下 行业板块类目大概50个，可每小时查询一次即可
        Lists.partition(infos,20).forEach(list->{
            threadPoolTaskExecutor.execute(()->{
                //20个一组，批量插入
                stockBlockRtInfoMapper.insertBatch(list);
            });
        });
    }
~~~

## 5.线程池高级（面试）

~~~tex
通过上一小节的学习，我们了解到线程池的几个核心参数：
    1.核心线程数
    2.最大线程数
    3.超过核心线程数的闲余线程存活时间
    4.任务队列长度（阻塞队列）
    5.拒绝策略
~~~

### 5.1 线程池工作流程概述

#### 1)回顾线程池工作流程

![image-20220107152235483](img/image-20220107152235483.png)

说明：

~~~tex
1 当一个任务通过submit或者execute方法提交到线程池的时候，如果当前池中线程数（包括闲置线程）小于coolPoolSize，则创建一个新的线程执行该任务;
2 如果当前线程池中线程数已经达到coolPoolSize，则将任务放入等待队列;
3 如果任务队列已满，则任务无法入队列，此时如果当前线程池中线程数小于maxPoolSize，则创建一个临时线程（非核心线程）执行该任务。
4 如果当前池中线程数已经等于maxPoolSize，此时无法执行该任务，根据拒绝执行策略处理。

注意：
当池中线程数大于coolPoolSize，超过keepAliveTime时间的闲置线程会被回收掉。回收的是非核心线程，核心线程一般是不会回收的。如果设置allowCoreThreadTimeOut(true)，则核心线程在闲置keepAliveTime时间后也会被回收。
~~~

#### 2)线程池拒绝策略

~~~tex
【1】什么时候会触发线程池的拒绝策略?
    1.当我们调用 shutdown 等方法关闭线程池后，如果再向线程池内提交任务，就会遭到拒绝；
    2.线程池没有空闲线程（线程达到最大线程数且都在执行任务）并且队列已经满；★★★

【2】拒绝策略类型有哪些?
线程池为我们提供了4种拒绝策略：

AbortPolicy
这种拒绝策略在拒绝任务时，会直接抛出一个类型为 RejectedExecutionException 的 RuntimeException，让你感知到任务被拒绝了，于是你便可以根据业务逻辑选择重试或者放弃提交等策略（默认）。

DiscardPolicy
当有新任务被提交后直接被丢弃掉，也不会给你任何的通知，相对而言存在一定的风险，因为我们提交的时候根本不知道这个任务会被丢弃，可能造成数据丢失。（不负责任）

DiscardOldestPolicy
丢弃任务队列中的头结点，通常是存活时间最长的任务，它也存在一定的数据丢失风险。

CallerRunsPolicy
第四种拒绝策略是 ，相对而言它就比较完善了，当有新任务提交后，如果线程池没被关闭且没有能力执行，则把这个任务交于提交任务的线程执行，也就是谁提交任务，谁就负责执行任务。
 任务线程满了后，改策略可将执行的人为交换给主线程执行，这个过程相当于一个正反馈，此时如果主线程能处理，则处理，如果也不能处理，也就以为这当前服务不能接收新的任务了；
 	主线程处理任务期间，可以为线程池腾出时间，如果此时有新的空闲线程，那么继续协助主线程处理任务；

自定义拒绝策略
	实现RejectedExecutionHandler接口来实现自己的拒绝策略；★★★
~~~

### 5.2 验证线程池工作流程

#### 1）环境准备

独立构建一个springboot测试工程，配置线程参数：

~~~yml
# 定时任务线程池基础参数
task:
  pool:
    corePoolSize: 5 # 核心线程数
    maxPoolSize: 10 # 设置最大线程数
    keepAliveSeconds: 2 # 设置线程活跃时间,单位秒
    queueCapacity: 10 # 设置队列容量
~~~

参数封装：

~~~java
package com.itheima.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author by itheima
 * @Date 2021/12/13
 * @Description
 */
@ConfigurationProperties(prefix = "task.pool")
@Data
public class TaskThreadPoolInfo {
    /**
     *  核心线程数（获取硬件）：线程池创建时候初始化的线程数
     */
    private Integer corePoolSize;
    private Integer maxPoolSize;
    private Integer keepAliveSeconds;
    private Integer queueCapacity;
}
~~~

配置线程池：

~~~java
package com.itheima.config;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author by itheima
 * @Date 2021/12/13
 * @Description
 */
@Configuration
@EnableConfigurationProperties(TaskThreadPoolInfo.class)
@Slf4j
public class TaskExecutePool {
    private TaskThreadPoolInfo info;

    public TaskExecutePool(TaskThreadPoolInfo info) {
        this.info = info;
    }

    /**
     * 定义任务执行器
     * @return
     */
    @Bean(name = "threadPoolTaskExecutor",destroyMethod = "shutdown")
    public ThreadPoolTaskExecutor threadPoolTaskExecutor(){
         //构建线程池对象
         ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
         //核心线程数：核心线程数（获取硬件）：线程池创建时候初始化的线程数
         taskExecutor.setCorePoolSize(info.getCorePoolSize());
         //最大线程数：只有在缓冲队列满了之后才会申请超过核心线程数的线程
         taskExecutor.setMaxPoolSize(info.getMaxPoolSize());
         //缓冲队列：用来缓冲执行任务的队列
         taskExecutor.setQueueCapacity(info.getQueueCapacity());
         //允许线程的空闲时间：当超过了核心线程出之外的线程在空闲时间到达之后会被销毁
         taskExecutor.setKeepAliveSeconds(info.getKeepAliveSeconds());
         //线程名称前缀
         taskExecutor.setThreadNamePrefix("StockThread-");
         //参数初始化
         taskExecutor.initialize();
         return taskExecutor;
    }
}
~~~

配置模拟股票采集服务：

~~~java
package com.itheima.service;

import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * @author by itheima
 * @Date 2022/1/7
 * @Description
 */
@Service
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
~~~

除参数外，上述设置与我们项目中配置一致。

直接导入：day06\资料\线程池测试工程\threadpooltest

#### 2）并发情况-1

并发任务小于等于核心任务数情况；

测试代码：

​		循环总任务数等于核心线程数：

~~~java
package com.itheima;

import com.itheima.service.StockTimerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.TimeUnit;

@SpringBootTest
@Slf4j
public class ThreadpooltestApplicationTests {
    @Autowired
    private StockTimerService stockTimerService;

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @Test
    public  void contextLoads() throws InterruptedException {
        //线程池初始化线程数为0
        log.info("线程池初始化大小:{}",threadPoolTaskExecutor.getPoolSize());
        for (int i = 0; i < 3; i++) {
               threadPoolTaskExecutor.execute(()->{
                   stockTimerService.stockRtInto();
               });
            //获取线程池内最新的线程数量
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
        }
        //休眠2s中，保证前3个线程任务都执行完，有闲余的线程
        TimeUnit.MILLISECONDS.sleep(2000);
        log.info("当前活动线程数：{}" ,threadPoolTaskExecutor.getActiveCount());//此时为0，证明线程内有闲余的线程
        for (int i = 0; i < 2; i++) {
            threadPoolTaskExecutor.execute(()->{
                stockTimerService.stockRtInto();
            });
            //获取线程池内最新的线程数量
            //发现在没有达到核心线程数时，哪怕有新的任务，也依旧开启新的线程执行
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
        }
        log.info("########任务线程构建完毕");

        while (true) {
            int queueSize = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
            log.info("当前阻塞队列任务数：{}" , queueSize);
            log.info("当前活动线程数：{}" ,threadPoolTaskExecutor.getActiveCount());
            long completedTaskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
            log.info("线程池完成任务数：{}" ,completedTaskCount);
            //当所有任务都完成后，那么completedTaskCount=taskCount
            long taskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
            log.info("总线池总任务数：{}" ,taskCount);
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            //获取线程池内最新的线程数量
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
            log.info("############################");
        }
    }
}
~~~

运行结果解释：

![0010](img/0010.png)

结论：

~~~tex
1.线程池初始化核心线程数为0（性能考虑，按需加载）
2.当线程池内线程数量未达到核心线程数时，如有新的任务加入，不用复用此时的空闲线程；
~~~

#### 3）并发情况-2

并发任务数大于核心线程数 ，且小于等于核心线程数+任务队列长度

此时循环任务数为：15；

示例代码：

~~~java
package com.itheima;

import com.itheima.service.StockTimerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.TimeUnit;

@SpringBootTest
@Slf4j
public class ThreadpooltestApplicationTests {
    @Autowired
    private StockTimerService stockTimerService;

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @Test
    public  void contextLoads() throws InterruptedException {
        //线程池初始化线程数为0
        log.info("线程池初始化大小:{}",threadPoolTaskExecutor.getPoolSize());
//        for (int i = 0; i < 3; i++) {
//               threadPoolTaskExecutor.execute(()->{
//                   stockTimerService.stockRtInto();
//               });
//            //获取线程池内最新的线程数量
//            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
//        }
//        //休眠2s中，保证前3个线程任务都执行完，有闲余的线程
//        TimeUnit.MILLISECONDS.sleep(2000);
//        log.info("当前活动线程数：{}" ,threadPoolTaskExecutor.getActiveCount());//此时为0，证明线程内有闲余的线程
        for (int i = 0; i < 15; i++) {
            threadPoolTaskExecutor.execute(()->{
                stockTimerService.stockRtInto();
            });
            //获取线程池内最新的线程数量
            //发现在没有达到核心线程数时，哪怕有新的任务，也依旧开启新的线程执行
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
        }
        log.info("########任务线程构建完毕");


        while (true) {
            int queueSize = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
            log.info("当前阻塞队列任务数：{}" , queueSize);
            log.info("当前活动线程数：{}" ,threadPoolTaskExecutor.getActiveCount());
            long completedTaskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
            log.info("线程池完成任务数：{}" ,completedTaskCount);
            //当所有任务都完成后，那么completedTaskCount=taskCount
            long taskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
            log.info("总线池总任务数：{}" ,taskCount);
            try {
                Thread.sleep(800);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            //获取线程池内最新的线程数量
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
            log.info("############################");
        }
    }
}
~~~

效果：

![线程池场景-2](img/线程池场景-2.png)

#### 4) 并发情况-3

并发任务时，阻塞队列已满，且未达到最大线程数：

此时循环任务数为：20

~~~java
package com.itheima;

import com.itheima.service.StockTimerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.TimeUnit;

@SpringBootTest
@Slf4j
public class ThreadpooltestApplicationTests {
    @Autowired
    private StockTimerService stockTimerService;

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @Test
    public  void contextLoads() throws InterruptedException {
        //线程池初始化线程数为0
        log.info("线程池初始化大小:{}",threadPoolTaskExecutor.getPoolSize());
//        for (int i = 0; i < 3; i++) {
//               threadPoolTaskExecutor.execute(()->{
//                   stockTimerService.stockRtInto();
//               });
//            //获取线程池内最新的线程数量
//            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
//        }
//        //休眠2s中，保证前3个线程任务都执行完，有闲余的线程
//        TimeUnit.MILLISECONDS.sleep(2000);
//        log.info("当前活动线程数：{}" ,threadPoolTaskExecutor.getActiveCount());//此时为0，证明线程内有闲余的线程
        for (int i = 0; i < 20; i++) {
            threadPoolTaskExecutor.execute(()->{
                stockTimerService.stockRtInto();
            });
            //获取线程池内最新的线程数量
            //发现在没有达到核心线程数时，哪怕有新的任务，也依旧开启新的线程执行
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
        }
        log.info("########任务线程构建完毕");


        while (true) {
            int queueSize = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
            log.info("当前阻塞队列任务数：{}" , queueSize);
            log.info("当前活动线程数：{}" ,threadPoolTaskExecutor.getActiveCount());
            long completedTaskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
            log.info("线程池完成任务数：{}" ,completedTaskCount);
            //当所有任务都完成后，那么completedTaskCount=taskCount
            long taskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
            log.info("总线池总任务数：{}" ,taskCount);
            try {
                Thread.sleep(800);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            //获取线程池内最新的线程数量
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
            log.info("############################");
        }
    }
}
~~~

效果：

![线程池场景-3](img/线程池场景-3.png)

结论：

~~~tex
1.当并发任务数量超过核心线程数+任务队列，且小于最大线程数+任务队列时，线程池会主动创建新的线程；
2.在空闲时间内，超过核心线程的线程对象会被淘汰；
~~~

#### 5）并发情况-4

并发任务数量超过最大线程数+任务队列时的场景；

定义循环线程数量：21，超过了1个线程；

代码：

~~~java
package com.itheima;

import com.itheima.service.StockTimerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.TimeUnit;

@SpringBootTest
@Slf4j
public class ThreadpooltestApplicationTests {
    @Autowired
    private StockTimerService stockTimerService;

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @Test
    public  void contextLoads() throws InterruptedException {
        //线程池初始化线程数为0
        log.info("线程池初始化大小:{}",threadPoolTaskExecutor.getPoolSize());
//        for (int i = 0; i < 3; i++) {
//               threadPoolTaskExecutor.execute(()->{
//                   stockTimerService.stockRtInto();
//               });
//            //获取线程池内最新的线程数量
//            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
//        }
//        //休眠2s中，保证前3个线程任务都执行完，有闲余的线程
//        TimeUnit.MILLISECONDS.sleep(2000);
//        log.info("当前活动线程数：{}" ,threadPoolTaskExecutor.getActiveCount());//此时为0，证明线程内有闲余的线程
        for (int i = 0; i < 21; i++) {
            threadPoolTaskExecutor.execute(()->{
                stockTimerService.stockRtInto();
            });
            //获取线程池内最新的线程数量
            //发现在没有达到核心线程数时，哪怕有新的任务，也依旧开启新的线程执行
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
        }
        log.info("########任务线程构建完毕");


        while (true) {
            int queueSize = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
            log.info("当前阻塞队列任务数：{}" , queueSize);
            log.info("当前活动线程数：{}" ,threadPoolTaskExecutor.getActiveCount());
            long completedTaskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
            log.info("线程池完成任务数：{}" ,completedTaskCount);
            //当所有任务都完成后，那么completedTaskCount=taskCount
            long taskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
            log.info("总线池总任务数：{}" ,taskCount);
            try {
                Thread.sleep(800);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            //获取线程池内最新的线程数量
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
            log.info("############################");
        }
    }
}
~~~

效果：

![image-20220107173328287](img/image-20220107173328287.png)

通过阅读源码我们发现：

![image-20220107173539283](img/image-20220107173539283.png)

默认采用AbortPolicy策略，直接中断程序执行

结论：

~~~tex
当并发任务数超过最大线程数+任务队列长度时，触发线程的拒绝策略；
~~~

#### 6）自定义线程池拒绝策略

第一步：自定义线程任务对象

~~~java
package com.itheima.config;

import com.itheima.service.StockTimerService;

import java.util.Map;

/**
 * @author by itheima
 * @Date 2022/1/7
 * @Description
 */
public class StockTaskRunable implements Runnable{

    //携带的任务信息,任务拒绝时，使用
    private Map<String,Object> infos;

    private StockTimerService stockTimerService;

    public StockTaskRunable(Map<String, Object> infos, StockTimerService stockTimerService) {
        this.infos = infos;
        this.stockTimerService = stockTimerService;
    }
	//任务逻辑
    @Override
    public void run() {
        stockTimerService.stockRtInto();
    }
	//提供get方法
    public Map<String, Object> getInfos() {
        return infos;
    }
}
~~~

第二步：自定义拒绝策略

~~~java
package com.itheima.config;

import com.itheima.service.StockTimerService;
import lombok.extern.slf4j.Slf4j;

import java.util.Map;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author by itheima
 * @Date 2022/1/7
 * @Description 自定义线程池任务拒绝策略
 */
@Slf4j
public class StockTaskRejectedExecutionHandler implements RejectedExecutionHandler {
    @Override
    public void rejectedExecution(Runnable r, ThreadPoolExecutor executor) {
        if (r instanceof StockTaskRunable) {
            StockTaskRunable r2= ((StockTaskRunable) r);
            Map<String, Object> infos = r2.getInfos();
            log.info("出现的异常的任务信息：{}",infos);
        }
    }
}
~~~

第三步：配置拒绝策略

~~~java
    /**
     * 定义任务执行器
     * @return
     */
    @Bean(name = "threadPoolTaskExecutor",destroyMethod = "shutdown")
    public ThreadPoolTaskExecutor threadPoolTaskExecutor(){
         //构建线程池对象
         ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
         //核心线程数：核心线程数（获取硬件）：线程池创建时候初始化的线程数
         taskExecutor.setCorePoolSize(info.getCorePoolSize());
         //最大线程数：只有在缓冲队列满了之后才会申请超过核心线程数的线程
         taskExecutor.setMaxPoolSize(info.getMaxPoolSize());
         //缓冲队列：用来缓冲执行任务的队列
         taskExecutor.setQueueCapacity(info.getQueueCapacity());
         //允许线程的空闲时间：当超过了核心线程出之外的线程在空闲时间到达之后会被销毁
         taskExecutor.setKeepAliveSeconds(info.getKeepAliveSeconds());
         //线程名称前缀
         taskExecutor.setThreadNamePrefix("StockThread-");
         //设置拒绝策略
          taskExecutor.setRejectedExecutionHandler(rejectedExecutionHandler());
         //参数初始化
         taskExecutor.initialize();
         return taskExecutor;
    }

    /**
     * 自定义线程拒绝策略
     * @return
     */
    @Bean
    public RejectedExecutionHandler rejectedExecutionHandler(){
        StockTaskRejectedExecutionHandler errorHandler = new StockTaskRejectedExecutionHandler();
        return errorHandler;
    }
~~~

第四步：测试

~~~java
    @Test
    public  void contextLoads2() throws InterruptedException {
        //线程池初始化线程数为0
        log.info("线程池初始化大小:{}",threadPoolTaskExecutor.getPoolSize());
         for (int i = 0; i < 21; i++) {
             HashMap<String, Object> info = new HashMap<>();
             info.put("handler","stockRtInfo");
             //自定义任务
             StockTaskRunable task = new StockTaskRunable(info, stockTimerService);
             threadPoolTaskExecutor.execute(task);
            //获取线程池内最新的线程数量
            //发现在没有达到核心线程数时，哪怕有新的任务，也依旧开启新的线程执行
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
        }
        log.info("########任务线程构建完毕");
        while (true) {
            int queueSize = threadPoolTaskExecutor.getThreadPoolExecutor().getQueue().size();
            log.info("当前阻塞队列任务数：{}" , queueSize);
            log.info("当前活动线程数：{}" ,threadPoolTaskExecutor.getActiveCount());
            long completedTaskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getCompletedTaskCount();
            log.info("线程池完成任务数：{}" ,completedTaskCount);
            //当所有任务都完成后，那么completedTaskCount=taskCount
            long taskCount = threadPoolTaskExecutor.getThreadPoolExecutor().getTaskCount();
            log.info("总线池总任务数：{}" ,taskCount);
            try {
                Thread.sleep(800);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            //获取线程池内最新的线程数量
            log.info("当前线池内的程数为：{}",threadPoolTaskExecutor.getPoolSize());
            log.info("############################");
        }
    }
~~~

效果：

![image-20220107175842898](img/image-20220107175842898.png)

### 5.3 线程池参数设置原则

#### 1）如何为线程池设置合适的线程参数？

目前根据一些开源框架，设置多少个线程数量通常是根据应用的类型**：IO 密集型、CPU 密集型。**

- I/O密集型

  ~~~tex
  1.I/O密集型的场景在开发中比较常见，比如像 MySQL数据库读写、文件的读写、网络通信等任务，这类任务不会   特别消耗CPU资源，但是IO操作比较耗时，会占用比较多时间;
  2.IO密集型通常设置为 2n+1，其中 n 为 CPU 核数;
  ~~~

- CPU密集型

  ~~~tex
  1.CPU密集型的场景，比如像加解密，压缩、计算等一系列需要大量耗费 CPU 资源的任务，这些场景大部分都是纯   CPU计算;
  2.CPU密集型通常设置为n+1,这样也可避免多线程环境下CPU资源挣钱带来上下文频繁切换的开销；
  ~~~

#### 2) 如何获取当前服务器的cpu核数？

~~~java
int cors= Runtime.getRuntime().availableProcessors();
~~~

#### 3) 无界队列问题

实际运行中，我们一般会设置线程池的阻塞队列长度，如果不设置，则采用默认值：

~~~java
private int corePoolSize = 1;
private int maxPoolSize = Integer.MAX_VALUE;
private int keepAliveSeconds = 60;
private int queueCapacity = Integer.MAX_VALUE;
~~~

在这个过程中，如果设置或者使用不当，容易造成内存溢出问题；

所以企业开发中，禁止使用默认的队列长度；
