package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.model.AbsenceInfo;
import com.gxzy.salary.basic.service.AbsenceInfoService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 请假描述信息管理 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class AbsenceInfoServiceImpl  implements AbsenceInfoService {

    @Override
    public int save(AbsenceInfo record) {
        return 0;
    }

    @Override
    public int delete(AbsenceInfo record) {
        return 0;
    }

    @Override
    public int delete(List<AbsenceInfo> records) {
        return 0;
    }

    @Override
    public AbsenceInfo findById(Long id) {
        return null;
    }
}
