package com.shf.stock.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * 角色权限表
 * @TableName sys_role_permission
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysRolePermission implements Serializable {
    /**
     * 主键
     */
    private String id;

    /**
     * 角色id
     */
    private String roleId;

    /**
     * 菜单权限id
     */
    private String permissionId;

    /**
     * 创建时间
     */
    private Date createTime;

    private static final long serialVersionUID = 1L;
}