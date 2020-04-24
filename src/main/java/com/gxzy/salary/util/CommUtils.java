package com.gxzy.salary.util;

import com.gxzy.salary.basic.vo.BasicFilterVo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class CommUtils {

    // 获取当前月第一天
    public static String getMonthFirst() {
        Calendar cale = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String firstday;
        // 获取前月的第一天
        cale = Calendar.getInstance();
        cale.add(Calendar.MONTH, 0);
        cale.set(Calendar.DAY_OF_MONTH, 1);
        firstday = format.format(cale.getTime());
       return firstday;
    }

    // 获取当前时间第一天 dayTime="2019-08-23" trans  dayTime="2019-08-01"
    public static String getMonthFirst(String dayTime) {
        if(null == dayTime || "".equals(dayTime))
        {
            return null;
        }
        StringBuffer sb = new StringBuffer(dayTime.substring(0,dayTime.length()-2));
        sb.append("01");
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(CommUtils.getMonthFirst());
        String dayTime="2019-08-23";
        String newString = CommUtils.getMonthFirst(dayTime);
        System.out.println(newString);

        ///////////test
        List<BasicFilterVo> array = new ArrayList<>();
        array.add(new BasicFilterVo("王五"));
        for (BasicFilterVo item :array) {
            item.setName("张三");
        }
        System.out.println(array.toString());

//        String mid = new String("12,13,14");
        String mid = new String("12");
        String[] arr = mid.split(",");
        for (int i = 0; i <arr.length ; i++) {
            System.out.println(arr[i]);
        }
    }
}
