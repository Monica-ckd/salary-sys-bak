package com.gxzy.salary.basic.dao;

import com.gxzy.salary.basic.model.BrandsRegamt;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.BasicMapper;

import java.util.List;

/**
 * <p>
 * 牌号定额管理 Mapper 接口
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface BrandsRegamtMapper extends BasicMapper<BrandsRegamt> {

    List<BrandsRegamt> selectAll(int category);

    /**
     * 根据机台、牌号 -》获取定额数据
     * @param filter
     * @return
     */
    BrandsRegamt findByFilter(BasicFilterVo filter);

    List<BrandsRegamt> findByBrand(String brand);

    List<BrandsRegamt> findByMid(Long mid);
}
