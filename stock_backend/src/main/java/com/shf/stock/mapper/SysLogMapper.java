package com.shf.stock.mapper;

import com.shf.stock.pojo.SysLog;
import org.apache.ibatis.annotations.Mapper;

/**
* @author shuho
* @description 针对表【sys_log(系统日志)】的数据库操作Mapper
* @createDate 2023-01-08 19:06:44
* @Entity com.shf.stock.pojo.SysLog
*/
@Mapper
public interface SysLogMapper {

    int deleteByPrimaryKey(Long id);

    int insert(SysLog record);

    int insertSelective(SysLog record);

    SysLog selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysLog record);

    int updateByPrimaryKey(SysLog record);

}
