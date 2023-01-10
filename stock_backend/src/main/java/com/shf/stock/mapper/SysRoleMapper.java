package com.shf.stock.mapper;

import com.shf.stock.pojo.SysRole;
import org.apache.ibatis.annotations.Mapper;

/**
* @author shuho
* @description 针对表【sys_role(角色表)】的数据库操作Mapper
* @createDate 2023-01-08 19:06:44
* @Entity com.shf.stock.pojo.SysRole
*/
@Mapper
public interface SysRoleMapper {

    int deleteByPrimaryKey(Long id);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    SysRole selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);

}
