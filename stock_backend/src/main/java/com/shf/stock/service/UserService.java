package com.shf.stock.service;

import com.shf.stock.vo.req.LoginReqVo;
import com.shf.stock.vo.resp.LoginRespVo;
import com.shf.stock.vo.resp.R;

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
}
