package com.gxzy.salary.intface;

import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.page.PageRequest;
import com.gxzy.salary.core.page.PageResult;

import java.util.List;

public interface EnCurdService<T> extends CurdService<T>{

    /**
     * 更新操作
     * @param record
     * @return
     */
    int update(List<T> record);

    /**
     * 条件查询
     */
    List<T> findByCondition(BasicFilterVo filter);

    /**
     * 分页查询
     */
    PageResult findPage(PageRequest page);
}
