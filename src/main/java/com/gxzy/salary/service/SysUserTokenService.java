package com.gxzy.salary.service;
import com.gxzy.salary.model.SysUserToken;
import com.gxzy.salary.intface.CurdService;

/**
 * @author: chenkaidi
 * @Date: 2019/8/5 14:29
 * @Description:用户token管理
 */

/**
 *  @author: chenkaidi
 *  @Date: 2019/8/5 11:43
 *  @Description:Token
 */
public interface SysUserTokenService extends CurdService<SysUserToken>{

    /**
     * 根据用户id查找
     * @param userId
     * @return
     */
    SysUserToken findByUserId(Long userId);

    /**
     * 根据token查找
     * @param token
     * @return
     */
    SysUserToken findByToken(String token);

    /**
     * 生成token
     * @param userId
     * @return
     */
    SysUserToken createToken(long userId);

}
