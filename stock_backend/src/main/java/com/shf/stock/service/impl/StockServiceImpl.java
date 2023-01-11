package com.shf.stock.service.impl;

import com.alibaba.excel.EasyExcel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.shf.stock.common.domain.InnerMarketDomain;
import com.shf.stock.common.domain.StockExcelDomain;
import com.shf.stock.common.domain.StockInfoConfig;
import com.shf.stock.common.domain.StockUpdownDomain;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

}
