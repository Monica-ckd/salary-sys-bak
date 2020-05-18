package com.gxzy.salary.points.service;

import com.gxzy.salary.points.model.ModuleItem;
import com.gxzy.salary.intface.CurdService;

import java.util.List;

/**
 * <p>
 * 积分项目表 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
public interface ModuleItemService extends CurdService<ModuleItem> {

    List<ModuleItem> findAll();

    int deleteById(Long id);

    List findForTable();
}
