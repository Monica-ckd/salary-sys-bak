package com.gxzy.salary.points.controller;


import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.controller.SysUserController;
import com.gxzy.salary.core.http.HttpResult;
import com.gxzy.salary.core.page.ColumnFilter;
import com.gxzy.salary.core.page.MybatisPageHelper;
import com.gxzy.salary.core.page.PageRequest;
import com.gxzy.salary.core.page.PageResult;
import com.gxzy.salary.points.model.PointRecord;
import com.gxzy.salary.points.service.PointRecordService;
import com.gxzy.salary.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 积分记录表 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@RestController
@RequestMapping("/point")
public class PointRecordController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(PointRecordController.class);
    @Autowired
    private PointRecordService pointRecordService;

    // 分页查询
    @PostMapping(value="/findPage")
    public HttpResult findPage(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(pointRecordService.findPage(pageRequest));
    }
    // 条件查询
    @PostMapping(value="/findByCondition")
    public HttpResult findByCondition(@RequestBody BasicFilterVo filterVo) {
        logger.info("积分记录条件查询"+filterVo);
        return HttpResult.ok(pointRecordService.findByCondition(filterVo));
    }

    // 条件查询
    @GetMapping(value="/findAll")
    public HttpResult findAll() {
        logger.info("积分记录查询全部");
        return HttpResult.ok(pointRecordService.findAll());
    }

    @PostMapping(value="/findByPageCondition")
    public HttpResult findByPageCondition(@RequestBody BasicFilterVo filterVo) {
        logger.info("积分记录条件分页查询"+filterVo);
        return HttpResult.ok(pointRecordService.findByPageCondition(filterVo));
    }

    // 新增 或修改
    @PostMapping(value="/addOrUpdate")
    public HttpResult addRecords(@RequestBody PointRecord record) {
        logger.info("积分新增或修改记录"+record);
        return HttpResult.ok(pointRecordService.save(record));
    }
    // 删除
    @PostMapping(value="/del")
    public HttpResult delRecords(@RequestBody PointRecord record) {
        logger.info("积分记录删除"+record);
        return HttpResult.ok(pointRecordService.delete(record));
    }
    // 根据id删除
     @GetMapping(value="/delById")
        public HttpResult delById(@RequestParam Long id) {
            logger.info("积分记录删除"+id);
            return HttpResult.ok(pointRecordService.deleteById(id));
        }

        // 查询汇总记录
    @PostMapping(value="/findSummary")
    public HttpResult findSummary(@RequestBody BasicFilterVo filterVo) {
        logger.info("查询汇总记录"+filterVo);
        return HttpResult.ok(pointRecordService.findSummary(filterVo));
    }

    /**
     * 获取过滤字段的值
     * @param filterName
     * @return
     */
    public String getColumnFilterValue(PageRequest pageRequest, String filterName) {
        String value = null;
        ColumnFilter columnFilter = pageRequest.getColumnFilter(filterName);
        if(columnFilter != null) {
            value = columnFilter.getValue();
        }
        return value;
    }
}
