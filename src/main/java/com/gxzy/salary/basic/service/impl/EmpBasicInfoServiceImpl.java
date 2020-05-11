package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.EmpBasicInfoMapper;
import com.gxzy.salary.basic.model.EmpBasicInfo;
import com.gxzy.salary.basic.service.EmpBasicInfoService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.exception.MyException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 员工基本信息表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class EmpBasicInfoServiceImpl  implements EmpBasicInfoService {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(EmpBasicInfoServiceImpl.class);

    @Autowired
    private EmpBasicInfoMapper empBasicInfoMapper;

    @Override
    public List<EmpBasicInfo> findAll() {
        logger.info("*empBasicInfo*findAll*selectAll*");
        return empBasicInfoMapper.selectAll();
    }

    @Override
    public String getLastMonth() {
        return empBasicInfoMapper.getMonthTime();
    }

    @Override
    public List<EmpBasicInfo> findForPull(String monthTime) {
        logger.info("*empBasicInfo**findForPull*"+monthTime);
//        List<EmpBasicInfo> empBasicInfos = empBasicInfoMapper.findForPull();
//        if(null == empBasicInfos || empBasicInfos.size() ==0)
//        {
//            throw new MyException("当月排版数据未导入，请先导入排班数据");
//        }
        return empBasicInfoMapper.findForPull(monthTime);
    }

    @Override
    public EmpBasicInfo findEmpByName(BasicFilterVo filter) {
        try{
            EmpBasicInfo basicInfo = empBasicInfoMapper.findEmpByName(filter);
            return basicInfo;
        }catch (Exception e)
        {
            throw new MyException("当月排版数据未导入，请先导入排班数据");
        }

    }

    @Override
    public int save(EmpBasicInfo record) {
        return 0;
    }

    @Override
    public int delete(EmpBasicInfo record) {
        return 0;
    }

    @Override
    public int delete(List<EmpBasicInfo> records) {
        return 0;
    }

    @Override
    public EmpBasicInfo findById(Long id) {
        return null;
    }
}
