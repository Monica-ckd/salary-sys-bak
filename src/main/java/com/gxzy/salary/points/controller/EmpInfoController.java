package com.gxzy.salary.points.controller;


import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.http.HttpResult;
import com.gxzy.salary.points.service.EmpInfoService;
import com.gxzy.salary.util.CommUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 员工信息表 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@RestController
@RequestMapping("/empInfo")
public class EmpInfoController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(EmpInfoController.class);

    @Autowired
    private EmpInfoService empInfoService;
    

    @GetMapping(value = "/findEmpInfos")
    public HttpResult findEmpInfos() {

        return HttpResult.ok(empInfoService.findAll());
    }

    @GetMapping(value = "/findForMonth")
    public HttpResult findForMonth() {
        // 取当月积分
        String monthTime = CommUtils.getMonthFirst();
        return HttpResult.ok(empInfoService.findForMonth(monthTime));
    }

    @GetMapping(value = "/findEmpByName")
    public HttpResult findEmpByName(@RequestParam String name) {

        // 构造查询filter

        BasicFilterVo filter = new BasicFilterVo(name,CommUtils.getMonthFirst());
        logger.info("findEmpByName**filter**"+filter);
        return HttpResult.ok(empInfoService.findEmpByName(filter));
    }

}
