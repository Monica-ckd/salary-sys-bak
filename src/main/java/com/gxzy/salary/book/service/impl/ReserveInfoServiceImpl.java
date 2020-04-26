package com.gxzy.salary.book.service.impl;

import com.gxzy.salary.book.dao.ReserveInfoMapper;
import com.gxzy.salary.book.dao.RoomUseInfosMapper;
import com.gxzy.salary.book.model.ReserveInfo;
import com.gxzy.salary.book.service.ReserveInfoService;
import com.gxzy.salary.book.service.vo.ReserveFilterVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 会议室预约信息 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2020-01-16
 */
@Service
public class ReserveInfoServiceImpl  implements ReserveInfoService {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(ReserveInfoServiceImpl.class);

    @Autowired
    private ReserveInfoMapper reserveInfoMapper;
    @Autowired
    private RoomUseInfosMapper roomUseInfosMapper;
    @Override
    public int save(ReserveInfo record) {
        return 0;
    }

    @Override
    public int delete(ReserveInfo record) {
        return 0;
    }

    @Override
    public int delete(List<ReserveInfo> records) {
        return 0;
    }

    @Override
    public ReserveInfo findById(Long id) {
        return null;
    }

    @Override
    public List<ReserveInfo> findAll() {
        return reserveInfoMapper.selectAll();
    }

    @Override
    public List<ReserveInfo> findByDate(String filterTime) {
        return reserveInfoMapper.selectByDate(filterTime);
    }


    @Override
    @Transactional(readOnly=false,rollbackFor=Exception.class)
    public boolean addReserve(ReserveInfo reserveInfo) {
        logger.info("addReserve"+reserveInfo.toString());
        // 插入预定信息记录
        boolean succFlag = true;
        try{
            reserveInfoMapper.insert(reserveInfo);
        }catch (Exception e){
            e.printStackTrace();
            succFlag = false;
        }
        logger.info("成功插入");
        return succFlag;
    }

    @Override
    public List<ReserveInfo> findWeekByRoom(ReserveFilterVo filterVo) {
        logger.info("findWeekByRoom"+ filterVo);
        // 计算本周所处日期时段
        Date startDate = getWeekStart(filterVo.getQueryDate());
        Calendar start = Calendar.getInstance();
        start.setTime(startDate);
        start.add(Calendar.DATE,6);
        Date endDate = start.getTime();
        logger.info("findWeekByRoom"+endDate);

        // 封装查询对象
        ReserveFilterVo filter = new ReserveFilterVo(filterVo.getRoomId(),formateDate(startDate),formateDate(endDate));
        logger.debug(filter.toString());
        return reserveInfoMapper.selectByRoomAndWeek(filter);
    }

    @Override
    public int checkReserveTime(ReserveInfo reserveInfo) {

        // 封装查询对象
        ReserveFilterVo filter = new ReserveFilterVo(reserveInfo.getRoomId(),reserveInfo.getDateNo(),reserveInfo.getStartTime(),reserveInfo.getEndTime());
        logger.info("checkReserveTime"+filter);
        return reserveInfoMapper.checkReserveTime(filter);
    }

    /**
     *  @author: chenkaidi
     *  @Date: 2020/3/11 10:10
     *  @Description: 根据登录用户名查询预定信息
     */
    @Override
    public List<ReserveInfo> findByName(String name) {
        String[] roomArr = {"","卷包车间党员之家","卷包车间会议室","卷包车间二楼大师工作室"};
        logger.info("findByName"+name);
        List<ReserveInfo> reserveInfos = reserveInfoMapper.selectByName(name);
        if(reserveInfos != null && reserveInfos.size()>0)
        {
            for (int i = 0; i <reserveInfos.size() ; i++) {
                ReserveInfo item = reserveInfos.get(i);
                reserveInfos.get(i).setRoomName(roomArr[item.getRoomId().intValue()]);
                logger.info(item.toString());
            }

        }
        return reserveInfos;
    }

