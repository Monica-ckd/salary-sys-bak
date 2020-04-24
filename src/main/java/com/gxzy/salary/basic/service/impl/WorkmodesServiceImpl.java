package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.model.Workmodes;
import com.gxzy.salary.basic.service.WorkmodesService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 工作模式表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class WorkmodesServiceImpl implements WorkmodesService {

    @Override
    public int save(Workmodes record) {
        return 0;
    }

    @Override
    public int delete(Workmodes record) {
        return 0;
    }

    @Override
    public int delete(List<Workmodes> records) {
        return 0;
    }

    @Override
    public Workmodes findById(Long id) {
        return null;
    }
}
