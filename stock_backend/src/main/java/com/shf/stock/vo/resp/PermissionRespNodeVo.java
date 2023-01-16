package com.shf.stock.vo.resp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PermissionRespNodeVo {
    private String id;

    private String title;

    private List<?> children;

    private String url;
    private String icon;
    private String name;
    private String path;
}