    /**
     *  @author: chenkaidi
     *  @Date: 2020/3/11 12:06
     *  @Description: 根据ID删除预定信息
     */
    @Override
    public boolean delById(long id) {
        logger.info("delByRoomId"+id);
        // 删除预定信息记录
        boolean succFlag = true;
        try{
            reserveInfoMapper.deleteByPrimaryKey(id);
        }catch (Exception e){
            e.printStackTrace();
            succFlag = false;
        }
        logger.info("成功删除");
        return succFlag;
    }

    /**
     *  @author: chenkaidi
     *  @Date: 2020/3/11 12:09
     *  @Description: 只能创建时间在2小时内的预定信息
     */
    @Override
    public int delByIdAndTime(long id) {
        // 检查是有效删除时间
        boolean isValidTime = isValidTime(id);
        if(isValidTime)
        {
            // 根据id删除
            boolean delFlag = delById(id);
            if(delFlag) // 删除成功
            {
                return 1;
            }else
            {
                return 0; // 删除失败
            }
        }
        return -1; // 超过可删除时间
    }

    @Override
    public int updateReserve(ReserveInfo reserveInfo) {
        logger.info("更新"+reserveInfo.toString());
        return reserveInfoMapper.updateByPrimaryKeySelective(reserveInfo);
    }

    private boolean isValidTime(long id) {
        logger.info("检查是否超出删除时间"+id);
        // 查询
        ReserveInfo res = reserveInfoMapper.selectByPrimaryKey(id);
        // 获取当前时间前两小时的时间
        Date startDate = new Date();
        Calendar start = Calendar.getInstance();
        start.setTime(startDate);
        start.add(Calendar.HOUR,-1);
        Date beforeTwoHour = start.getTime();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date creatTime = sdf.parse(res.getCreateTime());
            if(creatTime.after(beforeTwoHour))
            {
               return true;
            }
            else
            {
                logger.info("超出删除时间"+res.getCreateTime());
                return false;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return false;
    }



    /**
    * @Description
    * @Author  chenkaidi
    * @Date   2020/3/10 19:03
    * @Param
    * @Return
    * @Exception   把Date 转换成YYYY-MM-DD格式输出
    *
    */
    private  String formateDate(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ; //使用了默认的格式创建了一个日期格式化对象。
        String dateString = dateFormat.format(date); //可以把日期转换转指定格式的字符串
        return  dateString;
    }

    private  Date formateString(String date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ; //使用了默认的格式创建了一个日期格式化对象。
        Date resDate = null; //可以把日期转换转指定格式的字符串
        try {
            resDate = dateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return  resDate;
    }


    private  Date getWeekStart(String queryDate) {

        Date startDate = formateString(queryDate);
        Calendar start = Calendar.getInstance();
        start.setTime(startDate);
        // 周几
        int w = start.get(Calendar.DAY_OF_WEEK) - 1;
        switch (w){
            case 0 : // 周日
                break;
            case 1 : // 周一
                start.add(Calendar.DATE,-1);
                break;
            case 2 : // 周二
                start.add(Calendar.DATE,-2);
                break;
            case 3 : // 周三
                start.add(Calendar.DATE,-3);
                break;
            case 4 : // 周四
                start.add(Calendar.DATE,-4);
                break;
            case 5 : // 周五
                start.add(Calendar.DATE,-5);
                break;
            case 6 : // 周六
                start.add(Calendar.DATE,-6);
                break;
        }
        startDate = start.getTime();
        System.out.println(startDate);
        logger.info("getWeekStart"+startDate);
        return startDate;
    }

    public static void main(String[] args) {

        // 获取当前时间前两小时的时间
        Calendar start = Calendar.getInstance();
        start.setTime(new Date());
        start.add(Calendar.HOUR,-2);
        Date beforeTwoHour = start.getTime();

        String time = "2020-03-11 13:19:21";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date creatTime = sdf.parse(time);
            if(creatTime.after(beforeTwoHour))
            {
                System.out.println("合法");
            }
            else
            {
                System.out.println("超时");
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

    }


    private boolean checkTimeField(ReserveInfo reserveInfo) {
        return true;
    }
}
