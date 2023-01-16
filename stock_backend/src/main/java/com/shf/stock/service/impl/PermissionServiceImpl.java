package com.shf.stock.service.impl;

import com.shf.stock.pojo.SysPermission;
import com.shf.stock.service.PermissionService;
import com.shf.stock.vo.resp.PermissionRespNodeVo;
import org.apache.commons.compress.utils.Lists;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionService {

    @Override
    public List<PermissionRespNodeVo> getTree(List<SysPermission> permissions, String pid, boolean isOnLyMenuType) {
        ArrayList<PermissionRespNodeVo> list = Lists.newArrayList();
        if (CollectionUtils.isEmpty(permissions)) {
            return list;
        }
        permissions.stream().forEach(permission -> {
            if (permission.getPid().equals(pid)) {
                if (permission.getType().intValue() != 3 || !isOnLyMenuType) {
                    PermissionRespNodeVo respNodeVo = new PermissionRespNodeVo();
                    respNodeVo.setId(permission.getId());
                    respNodeVo.setTitle(permission.getTitle());
                    respNodeVo.setIcon(permission.getIcon());
                    respNodeVo.setPath(permission.getUrl());
                    respNodeVo.setName(permission.getName());
                    respNodeVo.setChildren(getTree(permissions, permission.getId(), isOnLyMenuType));
                    list.add(respNodeVo);
                }
            }
        });

        return list;
    }
}
