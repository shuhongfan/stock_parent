package com.shf.stock.service.impl;

import com.google.common.base.Strings;
import com.shf.stock.common.enums.ResponseCode;
import com.shf.stock.mapper.SysUserMapper;
import com.shf.stock.pojo.SysUser;
import com.shf.stock.service.UserService;
import com.shf.stock.utils.IdWorker;
import com.shf.stock.vo.req.LoginReqVo;
import com.shf.stock.vo.resp.LoginRespVo;
import com.shf.stock.vo.resp.R;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 用户服务实现
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private IdWorker idWorker;

    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public R<LoginRespVo> login(LoginReqVo vo) {
//        1. 判断vo是否存在，或者用户名是否存在
        if (vo == null || Strings.isNullOrEmpty(vo.getUsername()) || Strings.isNullOrEmpty(vo.getPassword()) ||
                Strings.isNullOrEmpty(vo.getCode()) || Strings.isNullOrEmpty(vo.getRkey())) {
            return R.error(ResponseCode.DATA_ERROR.getMessage());
        }

//        1.1 校验验证码
//        获取Redis中rkey对应的验证码
        String redisCode = (String) redisTemplate.opsForValue().get(vo.getRkey());
//        比对
        if (redisCode == null || !redisCode.equals(vo.getCode())) {
            return R.error(ResponseCode.DATA_ERROR.getMessage());
        }

//        快速淘汰验证码，合理利用Redis的内存空间
        redisTemplate.delete(vo.getRkey());

//        2.根据用户名查询用户是否存在
        SysUser userInfo = sysUserMapper.findUserInfoByUserName(vo.getUsername());
        if (userInfo == null) {
            return R.error(ResponseCode.DATA_ERROR.getMessage());
        }

//        3.判断密码，不匹配
        if (!passwordEncoder.matches(vo.getPassword(), userInfo.getPassword())) {
            return R.error(ResponseCode.SYSTEM_PASSWORD_ERROR.getMessage());
        }

//        4.属性赋值 两个类之间属性名称一致
        LoginRespVo respVo = new LoginRespVo();
        BeanUtils.copyProperties(userInfo, respVo);

        return R.ok(respVo);
    }

    /**
     * 生成登录校验码
     * @return
     */
    @Override
    public R<Map> getCaptchaCode() {
//        1. 生成随机校验码, 长度为4
        String checkCode = RandomStringUtils.randomNumeric(4);

//        2. 生成一个类似sessionId 的id作为key，然后校验码作为value保存在Redis中，同时设置有效期60s
        long redisKey = idWorker.nextId();
        String sessionId = String.valueOf(redisKey);
        redisTemplate.opsForValue().set(sessionId, checkCode, 60, TimeUnit.SECONDS);

//        3.组装响应的map对象
        HashMap<String, String> map = new HashMap<>();
        map.put("code", checkCode);
        map.put("rkey", sessionId);

//        4. 返回组装数据
        return R.ok(map);
    }

}
