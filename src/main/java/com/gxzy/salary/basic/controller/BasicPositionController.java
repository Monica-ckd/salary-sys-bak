package com.gxzy.salary.basic.controller;


import com.gxzy.salary.basic.service.BasicPositionService;
import com.gxzy.salary.core.http.HttpResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 员工岗位信息表 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-28
 */
@RestController
@RequestMapping("basicPosition")
public class BasicPositionController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(BasicPositionController.class);

    @Autowired
    private BasicPositionService basicPositionService;

    @GetMapping(value = "/findAll")
    public HttpResult findBaiscPostChange() {
        logger.info("******findBaiscPostChange*******");
        return HttpResult.ok(basicPositionService.findAll());
    }

    @GetMapping(value = "/findAllOperator")
    public HttpResult findAllOperator() {
        logger.info("******findAllOperator 查询所有操作岗位*******");
        return HttpResult.ok(basicPositionService.findAllOperator());
    }

}
