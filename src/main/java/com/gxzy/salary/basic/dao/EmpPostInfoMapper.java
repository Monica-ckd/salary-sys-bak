package com.gxzy.salary.basic.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gxzy.salary.basic.model.EmpPostInfo;

/**
 * <p>
 * 员工岗位信息表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface EmpPostInfoMapper extends BaseMapper<EmpPostInfo> {

    EmpPostInfo findById(Long pid);

    EmpPostInfo findByName(String name);
}
