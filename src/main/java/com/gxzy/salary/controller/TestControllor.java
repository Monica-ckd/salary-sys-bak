package com.gxzy.salary.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestControllor {
    private static final Logger logger = LoggerFactory.getLogger(TestControllor.class);
    @GetMapping(value="/hello")
    public Object hello() {
        // test logger
        logger.info("wwwww==============================");
        return "Hello Kitty!";
    }
}
