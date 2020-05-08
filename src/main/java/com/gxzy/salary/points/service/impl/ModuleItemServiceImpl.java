package com.gxzy.salary.points.service.impl;

import com.gxzy.salary.points.model.ModuleItem;
import com.gxzy.salary.points.dao.ModuleItemMapper;
import com.gxzy.salary.points.service.ModuleItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
    @Override
    public int save(ModuleItem record) {
        return 0;
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
}
