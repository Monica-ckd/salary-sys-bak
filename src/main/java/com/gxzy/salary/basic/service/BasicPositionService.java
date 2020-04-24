package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.BasicPosition;
import com.gxzy.salary.intface.CurdService;

import java.util.List;

/**
 * <p>
 * 员工岗位信息表 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-28
 */
public interface BasicPositionService extends CurdService<BasicPosition> {

    List<BasicPosition> findAll();

    List<BasicPosition> findAllOperator();
}
