package com.gxzy.salary.basic.service.impl;


import com.gxzy.salary.basic.dao.WorktimeinfoMapper;
import com.gxzy.salary.basic.model.Worktimeinfo;
import com.gxzy.salary.basic.service.WorktimeinfoService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.page.PageRequest;
import com.gxzy.salary.core.page.PageResult;
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
 * 月工作时间信息 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class WorktimeinfoServiceImpl  implements WorktimeinfoService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(WorktimeinfoServiceImpl.class);

    @Autowired
    WorktimeinfoMapper worktimeinfoMapper;


    @Override
    public List<Worktimeinfo> selectByMonth(String monthDate) {
        return worktimeinfoMapper.findByMonth(monthDate);
    }

    @Transactional
    @Override
    public int update(List<Worktimeinfo> records) {
        // 根据月份查找有没有当前记录 -- 事务机制
        String monthTime = records.get(0).getMonthDate();
        logger.info("***delete condition monthDate***"+monthTime);
        // 删除当前月份对应的数据
        int rows = worktimeinfoMapper.deleteBatchByMonth(monthTime);
        logger.info("***********deleteBatchByMonth finish*************"+rows);
        // 插入
//        worktimeinfoMapper.insertBatch(records);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime = df.format(new Date());
        for (Worktimeinfo record:records) {
            logger.info("***********insert begin*************"+ record);
            record.setCreateTime(nowTime);
            worktimeinfoMapper.insert(record);
        }
        return 1;
    }

    @Override
    public List<Worktimeinfo> findByCondition(BasicFilterVo filter) {
        return null;
    }

    @Override
    public PageResult findPage(PageRequest page) {
        return null;
    }

    @Override
    public int save(Worktimeinfo record) {
        return 0;
    }

    @Override
    public int delete(Worktimeinfo record) {
        return 0;
    }

    @Override
    public int delete(List<Worktimeinfo> records) {
        return 0;
    }

    @Override
    public Worktimeinfo findById(Long id) {
        return null;
    }
}
