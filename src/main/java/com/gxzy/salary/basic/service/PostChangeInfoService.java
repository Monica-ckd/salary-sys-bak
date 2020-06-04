package com.gxzy.salary.basic.service;

import com.gxzy.salary.basic.model.PostChangeInfo;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.intface.CurdService;

import java.util.List;

/**
 * <p>
 * 员工岗位信息表 服务类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-27
 */
public interface PostChangeInfoService extends CurdService<PostChangeInfo> {

    List<PostChangeInfo> findPostChange(BasicFilterVo filter);

    int confirmPostExcept(List<PostChangeInfo> records);

    int askUpdatePost(PostChangeInfo record);

    List<PostChangeInfo>  findPostOrders(BasicFilterVo filter);

    int addEmpPost(PostChangeInfo record);

    int batchOrderConfirm(List<PostChangeInfo> records);

    int orderDeny(PostChangeInfo record);

    List<PostChangeInfo> findAllPostChange(BasicFilterVo filter);
}
