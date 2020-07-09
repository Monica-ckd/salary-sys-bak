package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.DutyExceptMapper;
import com.gxzy.salary.basic.model.DutyExcept;
import com.gxzy.salary.basic.service.DutyExceptService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * <p>
 * 异常出勤统计表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-26
 */
@Service
public class DutyExceptServiceImpl implements DutyExceptService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(DutyExceptServiceImpl.class);

    @Autowired
    private DutyExceptMapper dutyExceptMapper;

    @Override
    public List<DutyExcept> findDutyExcept(BasicFilterVo filter) {
        // 查询个人名下，未确认，正常状态 的所有异常出勤数据
        // name ,check_state=0 , abnmoal_st = 0
        // filterCondition [name,checkState=0, abnmalState=0]
        logger.info("***findDutyExcept service***"+filter.getName());
        return  dutyExceptMapper.findDutyExcept(filter.getName());
    }


    @Override
    public int confirmDutyExcept(List<DutyExcept> records) {

        for(DutyExcept record : records) {
            // checkState =1;
            record = buildRecord(record,1,0,0);
            logger.info("**********confirmDutyExcept**********"+record);
            dutyExceptMapper.updateByPrimaryKeySelective(record);
        }
        return 1;
    }


    // emp个人异常反馈申请
    @Transactional(readOnly=false,rollbackFor=Exception.class)
    @Override
    public int askUpdateDuty(DutyExcept record) {
        logger.info("askUpdateDuty service****"+record);

        // 原数据设置异常 abnmalState = -1
        // 查找原数据
        DutyExcept oldRecord = dutyExceptMapper.selectByPrimaryKey(record.getId());
        oldRecord = buildRecord(oldRecord,0,-1,0);
        dutyExceptMapper.updateByPrimaryKeySelective(oldRecord);
        record = buildRecord(record,0,-1,0);
        // 新增考勤修正申请
        record.setParentId(record.getId());
        record.setId(null);
        logger.info("after builld askUpdateDuty service****"+record);
        return dutyExceptMapper.insertSelective(record);
    }
//////////////////MGT//////////////////////////////////////////////////////

    @Override
    public List<DutyExcept> findDutyOrders(BasicFilterVo filter) {
        logger.info("***findDutyOrders service***"+filter.getName());
        // 未确认，状态异常 创建人= filter.name
        return dutyExceptMapper.findDutyOrders(filter.getName());
    }

    // MGT新增异常考勤数据
    @Override
    public int addDutyExcept(DutyExcept record) {
<<<<<<< .mine
        if(record.getId() == 0) {// 新增
            // 取当前系统时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            record.setCreateTime(df.format(new Date()));// new Date()为获取当前系统时间
            record.setStatus(100);
            record.setDescribe("待员工确认");
            logger.info("addDutyExcept service" + record);
            return dutyExceptMapper.insertSelective(record);
        }else{// 修改
            dutyExceptMapper.updateByPrimaryKeySelective(record);
        }
        return 0;
=======
        // 取当前系统时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        record.setCreateTime(df.format(new Date()));// new Date()为获取当前系统时间
        record.setStatus(100);
        record.setDescribe("待员工确认");
        logger.info("addDutyExcept service"+record);
        return dutyExceptMapper.insertSelective(record);





>>>>>>> .theirs
    }

    @Transactional(readOnly=false,rollbackFor=Exception.class)
    @Override
    public int batchOrderConfirm(List<DutyExcept> records){
        for(DutyExcept record : records)
        {
            logger.info("******batchOrderConfirm******"+record);
            // DutyExcept.checkState =1;通过 DutyExcept.delFlag =1 是否删除（-1：删除 0：正常）
            record = buildRecord(record,1,0,-1);
            dutyExceptMapper.updateByPrimaryKeySelective(record);
            // 更新parent_id对应的数据
            DutyExcept parentRecord = buildParentRecord(record);
            dutyExceptMapper.updateByPrimaryKeySelective(parentRecord);
        }
        return 1;
    }

    private DutyExcept buildParentRecord(DutyExcept record) {
        // 恢复init
        record = buildRecord(record,1,0,0);
        // id
        record.setId(record.getParentId());
        record.setParentId(0L);
        logger.info("parent Record ****"+record);
        return  record;
    }

    /**
    * @Description :根据场景构造record
    * @Author  chenkaidi
    * @Date   2019/8/26 14:39
    * @Param  checkState :确认状态(-1:驳回 0：未审批 1：审批通过)
     * @Param  abnmalState :异常状态(-1:异常  0：正常 )
     * @Param  delFlag :删除标志 （-1:异常  0：正常 )
    * @Return
    * @Exception
    *
    */
    private DutyExcept buildRecord(DutyExcept record,int checkState,int abnmalState,int delFlag) {
        logger.info("build record before***"+ record);
        record.setCheckState(checkState);
        record.setAbnmalState(abnmalState);
        record.setDelFlag(delFlag);
        // 父记录
        if(record.getParentId() == 0)
        {
            if(checkState+abnmalState == 1)
            {
                record.setStatus(101);
                record.setDescribe("已确认，完成");
            }else if(checkState+abnmalState == -1)
            {
                record.setStatus(102);
                record.setDescribe("提起异常，待管理审批");
            } else
            {
                // (checkState+abnmalState == 0)
                record.setStatus(100);
                record.setDescribe("待员工确认");
            }
        }
        // 子记录
        else{
           if(checkState==-1 && abnmalState==0)
           {
               record.setStatus(104);
               record.setDescribe("管理审批驳回，待员工确认");
           }else if(checkState==0 && abnmalState==-1)
            {
                record.setStatus(102);
                record.setDescribe("提起异常，待管理审批");
            }else{
               record.setStatus(103);
               record.setDescribe("管理审批通过，完成");
           }
        }
        logger.info("build record after***"+ record);
        return  record;
    }

    @Transactional(readOnly=false,rollbackFor=Exception.class)
    @Override
    public int orderDeny(DutyExcept record) {
        // check_state = -1
        buildRecord(record,-1,0,0);
        // 更新父记录 回显给用户
        DutyExcept oldRecord = dutyExceptMapper.selectByPrimaryKey(record.getParentId());
        oldRecord = buildRecord(oldRecord,0,0,0);
        dutyExceptMapper.updateByPrimaryKeySelective(oldRecord);
        dutyExceptMapper.updateByPrimaryKeySelective(record);
        return 1;
    }

    @Override
    public List<DutyExcept> findAllDutys(BasicFilterVo filter) {
        logger.info("***findAllDutys service***"+filter);
        // 未确认，状态异常 创建人= filter.name
        return dutyExceptMapper.findAllDutys(filter);
    }

    @Override
    public int save(DutyExcept record) {
        return 0;
    }

    @Override
    public int delete(DutyExcept record) {
        return 0;
    }

    @Override
    public int delete(List<DutyExcept> records) {
        return 0;
    }

    @Override
    public DutyExcept findById(Long id) {
        return null;
    }
}
