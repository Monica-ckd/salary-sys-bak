package com.gxzy.salary.points.controller;


import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.http.HttpResult;
import com.gxzy.salary.points.model.ModuleItem;
import com.gxzy.salary.points.model.PointRecord;
import com.gxzy.salary.points.service.ModuleItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 积分项目表 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2020-05-08
 */
@RestController
@RequestMapping("/module")
public class ModuleItemController {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(ModuleItemController.class);
    @Autowired
    private ModuleItemService moduleItemService;
    // 查询
    @GetMapping(value="/findAll")
    public HttpResult findAll() {
        logger.info("积分项目模块配置查询");
        return HttpResult.ok(moduleItemService.findAll());
    }



    // 删除
    @GetMapping(value="/delete")
    public HttpResult deleteById(@RequestParam Long id) {
        logger.info("积分项目模块配置查询");
        return HttpResult.ok(moduleItemService.deleteById(id));
    }
    // 保存(新增 或修改)
    @PostMapping(value="/save")
    public HttpResult saveRecords(@RequestBody ModuleItem record) {
        logger.info("积分新增或修改记录"+record);
        return HttpResult.ok(moduleItemService.save(record));
    }

    // 查询
    @GetMapping(value="/findForTable")
    public HttpResult findForTable() {
        logger.info("积分项目模块构造汇总表table查询");
        return HttpResult.ok(moduleItemService.findForTable());
    }
}
