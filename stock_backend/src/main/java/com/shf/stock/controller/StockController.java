package com.shf.stock.controller;

import com.shf.stock.common.domain.InnerMarketDomain;
import com.shf.stock.common.domain.StockUpdownDomain;
import com.shf.stock.pojo.StockBlockRtInfo;
import com.shf.stock.pojo.StockBusiness;
import com.shf.stock.service.StockService;
import com.shf.stock.vo.resp.PageResult;
import com.shf.stock.vo.resp.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/quot")
@CrossOrigin
public class StockController {
    @Autowired
    private StockService stockService;

    @GetMapping("/stock/business/all")
    public List<StockBusiness> getAllBusiness() {
        return stockService.getAllStockBusiness();
    }

    /**
     * 获取最新的A股大盘信息
     * 如果不在股票交易日，则显示最近最新的交易数据信息
     *
     * @return
     */
    @GetMapping("/index/all")
    public R<List<InnerMarketDomain>> innerIndexAll() {
        return stockService.innerIndexAll();
    }

    /**
     * 沪深两市板块分时行情数据查询，以交易时间和交易总金额降序查询，取前10条数据
     *
     * @return
     */
    @GetMapping("/sector/all")
    public R<List<StockBlockRtInfo>> sectorAll() {
        return stockService.sectorAllLimit();
    }

    /**
     * 沪深两市个股涨幅分时行情数据查询，以时间顺序和涨幅查询前10条数据
     *
     * @return
     */
    @GetMapping("/stock/increase")
    public R<List<StockUpdownDomain>> getStockRtInfoLimit() {
        return stockService.getStockRtInfoLimit();
    }

    /**
     * 分页查询股票交易数据，按照日期和涨幅降序排序
     *
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/stock/all")
    public R<PageResult<StockUpdownDomain>> getStockInfo4Page(Integer page, Integer pageSize) {
        return stockService.getStockInfo4Page(page, pageSize);
    }

    /**
     * 功能描述：沪深两市涨跌停分时行情数据查询，查询T日每分钟的涨跌停数据（T：当前股票交易日）
     * 查询每分钟的涨停和跌停的数据的同级；
     * 如果不在股票的交易日内，那么就统计最近的股票交易下的数据
     * map:
     * upList:涨停数据统计
     * downList:跌停数据统计
     *
     * @return
     */
    @GetMapping("/stock/updown/count")
    public R<Map> upDownCount() {
        return stockService.upDownCount();
    }


    /**
     * 将指定页面的股票导出到excel表下
     * @param response
     * @param page
     * @param pageSize
     */
    @GetMapping("/stock/export")
    public void stockExport(HttpServletResponse response, Integer page, Integer pageSize) throws IOException {
        stockService.stockExport(response, page, pageSize);
    }
}
