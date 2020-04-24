package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.Worktimeinfo;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 月工作时间信息 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface WorktimeinfoMapper extends BasicMapper<Worktimeinfo> {


    List<Worktimeinfo> selectLast();

    List<Worktimeinfo> findByMonth(String monthDate);

    int deleteBatchByMonth(String monthDate);

    /**
     * [group,MonthTime]->workTimeInfo
     * @param filter
     * @return
     */
    Worktimeinfo findByFilter(BasicFilterVo filter);
}
