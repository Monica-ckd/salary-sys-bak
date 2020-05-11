package com.gxzy.salary.basic.controller;


import com.gxzy.salary.basic.service.EmpBasicInfoService;
import com.gxzy.salary.basic.service.EmpPostInfoService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.http.HttpResult;
import com.gxzy.salary.util.CommUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 员工基本信息表 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@RestController
@RequestMapping("empPostInfo")
public class EmpBasicInfoController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(EmpBasicInfoController.class);

    @Autowired
    private EmpBasicInfoService empBasicInfoService;

    @Autowired
    private EmpPostInfoService empPostInfoService;

    @GetMapping(value = "/findEmpInfos")
    public HttpResult findEmpInfos() {
        // 取【姓名，班组】
        return HttpResult.ok(empBasicInfoService.findAll());
    }

    @GetMapping(value = "/findForPull")
    public HttpResult findForPull() {
        // 取当月排班所有操作工信息 post_type=0
//        String monthTime = CommUtils.getMonthFirst();
        String monthTime = empBasicInfoService.getLastMonth();
        logger.info("monthTime"+monthTime);
        return HttpResult.ok(empBasicInfoService.findForPull(monthTime));
}

    // 查询员工岗位信息
//    "eno": "111110","eName": "韩梅梅","position": "卷接挡车工","group":"甲", "mid":"2","bounsRatio": "0.55"
    @GetMapping(value = "/findEmpByName")
    public HttpResult findEmpByName(@RequestParam String name) {

        // 构造查询filter
        BasicFilterVo filter = new BasicFilterVo(name,CommUtils.getMonthFirst());
        logger.info("findEmpByName**filter**"+filter);
        return HttpResult.ok(empBasicInfoService.findEmpByName(filter));
    }

}
