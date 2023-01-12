package com.shf.stock.service.impl;

import com.alibaba.excel.EasyExcel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.shf.stock.common.domain.*;
import com.shf.stock.config.vo.StockInfoConfig;
import com.shf.stock.common.enums.ResponseCode;
import com.shf.stock.mapper.StockBlockRtInfoMapper;
import com.shf.stock.mapper.StockBusinessMapper;
import com.shf.stock.mapper.StockMarketIndexInfoMapper;
import com.shf.stock.mapper.StockRtInfoMapper;
import com.shf.stock.pojo.StockBlockRtInfo;
import com.shf.stock.pojo.StockBusiness;
import com.shf.stock.service.StockService;
import com.shf.stock.utils.DateTimeUtil;
import com.shf.stock.vo.resp.PageResult;
import com.shf.stock.vo.resp.R;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private StockBusinessMapper stockBusinessMapper;

    @Autowired
    private StockMarketIndexInfoMapper stockMarketIndexInfoMapper;

    @Autowired
    private StockInfoConfig stockInfoConfig;

    @Autowired
    private StockBlockRtInfoMapper stockBlockRtInfoMapper;

    @Autowired
    private StockRtInfoMapper stockRtInfoMapper;


    @Override
    public List<StockBusiness> getAllStockBusiness() {
        return stockBusinessMapper.getAll();
    }

    /**
     * 获取最新的A股大盘信息
     * @return
     */
    @Override
    public R<List<InnerMarketDomain>> innerIndexAll() {
//        1.获取国内A股大盘的id集合
        List<String> inners = stockInfoConfig.getInner();

//        2.获取最近股票交易日期
        DateTime lastDateTime = DateTimeUtil.getLastDate4Stock(DateTime.now());

//        3. 转Java中的Date;
        Date lastDate = lastDateTime.toDate();

//      TODO  mock测试数据，后期通过第三方接口动态获取实时数据，可删除
        lastDate=DateTime.parse("2021-12-26 10:56:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();

//        4.将获取的java Date传入接口
        List<InnerMarketDomain> list = stockMarketIndexInfoMapper.getMarketInfo(inners, lastDate);

//        5.返回查询结果
        return R.ok(list);
    }

    /**
     * 沪深两市板块分时行情数据查询，以交易时间和交易总金额降序查询，取前10条数据
     * @return
     */
    @Override
    public R<List<StockBlockRtInfo>> sectorAllLimit() {
//        1. 调用mapper接口获取数据
        List<StockBlockRtInfo> infos = stockBlockRtInfoMapper.sectorAllLimit();

//        2. 组装数据
        if (CollectionUtils.isEmpty(infos)) {
            return R.error(ResponseCode.NO_RESPONSE_DATA.getMessage());
        }

        return R.ok(infos);
    }

    /**
     * 沪深两市个股涨幅分时行情数据查询，以时间顺序和涨幅查询前10条数据
     * @return
     */
    @Override
    public R<List<StockUpdownDomain>> getStockRtInfoLimit() {
//        1. 获取最近最新的股票有效交易时间点（精确到分钟）
        Date lastDate = DateTimeUtil.getLastDate4Stock(DateTime.now()).toDate();

//        TODO mock数据
        lastDate=DateTime.parse("2021-12-26 10:56:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();

//        2.调用mapper查询
        List<StockUpdownDomain> list = stockRtInfoMapper.getStockRtInfoLimit(lastDate);

//        3.判断集合装填
        if (CollectionUtils.isEmpty(list)) {
            return R.error(ResponseCode.NO_RESPONSE_DATA.getMessage());
        }

        return R.ok(list);
    }

    /**
     * 分页查询股票交易数据，按照日期和涨幅降序排序
     * @param page
     * @param pageSize
     * @return
     */
    @Override
    public R<PageResult<StockUpdownDomain>> getStockInfo4Page(Integer page, Integer pageSize) {
//        1.设置分页参数
        PageHelper.startPage(page, pageSize);

//        2.查询
        List<StockUpdownDomain> pages=stockRtInfoMapper.getStockInfoAll();
        if (CollectionUtils.isEmpty(pages)) {
            return R.error(ResponseCode.NO_RESPONSE_DATA.getMessage());
        }

//        3.组装PageInfo对象，封装了一切分页信息
        PageInfo<StockUpdownDomain> pageInfo = new PageInfo<>(pages);

//        4. 转换成自定义的分页对象
        PageResult<StockUpdownDomain> pageResult = new PageResult<>(pageInfo);

        return R.ok(pageResult);
    }

    /**
     * 功能描述：沪深两市涨跌停分时行情数据查询，查询T日每分钟的涨跌停数据（T：当前股票交易日）
     * 		查询每分钟的涨停和跌停的数据的同级；
     * 		如果不在股票的交易日内，那么就统计最近的股票交易下的数据
     * 	 map:
     * 	    upList:涨停数据统计
     * 	    downList:跌停数据统计
     * @return
     */
    @Override
    public R<Map> upDownCount() {
//        1. 借助工具类获取最近交易日的开盘时间和收盘时间
//        获取有效时间点
        DateTime avableTimePoint = DateTimeUtil.getLastDate4Stock(DateTime.now());

//        根据有效的时间点获取对应日期的开盘和收盘时间
        Date openTime = DateTimeUtil.getOpenDate(avableTimePoint).toDate();
        Date closeTime = DateTimeUtil.getCloseDate(avableTimePoint).toDate();
//        TODO mock数据
        openTime=DateTime.parse("2021-12-19 09:30:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();
        closeTime=DateTime.parse("2021-12-19 15:00:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();

//        2.查询涨停的统计数据
        List<Map> upList = stockRtInfoMapper.getStockUpDownCount(openTime, closeTime, 1);

//        3.查询跌停的统计数据
        List<Map> downList = stockRtInfoMapper.getStockUpDownCount(openTime, closeTime, 0);

//        4.组装Map:将状态和跌停的数据组装到map中
        HashMap<String, List> map = new HashMap<>();
        map.put("upList", upList);
        map.put("downList", downList);

//        5.返回结果
        return R.ok(map);
    }

    /**
     * 将指定页面的股票导出到excel表下
     * @param response
     * @param page
     * @param pageSize
     */
    @Override
    public void stockExport(HttpServletResponse response, Integer page, Integer pageSize) throws IOException {
        //1.设置响应数据的类型:excel
        response.setContentType("application/vnd.ms-excel");

        //2.设置响应数据的编码格式
        response.setCharacterEncoding("utf-8");

        //3.设置默认的文件名称
        // 这里URLEncoder.encode可以防止中文乱码 当然和easyexcel没有关系
        String fileName = URLEncoder.encode("stockRt", "UTF-8");

        //设置默认文件名称
        response.setHeader("content-disposition", "attachment;filename=" + fileName + ".xlsx");

//        4. 分页查询股票数据
        PageHelper.startPage(page, pageSize);

        List<StockUpdownDomain> pages = stockRtInfoMapper.getStockInfoAll();
        if (CollectionUtils.isEmpty(pages)) {
            R<Object> error = R.error(ResponseCode.NO_RESPONSE_DATA.getMessage());

//            将错误信息转换为JSON字符串响应给前端
            String jsonData = new Gson().toJson(error);

//            响应前端错误数据
            response.getWriter().write(jsonData);

//            终止当前程序
            return;
        }

//        5. 类型转换
        List<StockExcelDomain> domainList = pages.stream().map(item -> {
            StockExcelDomain domain = new StockExcelDomain();
            BeanUtils.copyProperties(item, domain);
            return domain;
        }).collect(Collectors.toList());

//        6. 数据导出
        EasyExcel.write(response.getOutputStream(), StockExcelDomain.class)
                .sheet("stockInfo")
                .doWrite(domainList);
    }

    /**
     * 统计国内A股大盘T日和T-1日成交量对比功能（成交量为沪市和深市成交量之和）
     * @return
     */
    @Override
    public R<Map> stockTradeVol4InnerMarket() {
//        1.获取T日和T-1日的开始时间和结束时间
        DateTime lastDateTime = DateTimeUtil.getLastDate4Stock(DateTime.now());
        DateTime openDateTime = DateTimeUtil.getOpenDate(lastDateTime);

//        转换为java中的Date，这样JDBC默认识别、
        Date startTime4T = openDateTime.toDate();
        Date endTime4T = lastDateTime.toDate();

//        TODO mock数据
        startTime4T=DateTime.parse("2021-12-28 09:30:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();
        endTime4T=DateTime.parse("2021-12-28 15:00:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();

//        1.2 获取T-1日的区间范围
//        获取lastDateTime的上一个股票有效交易日
        DateTime preLastDateTime = DateTimeUtil.getPreviousTradingDay(lastDateTime);
        DateTime preOpenDateTime = DateTimeUtil.getOpenDate(preLastDateTime);

//        转换成java中的Date，这样JDBC默认识别
        Date startTime4PreT = preOpenDateTime.toDate();
        Date endTime4PreT = preLastDateTime.toDate();

//        TODO mock数据
        startTime4PreT=DateTime.parse("2021-12-27 09:30:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();
        endTime4PreT=DateTime.parse("2021-12-27 15:00:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();


//        2.获取上证和深证的配置的大盘id、
//        2.1  获取大盘id、集合
        List<String> markedIds = stockInfoConfig.getInner();

//        3.分别查询T日和T-1日的交易量数据，得到两个集合
//        3.1 查询T日大盘交易统计数据
        List<Map> data4T=stockMarketIndexInfoMapper.getStockTradeVol(markedIds, startTime4T, endTime4T);
        if (CollectionUtils.isEmpty(data4T)) {
            data4T = new ArrayList<>();
        }

//        3.2 查询T-1日大盘交易统计数据
        List<Map> data4PreT=stockMarketIndexInfoMapper.getStockTradeVol(markedIds, startTime4PreT, endTime4PreT);
        if (CollectionUtils.isEmpty(data4PreT)) {
            data4PreT = new ArrayList<>();
        }

//        4.组装响应数据
        HashMap<String, List> info = new HashMap<>();
        info.put("volList", data4T);
        info.put("yesVolList", data4PreT);

//        5.封装返回
        return R.ok(info);
    }

    /**
     * 查询当前时间下股票的涨跌幅度区间统计功能
     * @return
     */
    @Override
    public R<Map> stockUpDownScopeCount() {
//        1. 获取股票最新交易时间
        DateTime dateTime4Stock = DateTimeUtil.getLastDate4Stock(DateTime.now());
        Date lastDate = dateTime4Stock.toDate();
//        TODO mock数据
        lastDate=DateTime.parse("2021-12-28 09:43:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();

//        2.插入mapper接口获取统计数据
        List<Map> infos = stockRtInfoMapper.getStockUpDownRegin(lastDate);

//        保证涨幅区间按照从小到大排序，并且对于没有数据的涨幅区间默认为0
//        思路：只需要按照顺序遍历自定义的涨幅区间集合，然后获取对应的map，就可以保证各个map对象的顺序
//        2.1 获取涨幅区间顺序集合
        List<String> upDownRangeList = stockInfoConfig.getUpDownRange();

//        方式1：普通循环
//        构建新的集合
//        ArrayList<Map> newMaps = new ArrayList<>();

//        for (String item : upDownRangeList) {
////            循环查询的infos集合，找到item对应的map即可
//            Map tmp = null;
//            for (Map info : infos) {
//                if (info.get("title").equals(item)) {
//                    tmp = info;
//                }
//            }
//            if (tmp == null) {
//                tmp = new HashMap();
//                tmp.put("title", item);
//                tmp.put("count", 0);
//            }
//            newMaps.add(tmp);
//        }

//        方式2：lambda
        List<Map> newMaps = upDownRangeList.stream().map(item -> {
            Optional<Map> optional = infos.stream().filter(map -> map.get("title").equals(item)).findFirst();
            Map tmp = null;
//            判断是否有map
            if (optional.isPresent()) {
                tmp = optional.get();
            } else {
                tmp = new HashMap();
                tmp.put("title", item);
                tmp.put("count", 0);
            }
            return tmp;
        }).collect(Collectors.toList());

//        3. 组装数据，并响应
        HashMap<String, Object> data = new HashMap<>();
//        获取日期格式
        String stringDateTime = dateTime4Stock.toString(DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss"));
        data.put("time", stringDateTime);
        data.put("infos", newMaps);
        return R.ok(data);
    }

    /**
     * 询单个个股的分时行情数据，也就是统计指定股票T日每分钟的交易数据
     * @param code
     * @return
     */
    @Override
    public R<List<Stock4MinuteDomain>> stockScreenTimeSharing(String code) {
//        1. 获取最近最新的交易时间和对应的开盘日期
//        1.1 获取最近有效时间点
        DateTime lastDate4Stock = DateTimeUtil.getLastDate4Stock(DateTime.now());
        Date endTime = lastDate4Stock.toDate();
//        TODO mock数据
        endTime=DateTime.parse("2021-12-30 14:47:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();

//        1.2 获取最近有效时间点对应开盘日期
        DateTime openDateTime = DateTimeUtil.getOpenDate(lastDate4Stock);
        Date startTime = openDateTime.toDate();
//        TODO mock数据
        startTime=DateTime.parse("2021-12-30 09:30:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();

//        2.根据股票code和日期范围查询
        List<Stock4MinuteDomain> list = stockRtInfoMapper.getStockInfoByCodeAndDate(code, startTime, endTime);
//        判断非空处理
        if (CollectionUtils.isEmpty(list)) {
            list = new ArrayList<>();
        }

//        3.返回响应数据
        return R.ok(list);
    }

    /**
     * 个股日K线
     * @param stockCode
     * @return
     */
    @Override
    public R<List<Stock4EvrDayDomain>> stockCreenDkLine(String stockCode) {
//        1. 获取查询的日期范围
        DateTime endDateTime = DateTimeUtil.getLastDate4Stock(DateTime.now());
        Date endTime = endDateTime.toDate();
//        TODO mock数据
        endTime=DateTime.parse("2021-12-30 09:00:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();

//        1.2获取开始时间
        DateTime startDateTime = endDateTime.minusDays(10);
        Date startTime = startDateTime.toDate();
//        TODO mock数据
        startTime=DateTime.parse("2021-12-10 09:00:00", DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss")).toDate();

//        2. 调用mapper接口获取查询的集合信息
        List<Stock4EvrDayDomain> data = stockRtInfoMapper.getStockInfo4EvrDay(stockCode, startTime, endTime);
        if (CollectionUtils.isEmpty(data)) {
            data = new ArrayList<>();
        }

//        3.组装数据，响应
        return R.ok(data);
    }

}
