package com.gxzy.salary.basic.controller;


import com.gxzy.salary.basic.model.Workmodes;
import com.gxzy.salary.basic.service.WorkmodesService;
import com.gxzy.salary.core.http.HttpResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 工作模式表 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@RestController
@RequestMapping("/workmodes")
public class WorkmodesController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(WorkmodesController.class);
    @Autowired
    private WorkmodesService workmodesService;

    @GetMapping(value = "/findAll")
    public HttpResult findJbAll() {
        int category =0;
        return HttpResult.ok(workmodesService.findAll());
    }

}
