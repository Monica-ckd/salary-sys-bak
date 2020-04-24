package com.gxzy.salary.book.dao;

import com.gxzy.salary.book.model.ReserveInfo;
import com.gxzy.salary.book.service.vo.ReserveFilterVo;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 会议室预约信息 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-16
 */
public interface ReserveInfoMapper extends BasicMapper<ReserveInfo> {

    List<ReserveInfo> selectByDate(String filterTime);

    List<ReserveInfo> selectByRoomAndWeek(ReserveFilterVo filter);

    int checkReserveTime(ReserveFilterVo filter);

    List<ReserveInfo> selectByName(String name);
}
