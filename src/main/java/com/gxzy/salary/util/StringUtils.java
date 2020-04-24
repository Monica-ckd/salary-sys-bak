package com.gxzy.salary.util;

/**
 *  @author: chenkaidi
 *  @Date: 2019/8/5 14:54
 *  @Description:字符串工具类
 */
public class StringUtils {

	/**
	 * 判空操作
	 * @param value
	 * @return
	 */
	public static boolean isBlank(String value) {
		return value == null || "".equals(value) || "null".equals(value) || "undefined".equals(value);
	}

}
