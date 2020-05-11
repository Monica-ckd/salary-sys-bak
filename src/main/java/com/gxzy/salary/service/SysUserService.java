package com.gxzy.salary.service;

import com.gxzy.salary.core.page.PageRequest;
import com.gxzy.salary.core.page.PageResult;
import com.gxzy.salary.model.SysUser;
import com.gxzy.salary.model.SysUserRole;
import com.gxzy.salary.intface.CurdService;

import java.util.List;
import java.util.Set;

public interface SysUserService extends CurdService<SysUser> {

    int updatePwd(SysUser record);

    SysUser findByName(String username);

    /**
    * @Description 根据工号查询用户
    * @Author  chenkaidi
    * @Date   2019/8/5 16:13
    * @Param
    * @Return
    * @Exception
    *
    */
    SysUser findByEno(String eno);

    /**
     * 查找用户的菜单权限标识集合
     * @param userName
     * @return
     */
    Set<String> findPermissions(String userName);

    /**
     * 查找用户的角色集合
     * @param userId
     * @return
     */
    List<SysUserRole> findUserRoles(Long userId);
    /**
     * 查找所有用户
     * @return
     */
    List<SysUser> findAll();

    PageResult findPage(PageRequest pageRequest);

}