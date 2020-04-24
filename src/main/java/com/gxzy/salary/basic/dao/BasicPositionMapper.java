package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.BasicPosition;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 员工岗位信息表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-28
 */
public interface BasicPositionMapper extends BasicMapper<BasicPosition> {

    /**
     * 根据岗位id 获取基本岗位信息
     * @param pid
     * @return
     */
    BasicPosition findById(Long bpid);

    /**
     * 根据岗位类型获取基本岗位信息
     * @param postType 岗位类型:0操作 1维修 2 班组管理 3车间管理
     * @return
     */
    List<BasicPosition> findByPostType(int postType);
}
