package com.gxzy.salary.basic.controller;


import com.gxzy.salary.core.http.HttpResult;
import com.gxzy.salary.basic.service.MeetRoomInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 会议室信息 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-16
 */
@RestController
@RequestMapping("/meetRoomInfo")
public class MeetRoomInfoController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(MeetRoomInfoController.class);
    @Autowired
    private MeetRoomInfoService roomInfoService;

    @GetMapping(value = "/findRoomAll")
    public HttpResult findRoomAll() {
        logger.info("======MeetRoomInfoController=====");
        return HttpResult.ok(roomInfoService.findAll());
    }
}
