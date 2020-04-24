package com.gxzy.salary.book.controller;


import com.gxzy.salary.basic.controller.MeetRoomInfoController;
import com.gxzy.salary.book.model.ReserveInfo;
import com.gxzy.salary.book.service.ReserveInfoService;
import com.gxzy.salary.book.service.vo.ReserveFilterVo;
import com.gxzy.salary.core.http.HttpResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>
 * 会议室预约信息 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-16
 */
@RestController
@RequestMapping("/reserveInfo")
public class ReserveInfoController {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(MeetRoomInfoController.class);
    @Autowired
    private ReserveInfoService reserveInfoService;
    // 查找全部
        @GetMapping(value = "/findAll")
            public HttpResult findRoomAll() {
                logger.info("======ReserveInfoController=====");
                return HttpResult.ok(reserveInfoService.findAll());
    }

    // 查找当前会议室当周预定信息
    @PostMapping(value = "/findWeekInfos")
    public HttpResult findWeekByRoom(@RequestBody ReserveFilterVo filter) {
        logger.info("======findWeekByRoom Controller=====");
        return HttpResult.ok(reserveInfoService.findWeekByRoom(filter));
    }


    // 根据时间查找
    @GetMapping(value = "/findByDate")
    public HttpResult findByDate(@RequestParam String filterTime) {
        logger.info("======ReserveInfoController====="+filterTime);
        return HttpResult.ok(reserveInfoService.findByDate(filterTime));
    }


    // 新增预约
    @PostMapping(value="/addReserve")
    public HttpResult addReserveInfo(@RequestBody ReserveInfo reserveInfo) {

        if(null == reserveInfo)
        {
            HttpResult.error("当前新增数据记录为空！");
        }
        // 1.根据会议室 日期 时间校验 是否空闲时间段
       if(isBusyTime(reserveInfo))
       {
           logger.info("当前预约时间段非空闲");
           return HttpResult.error("当前预约时间段已被占用");
       }
       // 当前时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       String strDate = sdf.format(new Date());
       reserveInfo.setCreateTime(strDate);
        return HttpResult.ok(reserveInfoService.addReserve(reserveInfo));
    }

    /**
     *  @author: chenkaidi
     *  @Date: 2020/3/10 22:49
     *  @Description: 判断预约时间段是否占用
     */
    private boolean isBusyTime(ReserveInfo reserveInfo) {
        boolean isBusy = false;
        int cnt = reserveInfoService.checkReserveTime(reserveInfo);
        if(cnt > 0)
        {
            isBusy = true;
        }
        logger.info("isBusyTime预约时间段是否占用"+ isBusy);
        return isBusy;
    }

    // 根据创建人查找
    @GetMapping(value = "/findByUserName")
    public HttpResult findByName(@RequestParam String name) {
        logger.info("======ReserveInfoController findByName====="+name);
        return HttpResult.ok(reserveInfoService.findByName(name));
    }
    // 删除预约 -- 在创建后两小时可以删除
    @GetMapping(value = "/delReserve")
    public HttpResult delByRoomId(@RequestParam long id) {
        logger.info("======ReserveInfoController delByRoomId====="+id);
        return HttpResult.ok(reserveInfoService.delByIdAndTime(id));
    }
    // 修改预约 过期则不得修改
    @PostMapping(value="/updateReserve")
    public HttpResult updateReserveInfo(@RequestBody ReserveInfo reserveInfo) {

        if(null == reserveInfo)
        {
            HttpResult.error("当前修改数据记录为空！");
        }
        return HttpResult.ok(reserveInfoService.updateReserve(reserveInfo));
    }


}
