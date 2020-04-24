package com.gxzy.salary.service.impl;
/**
 *  @author: chenkaidi
 *  @Date: 2019/8/5 14:11
 *  @Description:
 */

import com.gxzy.salary.dao.SysUserTokenMapper;
import com.gxzy.salary.model.SysUserToken;
import com.gxzy.salary.service.SysUserTokenService;
import com.gxzy.salary.util.TokenGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SysUserTokenServiceImpl  implements SysUserTokenService {

    @Autowired
    private SysUserTokenMapper sysUserTokenMapper;
    // 12小时后过期
    private final static int EXPIRE = 3600 * 12;


    @Override
    public SysUserToken findByUserId(Long userId) {
        return sysUserTokenMapper.findByUserId(userId);
    }

    @Override
    public SysUserToken findByToken(String token) {
        return sysUserTokenMapper.findByToken(token);
    }

    @Override
    public int save(SysUserToken record) {
        if(record.getId() == null || record.getId() == 0) {
            return sysUserTokenMapper.insertSelective(record);
        }
        return sysUserTokenMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int delete(SysUserToken record) {
        return sysUserTokenMapper.deleteByPrimaryKey(record.getId());
    }

    @Override
    public int delete(List<SysUserToken> records) {
        for(SysUserToken record:records) {
            delete(record);
        }
        return 1;
    }

    @Override
    public SysUserToken findById(Long id) {
        return sysUserTokenMapper.selectByPrimaryKey(id);
    }

    @Override
    public SysUserToken createToken(long userId) {
        // 生成一个token
        String token = TokenGenerator.generateToken();
        // 当前时间
        Date now = new Date();
        // 过期时间
        Date expireTime = new Date(now.getTime() + EXPIRE * 1000);
        // 判断是否生成过token
        SysUserToken sysUserToken = findByUserId(userId);
        if(sysUserToken == null){
            sysUserToken = new SysUserToken();
            sysUserToken.setUserId(userId);
            sysUserToken.setToken(token);
            sysUserToken.setLastUpdateTime(now);
            sysUserToken.setExpireTime(expireTime);
            sysUserToken.setFirstLoginFlag(true);
            // 保存token，这里选择保存到数据库，也可以放到Redis或Session之类可存储的地方
            save(sysUserToken);
        } else{
            sysUserToken.setToken(token);
            sysUserToken.setLastUpdateTime(now);
            sysUserToken.setExpireTime(expireTime);
            sysUserToken.setFirstLoginFlag(false);
            // 如果token已经生成，则更新token的过期时间
            save(sysUserToken);
        }
        return sysUserToken;
    }
}
