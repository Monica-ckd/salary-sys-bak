package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.Worktimeinfo;
import com.gxzy.salary.intface.EnCurdService;

import java.util.List;

/**
 * <p>
 * 月工作时间信息 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface WorktimeinfoService extends EnCurdService<Worktimeinfo> {

    /**
    * @Description 查询最近月份的工时信息
    * @Author  chenkaidi
    * @Date   2019/8/23 14:10
    * @Param
    * @Return
    * @Exception
    *
    */
    /*按照月份查找*/
    List<Worktimeinfo> selectByMonth(String monthDate);

}
