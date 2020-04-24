package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.BasicPositionMapper;
import com.gxzy.salary.basic.model.BasicPosition;
import com.gxzy.salary.basic.service.BasicPositionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 员工岗位信息表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-28
 */
@Service
public class BasicPositionServiceImpl implements BasicPositionService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(BasicPositionServiceImpl.class);

    @Autowired
    private BasicPositionMapper basicPositionMapper;

    @Override
    public List<BasicPosition> findAll() {
        return basicPositionMapper.selectAll();
    }

    @Override
    public List<BasicPosition> findAllOperator() {
        int postType = 0;// 操作岗
        return basicPositionMapper.findByPostType(postType);
    }

    @Override
    public int save(BasicPosition record) {
        return 0;
    }

    @Override
    public int delete(BasicPosition record) {
        return 0;
    }

    @Override
    public int delete(List<BasicPosition> records) {
        return 0;
    }

    @Override
    public BasicPosition findById(Long id) {
        return null;
    }
}
