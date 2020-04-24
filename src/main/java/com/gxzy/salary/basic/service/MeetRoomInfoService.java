package com.gxzy.salary.basic.service;

import com.gxzy.salary.intface.CurdService;
import com.gxzy.salary.basic.model.MeetRoomInfo;

import java.util.List;

/**
 * <p>
 * 会议室信息 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-16
 */
public interface MeetRoomInfoService extends CurdService<MeetRoomInfo> {

    List<MeetRoomInfo> findAll();
}
