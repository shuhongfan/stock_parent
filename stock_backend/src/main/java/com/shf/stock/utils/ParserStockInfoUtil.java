package com.shf.stock.utils;

import com.google.common.base.Strings;
import com.google.gson.Gson;
import com.shf.stock.pojo.StockBlockRtInfo;
import com.shf.stock.pojo.StockMarketIndexInfo;
import com.shf.stock.pojo.StockRtInfo;
import org.joda.time.DateTime;

import java.math.BigDecimal;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class ParserStockInfoUtil {

    public ParserStockInfoUtil(IdWorker idWorker) {
        this.idWorker = idWorker;
    }

    private IdWorker idWorker;

    /**
     * @param stockStr 大盘 股票 实时拉去原始数据(js格式解析)
     * @param type 1:国内大盘 2.国外大盘 3.A股
     * @return 解析后的数据
     */
    public List parser4StockOrMarketInfo(String stockStr,Integer  type){
        //收集封装数据
        List<Object> datas=new ArrayList<>();
        //合法判断
        if (Strings.isNullOrEmpty(stockStr)) {
            //返回空数组
            return datas;
        }
        //定义正则 第一组：匹配任意非空字符串  第二组：匹配任意除了换行符的字符串包括名称中出现空格的数据
        String reg="var hq_str_(\\S*)=\"(.*)\";";
        //编译正则，获取正则对象
        Pattern pattern = Pattern.compile(reg);
        //获取正则匹配器
        Matcher matcher = pattern.matcher(stockStr);
        while (matcher.find()) {
            //解析国内股票大盘
            if (type==1){
                StockMarketIndexInfo info=parser4InnerStockMarket(matcher.group(1),matcher.group(2));
                datas.add(info);
            }
            //国外大盘
            if (type==2) {
                StockMarketIndexInfo info=parser4OuterStockMarket(matcher.group(1),matcher.group(2));
                datas.add(info);
            }
            //国内A股信息
            if(type==3){
                StockRtInfo info=parser4StockRtInfo(matcher.group(1),matcher.group(2));
                datas.add(info);
            }
        }
        return datas;
    }

    /**
     * 解析国内A股数据
     * @param stockCode 股票ID
     * @param otherInfo 股票其它信息，以逗号间隔
     * @return
     */
    private StockRtInfo parser4StockRtInfo(String stockCode, String otherInfo) {
                ////去除股票sz或者sh前缀
                stockCode = stockCode.substring(2);
                String[] others = otherInfo.split(",");
                //大盘名称
                String stockName = others[0];
                //今日开盘价
                BigDecimal openPrice = new BigDecimal(others[1]);
                //昨日收盘价
                BigDecimal preClosePrice = new BigDecimal(others[2]);
                //当前价格
                BigDecimal currentPrice = new BigDecimal(others[3]);
                //今日最高价额
                BigDecimal maxPrice = new BigDecimal(others[4]);
                //今日最低价额
                BigDecimal minPrice = new BigDecimal(others[5]);
                //成交量
                Long tradeAmount = Long.valueOf(others[8]);
                //成交金额
                BigDecimal tradeVol = new BigDecimal(others[9]);
                //当前日期
                Date curDateTime = DateTimeUtil.getDateTimeWithoutSecond(others[30] + " " + others[31]).toDate();
                //Date currentTime = DateTime.parse(others[30] + " " + others[31], DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();
                StockRtInfo stockRtInfo =StockRtInfo.builder()
                        .id(idWorker.nextId()+"")
                        .stockCode(stockCode)
                        .stockName(stockName)
                        .openPrice(openPrice)
                        .preClosePrice(preClosePrice)
                        .curPrice(currentPrice)
                        .maxPrice(maxPrice)
                        .minPrice(minPrice)
                        .tradeAmount(tradeAmount)
                        .tradeVolume(tradeVol)
                        .curTime(curDateTime)
                        .build();
                return stockRtInfo;
    }

    /**
     * 解析国外大盘数据
     * @param marketCode 大盘ID
     * @param otherInfo 大盘其它信息，以逗号间隔
     * @return
     */
    private StockMarketIndexInfo parser4OuterStockMarket(String marketCode, String otherInfo) {
        //其他信息
        String[] others=otherInfo.split(",");
        //大盘名称
        String marketName = others[0];
        //大盘点数
        BigDecimal curPoint = new BigDecimal(others[1]);
        //当前价格
        BigDecimal curPrice = new BigDecimal(others[2]);
        //振幅
        BigDecimal updownRate = new BigDecimal(others[3]);
        //获取当前时间
        Date now=DateTimeUtil.getDateTimeWithoutSecond(DateTime.now()).toDate();
        //组装实体对象
        StockMarketIndexInfo smi = StockMarketIndexInfo.builder()
                .id(idWorker.nextId()+"")
                .markId(marketCode)
                .curTime(now)
                .markName(marketName)
                .curPoint(curPoint)
                .currentPrice(curPrice)
                .updownRate(updownRate)
                .tradeAccount(0L)
                .tradeVolume(0L)
                .build();
        return smi;
    }

    /**
     * 解析国内大盘数据
     * @param marketCode 大盘ID
     * @param otherInfo 大盘其它信息，以逗号间隔
     * @return
     */
    private StockMarketIndexInfo parser4InnerStockMarket(String marketCode, String otherInfo) {
        //其他信息
        String[] others=otherInfo.split(",");
        //大盘名称
        String marketName = others[0];
        //大盘点数
        BigDecimal curPoint = new BigDecimal(others[1]);
        //当前价格
        BigDecimal curPrice = new BigDecimal(others[2]);
        //振幅
        BigDecimal updownRate = new BigDecimal(others[3]);
        //成交量
        Long tradeCount = Long.valueOf(others[4]);
        //成交金额
        Long tradeVolume = Long.valueOf(others[5]);
        //获取当前时间
        Date now=DateTimeUtil.getDateTimeWithoutSecond(DateTime.now()).toDate();
        //组装实体对象
        StockMarketIndexInfo smi = StockMarketIndexInfo.builder()
                .id(idWorker.nextId()+"")
                .markId(marketCode)
                .curTime(now)
                .markName(marketName)
                .curPoint(curPoint)
                .currentPrice(curPrice)
                .updownRate(updownRate)
                .tradeAccount(tradeCount)
                .tradeVolume(tradeVolume)
                .build();
        return smi;
    }


    /**
     * 转化板块数据获取集合信息
     * @param stockStr
     * @return
     */
    public List<StockBlockRtInfo> parse4StockBlock(String stockStr){
        if (Strings.isNullOrEmpty(stockStr)|| !stockStr.contains("=")){
            return Collections.emptyList();
        }
        String jsonStr = stockStr.substring(stockStr.indexOf("=") + 1);
        HashMap mapInfo = new Gson().fromJson(jsonStr, HashMap.class);
        System.out.println(mapInfo);
        Collection values = mapInfo.values();
        List<StockBlockRtInfo> collect = (List<StockBlockRtInfo>) mapInfo.values().stream().map(restStr -> {
            String infos = (String) restStr;
            String[] infoArray = infos.split(",");
            //板块编码
            String label = infoArray[0];
            //板块行业
            String blockName = infoArray[1];
            //板块公司数量
            Integer companyNum = Integer.valueOf(infoArray[2]);
            //均价
            BigDecimal avgPrice = new BigDecimal(infoArray[3]);
            //涨跌幅度
            BigDecimal priceLimit = new BigDecimal(infoArray[5]);
            //涨跌率
//            BigDecimal updownRate=new BigDecimal(infoArray[5]);
            //总成交量
            Long tradeAmount = Long.valueOf(infoArray[6]);
            //总成交金额
            BigDecimal tradeVolume = new BigDecimal(infoArray[7]);
            //当前日期
            Date now=DateTimeUtil.getDateTimeWithoutSecond(DateTime.now()).toDate();
            //构建板块信息对象
            StockBlockRtInfo blockRtInfo = StockBlockRtInfo.builder().id(idWorker.nextId()+"").label(label)
                    .blockName(blockName).companyNum(companyNum).avgPrice(avgPrice).curTime(now)
                    .updownRate(priceLimit).tradeAmount(tradeAmount).tradeVolume(tradeVolume)
                    .build();
            return blockRtInfo;
        }).collect(Collectors.toList());
        return collect;
    }
}
