package com.gxzy.salary.controller;

import com.gxzy.salary.constants.SysConstants;
import com.gxzy.salary.core.http.HttpResult;
import com.gxzy.salary.model.SysUser;
import com.gxzy.salary.service.SysUserService;
import com.gxzy.salary.util.PasswordUtils;
import com.gxzy.salary.vo.LoginBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
/**
 *  @author: chenkaidi
 *  @Date: 2019/8/6 14:57
 *  @Description:  用户管理Controller
 */
@RestController
@RequestMapping("user")
public class SysUserController {

    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(SysUserController.class);
    @Autowired
    private SysUserService sysUserService;


    @GetMapping(value = "/findAll")
    public Object findAll() {
        return sysUserService.findAll();
    }

    @PostMapping(value="/save")
    public HttpResult save(@RequestBody SysUser record) {
        logger.info("新增用户保存");
        SysUser user = sysUserService.findById(record.getId());
        if(user != null) {
            if(SysConstants.ADMIN.equalsIgnoreCase(user.getName())) {
                return HttpResult.error("超级管理员不允许修改!");
            }
        }
        if(record.getPassword() != null) {
            String salt = PasswordUtils.getSalt();
            if(user == null) {
                // 新增用户
                if(sysUserService.findByName(record.getName()) != null) {
                    return HttpResult.error("用户名已存在!");
                }
                String password = PasswordUtils.encrypte(record.getPassword(), salt);
                record.setSalt(salt);
                record.setPassword(password);
            } else {
                // 修改用户, 且修改了密码
                if(!record.getPassword().equals(user.getPassword())) {
                    String password = PasswordUtils.encrypte(record.getPassword(), salt);
                    record.setSalt(salt);
                    record.setPassword(password);
                }
            }
        }
        return HttpResult.ok(sysUserService.save(record));
    }

    @PostMapping(value="/delete")
    public HttpResult delete(@RequestBody List<SysUser> records) {
        for(SysUser record:records) {
            SysUser sysUser = sysUserService.findById(record.getId());
            if(sysUser != null && SysConstants.ADMIN.equalsIgnoreCase(sysUser.getName())) {
                return HttpResult.error("超级管理员不允许删除!");
            }
        }
        return HttpResult.ok(sysUserService.delete(records));
    }

    @GetMapping(value="/findByName")
    public HttpResult findByUserName(@RequestParam String name) {
        return HttpResult.ok(sysUserService.findByName(name));
    }

    @GetMapping(value="/findByEno")
    public HttpResult findByUserEno(@RequestParam String eno) {
        SysUser user = sysUserService.findByEno(eno);
        logger.info("find user by eno..."+ user);
        return HttpResult.ok(user);
    }

    @GetMapping(value="/findPermissions")
    public HttpResult findPermissions(@RequestParam String name) {
        return HttpResult.ok(sysUserService.findPermissions(name));
    }

    @GetMapping(value="/findUserRoles")
    public HttpResult findUserRoles(@RequestParam Long userId) {
        return HttpResult.ok(sysUserService.findUserRoles(userId));
    }

    /**
     * 修改登录用户密码
     */
    @PostMapping("/updatePassword")
    public HttpResult updatePassword(@RequestBody LoginBean loginBean) {
        String password = loginBean.getPassword();
        String newPassword = loginBean.getNewPassword();
        String eno = loginBean.getAccount();
        SysUser user = sysUserService.findByEno(eno);
        logger.info("updatePassword user==" + user);
        if (user != null && password != null && newPassword != null) {
            String oldPassword = PasswordUtils.encrypte(password, user.getSalt());
            if (!oldPassword.equals(user.getPassword())) {
                return HttpResult.error("原密码不正确");
            }
            user.setPassword(PasswordUtils.encrypte(newPassword, user.getSalt()));
        logger.info(user.toString());
        return HttpResult.ok(sysUserService.updatePwd(user));
    }
        return HttpResult.error();
    }

}