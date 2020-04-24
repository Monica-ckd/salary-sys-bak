
package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.PostChangeInfoMapper;
import com.gxzy.salary.basic.model.PostChangeInfo;
import com.gxzy.salary.basic.service.PostChangeInfoService;
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
 * 员工岗位信息表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-27
 */
@Service
public class PostChangeInfoServiceImpl implements PostChangeInfoService {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(PostChangeInfoServiceImpl.class);

    @Autowired
    private PostChangeInfoMapper postChangeInfoMapper;

    @Override
    public List<PostChangeInfo> findPostChange(BasicFilterVo filter) {
        // 查询个人名下，未确认，正常状态 的所有异常出勤数据
        // name ,check_state=0 , abnmoal_st = 0mode
        // filterCondition [name,checkState=0, abnmalState=0]
        logger.info("***findPostChange service***"+filter.getName());
        return  postChangeInfoMapper.findPostChange(filter.getName());
    }

    @Override
    public int confirmPostExcept(List<PostChangeInfo> records) {
        for(PostChangeInfo record : records) {
            // checkState =1;
            record = buildRecord(record,1,0,0);
            logger.info("**********confirmPostChangeInfo**********"+record);
            postChangeInfoMapper.updateByPrimaryKeySelective(record);
        }
        return 1;
    }
    @Transactional(readOnly=false,rollbackFor=Exception.class)
    @Override
    public int askUpdatePost(PostChangeInfo record) {
        logger.info("askUpdateDuty service****"+record);
        // 原数据设置异常 abnmalState = -1
        postChangeInfoMapper.updateAbnmalState(record);

        // 新增考勤修正申请
        record.setParentId(record.getId());
        record.setId(null);
        record = buildRecord(record,0,-1,0);
        logger.info("after builld askUpdateDuty service****"+record);
        return postChangeInfoMapper.insertSelective(record);
    }

    @Override
    public List<PostChangeInfo> findPostOrders(BasicFilterVo filter) {
        logger.info("***findPostOrders service***"+filter.getName());
        // 未确认，状态异常 创建人= filter.name
        return postChangeInfoMapper.findPostOrders(filter.getName());
    }

    @Override
    public int addEmpPost(PostChangeInfo record) {
        // 取当前系统时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        record.setCreateTime(df.format(new Date()));// new Date()为获取当前系统时间
        logger.info("addPostChangeInfo service"+record);
        return postChangeInfoMapper.insertSelective(record);
    }
    @Transactional(readOnly=false,rollbackFor=Exception.class)
    @Override
    public int batchOrderConfirm(List<PostChangeInfo> records) {
        for(PostChangeInfo record : records)
        {
            logger.info("******batchOrderConfirm******"+record);
            // PostChangeInfo.checkState =1;通过 PostChangeInfo.delFlag =1 是否删除（-1：删除 0：正常）
            record = buildRecord(record,1,0,-1);
            postChangeInfoMapper.updateByPrimaryKeySelective(record);
            // 更新parent_id对应的数据
            PostChangeInfo parentRecord = buildParentRecord(record);
            postChangeInfoMapper.updateByPrimaryKeySelective(parentRecord);
        }
        return 1;
    }
    private PostChangeInfo buildParentRecord(PostChangeInfo record) {
        // 恢复init
        record = buildRecord(record,0,0,0);
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
     */
    private PostChangeInfo buildRecord(PostChangeInfo record,int checkState,int abnmalState,int delFlag) {
        logger.info("build record before***"+ record);
        record.setCheckState(checkState);
        record.setAbnmalState(abnmalState);
        record.setDelFlag(delFlag);
        logger.info("build record after***"+ record);
        return  record;
    }
    @Override
    public int orderDeny(PostChangeInfo record) {
        // check_state = -1
        buildRecord(record,-1,0,0);
        return postChangeInfoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int save(PostChangeInfo record) {
        return 0;
    }

    @Override
    public int delete(PostChangeInfo record) {
        return 0;
    }

    @Override
    public int delete(List<PostChangeInfo> records) {
        return 0;
    }

    @Override
    public PostChangeInfo findById(Long id) {
        return null;
    }
}
