package com.gxzy.salary.intface;

import java.util.List;

public interface EnCurdService<T> extends CurdService<T>{

    /**
     * 更新操作
     * @param record
     * @return
     */
    int update(List<T> record);
}
