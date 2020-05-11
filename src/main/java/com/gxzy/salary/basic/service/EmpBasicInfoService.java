package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.EmpBasicInfo;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.CurdService;

import java.util.List;

/**
 * <p>
 * 员工基本信息表 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface EmpBasicInfoService extends CurdService<EmpBasicInfo> {

    List<EmpBasicInfo> findAll();

    List<EmpBasicInfo> findForPull(String monthTime);

    EmpBasicInfo findEmpByName(BasicFilterVo filter);

    String getLastMonth();
}
