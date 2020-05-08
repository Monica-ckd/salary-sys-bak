package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.Groups;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.CurdService;
import com.gxzy.salary.intface.EnCurdService;
import com.gxzy.salary.intface.EnhanceCrudService;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;

/**
 * <p>
 * 班组管理 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface GroupsService extends EnhanceCrudService<Groups, BasicFilterVo> {

}
