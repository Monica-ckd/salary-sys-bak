package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.EmpDayAmtsalary;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.CurdService;

import java.util.List;

/**
 * <p>
 * 员工日工资汇总 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-30
 */
public interface EmpDayAmtsalaryService extends CurdService<EmpDayAmtsalary> {

    int calAmtSalary(String dayTime);

    List<EmpDayAmtsalary> findAmtSalary(BasicFilterVo filter);
}
