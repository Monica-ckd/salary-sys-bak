package com.gxzy.salary.points.service;

import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.page.PageRequest;
import com.gxzy.salary.core.page.PageResult;
import com.gxzy.salary.intface.EnCurdService;
import com.gxzy.salary.points.model.PointRecord;
import com.gxzy.salary.intface.CurdService;

/**
 * <p>
 * 积分记录表 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
public interface PointRecordService extends EnCurdService<PointRecord> {

    int deleteById(Long id);

    PageResult findByPageCondition(BasicFilterVo filterVo);
}
