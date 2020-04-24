package com.gxzy.salary.intface;

import java.util.List;

/**
 *  @author: chenkaidi
 *  @Date: 2019/8/17 9:16
 *  @Description: 增强型CRUD接口定义
 */
public interface EnhanceCrudService<T,V> extends CurdService<T>{
    /**
     * 批量保存操作
     * @param records
     * @return
     */
    int save(List<T> records);

    /**
     * 批量更新操作
     * @param records
     * @return
     */
    int update(List<T> records);

    /**
     * 更新操作
     * @param record
     * @return
     */
    int update(T record);

    /**
     * 查询全部
     * @return
     */
    List<T> findAll();

    /**
     * 条件查询全部
     * @param filter 筛选条件
     * @return
     */
    List<T> findByCondition(V filter);

}
