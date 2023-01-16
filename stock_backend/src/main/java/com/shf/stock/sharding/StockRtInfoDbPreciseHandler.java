package com.shf.stock.sharding;

import org.apache.shardingsphere.api.sharding.standard.PreciseShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.standard.PreciseShardingValue;
import org.joda.time.DateTime;

import java.util.Collection;
import java.util.Date;

/**
 * 定义公共精确匹配数据的类
 */
public class StockRtInfoDbPreciseHandler implements PreciseShardingAlgorithm<Date> {

    /**
     * @param dbNames       数据源集合
     * @param shardingValue 分片键相关信息的封装
     * @return 具体的数据源名称
     */
    @Override
    public String doSharding(Collection<String> dbNames, PreciseShardingValue<Date> shardingValue) {
//        获取分片的字段
        String columnName = shardingValue.getColumnName();
        System.out.println(columnName);

//        获取逻辑表
        String logicTableName = shardingValue.getLogicTableName();
        System.out.println(logicTableName);

//        获取分片值
        Date date = shardingValue.getValue();

//        获取年份
        int year = new DateTime(date).getYear();

//        从数据源集合中查找以指定的年结尾的数据源即可
        String dbName = dbNames.stream().filter(name -> name.endsWith(year + "")).findFirst().get();

        return dbName;
    }
}
