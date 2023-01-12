package com.shf.stock.mapper;

import com.shf.stock.common.domain.Stock4EvrDayDomain;
import com.shf.stock.common.domain.Stock4MinuteDomain;
import com.shf.stock.common.domain.StockUpdownDomain;
import com.shf.stock.pojo.StockRtInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
* @author shuho
* @description 针对表【stock_rt_info(个股详情信息表)】的数据库操作Mapper
* @createDate 2023-01-08 19:06:44
* @Entity com.shf.stock.pojo.StockRtInfo
*/
@Mapper
public interface StockRtInfoMapper {

    int deleteByPrimaryKey(Long id);

    int insert(StockRtInfo record);

    int insertSelective(StockRtInfo record);

    StockRtInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(StockRtInfo record);

    int updateByPrimaryKey(StockRtInfo record);

    /**
     * 沪深两市个股涨幅分时行情数据查询，以时间顺序和涨幅查询前10条数据
     * @param timePoint 时间点，精确到分钟
     * @return
     */
    List<StockUpdownDomain> getStockRtInfoLimit(@Param("timePoint") Date timePoint);

    /**
     * 根据日期和涨幅降序排序查询股票信息
     * @return
     */
    List<StockUpdownDomain> getStockInfoAll();

    /**
     * 根据制定日期范围统计对应范围内每分钟的涨停或者跌停的数据
     * @param startTime 开始时间
     * @param endTime  结束时间
     * @param flag  标识 1代表涨停 0代表跌停
     * @return
     */
    List<Map> getStockUpDownCount(@Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("flag") int flag);

    /**
     * 查询指定时间点下股票在各个涨幅区间的数量
     * @param timePoint
     * @return
     */
    List<Map> getStockUpDownRegin(@Param("timePoint") Date timePoint);


    /**
     * 根据时间范围查询指定股票的交易流水
     * @param code
     * @param startTime
     * @param endTime
     * @return
     */
    List<Stock4MinuteDomain> getStockInfoByCodeAndDate(@Param("code") String code, @Param("startTime") Date startTime, @Param("endTime") Date endTime);

    /**
     * 查询指定日期范围内指定股票每天的交易数据
     * @param stockCode
     * @param startTime
     * @param endTime
     * @return
     */
    List<Stock4EvrDayDomain> getStockInfo4EvrDay(@Param("stockCode") String stockCode, @Param("startTime") Date startTime, @Param("endTime") Date endTime);
}
