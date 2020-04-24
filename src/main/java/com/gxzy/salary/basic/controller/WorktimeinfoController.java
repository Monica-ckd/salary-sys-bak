package com.gxzy.salary.basic.controller;


import com.gxzy.salary.basic.model.Worktimeinfo;
import com.gxzy.salary.basic.service.WorktimeinfoService;
import com.gxzy.salary.core.http.HttpResult;
import com.gxzy.salary.util.CommUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 月工作时间信息 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@RestController
@RequestMapping("/worktime")
public class WorktimeinfoController {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(WorktimeinfoController.class);
    @Autowired
    private WorktimeinfoService worktimeService;


    @GetMapping(value = "/findAll")
    public HttpResult findAll(@RequestParam(required = false) String monthTime) {
        if (null == monthTime || "".equals(monthTime))
        {
            // 当前月份查找
            monthTime = CommUtils.getMonthFirst();
        }
        // 按月份查找
        logger.info("按月份查找:"+monthTime);
        return HttpResult.ok(worktimeService.selectByMonth(monthTime));
    }


    @PostMapping(value="/updateMonth")
    public HttpResult updateMonth(@RequestBody List<Worktimeinfo> records) {

        if(null == records || records.isEmpty())
        {
            HttpResult.error("当前更新数据记录为空！");
        }
        return HttpResult.ok(worktimeService.update(records));
    }

}
