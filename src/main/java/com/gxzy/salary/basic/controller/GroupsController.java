package com.gxzy.salary.basic.controller;


import com.gxzy.salary.basic.service.GroupsService;
import com.gxzy.salary.core.http.HttpResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 班组管理 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@RestController
@RequestMapping("/groups")
public class GroupsController {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(GroupsController.class);
    @Autowired
    private GroupsService groupsService;

    @GetMapping(value = "/findAll")
    public HttpResult findJbAll() {
        return HttpResult.ok(groupsService.findAll());
    }

}
