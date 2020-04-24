package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.CigOutputInfo;
import com.gxzy.salary.intface.CurdService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


/**
 * <p>
 * 日产量汇总 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-16
 */
public interface CigOutputInfoService extends CurdService<CigOutputInfo> {

    boolean batchImport(String fileName, MultipartFile file, String createTime) throws Exception;

    List<CigOutputInfo> findByTime(String dayTime);
}
