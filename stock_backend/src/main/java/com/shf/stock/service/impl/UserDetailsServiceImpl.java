package com.shf.stock.service.impl;

import com.google.common.base.Strings;
import com.shf.stock.mapper.SysPermissionMapper;
import com.shf.stock.mapper.SysRoleMapper;
import com.shf.stock.mapper.SysUserMapper;
import com.shf.stock.pojo.SysPermission;
import com.shf.stock.pojo.SysRole;
import com.shf.stock.pojo.SysUser;
import com.shf.stock.service.PermissionService;
import com.shf.stock.service.UserDetailsService;
import com.shf.stock.vo.resp.PermissionRespNodeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysPermissionMapper sysPermissionMapper;

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private PermissionService permissionService;

    @Override
    public UserDetails loadUserByUsername(String userName) {
        SysUser user = sysUserMapper.findUserInfoByUserName(userName);
        if (user == null) {
            throw new UsernameNotFoundException("用户不存在");
        }

//        获取权限集合
        List<SysPermission> permissonList = sysPermissionMapper.getPermissionByUserId(user.getId());
        List<String> permsNameList = permissonList.stream()
                .filter(permisson -> !Strings.isNullOrEmpty(permisson.getPerms()))
                .map(permission -> permission.getPerms())
                .collect(Collectors.toList());

//        获取角色集合 基于角色鉴权注解需要将角色前追加ROLE_
        List<SysRole> roleList = sysRoleMapper.getRoleByUserId(user.getId());
//        角色表示需要追加前缀ROLE_
        List<String> roleNameList = roleList.stream().filter(item -> !Strings.isNullOrEmpty(item.getName()))
                .map(item -> "ROLE_" + item.getName())
                .collect(Collectors.toList());
        ArrayList<String> auths = new ArrayList<>();
        auths.addAll(permsNameList);
        auths.addAll(roleNameList);

//        转换为数组
        String[] perms = auths.toArray(new String[auths.size()]);

//        转化为数组，给Springsecurity
        List<GrantedAuthority> authorityList = AuthorityUtils.createAuthorityList(perms);
        user.setAuthorities(authorityList);

//        权限树结构，给前端响应
        List<PermissionRespNodeVo> treeNodeVo = permissionService.getTree(permissonList, "0", true);
        user.setMenus(treeNodeVo);

//        按钮权限集合，给前端响应
        List<String> authBtnPerms = null;
        if (!CollectionUtils.isEmpty(permissonList)) {
            authBtnPerms = permissonList.stream().filter(per -> !Strings.isNullOrEmpty(per.getCode()) && per.getType() == 3)
                    .map(per -> per.getCode()).collect(Collectors.toList());
        }
        user.setPermissions(authBtnPerms);
        return user;
    }
}
