package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.Workmodes;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gxzy.salary.intface.BasicMapper;

/**
 * <p>
 * 工作模式表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface WorkmodesMapper extends BasicMapper<Workmodes> {

    Workmodes findById(Long wid);
}
