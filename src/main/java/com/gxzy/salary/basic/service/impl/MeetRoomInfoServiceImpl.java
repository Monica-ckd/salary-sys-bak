package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.MeetRoomInfoMapper;
import com.gxzy.salary.basic.model.MeetRoomInfo;
import com.gxzy.salary.basic.service.MeetRoomInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 会议室信息 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-16
 */
@Service
public class MeetRoomInfoServiceImpl implements MeetRoomInfoService {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(MeetRoomInfoServiceImpl.class);

    @Autowired
    private MeetRoomInfoMapper meetRoomInfoMapper;
    @Override
    public int save(MeetRoomInfo record) {
        return 0;
    }

    @Override
    public int delete(MeetRoomInfo record) {
        return 0;
    }

    @Override
    public int delete(List<MeetRoomInfo> records) {
        return 0;
    }

    @Override
    public MeetRoomInfo findById(Long id) {
        return null;
    }

    @Override
    public List<MeetRoomInfo> findAll() {
        logger.info("======MeetRoomInfoServiceImpl=====");
        return meetRoomInfoMapper.selectAll();
    }
}
