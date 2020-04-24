package com.gxzy.salary;
/**
 *  @author: chenkaidi
 *  @Date: 2019/8/5 11:32
 *  @Description:
 */

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages ={"com.gxzy.salary.*","com.gxzy.salary.book.*"})
        public class SalarySysApplication {

    public static void main(String[] args) {
        SpringApplication.run(SalarySysApplication.class, args);
    }

}
