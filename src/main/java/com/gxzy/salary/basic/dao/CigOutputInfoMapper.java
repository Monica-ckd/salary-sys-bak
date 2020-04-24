package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.CigOutputInfo;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 日产量汇总 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface CigOutputInfoMapper extends BasicMapper<CigOutputInfo> {

    List<CigOutputInfo> findByTime(String dayTime);

    int deleteByCreateTime(String createTime);
}
