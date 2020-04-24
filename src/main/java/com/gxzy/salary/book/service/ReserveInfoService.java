package com.gxzy.salary.book.service;

import com.gxzy.salary.book.model.ReserveInfo;
import com.gxzy.salary.book.service.vo.ReserveFilterVo;
import com.gxzy.salary.intface.CurdService;

import java.util.List;

/**
 * <p>
 * 会议室预约信息 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-16
 */
public interface ReserveInfoService extends CurdService<ReserveInfo> {

    List<ReserveInfo> findAll();


    List<ReserveInfo> findByDate(String filterTime);

    boolean addReserve(ReserveInfo reserveInfo);

    /**
     *  @author: chenkaidi
     *  @Date: 2020/3/10 16:31
     *  @Description: 根据roomId查询一周内的预定情况
     * @param filterVo
     */
    List<ReserveInfo> findWeekByRoom(ReserveFilterVo filterVo);

    /**
     *  @author: chenkaidi
     *  @Date: 2020/3/10 22:59
     *  @Description: 预约时间段是否空闲校验
     */
    int checkReserveTime(ReserveInfo reserveInfo);

    List<ReserveInfo> findByName(String name);

    boolean delById(long id);

    int delByIdAndTime(long id);

    int updateReserve(ReserveInfo reserveInfo);
}
