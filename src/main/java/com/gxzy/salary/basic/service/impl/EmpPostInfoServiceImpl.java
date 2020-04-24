package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.EmpPostInfoMapper;
import com.gxzy.salary.basic.model.EmpPostInfo;
import com.gxzy.salary.basic.service.EmpPostInfoService;
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
 * @since 2019-08-16
 */
@Service
public class EmpPostInfoServiceImpl implements EmpPostInfoService {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(EmpPostInfoServiceImpl.class);

    @Autowired
    private EmpPostInfoMapper empPostInfoMapper;
    @Override
    public int save(EmpPostInfo record) {
        return 0;
    }

    @Override
    public int delete(EmpPostInfo record) {
        return 0;
    }

    @Override
    public int delete(List<EmpPostInfo> records) {
        return 0;
    }

    @Override
    public EmpPostInfo findById(Long id) {
        return null;
    }

    @Override
    public EmpPostInfo findEmpByName(String name) {
        logger.info("***findEmpByName***"+name);
        return empPostInfoMapper.findByName(name);
    }
}
