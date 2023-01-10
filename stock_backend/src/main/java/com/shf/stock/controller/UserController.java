package com.shf.stock.controller;

import com.shf.stock.service.UserService;
import com.shf.stock.vo.req.LoginReqVo;
import com.shf.stock.vo.resp.LoginRespVo;
import com.shf.stock.vo.resp.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public R<LoginRespVo> login(@RequestBody LoginReqVo vo) {
        return userService.login(vo);
    }

    /**
     * 生成登录校验码
     * @return
     */
    @GetMapping("/captcha")
    public R<Map> getCaptchaCode() {
        return userService.getCaptchaCode();
    }
}
