package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.WorkmodesMapper;
import com.gxzy.salary.basic.model.Workmodes;
import com.gxzy.salary.basic.service.WorkmodesService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 工作模式表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class WorkmodesServiceImpl implements WorkmodesService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(GroupsServiceImpl.class);
    @Autowired
    private WorkmodesMapper workmodesMapper;

    @Override
    public int save(List<Workmodes> records) {
        return 0;
    }

    @Override
    public int update(List<Workmodes> records) {
        return 0;
    }

    @Override
    public int update(Workmodes record) {
        return 0;
    }

    @Override
    public List<Workmodes> findAll() {
        return workmodesMapper.selectAll();
    }

    @Override
    public List<Workmodes> findByCondition(BasicFilterVo filter) {
        return null;
    }

    @Override
    public int save(Workmodes record) {
        return 0;
    }

    @Override
    public int delete(Workmodes record) {
        return 0;
    }

    @Override
    public int delete(List<Workmodes> records) {
        return 0;
    }

    @Override
    public Workmodes findById(Long id) {
        return null;
    }
}
