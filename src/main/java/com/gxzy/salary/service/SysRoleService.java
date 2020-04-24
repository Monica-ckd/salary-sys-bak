package com.gxzy.salary.service;

import com.gxzy.salary.model.SysMenu;
import com.gxzy.salary.model.SysRole;
import com.gxzy.salary.model.SysRoleMenu;
import com.gxzy.salary.intface.CurdService;

import java.util.List;


/**
 *  @author: chenkaidi
 *  @Date: 2019/8/5 23:12
 *  @Description: 角色管理
 */
public interface SysRoleService extends CurdService<SysRole> {

	/**
	 * 查询全部
	 * @return
	 */
	List<SysRole> findAll();

	/**
	 * 查询角色菜单集合
	 * @return
	 */
	List<SysMenu> findRoleMenus(Long roleId);

	/**
	 * 保存角色菜单
	 * @param records
	 * @return
	 */
	int saveRoleMenus(List<SysRoleMenu> records);

	/**
	 * 根据名称查询
	 * @param name
	 * @return
			 */
	List<SysRole> findByName(String name);

}
