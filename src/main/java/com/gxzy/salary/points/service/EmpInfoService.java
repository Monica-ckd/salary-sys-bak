package com.gxzy.salary.points.service;

import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.CurdService;
import com.gxzy.salary.points.model.EmpInfo;

import java.util.List;

/**
 * <p>
 * 员工信息表 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
public interface EmpInfoService extends CurdService<EmpInfo> {

    List<EmpInfo> findAll();

    List<EmpInfo> findForMonth(String monthTime);

    EmpInfo findEmpByName(BasicFilterVo filter);

}
