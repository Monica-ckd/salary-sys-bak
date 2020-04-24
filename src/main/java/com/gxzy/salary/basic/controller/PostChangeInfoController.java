package com.gxzy.salary.basic.controller;


import com.gxzy.salary.basic.model.PostChangeInfo;
import com.gxzy.salary.basic.service.PostChangeInfoService;
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
 * 员工岗位信息表 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-27
 */
@RestController
@RequestMapping("position")
public class PostChangeInfoController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(PostChangeInfoController.class);

    @Autowired
    private PostChangeInfoService postChangeInfoService;

    ////////////////////////////////员工个人/////////////////////////////////
    //条件查询个人查询顶岗数据 findPostChange
    @PostMapping(value = "/findPostChange")
    public HttpResult findPostChange(@RequestBody BasicFilterVo filter) {
        logger.info("******findPostChange*******"+filter);
        return HttpResult.ok(postChangeInfoService.findPostChange(filter));
    }

    //批量确认个人顶岗数据 confirmDutyExecpt
    @PostMapping(value = "/confirmPostExcept")
    public HttpResult confirmPostExcept(@RequestBody List<PostChangeInfo> records) {
        // 查询当前登陆用户考勤数据修改申请单
        return HttpResult.ok(postChangeInfoService.confirmPostExcept(records));
    }

    //申请修改个人顶岗数据 新增修改订单 askUpdatePost
    @PostMapping(value = "/askUpdatePost")
    public HttpResult askUpdatePost(@RequestBody PostChangeInfo record) {
        logger.info("******askUpdatePost*******"+record);
        // 查询当前登陆用户考勤数据修改申请单
        return HttpResult.ok(postChangeInfoService.askUpdatePost(record));
    }

    ////////////////////////////////MGT 管理/////////////////////////////////

    // 查询顶岗修改数据修改单 findPostOrders
    @PostMapping(value = "/findPostOrders")
    public HttpResult findPostOrders(@RequestBody BasicFilterVo filter) {
        // 查询当前登陆用户下待审批考勤数据 修改申请单
        logger.info("******findPostOrders*******"+filter);
        return HttpResult.ok(postChangeInfoService.findPostOrders(filter));
    }

    // 新增顶岗数据addEmpPost
    @PostMapping(value = "/addEmpPost")
    public HttpResult addEmpPost(@RequestBody PostChangeInfo record) {
        logger.info("******addPostChangeInfo*******"+record);
        // 查询当前登陆用户考勤数据修改申请单
        return HttpResult.ok(postChangeInfoService.addEmpPost(record));
    }

    // 批量审批 batchOrderConfirm
    @PostMapping(value = "/batchOrderConfirm")
    public HttpResult batchOrderConfirm(@RequestBody List<PostChangeInfo> records) {
        return HttpResult.ok(postChangeInfoService.batchOrderConfirm(records));
    }


    // 审批驳回 审批状态置-1 orderDeny
    @PostMapping(value = "/orderDeny")
    public HttpResult orderDeny(@RequestBody PostChangeInfo record) {
        // 查询当前登陆用户考勤数据修改申请单
        return HttpResult.ok(postChangeInfoService.orderDeny(record));
    }


}
