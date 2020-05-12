package com.gxzy.salary.points.service.impl;

import com.gxzy.salary.points.controller.ModuleItemController;
import com.gxzy.salary.points.model.ModuleItem;
import com.gxzy.salary.points.dao.ModuleItemMapper;
import com.gxzy.salary.points.service.ModuleItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 积分项目表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@Service
public class ModuleItemServiceImpl implements ModuleItemService {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(ModuleItemServiceImpl.class);
    @Autowired
    private ModuleItemMapper moduleItemMapper;
    @Override
    public int save(ModuleItem record) {
        logger.info("**ModuleItem保存操作**");
        Long id = null;
        if(record.getId() == null || record.getId() == 0) {
            // 新增积分记录
            logger.info("新增积分记录");
            moduleItemMapper.insertSelective(record);
        } else {
            // 更新积分记录信息
            logger.info("更新积分记录信息"+id);
            moduleItemMapper.updateByPrimaryKeySelective(record);
        }
        return 1;
    }

    @Override
    public int delete(ModuleItem record) {
        return 0;
    }

    @Override
    public int delete(List<ModuleItem> records) {
        return 0;
    }

    @Override
    public ModuleItem findById(Long id) {
        return null;
    }

    @Override
    public List<ModuleItem> findAll() {
        logger.info("**ModuleItem查询全部**");
        return moduleItemMapper.selectAll();
    }

    @Override
    public int deleteById(Long id) {
        logger.info("**ModuleItem删除**");
         moduleItemMapper.deleteByPrimaryKey(id);
        return 1;
    }
}
