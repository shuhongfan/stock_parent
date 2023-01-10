package com.shf.stock;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

@SpringBootTest
public class TestRedisDemo {

    @Autowired
    private RedisTemplate redisTemplate;

    @Test
    public void test01() {
        redisTemplate.opsForValue().set("name","zhangsan");
        Object name = redisTemplate.opsForValue().get("name");
        System.out.println(name);
    }
}
