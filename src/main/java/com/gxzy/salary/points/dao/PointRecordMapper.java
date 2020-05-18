package com.gxzy.salary.points.dao;

import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.model.SysUser;
import com.gxzy.salary.points.model.PointRecord;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 积分记录表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
public interface PointRecordMapper extends BasicMapper<PointRecord> {

    List<PointRecord> findPage();

    List<String> selectNames(BasicFilterVo filterVo);
}
