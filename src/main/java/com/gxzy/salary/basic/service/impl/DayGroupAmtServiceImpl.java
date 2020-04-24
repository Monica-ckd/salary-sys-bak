package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.model.DayGroupAmt;
import com.gxzy.salary.basic.service.DayGroupAmtService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 日班总产量数据 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-30
 */
@Service
public class DayGroupAmtServiceImpl implements DayGroupAmtService {

    @Override
    public int save(DayGroupAmt record) {
        return 0;
    }

    @Override
    public int delete(DayGroupAmt record) {
        return 0;
    }

    @Override
    public int delete(List<DayGroupAmt> records) {
        return 0;
    }

    @Override
    public DayGroupAmt findById(Long id) {
        return null;
    }
}
