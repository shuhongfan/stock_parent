package com.shf.stock.sharding;

import org.apache.shardingsphere.api.sharding.standard.PreciseShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.standard.PreciseShardingValue;

import java.util.Collection;
import java.util.Date;

/**
 * 定义公共精确匹配表的类
 *
 * 要求：库内表没有水平分表
 */
public class CommonTbPreciseShardingAlgorithm implements PreciseShardingAlgorithm<Date> {

    /**
     * 物理表名称集合
     *
     * @param tbNames       物理表名称集合
     * @param shardingValue 分片键相关信息的封装
     * @return 具体的数据源名称
     */
    @Override
    public String doSharding(Collection<String> tbNames, PreciseShardingValue<Date> shardingValue) {
//        获取逻辑表
        String logicTableName = shardingValue.getLogicTableName();
//        String logicTableName = tbNames.stream().findFirst().get();
        return logicTableName;
    }
}
