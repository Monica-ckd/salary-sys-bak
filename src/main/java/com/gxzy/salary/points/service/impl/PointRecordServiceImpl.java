package com.gxzy.salary.points.service.impl;

import com.github.pagehelper.PageInfo;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.page.MybatisPageHelper;
import com.gxzy.salary.core.page.PageRequest;
import com.gxzy.salary.core.page.PageResult;
import com.gxzy.salary.points.controller.PointRecordController;
import com.gxzy.salary.points.model.PointRecord;
import com.gxzy.salary.points.dao.PointRecordMapper;
import com.gxzy.salary.points.service.PointRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 积分记录表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@Service
public class PointRecordServiceImpl implements PointRecordService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(PointRecordServiceImpl.class);
    @Autowired
    private PointRecordMapper pointRecordMapper;
    // 新增或删除操作
    @Override
    public int save(PointRecord record) {
        Long id = null;
        if(record.getId() == null || record.getId() == 0) {
            // 新增积分记录
            logger.info("新增积分记录");
            pointRecordMapper.insertSelective(record);
        } else {
            // 更新积分记录信息
            logger.info("更新积分记录信息"+id);
            pointRecordMapper.updateByPrimaryKeySelective(record);
        }
        return 1;
    }

    @Override
    public int delete(PointRecord record) {
        logger.info("删除积分记录信息"+record);
        return pointRecordMapper.deleteByPrimaryKey(record.getId());
    }

    @Override
    public int delete(List<PointRecord> records) {
        return 0;
    }

    @Override
    public PointRecord findById(Long id) {
        return null;
    }

    @Override
    public PageResult findPage(PageRequest pageRequest) {
        logger.info("findPage 积分记录分页查询");
        PageResult pageResult = null;
        pageResult = MybatisPageHelper.findPage(pageRequest, pointRecordMapper);
        logger.info("findPage"+pageResult);
            // 加载项目信息
        return pageResult;
    }


    @Override
    public int update(List<PointRecord> record) {
        return 0;
    }

    @Override
    public List<PointRecord> findByCondition(BasicFilterVo filter) {
        List records = pointRecordMapper.selectByCondition(filter);
        return records;
    }


    @Override
    public int deleteById(Long id) {
        return pointRecordMapper.deleteByPrimaryKey(id);
    }

    @Override
    public PageResult findByPageCondition(BasicFilterVo filterVo) {
            List records = pointRecordMapper.selectByCondition(filterVo);
            return getPageResult(new PageInfo(records));
    }

<<<<<<< HEAD
    @Override
    public List<PointRecord> findAll() {
        return pointRecordMapper.selectAll();
    }

=======
>>>>>>> ccabb361d0170a600af9d6d42c4f9ab2ebd2dd52
    private PageResult getPageResult(PageInfo<?> pageInfo) {
        PageResult pageResult = new PageResult();
        pageResult.setPageNum(pageInfo.getPageNum());
        pageResult.setPageSize(pageInfo.getPageSize());
        pageResult.setTotalSize(pageInfo.getTotal());
        pageResult.setTotalPages(pageInfo.getPages());
        pageResult.setContent(pageInfo.getList());
        return pageResult;
    }

}
