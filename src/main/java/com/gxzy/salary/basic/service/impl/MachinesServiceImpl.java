package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.model.Machines;
import com.gxzy.salary.basic.service.MachinesService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 机台号管理 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class MachinesServiceImpl implements MachinesService {

    @Override
    public int save(Machines record) {
        return 0;
    }

    @Override
    public int delete(Machines record) {
        return 0;
    }

    @Override
    public int delete(List<Machines> records) {
        return 0;
    }

    @Override
    public Machines findById(Long id) {
        return null;
    }
}
