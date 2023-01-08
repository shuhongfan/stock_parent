package com.shf.stock;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
public class TestPasswordEncoder {
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    public void test1() {
        String pwd = "123456";

//        加密
        String encode1 = passwordEncoder.encode(pwd);
        String encode2 = passwordEncoder.encode(pwd);

//        验证密码是否正确
        boolean r1 = passwordEncoder.matches(pwd, encode1);
        System.out.println(r1);

        boolean r2 = passwordEncoder.matches(pwd, encode2);
        System.out.println(r2);

    }

}
