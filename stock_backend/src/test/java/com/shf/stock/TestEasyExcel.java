package com.shf.stock;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.shf.stock.pojo.User;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@SpringBootTest
public class TestEasyExcel {

    public List<User> init() {
        ArrayList<User> users = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            User user = User.builder()
                    .address("上海" + i)
                    .userName("张三" + i)
                    .birthday(new Date())
                    .age(10 + i)
                    .build();
            users.add(user);
        }
        return users;
    }

    @Test
    public void writeExcel() {
        List<User> users = init();
        //不做任何注解处理时，表头名称与实体类属性名称一致
        EasyExcel.write("./用户.xls", User.class).sheet("用户信息").doWrite(users);
    }

    @Test
    public void readExcel() {
        ArrayList<User> users = new ArrayList<>();

        EasyExcel.read("./用户.xls", User.class, new AnalysisEventListener<User>() {
            /**
             * 获取每一行封装的对象
             * @param user
             * @param analysisContext
             */
            @Override
            public void invoke(User user, AnalysisContext analysisContext) {
                System.out.println(user);
                users.add(user);
            }

            @Override
            public void doAfterAllAnalysed(AnalysisContext analysisContext) {
                System.out.println("Excel读取完毕");
            }
        }).sheet().doRead();

        System.out.println(users);
    }
}
