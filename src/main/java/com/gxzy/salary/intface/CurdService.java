package com.gxzy.salary.intface;

import java.util.List;
/**
 *  @author: chenkaidi
 *  @Date: 2019/8/5 14:28
 *  @Description:通用CURD接口
 */
public interface CurdService<T> {
        /**
         * 保存操作
         * @param record
         * @return
         */
        int save(T record);



        /**
         * 删除操作
         * @param record
         * @return
         */
        int delete(T record);

        /**
         * 批量删除操作
         * @param records
         */
        int delete(List<T> records);

        /**
         * 根据ID查询
         * @param id
         * @return
         */
        T findById(Long id);


}
