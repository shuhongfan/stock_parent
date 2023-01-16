package com.shf.stock.pojo;

import com.shf.stock.vo.resp.PermissionRespNodeVo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 用户表
 *
 * @TableName sys_user
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SysUser implements Serializable, UserDetails {
    private static final long serialVersionUID = 1L;
    /**
     * 用户id
     */
    private String id;
    /**
     * 账户
     */
    private String username;
    /**
     * 用户密码密文
     */
    private String password;
    /**
     * 手机号码
     */
    private String phone;
    /**
     * 真实名称
     */
    private String realName;
    /**
     * 昵称
     */
    private String nickName;
    /**
     * 邮箱(唯一)
     */
    private String email;
    /**
     * 账户状态(1.正常 2.锁定 )
     */
    private Integer status;
    /**
     * 性别(1.男 2.女)
     */
    private Integer sex;
    /**
     * 是否删除(1未删除；0已删除)
     */
    private Integer deleted;
    /**
     * 创建人
     */
    private String createId;
    /**
     * 更新人
     */
    private String updateId;
    /**
     * 创建来源(1.web 2.android 3.ios )
     */
    private Integer createWhere;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 更新时间
     */
    private Date updateTime;

//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        return null;
//    }
    /**
     * 权限集合
     */
    private List<GrantedAuthority> authorities;
//    @Override
//    public boolean isAccountNonExpired() {
//        return false;
//    }
    /**
     * true:账户未过期
     */
    private boolean isAccountNonExpired = true;
//    @Override
//    public boolean isAccountNonLocked() {
//        return false;
//    }
    /**
     * true:账户未锁定
     */
    private boolean isAccountNonLocked = true;
//    @Override
//    public boolean isCredentialsNonExpired() {
//        return false;
//    }
    /**
     * true:凭证（密码）未过期
     */
    private boolean isCredentialsNonExpired = true;
//    @Override
//    public boolean isEnabled() {
//        return false;
//    }
    /**
     * true:不禁用
     */
    private boolean isEnabled = true;
    /**
     * 给认证的用户添加权限菜单集合
     */
    private List<PermissionRespNodeVo> menus;
    /**
     * 前端按钮权限表示
     */
    private List<String> permissions;
}