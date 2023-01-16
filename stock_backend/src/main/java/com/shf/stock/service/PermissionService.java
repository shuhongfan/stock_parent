package com.shf.stock.service;

import com.shf.stock.pojo.SysPermission;
import com.shf.stock.vo.resp.PermissionRespNodeVo;

import java.util.List;

public interface PermissionService {
    public List<PermissionRespNodeVo> getTree(List<SysPermission> permissions, String pid, boolean isOnLyMenuType);

}
