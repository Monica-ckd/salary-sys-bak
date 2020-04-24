package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.BrandsRegamtMapper;
import com.gxzy.salary.basic.dao.MachinesMapper;
import com.gxzy.salary.basic.model.BrandsRegamt;
import com.gxzy.salary.basic.model.Machines;
import com.gxzy.salary.basic.service.BrandsRegamtService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 牌号定额管理 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class BrandsRegamtServiceImpl implements BrandsRegamtService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(BrandsRegamtServiceImpl.class);
    @Autowired
    private BrandsRegamtMapper brandsRegamtMapper;
    @Autowired
    private MachinesMapper machinesMapper;
    @Override
    public List<BrandsRegamt> findAll(int category) {
        return brandsRegamtMapper.selectAll(category);
    }

    @Transactional(readOnly=false,rollbackFor=Exception.class)
    @Override
    public int save(BrandsRegamt record) {
        if(null != record.getMachineno())
        {
            record = handleMidColumn(record);
        }
        if (record.getId() == null || record.getId() == 0) {
            logger.info("save service**start insert new records********"+record);

            return brandsRegamtMapper.insertSelective(record);

        }
        logger.info("save service*******start update records********"+record);
        return brandsRegamtMapper.updateByPrimaryKeySelective(record);
    }

    /*根据machineno映射成对应的mid*/
    private BrandsRegamt handleMidColumn(BrandsRegamt record) {
        logger.info("******handleMidColumn start ***"+record);
        // machineno 对应mid存在 直接设置mid=?
        Machines machine = machinesMapper.selectByMno(record.getMachineno());
        if(null != machine)
        {
            record.setMid(machine.getId());
        }else
        {
            Machines newRecord = new Machines();
            newRecord.setMachineno(record.getMachineno());
            logger.info("******insert new machineNo ********"+ newRecord);
            machinesMapper.insertSelective(newRecord);
            Machines newMachine = machinesMapper.selectByMno(record.getMachineno());
            logger.info("****** new machine ********"+ newMachine);
            record.setMid(newMachine.getId());
        }
        // machineno 对应mid不存在 添加machinno 再设置mid=?
        logger.info("******handleMidColumn end ***"+record);
        return record;
    }


    @Override
    public int delete(BrandsRegamt record) {
        logger.info("save service:**start delete records********"+record);
        return brandsRegamtMapper.deleteByPrimaryKey(record.getId());
    }

    @Override
    public int delete(List<BrandsRegamt> records) {
        for(BrandsRegamt record :records)
        {
            delete(record);
        }
        return 1;
    }

    @Override
    public BrandsRegamt findById(Long id) {
        return null;
    }
}
