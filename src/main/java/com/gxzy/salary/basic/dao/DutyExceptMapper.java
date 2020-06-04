package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.DutyExcept;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 异常出勤统计表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-26
 */
public interface DutyExceptMapper extends BasicMapper<DutyExcept> {

    List<DutyExcept> findDutyExcept(String name);

    List<DutyExcept> findDutyOrders(String name);

    List<DutyExcept> findAllDutys(BasicFilterVo filter);
}
