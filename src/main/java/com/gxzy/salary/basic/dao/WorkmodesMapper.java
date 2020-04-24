package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.Workmodes;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 工作模式表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface WorkmodesMapper extends BaseMapper<Workmodes> {

    Workmodes findById(Long wid);
}
