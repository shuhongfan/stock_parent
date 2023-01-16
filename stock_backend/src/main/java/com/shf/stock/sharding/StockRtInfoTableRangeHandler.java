package com.shf.stock.sharding;

import com.google.common.collect.Range;
import org.apache.shardingsphere.api.sharding.standard.RangeShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.standard.RangeShardingValue;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;

import java.util.Collection;
import java.util.Date;
import java.util.stream.Collectors;

/**
 * 定义股票流水范围查询的算法类
 * <p>
 * 比较大小
 */
public class StockRtInfoTableRangeHandler implements RangeShardingAlgorithm<Date> {

    /**
     * @param tbNames       表名称集合
     * @param shardingValue 封装分片键分为查询的对象
     * @return
     */
    @Override
    public Collection<String> doSharding(Collection<String> tbNames, RangeShardingValue<Date> shardingValue) {
//        获取范围对象
        Range<Date> valueRange = shardingValue.getValueRange();

//        判断是否有下限值
        if (valueRange.hasLowerBound()) {
//            获取下限值
            Date lowerDate = valueRange.lowerEndpoint();
//            获取年月组合字符串，如202210
            String dateStr = new DateTime(lowerDate).toString(DateTimeFormat.forPattern("yyyyMM"));
            Integer dateInt = Integer.valueOf(dateStr);
//            从tbNames集合中获取大于等于intDate的表的名称集合
            tbNames = tbNames.stream().filter(tbName -> Integer.valueOf(
                            tbName.substring(tbName.lastIndexOf("_") + 1)) >= dateInt)
                    .collect(Collectors.toList());

        }

        //        判断是否有上限值
        if (valueRange.hasLowerBound()) {
//            获取上限值
            Date upperDate = valueRange.upperEndpoint();
//            获取年月组合字符串，如202210
            String dateStr = new DateTime(upperDate).toString(DateTimeFormat.forPattern("yyyyMM"));
            Integer dateInt = Integer.valueOf(dateStr);
//            从tbNames集合中获取大于等于intDate的表的名称集合
            tbNames = tbNames.stream().filter(tbName -> Integer.valueOf(
                            tbName.substring(tbName.lastIndexOf("_") + 1)) <= dateInt)
                    .collect(Collectors.toList());

        }

        return tbNames;
    }
}
