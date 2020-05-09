package com.gxzy.salary.points.dao;


import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.BasicMapper;
import com.gxzy.salary.points.model.EmpInfo;

import java.util.List;


/**
 * <p>
 * 员工信息表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
public interface EmpInfoMapper extends BasicMapper<EmpInfo> {

    List<EmpInfo> selectAll();

    EmpInfo findByName(String name);

    EmpInfo findByCondition(BasicFilterVo filter);

    List<EmpInfo> findForMonth(String monthTime);

    EmpInfo findEmpByName(BasicFilterVo name);
}
