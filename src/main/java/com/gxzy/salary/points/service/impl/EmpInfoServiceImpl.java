package com.gxzy.salary.points.service.impl;

import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.exception.MyException;
import com.gxzy.salary.points.dao.EmpInfoMapper;
import com.gxzy.salary.points.model.EmpInfo;
import com.gxzy.salary.points.service.EmpInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 员工信息表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@Service
public class EmpInfoServiceImpl  implements EmpInfoService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(EmpInfoServiceImpl.class);

    @Autowired
    private EmpInfoMapper empInfoMapper;

    @Override
    public List<EmpInfo> findAll() {
        logger.info("*empInfo*findAll*selectAll*");
        return empInfoMapper.selectAll();
    }

    @Override
    public List<EmpInfo> findForMonth(String monthTime) {
        logger.info("*empInfo**findForMonth*" + monthTime);
        return empInfoMapper.findForMonth(monthTime);
    }

    @Override
    public EmpInfo findEmpByName(BasicFilterVo filter) {
        try{
            EmpInfo basicInfo = empInfoMapper.findEmpByName(filter);
            return basicInfo;
        }catch (Exception e)
        {
            throw new MyException("当月积分未录入，请先录入数据");
        }

    }
    @Override
    public int save(EmpInfo record) {
        return 0;
    }

    @Override
    public int delete(EmpInfo record) {
        return 0;
    }

    @Override
    public int delete(List<EmpInfo> records) {
        return 0;
    }

    @Override
    public EmpInfo findById(Long id) {
        return null;
    }
}
