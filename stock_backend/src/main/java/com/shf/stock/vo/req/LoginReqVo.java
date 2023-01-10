package com.shf.stock.vo.req;

import lombok.Data;

@Data
public class LoginReqVo {
    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 验证码
     */
    private String code;

    /**
     * 前端发送的SessionID
     */
    private String rkey;
}