package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.DayGroupAmt;
import com.gxzy.salary.intface.BasicMapper;

/**
 * <p>
 * 日班总产量数据 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-30
 */
public interface DayGroupAmtMapper extends BasicMapper<DayGroupAmt> {

    int deleteByTime(String dayTime);
}
