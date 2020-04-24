package com.gxzy.salary.basic.controller;


import com.gxzy.salary.basic.model.BrandsRegamt;
import com.gxzy.salary.basic.service.BrandsRegamtService;
import com.gxzy.salary.core.http.HttpResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 牌号定额管理 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@RestController
@RequestMapping("regAmount")
public class BrandsRegamtController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(BrandsRegamtController.class);
    @Autowired
    private BrandsRegamtService brandsRegamtService;


    @GetMapping(value = "/findJbAll")
    public HttpResult findJbAll() {
        int category =0;
        return HttpResult.ok(brandsRegamtService.findAll(category));
    }

    @GetMapping(value = "/findCxAll")
    public HttpResult findCxAll() {
        int category =1; // 成型
        return HttpResult.ok(brandsRegamtService.findAll(category));
    }


    @PostMapping(value = "/batchDelete")
    public HttpResult delete(@RequestBody List<BrandsRegamt> records) {
        return HttpResult.ok(brandsRegamtService.delete(records));
    }

    @PostMapping(value = "/save")
    public HttpResult save(@RequestBody BrandsRegamt record) {

        return HttpResult.ok(brandsRegamtService.save(record));
    }

}
