package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.BrandsRegamt;
import com.gxzy.salary.intface.CurdService;

import java.util.List;

/**
 * <p>
 * 牌号定额管理 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface BrandsRegamtService extends CurdService<BrandsRegamt> {

    List<BrandsRegamt> findAll(int category);
}
