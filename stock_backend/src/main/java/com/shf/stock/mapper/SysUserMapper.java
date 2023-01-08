package com.shf.stock.mapper;

import com.shf.stock.pojo.SysUser;
import org.apache.ibatis.annotations.Param;

/**
* @author shuho
* @description 针对表【sys_user(用户表)】的数据库操作Mapper
* @createDate 2023-01-08 19:06:44
* @Entity com.shf.stock.pojo.SysUser
*/
public interface SysUserMapper {

    int deleteByPrimaryKey(Long id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    /**
     * 根据用户名查询用户是否存在
     *
     * @param username
     * @return
     */
    SysUser findUserInfoByUserName(@Param("username") String username);
}
