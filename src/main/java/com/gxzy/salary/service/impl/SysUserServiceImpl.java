package com.gxzy.salary.service.impl;

import com.gxzy.salary.core.page.ColumnFilter;
import com.gxzy.salary.core.page.MybatisPageHelper;
import com.gxzy.salary.core.page.PageRequest;
import com.gxzy.salary.core.page.PageResult;
import com.gxzy.salary.dao.SysRoleMapper;
import com.gxzy.salary.dao.SysUserMapper;
import com.gxzy.salary.dao.SysUserRoleMapper;
import com.gxzy.salary.model.SysMenu;
import com.gxzy.salary.model.SysRole;
import com.gxzy.salary.model.SysUser;
import com.gxzy.salary.model.SysUserRole;
import com.gxzy.salary.service.SysMenuService;
import com.gxzy.salary.service.SysUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 *  @author: chenkaidi
 *  @Date: 2019/8/5 23:26
 *  @Description: 用户管理服务实现类
 */
@Service
public class SysUserServiceImpl  implements SysUserService {
	/**
	 * 日志对象
	 */
	private static final Logger logger = LoggerFactory.getLogger(SysUserServiceImpl.class);

	@Autowired
	private SysUserMapper sysUserMapper;
	@Autowired
	private SysMenuService sysMenuService;
	@Autowired
	private SysUserRoleMapper sysUserRoleMapper;
	@Autowired
	private SysRoleMapper sysRoleMapper;

	@Override
	public SysUser findByEno(String eno) {
		return sysUserMapper.findByEno(eno);
	}

	@Override
	public List<SysUser> findAll() {
		return sysUserMapper.selectAll();
	}

	@Override
	public PageResult findPage(PageRequest pageRequest) {
		PageResult pageResult = null;
		String name = getColumnFilterValue(pageRequest, "name");
		String email = getColumnFilterValue(pageRequest, "email");
		if(name != null) {
			if(email != null) {
				logger.info("findPage email"+pageRequest);
				pageResult = MybatisPageHelper.findPage(pageRequest, sysUserMapper, "findPageByNameAndEmail", name, email);
			} else {
				logger.info("findPage name"+pageRequest);
				pageResult = MybatisPageHelper.findPage(pageRequest, sysUserMapper, "findPageByName", name);
			}
		} else {
			logger.info("findPage empty"+pageRequest);
			pageResult = MybatisPageHelper.findPage(pageRequest, sysUserMapper);
			logger.info("findPage"+pageResult);
		}
		// 加载用户角色信息
		findUserRoles(pageResult);
		return pageResult;
	}

	/**
	 * 加载用户角色
	 * @param pageResult
	 */
	private void findUserRoles(PageResult pageResult) {
		List<?> content = pageResult.getContent();
		for(Object object:content) {
			SysUser sysUser = (SysUser) object;
			List<SysUserRole> userRoles = findUserRoles(sysUser.getId());
			sysUser.setUserRoles(userRoles);
			sysUser.setRoleNames(getRoleNames(userRoles));
		}
	}
	/**
	 * 获取过滤字段的值
	 * @param filterName
	 * @return
	 */
	public String getColumnFilterValue(PageRequest pageRequest, String filterName) {
		String value = null;
		ColumnFilter columnFilter = pageRequest.getColumnFilter(filterName);
		if(columnFilter != null) {
			value = columnFilter.getValue();
		}
		return value;
	}


	@Transactional
	@Override
	public int save(SysUser record) {
		Long id = null;
		if(record.getId() == null || record.getId() == 0) {
			// 新增用户
			sysUserMapper.insertSelective(record);
			id = record.getId();
		} else {
			// 更新用户信息
			sysUserMapper.updateByPrimaryKeySelective(record);
		}
		// 更新用户角色
		if(id != null && id == 0) {
			return 1;
		}
		if(id != null) {
			for(SysUserRole sysUserRole:record.getUserRoles()) {
				sysUserRole.setUserId(id);
			}
		} else {
			sysUserRoleMapper.deleteByUserId(record.getId());
		}
		for(SysUserRole sysUserRole:record.getUserRoles()) {
			sysUserRoleMapper.insertSelective(sysUserRole);
		}
		return 1;
	}

	@Override
	public int delete(SysUser record) {
		return sysUserMapper.deleteByPrimaryKey(record.getId());
	}

	@Override
	public int delete(List<SysUser> records) {
		for(SysUser record:records) {
			delete(record);
		}
		return 1;
	}

	@Override
	public SysUser findById(Long id) {
		return sysUserMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updatePwd(SysUser record) {
		// 更新用户密码
		sysUserMapper.updateByPrimaryKeySelective(record);
		logger.info("===更新用户密码====");
		return 1;
	}

	@Override
	public SysUser findByName(String name) {
		return sysUserMapper.findByName(name);
	}




	private String getRoleNames(List<SysUserRole> userRoles) {
		StringBuilder sb = new StringBuilder();
		for(Iterator<SysUserRole> iter=userRoles.iterator(); iter.hasNext();) {
			SysUserRole userRole = iter.next();
			SysRole sysRole = sysRoleMapper.selectByPrimaryKey(userRole.getRoleId());
			if(sysRole == null) {
				continue ;
			}
			sb.append(sysRole.getRemark());
			if(iter.hasNext()) {
				sb.append(", ");
			}
		}
		return sb.toString();
	}

	@Override
	public Set<String> findPermissions(String userName) {	
		Set<String> perms = new HashSet<>();
		List<SysMenu> sysMenus = sysMenuService.findByUser(userName);
		for(SysMenu sysMenu:sysMenus) {
			perms.add(sysMenu.getPerms());
		}
		return perms;
	}

	@Override
	public List<SysUserRole> findUserRoles(Long userId) {
		return sysUserRoleMapper.findUserRoles(userId);
	}
}
