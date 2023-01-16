package com.shf.stock.handler;

import com.google.gson.Gson;
import com.shf.stock.common.enums.ResponseCode;
import com.shf.stock.vo.resp.R;
import org.springframework.http.MediaType;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 认证用户无权限访问资源处理器
 */
public class StockAccessDeniedHandler implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
//        设置响应数据格式
        response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);

//        构建结果
        R<Object> result = R.error(ResponseCode.NOT_PERMISSION.getCode(), ResponseCode.NOT_PERMISSION.getMessage());

//        将对象序列华为JSON字符串响应前台
        response.getWriter().write(new Gson().toJson(result));
    }
}
