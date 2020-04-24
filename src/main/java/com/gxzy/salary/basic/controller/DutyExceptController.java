package com.gxzy.salary.basic.controller;


import com.gxzy.salary.basic.model.DutyExcept;
import com.gxzy.salary.basic.service.DutyExceptService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.http.HttpResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 异常出勤统计表 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-26
 */
@RestController
@RequestMapping("dutyExcept")
public class DutyExceptController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(DutyExceptController.class);

    @Autowired
    private DutyExceptService dutyExceptService;

    ////////////////////////////////员工个人考勤数据查询确认/////////////////////////////////
    //条件查询个人异常考勤数据 findDutyExcept
    @PostMapping(value = "/findDutyExcept")
    public HttpResult findDutyExcept(@RequestBody BasicFilterVo filter) {
        logger.info("******findDutyExcept*******"+filter);
        return HttpResult.ok(dutyExceptService.findDutyExcept(filter));
    }


    //批量确认个人异常考勤数据 confirmDutyExcept
    @PostMapping(value = "/confirmDutyExcept")
    public HttpResult confirmDutyExcept(@RequestBody List<DutyExcept> records) {
        // 查询当前登陆用户考勤数据修改申请单
        return HttpResult.ok(dutyExceptService.confirmDutyExcept(records));
    }

    //申请修改个人异常考勤数据 新增修改订单 askUpdateDuty
    @PostMapping(value = "/addDutyOrder")
    public HttpResult askUpdateDuty(@RequestBody DutyExcept record) {
        logger.info("******askUpdateDuty*******"+record);
        // 查询当前登陆用户考勤数据修改申请单
        return HttpResult.ok(dutyExceptService.askUpdateDuty(record));
    }
    ////////////////////////////////考勤管理/////////////////////////////////////////////
    @PostMapping(value = "/findDutyOrders")
    public HttpResult findDutyOrders(@RequestBody BasicFilterVo filter) {
        // 查询当前登陆用户下待审批考勤数据修改申请单
        logger.info("******findDutyOrders*******"+filter);
        return HttpResult.ok(dutyExceptService.findDutyOrders(filter));
    }

    // 新增异常考勤数据 addDutyExecpt
    @PostMapping(value = "/addDutyExcept")
    public HttpResult addDutyExcept(@RequestBody DutyExcept record) {
        logger.info("******addDutyExcept*******"+record);
        // 查询当前登陆用户考勤数据修改申请单
        return HttpResult.ok(dutyExceptService.addDutyExcept(record));
    }

    // 批量审批 batchOrderConfirm
    @PostMapping(value = "/batchOrderConfirm")
    public HttpResult batchOrderConfirm(@RequestBody List<DutyExcept> records) {
        return HttpResult.ok(dutyExceptService.batchOrderConfirm(records));
    }


    // 审批驳回 审批状态置-1 orderDeny
    @PostMapping(value = "/orderDeny")
    public HttpResult orderDeny(@RequestBody DutyExcept record) {
        // 查询当前登陆用户考勤数据修改申请单
        return HttpResult.ok(dutyExceptService.orderDeny(record));
    }

}
