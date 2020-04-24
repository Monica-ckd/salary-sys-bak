package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.EmpDayAmtsalary;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 员工日工资汇总 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-30
 */
public interface EmpDayAmtsalaryMapper extends BasicMapper<EmpDayAmtsalary> {

    int deleteByCreateTime(String createTime);

    /**
     * 按照时间段查询【sTime<= createTime <=eTime】
     * @param filter
     * @return
     */
    List<EmpDayAmtsalary> findByPeriod(BasicFilterVo filter);
}
