package com.shf.stock;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.shf.stock.mapper")
public class StockAPP {
    public static void main(String[] args) {
        SpringApplication.run(StockAPP.class, args);
    }
}
