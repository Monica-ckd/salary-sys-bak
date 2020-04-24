package com.gxzy.salary.basic.controller;

import com.gxzy.salary.basic.service.CigOutputInfoService;
import com.gxzy.salary.core.http.HttpResult;
import com.gxzy.salary.handler.FileUpDown;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * <p>
 * 日产量汇总 前端控制器
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
@RestController
@RequestMapping("cigOutputInfo")
public class CigOutputInfoController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(CigOutputInfoController.class);

    @Autowired
    private CigOutputInfoService cigOutputService;

    @RequestMapping("/downDayAmtTmp")
    public void downloadFile(HttpServletResponse res) throws IOException {
        logger.info("*********模板文件下载开始***********");
        // C:\Users\prett\IdeaProjects\salary-sys\src\main\resources\template\dayAmtTemplete.xlsx
        String filePath = "template\\日产量数据汇总模板.xlsx";
        FileUpDown.downloadFile(res,filePath);
        logger.info("*********模板文件下载成功***********");
    }

    @PostMapping(value = "/upDayAmtExecl")
    public HttpResult uploadDayAmtExecl(@RequestParam("file") MultipartFile file,@RequestParam(value="createTime",required=false) String createTime) {
        boolean a = false;

        logger.info("******************"+createTime);

        String fileName = file.getOriginalFilename();
        logger.info("*********日产量execl文件上传解析开始***********"+fileName);
        try {
            if (cigOutputService.batchImport(fileName, file,createTime))
            {
                return  HttpResult.ok();
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage());
            return HttpResult.error(e.getMessage());
        }
     return  HttpResult.error();
    }

}

