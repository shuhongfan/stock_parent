package com.shf.stock.filter;

import com.shf.stock.utils.JwtTokenUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.rmi.RemoteException;
import java.util.List;

public class JwtAuthorizationFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
//        判断是否已经有token
//        获取token
        String tokenStr = request.getHeader(JwtTokenUtil.TOKEN_HEADER);

//        若请求头中没有Authorization信息，则直接放行
        if (tokenStr == null || tokenStr.trim() == "") {
//            放行到登录页面进行登录
            filterChain.doFilter(request, response);
//            停止当前逻辑判断
            return;
        }

//        从Token中解密获取用户名
        String username = JwtTokenUtil.getUsername(tokenStr);

//        从Token中法解密获取用户角色和权限集合字符串
        String role = JwtTokenUtil.getUserRole(tokenStr);

//        获取以逗号间隔的权限字符串
        String rolesNames = StringUtils.strip(role, "[]");

//        获取权限集合
        List<GrantedAuthority> authorities = AuthorityUtils.commaSeparatedStringToAuthorityList(rolesNames);
        if (username == null) {
            throw new RemoteException("token无效");
        }

//        生成授权Token
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, null);

//        认证token对象存入security上下文中，其他security过滤器都可以直接在上下文中获取该token
        SecurityContextHolder.getContext().setAuthentication(token);
        filterChain.doFilter(request, response);
    }
}
