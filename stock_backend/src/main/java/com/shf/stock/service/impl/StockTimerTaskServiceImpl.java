package com.shf.stock.service.impl;

import com.google.common.collect.Lists;
import com.shf.stock.config.vo.StockInfoConfig;
import com.shf.stock.mapper.StockBlockRtInfoMapper;
import com.shf.stock.mapper.StockBusinessMapper;
import com.shf.stock.mapper.StockMarketIndexInfoMapper;
import com.shf.stock.mapper.StockRtInfoMapper;
import com.shf.stock.pojo.StockBlockRtInfo;
import com.shf.stock.pojo.StockMarketIndexInfo;
import com.shf.stock.pojo.StockRtInfo;
import com.shf.stock.service.StockTimerTaskService;
import com.shf.stock.utils.DateTimeUtil;
import com.shf.stock.utils.IdWorker;
import com.shf.stock.utils.ParseType;
import com.shf.stock.utils.ParserStockInfoUtil;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
@Slf4j
public class StockTimerTaskServiceImpl implements StockTimerTaskService {

    @Autowired
    private StockInfoConfig stockInfoConfig;

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private IdWorker idWorker;

    @Autowired
    private StockMarketIndexInfoMapper stockMarketIndexInfoMapper;

    @Autowired
    private StockBusinessMapper stockBusinessMapper;

    @Autowired
    private ParserStockInfoUtil parserStockInfoUtil;

    @Autowired
    private StockRtInfoMapper stockRtInfoMapper;

    @Autowired
    private StockBlockRtInfoMapper stockBlockRtInfoMapper;

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    /**
     * 采集国内大盘的数据实现
     */
    @Override
    public void collectInnerMarketInfo() {
//        1.定义国内大盘的数据实现
        String url = stockInfoConfig.getMarketUrl() + String.join(",", stockInfoConfig.getInner());

//        2. 调用RestTemplate采集数据
//        2.1 组装请求头
        HttpHeaders headers = new HttpHeaders();
//        必须填写，否则数据采集不到
        headers.add("Referer", "https://finance.sina.com.cn/stock/");
        headers.add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36");

//        2.2 组装请求对象
        HttpEntity<Object> entity = new HttpEntity<>(headers);

//        2.3 restTemplate 发起请求
        String resString = restTemplate.postForObject(url, entity, String.class);
        log.info("当前采集数据：{}", resString);

//        获取公共采集时间点(获取Date，时间精确到分钟即可)
        Date date = DateTimeUtil.getDateTimeWithoutSecond(DateTime.now()).toDate();

//        3. 数据解析
        String reg = "var hq_str_(.+)=\"+(.+)\";";

//        编译表达式，获取编译对象
        Pattern pattern = Pattern.compile(reg);

//        匹配字符串
        Matcher matcher = pattern.matcher(resString);

        ArrayList<StockMarketIndexInfo> list = new ArrayList<>();
//        判断是否有配置的数值
        while (matcher.find()) {
//            获取大盘code
            String marketCode = matcher.group(1);

//            获取其他信息，字符串以逗号间隔
            String otherInfo = matcher.group(2);

//            以逗号切割字符串，形成数组
            String[] splitArr = otherInfo.split(",");

//            大盘名称
            String marketName = splitArr[0];

//            获取大盘点数
            BigDecimal currentPoint = new BigDecimal(splitArr[1]);

//            获取大盘涨跌值
            BigDecimal currentPrice = new BigDecimal(splitArr[2]);

//            获取大盘的涨幅
            BigDecimal upDownRate = new BigDecimal(splitArr[3]);

//            获取成交量
            Long tradeVol = Long.valueOf(splitArr[4]);

//            获取成交金额
            Long tradeAmount = Long.valueOf(splitArr[5]);

//            组装entity对象
            StockMarketIndexInfo info = StockMarketIndexInfo.builder()
                    .id(idWorker.nextId() + "")
                    .markId(marketCode)
                    .markName(marketName)
                    .curPoint(currentPoint)
                    .currentPrice(currentPrice)
                    .updownRate(upDownRate)
                    .tradeVolume(tradeVol)
                    .tradeAccount(tradeAmount)
                    .curTime(date)
                    .build();
            log.info("封装对象信息：{}", info.toString());

//            收集封装对象
            list.add(info);
        }

//        批量保存大盘数据
        int count = stockMarketIndexInfoMapper.insertBatch(list);
        log.info("批量插入了：{}条数据", count);
    }

    /**
     * 股票实时数据采集
     */
    @Override
    public void collectAshareInfo() {
//        1. 获取所有股票Code的集合
        List<String> stockCodeList = stockBusinessMapper.getStockIds();

//        1.1转化集合中股票代码，添加前缀
        stockCodeList = stockCodeList.stream().map(id -> {
            if (id.startsWith("6")) {
                id = "sh" + id;
            } else {
                id = "sz" + id;
            }
            return id;
        }).collect(Collectors.toList());

        //设置请求头数据
        HttpHeaders headers = new HttpHeaders();
        headers.add("Referer", "https://finance.sina.com.cn/stock/");
        headers.add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36");

//        组装请求对象
        HttpEntity<Object> entity = new HttpEntity<>(headers);

////        2. 将股票集合分片处理,均等分,比如每份20
//        Lists.partition(stockCodeList, 20).forEach(list -> {
////          3.为一份动态拼接URL地址
//            String url = stockInfoConfig.getMarketUrl() + String.join(",", list);
//            String resultData = restTemplate.postForObject(url, entity, String.class);
//
////          4.  解析处理,封装pojo
//            List<StockRtInfo> stockRtInfos = parserStockInfoUtil.parser4StockOrMarketInfo(resultData, ParseType.ASHARE);
//            log.info("当前解析的集合数据：", stockRtInfos);
//
////            5. 批量插入
//            stockRtInfoMapper.insertBatch(stockRtInfos);
//        });

        /**
         * 多线程处理
         */
        Lists.partition(stockCodeList, 20).forEach(list -> {
            threadPoolTaskExecutor.execute(() -> {
//          3.为一份动态拼接URL地址
                String url = stockInfoConfig.getMarketUrl() + String.join(",", list);
                String resultData = restTemplate.postForObject(url, entity, String.class);

//          4.  解析处理,封装pojo
                List<StockRtInfo> stockRtInfos = parserStockInfoUtil.parser4StockOrMarketInfo(resultData, ParseType.ASHARE);
                log.info("当前解析的集合数据：", stockRtInfos);

//            5. 批量插入
                stockRtInfoMapper.insertBatch(stockRtInfos);
            });
        });

    }

    /**
     * 获取板块实时数据
     * http://vip.stock.finance.sina.com.cn/q/view/newSinaHy.php
     */
    @Override
    public void getStockSectorRtIndex() {
//        发送板块数据请求
        String result = restTemplate.getForObject(stockInfoConfig.getBlockUrl(), String.class);

//        响应结果转板块集合数据
        List<StockBlockRtInfo> infos = parserStockInfoUtil.parse4StockBlock(result);
        log.info("板块数据量：{}", infos.size());

//        数据分片保存到数据库下 行业板块类目大概50个，可每小时查询一次即可
//        Lists.partition(infos, 20).forEach(info -> stockBlockRtInfoMapper.insertBatch(info));

        /**
         * 多线程版
         */
        Lists.partition(infos, 20).forEach(info -> {
            threadPoolTaskExecutor.execute(() -> {
                stockBlockRtInfoMapper.insertBatch(info);
            });
        });
    }
}
