package com.shf.stock.controller;

import com.shf.stock.common.domain.InnerMarketDomain;
import com.shf.stock.common.domain.Stock4EvrDayDomain;
import com.shf.stock.common.domain.Stock4MinuteDomain;
import com.shf.stock.common.domain.StockUpdownDomain;
import com.shf.stock.pojo.StockBlockRtInfo;
import com.shf.stock.pojo.StockBusiness;
import com.shf.stock.service.StockService;
import com.shf.stock.vo.resp.PageResult;
import com.shf.stock.vo.resp.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
     *
     * @param response
     * @param page
     * @param pageSize
     */
    @GetMapping("/stock/export")
    public void stockExport(HttpServletResponse response, Integer page, Integer pageSize) throws IOException {
        stockService.stockExport(response, page, pageSize);
    }

    /**
     * 功能描述：统计国内A股大盘T日和T-1日成交量对比功能（成交量为沪市和深市成交量之和）
     *   map结构示例：
     *      {
     *         "volList": [{"count": 3926392,"time": "202112310930"},......],
     *       "yesVolList":[{"count": 3926392,"time": "202112310930"},......]
     *      }
     * @return
     */
    @GetMapping("/stock/tradevol")
    public R<Map> stockTradeVol4InnerMarket() {
        return stockService.stockTradeVol4InnerMarket();
    }

    /**
     * 查询当前时间下股票的涨跌幅度区间统计功能
     * 如果当前日期不在有效时间内，则以最近的一个股票交易时间作为查询点
     * @return
     */
    @GetMapping("/stock/updown")
    public R<Map> getStockUpDown(){
        return stockService.stockUpDownScopeCount();
    }

    /**
     * 功能描述：查询单个个股的分时行情数据，也就是统计指定股票T日每分钟的交易数据；
     *         如果当前日期不在有效时间内，则以最近的一个股票交易时间作为查询时间点
     * @param code 股票编码
     * @return
     */
    @GetMapping("/stock/screen/time-sharing")
    public R<List<Stock4MinuteDomain>> stockScreenTimeSharing(@RequestParam("code") String code){
        return stockService.stockScreenTimeSharing(code);
    }


    /**
     * 单个个股日K 数据查询 ，可以根据时间区间查询数日的K线数据
     * @param stockCode 股票编码
     */
    @RequestMapping("/stock/screen/dkline")
    public R<List<Stock4EvrDayDomain>> getDayKLinData(@RequestParam("code") String stockCode){
        return stockService.stockCreenDkLine(stockCode);
    }
}
