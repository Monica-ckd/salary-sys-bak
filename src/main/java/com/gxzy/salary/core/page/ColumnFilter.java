package com.gxzy.salary.core.page;

/**
 * 分页查询列过滤器
 * @author: chenkaidi
 *  @Date: 2020/5/11 10:57
 *  @Description:
 */
public class ColumnFilter {

	/**
	 * 过滤列名
	 */
	private String name;
	/**
	 * 查询的值
	 */
	private String value;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "ColumnFilter{" +
				"name='" + name + '\'' +
				", value='" + value + '\'' +
				'}';
	}
}
