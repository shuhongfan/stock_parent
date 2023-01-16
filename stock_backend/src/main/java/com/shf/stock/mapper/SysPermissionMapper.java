package com.shf.stock.mapper;

import com.shf.stock.pojo.SysPermission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author shuho
 * @description 针对表【sys_permission(权限表（菜单）)】的数据库操作Mapper
 * @createDate 2023-01-08 19:06:44
 * @Entity com.shf.stock.pojo.SysPermission
 */
@Mapper
public interface SysPermissionMapper {

    int deleteByPrimaryKey(Long id);

    int insert(SysPermission record);

    int insertSelective(SysPermission record);

    SysPermission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysPermission record);

    int updateByPrimaryKey(SysPermission record);

    /**
     * 根据用户id查询用户信息
     *
     * @param userId
     * @return
     */
    List<SysPermission> getPermissionByUserId(@Param("userId") String userId);
}
