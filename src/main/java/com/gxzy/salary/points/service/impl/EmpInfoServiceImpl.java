package com.gxzy.salary.points.service.impl;

import com.gxzy.salary.points.model.EmpInfo;
import com.gxzy.salary.points.dao.EmpInfoMapper;
import com.gxzy.salary.points.service.EmpInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 员工信息表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@Service
public class EmpInfoServiceImpl  implements EmpInfoService {
    @Override
    public int save(EmpInfo record) {
        return 0;
    }

    @Override
    public int delete(EmpInfo record) {
        return 0;
    }

    @Override
    public int delete(List<EmpInfo> records) {
        return 0;
    }

    @Override
    public EmpInfo findById(Long id) {
        return null;
    }
}
