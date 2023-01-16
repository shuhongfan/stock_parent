package com.shf.stock.sharding;

import org.apache.shardingsphere.api.sharding.standard.RangeShardingAlgorithm;
import org.apache.shardingsphere.api.sharding.standard.RangeShardingValue;

import java.util.Collection;
import java.util.Date;

/**
 * 定义公共范围匹配表的类
 */
public class CommonTbRangeShardingAlgorithm implements RangeShardingAlgorithm<Date> {

    /**
     * @param tbNames       逻辑表的名称集合
     * @param shardingValue 范围查询分片值相关信息的封装
     * @return
     */
    @Override
    public Collection<String> doSharding(Collection<String> tbNames, RangeShardingValue<Date> shardingValue) {

        return tbNames;
    }
}
