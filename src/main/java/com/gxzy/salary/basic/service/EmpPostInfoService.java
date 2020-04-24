package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.EmpPostInfo;
import com.gxzy.salary.intface.CurdService;

/**
 * <p>
 * 员工岗位信息表 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface EmpPostInfoService extends CurdService<EmpPostInfo> {

    EmpPostInfo findEmpByName(String name);
}
