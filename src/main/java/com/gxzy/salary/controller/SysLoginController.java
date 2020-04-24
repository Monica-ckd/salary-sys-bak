package com.gxzy.salary.controller;

import com.gxzy.salary.core.http.HttpResult;
import com.gxzy.salary.model.SysUser;
import com.gxzy.salary.model.SysUserToken;
import com.gxzy.salary.service.SysUserService;
import com.gxzy.salary.service.SysUserTokenService;
import com.gxzy.salary.util.PasswordUtils;
import com.gxzy.salary.util.ShiroUtils;
import com.gxzy.salary.vo.LoginBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * @author: chenkaidi
 * @Date: 2019/8/5 11:40
 * @Description: 登陆
 */
@RestController
public class SysLoginController {

    private static final Logger logger = LoggerFactory.getLogger(SysLoginController.class);

    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private SysUserTokenService sysUserTokenService;

    /**
     * 登录接口
     */
    @PostMapping(value = "/login")
    public HttpResult login(@RequestBody LoginBean loginBean) throws IOException {
                String eno = loginBean.getAccount();
                String password = loginBean.getPassword();
        //
        //        // 用户信息
        SysUser user = sysUserService.findByEno(eno);
        logger.info("用户登陆" + user);

        // 账号不存在、密码错误
        if (user == null) {
            logger.error("账号不存在");
            return HttpResult.error("账号不存在");

        }

        if (!match(user, password)) {
            logger.error(user + "密码不正确");
            return HttpResult.error("密码不正确");
        }

        // 账号锁定
        if (user.getStatus() == 0) {
            return HttpResult.error("账号已被锁定,请联系管理员");
        }

        // 生成token，并保存到数据库
        SysUserToken data = sysUserTokenService.createToken(user.getId());
        logger.info("login successful ..."+ data);
        return HttpResult.ok(data);
    }

    /**
     * 验证用户密码
     *
     * @param user
     * @param password
     * @return
     */
    public boolean match(SysUser user, String password) {
        return user.getPassword().equals(PasswordUtils.encrypte(password, user.getSalt()));
    }

    /**
     * 登出接口
     */
    @GetMapping(value = "/logout")
    public HttpResult logout() {
        logger.info("用户退出登陆....");
        ShiroUtils.logout();
        return HttpResult.ok();
    }

}
