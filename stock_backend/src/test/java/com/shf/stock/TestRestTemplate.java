package com.shf.stock;

import com.shf.stock.config.HttpClientConfig;
import lombok.Data;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@SpringBootTest(classes = {HttpClientConfig.class})
public class TestRestTemplate {
    @Autowired
    private RestTemplate restTemplate;

    /**
     * get请求携带参数访问外部url
     */
    @Test
    public void test1() {
        String url="http://localhost:8081/api/quot/stock/updown";

        ResponseEntity<String> entity = restTemplate.getForEntity(url, String.class);

        // 获取响应头信息
        HttpHeaders headers = entity.getHeaders();
        System.out.println(headers);

        // 获取响应状态码
        HttpStatus statusCode = entity.getStatusCode();
        System.out.println(statusCode);

        // 获取响应数据
        String resString = entity.getBody();
        System.out.println(resString);
    }

    @Data
    public static class MyData {
        private String code;
        private Map<String,Object> data;
    }

    /**
     * get请求响应数据自动封装vo实体对象
     */
    @Test
    public void test2() {
        String url="http://localhost:8081/api/quot/stock/updown";
        ResponseEntity<MyData> entity = restTemplate.getForEntity(url, MyData.class);
        MyData body = entity.getBody();
        System.out.println(body);
    }

    /**
     * get请求响应数据自动封装vo实体对象
     */
    @Test
    public void test3() {
        String url="http://localhost:8081/api/quot/stock/updown";
        MyData data = restTemplate.getForObject(url, MyData.class);
        System.out.println(data);
    }

    /**
     * 请求头携带参数访问外部接口
     */
    @Test
    public void test4() {
        String url="http://localhost:8081/api/quot/stock/updown";

//        构建请求头对象
        HttpHeaders headers = new HttpHeaders();
        headers.add("userName","zhangsan");

//        将请求头对象封装到请求对象下
        HttpEntity<Object> entity = new HttpEntity<>(headers);

//        发起请求 请求url地址；请求方法；请求对象；响应数据类型
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        System.out.println(responseEntity);

        String res = restTemplate.postForObject(url, HttpMethod.GET, String.class);
        System.out.println(res);
    }

    /**
     * post模拟form表单提交数据
     */
    @Test
    public void test5() {
        String url="http://localhost:8081/api/quot/stock/updown";

//        构建请求头对象，设置当前请求方式form方式
        HttpHeaders headers = new HttpHeaders();

//        告知后端当前请求以form的方式提交
        headers.add("Content-type","application/x-www-form-urlencoded");

//        构建请求体下的请求数据
        LinkedMultiValueMap<String, Object> data = new LinkedMultiValueMap<>();
        data.add("id", "1");
        data.add("userName","zhangSan");
        data.add("address","sh");

//        将请求头和数据封装到请求对象下
        HttpEntity<Object> entity = new HttpEntity<>(data, headers);

//        发起请求
        ResponseEntity<MyData> response = restTemplate.exchange(url, HttpMethod.POST, entity, MyData.class);
        MyData body = response.getBody();
        System.out.println(body);
    }

    /**
     * POST请求发送JSON数据
     */
    @Test
    public void test6() {
        String url="http://localhost:6666/account/updateAccount";
        //设置请求头的请求参数类型
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type","application/json; charset=utf-8");

        //组装json格式数据
        String jsonReq="{\"address\":\"上海\",\"id\":\"1\",\"userName\":\"zhangsan\"}";
        //构建请求对象
        HttpEntity<String> httpEntity = new HttpEntity<>(jsonReq, headers);
        /*
            发送数据
            参数1：请求url地址
            参数2：请求方式
            参数3：请求体对象，携带了请求头和请求体相关的参数
            参数4：响应数据类型
         */
        ResponseEntity<MyData> responseEntity = restTemplate.exchange(url, HttpMethod.POST, httpEntity, MyData.class);
        //或者
        // MyData account=restTemplate.postForObject(url,httpEntity,MyData.class);
        MyData body = responseEntity.getBody();
        System.out.println(body);
    }

    /**
     * 获取请求cookie值
     */
    @Test
    public void test06(){
        String url="http://localhost:6666/account/getCookie";
        ResponseEntity<String> result = restTemplate.getForEntity(url, String.class);
        //获取cookie
        List<String> cookies = result.getHeaders().get("Set-Cookie");
        //获取响应数据
        String resStr = result.getBody();
        System.out.println(resStr);
        System.out.println(cookies);
    }

    @Test
    public void testRep2(){
        // 按指定模式在字符串查找
        String line = "This order was placed for QT3000! OK?";
        String pattern = "(\\D*)(\\d+)(.*)";

        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern);

        // 现在创建 matcher 对象
        Matcher m = r.matcher(line);
        if (m.find( )) {
            System.out.println("Found value: " + m.group(0) );
            System.out.println("Found value: " + m.group(1) );
            System.out.println("Found value: " + m.group(2) );
            System.out.println("Found value: " + m.group(3) );
        } else {
            System.out.println("NO MATCH");
        }
    }
}
