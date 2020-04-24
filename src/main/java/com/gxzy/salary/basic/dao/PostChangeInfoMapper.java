package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.PostChangeInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.gxzy.salary.basic.vo.BasicFilterVo;

import java.util.List;

/**
 * <p>
 * 员工岗位信息表 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-27
 */
public interface PostChangeInfoMapper extends BaseMapper<PostChangeInfo> {

    List<PostChangeInfo> findPostChange(String name);

    int updateByPrimaryKeySelective(PostChangeInfo record);

    int insertSelective(PostChangeInfo record);

    List<PostChangeInfo> findPostOrders(String name);

    int updateAbnmalState(PostChangeInfo record);

    /**
     * 当前用户，某日的岗位变动查询
     * filter = [name | creatTime]
     * @param filter
     * @return
     */
    List<PostChangeInfo> findPostChangeByFilter(BasicFilterVo filter);
}
