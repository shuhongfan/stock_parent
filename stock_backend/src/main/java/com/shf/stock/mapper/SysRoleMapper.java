package com.shf.stock.mapper;

import com.shf.stock.pojo.SysRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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

    /**
     * 根据用户id查询角色信息
     *
     * @param userId
     * @return
     */
    List<SysRole> getRoleByUserId(@Param("userId") String userId);
}
