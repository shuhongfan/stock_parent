package com.shf.stock.service.impl;

import com.shf.stock.mapper.StockBusinessMapper;
import com.shf.stock.pojo.StockBusiness;
import com.shf.stock.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private StockBusinessMapper stockBusinessMapper;

    @Override
    public List<StockBusiness> getAllStockBusiness() {
        return stockBusinessMapper.getAll();
    }
}
