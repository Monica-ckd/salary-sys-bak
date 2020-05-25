package com.gxzy.salary.points.service;

import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.page.PageResult;
import com.gxzy.salary.intface.EnCurdService;
import com.gxzy.salary.points.model.PointRecord;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 积分记录表 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
public interface PointRecordService extends EnCurdService<PointRecord> {

    int deleteById(Long id);

    PageResult findByPageCondition(BasicFilterVo filterVo);


    List<PointRecord> findAll();

    List findSummary(BasicFilterVo filterVo);

    boolean batchImport(String fileName, MultipartFile file);
}
