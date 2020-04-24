package com.gxzy.salary.book.service.impl;

import com.gxzy.salary.book.model.RoomUseInfos;
import com.gxzy.salary.book.service.RoomUseInfosService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 会议室预约时间信息 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-29
 */
@Service
public class RoomUseInfosServiceImpl implements RoomUseInfosService {
    @Override
    public int save(RoomUseInfos record) {
        return 0;
    }

    @Override
    public int delete(RoomUseInfos record) {
        return 0;
    }

    @Override
    public int delete(List<RoomUseInfos> records) {
        return 0;
    }

    @Override
    public RoomUseInfos findById(Long id) {
        return null;
    }
}
