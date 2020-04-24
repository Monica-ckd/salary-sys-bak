package com.gxzy.salary.basic.controller;

import com.gxzy.salary.basic.service.EmpDayAmtsalaryService;
import com.gxzy.salary.basic.service.SalaryCounterService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.exception.MyException;
import com.gxzy.salary.core.http.HttpResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 *  @author: chenkaidi
 *  @Date: 2019/8/28 15:57
 *  @Description: 计算产量工资和汇总工资
 */
@RestController
@RequestMapping("salaryCounter")
public class SalaryCounterController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(SalaryCounterController.class);

    @Autowired
    SalaryCounterService salaryCounterService;
    @Autowired
    EmpDayAmtsalaryService dayAmtsalaryService;

    /**
     * 计算单价
     */
    @PostMapping(value = "/getUnitPrice")
    public HttpResult getUnitPrice(@RequestBody BasicFilterVo filter) {// name brand mid
        try
        {
            return HttpResult.ok(salaryCounterService.getUnitPrice(filter, false));
        }catch (MyException e)
        {
            logger.error(e.getMsg());
            return HttpResult.error(e.getMsg());
        }
    }

    /**
     * 计算薪资
     */
    @GetMapping(value = "/calAmtSalary")
    public HttpResult calAmtSalary(@RequestParam String dayTime) {// name brand mid
        try
        {
            return HttpResult.ok(dayAmtsalaryService.calAmtSalary(dayTime));
        }catch (MyException e)
        {
            logger.error(e.getMsg());
            return HttpResult.error(e.getMsg());
        }
    }


    /**
     * 个人薪资查询
     */
    @PostMapping(value = "/findAmtSalary")
    public HttpResult findAmtSalary(@RequestBody BasicFilterVo filter) {// {"name":"","sTime":"2019-08-05","eTime":"2019-08-31"}
        try
        {
            return HttpResult.ok(dayAmtsalaryService.findAmtSalary(filter));
        }catch (MyException e)
        {
            logger.error(e.getMsg());
            return HttpResult.error(e.getMsg());
        }
    }
}