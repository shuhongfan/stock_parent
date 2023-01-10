package com.shf.stock.service;

import com.shf.stock.common.domain.InnerMarketDomain;
import com.shf.stock.pojo.StockBlockRtInfo;
import com.shf.stock.pojo.StockBusiness;
import com.shf.stock.vo.resp.R;

import java.util.List;

public interface StockService {
    /**
     * 获取所有股票信息
     * @return
     */
    List<StockBusiness> getAllStockBusiness();

    /**
     * 获取最新的A股大盘信息
     * @return
     */
    R<List<InnerMarketDomain>> innerIndexAll();

    /**
     * 沪深两市板块分时行情数据查询，以交易时间和交易总金额降序查询，取前10条数据
     * @return
     */
    R<List<StockBlockRtInfo>> sectorAllLimit();
}
