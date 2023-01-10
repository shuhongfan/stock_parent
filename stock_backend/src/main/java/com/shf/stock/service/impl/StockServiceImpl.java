package com.shf.stock.service.impl;

import com.shf.stock.common.domain.InnerMarketDomain;
import com.shf.stock.common.domain.StockInfoConfig;
import com.shf.stock.common.enums.ResponseCode;
import com.shf.stock.mapper.StockBlockRtInfoMapper;
import com.shf.stock.mapper.StockBusinessMapper;
import com.shf.stock.mapper.StockMarketIndexInfoMapper;
import com.shf.stock.pojo.StockBlockRtInfo;
import com.shf.stock.pojo.StockBusiness;
import com.shf.stock.service.StockService;
import com.shf.stock.utils.DateTimeUtil;
import com.shf.stock.vo.resp.R;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;

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
}
