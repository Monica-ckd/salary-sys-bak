package com.gxzy.salary.util;

import com.gxzy.salary.basic.vo.BasicFilterVo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Date;

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

    /**
     * 时间戳转换成日期格式字符串
     * @param seconds 精确到秒的字符串
     * @param format 转换的时间格式
     * @return
     */
    public static String timeStamp2Date(String seconds,String format) {
        if(seconds == null || seconds.isEmpty() || seconds.equals("null")){
            return "";
        }
        if(format == null || format.isEmpty()){
            format = "yyyy-MM-dd HH:mm:ss";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date(Long.valueOf(seconds+"000")));
    }

    /**
     * 日期格式字符串转换成时间戳
     * @param date_str 字符串日期
     * @param format 如：yyyy-MM-dd HH:mm:ss
     * @return
     */
    public static String date2TimeStamp(String date_str,String format){
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return String.valueOf(sdf.parse(date_str).getTime()/1000);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
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
