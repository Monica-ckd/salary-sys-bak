package com.gxzy.salary.points.dao;

import com.gxzy.salary.points.model.ModuleItem;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 积分项目表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
public interface ModuleItemMapper extends BasicMapper<ModuleItem> {

    List selectForTable();
}
