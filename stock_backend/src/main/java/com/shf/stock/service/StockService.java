package com.shf.stock.service;

import com.shf.stock.pojo.StockBusiness;

import java.util.List;

public interface StockService {
    /**
     * 获取所有股票信息
     * @return
     */
    List<StockBusiness> getAllStockBusiness();
}
