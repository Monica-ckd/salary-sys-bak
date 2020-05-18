package com.gxzy.salary.points.service.impl;

import com.gxzy.salary.points.model.PersonInfo;
import com.gxzy.salary.points.dao.PersonInfoMapper;
import com.gxzy.salary.points.service.PersonInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 员工信息表 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-21
 */
@Service
public class PersonInfoServiceImpl implements PersonInfoService {

    @Override
    public int save(PersonInfo record) {
        return 0;
    }

    @Override
    public int delete(PersonInfo record) {
        return 0;
    }

    @Override
    public int delete(List<PersonInfo> records) {
        return 0;
    }

    @Override
    public PersonInfo findById(Long id) {
        return null;
    }
}
