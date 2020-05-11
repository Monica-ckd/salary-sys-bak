package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.EmpBasicInfo;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 员工基本信息表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
    public interface EmpBasicInfoMapper extends BasicMapper<EmpBasicInfo> {

    List<EmpBasicInfo> selectAll();

    EmpBasicInfo findByName(String name);

    EmpBasicInfo findByCondition(BasicFilterVo filter);

    List<EmpBasicInfo> findForPull(String monthTime);

    EmpBasicInfo findEmpByName(BasicFilterVo name);

    String getMonthTime();
}
