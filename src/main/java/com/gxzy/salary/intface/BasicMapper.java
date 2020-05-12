package com.gxzy.salary.intface;

import com.baomidou.mybatisplus.core.mapper.Mapper;
import com.gxzy.salary.basic.vo.BasicFilterVo;

import java.util.List;
/**
 *  @author: chenkaidi
 *  @Date: 2019/8/17 8:48
 *  @Description: 通用mapper接口定义
 */
public interface BasicMapper<T> extends Mapper<T> {

    List<T> selectAll();

    int insert(T record);

    int insertBatch(List<T> records);

    int insertSelective(T record);

    T selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

    int deleteByPrimaryKey(Long id);

    int deleteBatch(List<T> records);

//    List<T> findByName(@Param(value = "name") String name);

    List<T> selectByCondition(BasicFilterVo filter);

}
