package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.model.Groups;
import com.gxzy.salary.basic.service.GroupsService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 班组管理 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@Service
public class GroupsServiceImpl implements GroupsService {
    @Override
    public int save(Groups record) {
        return 0;
    }

    @Override
    public int delete(Groups record) {
        return 0;
    }

    @Override
    public int delete(List<Groups> records) {
        return 0;
    }

    @Override
    public Groups findById(Long id) {
        return null;
    }
}
