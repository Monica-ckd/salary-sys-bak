package com.gxzy.salary.points.service.impl;

import com.github.pagehelper.PageInfo;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.page.MybatisPageHelper;
import com.gxzy.salary.core.page.PageRequest;
import com.gxzy.salary.core.page.PageResult;
import com.gxzy.salary.points.controller.PointRecordController;
import com.gxzy.salary.points.dao.ModuleItemMapper;
import com.gxzy.salary.points.model.ModuleItem;
import com.gxzy.salary.points.model.PointRecord;
import com.gxzy.salary.points.dao.PointRecordMapper;
import com.gxzy.salary.points.model.PointSummaryEntity;
import com.gxzy.salary.points.service.PointRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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

    @Autowired
    private ModuleItemMapper moduleItemMapper;
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


    @Override
    public List<PointRecord> findAll() {
        return pointRecordMapper.selectAll();
    }




    private PageResult getPageResult(PageInfo<?> pageInfo) {
        PageResult pageResult = new PageResult();
        pageResult.setPageNum(pageInfo.getPageNum());
        pageResult.setPageSize(pageInfo.getPageSize());
        pageResult.setTotalSize(pageInfo.getTotal());
        pageResult.setTotalPages(pageInfo.getPages());
        pageResult.setContent(pageInfo.getList());
        return pageResult;
    }

    @Override
    public List findSummary(BasicFilterVo filterVo) {
        logger.info("***findSummary***"+filterVo);
        // 返回值
        List<PointSummaryEntity> summaryEntities = new ArrayList<>();
        // 名字索引
        HashMap<String,PointSummaryEntity> pointIndexMap = new HashMap<>();

        // 初始化map
        initIndexMap(filterVo,pointIndexMap);
        // 获取积分记录
        List<PointRecord> pointRecords = pointRecordMapper.selectByCondition(filterVo);
        for (PointRecord record:pointRecords) {
            // 分值
            int score = record.getScore().intValue();
            if(score == 0)
            {
                continue;
            }
            // item别名 方便前端映射
            String itemExtend = record.getItemExtend();
            PointSummaryEntity entity = pointIndexMap.get(record.getName());
            HashMap<String,Integer> scoreMap = entity.getScoreMap();
            // 更新分数
            scoreMap.put(itemExtend,scoreMap.get(itemExtend).intValue()+score);
            // 更新总分
            entity.setSummary(entity.getSummary()+score);
            // 更新PointSummaryEntity
            entity.setScoreMap(scoreMap);
            pointIndexMap.put(record.getName(),entity);
        }
        // 遍历map,构造返回Lsit
        Set<String> keySet=pointIndexMap.keySet();
        for(String key:keySet){
            summaryEntities.add(pointIndexMap.get(key));
        }
        logger.info("***findSummary***"+summaryEntities.toArray());
        return summaryEntities;
    }

    // 初始化map
    private void initIndexMap(BasicFilterVo filterVo, HashMap<String, PointSummaryEntity> pointIndexMap) {
        logger.info("****initIndexMap***");
        // 获取所有的姓名
        List<String> names = pointRecordMapper.selectNames(filterVo);
        logger.info("names"+names.toArray());
        for (String name:names) {
            PointSummaryEntity entity = initSumEntity(name);
            pointIndexMap.put(name,entity);
        }
        logger.info("****initIndexMap**pointIndexMap*"+pointIndexMap);
    }

    /**
     * 初始化SumEntity
     * @param name
     * @return summaryEntity
     */
    private PointSummaryEntity initSumEntity(String name) {
        logger.info("****initSumEntity***");
        PointSummaryEntity summaryEntity = new PointSummaryEntity();
        summaryEntity.setName(name);
        summaryEntity.setSummary(0);
        HashMap<String, Integer> scoreMap = initScoreMap();
        summaryEntity.setScoreMap(scoreMap);
        logger.info("****initSumEntity***"+summaryEntity);
        return summaryEntity;
    }

    /**
     * 初始化ScoreMap
     * @return
     */
    private HashMap<String, Integer> initScoreMap() {
        logger.info("initScoreMap");
        HashMap<String, Integer> scoreMap = new HashMap<>();
        //获取项目模块配置列表
        List<ModuleItem> moduleItems = moduleItemMapper.selectAll();
        for (ModuleItem moduleItem:moduleItems) {
            scoreMap.put(moduleItem.getExtend(),0);
        }
        logger.info("initScoreMap end"+scoreMap);
        return scoreMap;
    }

}
