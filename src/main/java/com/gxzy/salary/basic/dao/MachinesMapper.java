package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.Machines;
import com.gxzy.salary.intface.BasicMapper;

/**
 * <p>
 * 机台号管理 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface MachinesMapper extends BasicMapper<Machines> {

    Machines selectByMno(String machineno);
}
