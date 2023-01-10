package com.shf.stock.mapper;

import com.shf.stock.pojo.SysRolePermission;
import org.apache.ibatis.annotations.Mapper;

/**
* @author shuho
* @description 针对表【sys_role_permission(角色权限表)】的数据库操作Mapper
* @createDate 2023-01-08 19:06:44
* @Entity com.shf.stock.pojo.SysRolePermission
*/
@Mapper
public interface SysRolePermissionMapper {

    int deleteByPrimaryKey(Long id);

    int insert(SysRolePermission record);

    int insertSelective(SysRolePermission record);

    SysRolePermission selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysRolePermission record);

    int updateByPrimaryKey(SysRolePermission record);

}
