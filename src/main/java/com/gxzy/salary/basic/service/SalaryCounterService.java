package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.vo.BasicFilterVo;

import java.math.BigDecimal;

/**
 * <p>
 * 薪资计算 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface SalaryCounterService {
    /**
     * 计算单价
     * @param filter
     * @param isInner
     * @return
     */
    BigDecimal getUnitPrice(BasicFilterVo filter, Boolean isInner);

    /**
     * 计算产量薪资
     * @param filter
     * @return
     */
    BigDecimal getAmtSalary(BasicFilterVo filter);

}
