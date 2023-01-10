package com.shf.stock.service;

import com.shf.stock.vo.req.LoginReqVo;
import com.shf.stock.vo.resp.LoginRespVo;
import com.shf.stock.vo.resp.R;

import java.util.Map;

/**
 * 用户服务接口
 */
public interface UserService {

    /**
     * 登录
     * @param vo
     * @return
     */
    R<LoginRespVo> login(LoginReqVo vo);

    /**
     * 生成登录校验码
     * @return
     */
    R<Map> getCaptchaCode();
}
