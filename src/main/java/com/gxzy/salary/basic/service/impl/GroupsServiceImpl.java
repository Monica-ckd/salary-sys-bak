package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.GroupsMapper;
import com.gxzy.salary.basic.model.Groups;
import com.gxzy.salary.basic.service.GroupsService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import org.apache.poi.ss.formula.functions.T;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 班组管理 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class GroupsServiceImpl implements GroupsService {


    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(GroupsServiceImpl.class);
    @Autowired
    private GroupsMapper groupsMapper;
    @Override
    public int save(List<Groups> records) {
        return 0;
    }

    @Override
    public int update(List<Groups> records) {
        return 0;
    }

    @Override
    public int update(Groups record) {
        return 0;
    }

    @Override
    public List<Groups> findAll() {
        return groupsMapper.selectAll();
    }

    @Override
    public List<Groups> findByCondition(BasicFilterVo filter) {
        return null;
    }

    @Override
    public int save(Groups record) {
        return 0;
    }

    @Override
    public int delete(Groups record) {
        return 0;
    }

    @Override
    public int delete(List<Groups> records) {
        return 0;
    }

    @Override
    public Groups findById(Long id) {
        return null;
    }
}
