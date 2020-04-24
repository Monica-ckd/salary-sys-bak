package com.gxzy.salary.oauth2;

import org.apache.shiro.authc.AuthenticationToken;

/**
 * @author: chenkaidi
 * @Date: 2019/8/5 11:37
 * @Description:自定义 token 对象
 */
public class OAuth2Token implements AuthenticationToken {

    private static final long serialVersionUID = 1L;

    private String token;

    public OAuth2Token(String token) {
        this.token = token;
    }

    @Override
    public String getPrincipal() {
        return token;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
