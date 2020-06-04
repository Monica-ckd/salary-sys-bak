package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.DutyExcept;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.CurdService;

import java.util.List;

/**
 * <p>
 * 异常出勤统计表 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-26
 */
public interface DutyExceptService extends CurdService<DutyExcept> {


   // 条件查询个人异常考勤数据
    List<DutyExcept> findDutyExcept(BasicFilterVo filter);

    int confirmDutyExcept(List<DutyExcept> records);

    int askUpdateDuty(DutyExcept record);

    // 查询当前登陆用户考勤数据修改申请单
    List<DutyExcept> findDutyOrders(BasicFilterVo filter);

    int addDutyExcept(DutyExcept record);

    int batchOrderConfirm(List<DutyExcept> records);

    int orderDeny(DutyExcept record);

 List<DutyExcept> findAllDutys(BasicFilterVo filter);
}
