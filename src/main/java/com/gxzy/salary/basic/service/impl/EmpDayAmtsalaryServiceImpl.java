package com.gxzy.salary.basic.service.impl;

import com.gxzy.salary.basic.dao.DayGroupAmtMapper;
import com.gxzy.salary.basic.dao.EmpBasicInfoMapper;
import com.gxzy.salary.basic.dao.EmpDayAmtsalaryMapper;
import com.gxzy.salary.basic.dao.PostChangeInfoMapper;
import com.gxzy.salary.basic.model.*;
import com.gxzy.salary.basic.service.CigOutputInfoService;
import com.gxzy.salary.basic.service.EmpDayAmtsalaryService;
import com.gxzy.salary.basic.service.SalaryCounterService;
import com.gxzy.salary.basic.vo.BasicFilterVo;
import com.gxzy.salary.core.exception.MyException;
import com.gxzy.salary.util.CommUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 员工日工资汇总 服务实现类
 * </p>
 *
 * @author chenkaidi
 * @since 2019-08-30
 */
@Service
public class EmpDayAmtsalaryServiceImpl implements EmpDayAmtsalaryService {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(EmpDayAmtsalaryServiceImpl.class);

    @Autowired
    SalaryCounterService salaryCounterService;

    @Autowired
    CigOutputInfoService cigOutputInfoService;

    @Autowired
    EmpDayAmtsalaryMapper dayAmtsalaryMapper;

    @Autowired
    EmpBasicInfoMapper empBasicInfoMapper;

    @Autowired
    PostChangeInfoMapper postChangeInfoMapper;

    @Autowired
    DayGroupAmtMapper dayGroupAmtMapper;

    @Override
    public List<EmpDayAmtsalary> findAmtSalary(BasicFilterVo filter) {
        if((null == filter.getsTime()||"".equals(filter.getsTime()))
                &&(null == filter.geteTime()||"".equals(filter.geteTime())))
        {
            String name = filter.getName();
            filter = new BasicFilterVo(name);
            // 设置默认起始时间为当前月初第一天
            filter.setsTime(CommUtils.getMonthFirst());
            logger.info("search filter ***"+filter);
        }
        logger.info("findAmtSalary***filter***"+filter);
        return dayAmtsalaryMapper.findByPeriod(filter);
    }

    @Transactional
    @Override
    public int calAmtSalary(String dayTime) {

        // 判断是否已经有日薪资数据 有，删除 dayTime
        int delRecord = dayAmtsalaryMapper.deleteByCreateTime(dayTime);
        logger.info("删除已有数据 deleteByCreateTime**"+ dayTime+"delRecord"+delRecord);

        // 1.查询对应日期下的所有日产量数据 cig_output_info
        List<CigOutputInfo> cigOutputInfos = cigOutputInfoService.findByTime(dayTime);
        logger.info("CigOutputInfo findByTime**"+ cigOutputInfos);

        // 1.2计算班总产量入库
        this.calDayGroupAmt(dayTime,cigOutputInfos);

        // 1.3 查询所有员工当日所在岗位数据
        List<EmpBasicInfo> empBasicInfos = this.getEmpBasicInfos(dayTime);

        // 2.得到个人名下产量数据 【mid,group】 -> 映射到个人名下
        List<EmpDayAmtsalary> empDayAmtsalaries = this.empAmtMapping(empBasicInfos,cigOutputInfos);

        // 3.构造filter ，计算日产量薪资
        empDayAmtsalaries = calEmpDayAmtsalary(empDayAmtsalaries);

        // 保存入库 表emp_day_amtSalary
        for(EmpDayAmtsalary record : empDayAmtsalaries)
        {
            logger.info("***empDayAmtsalary***"+record);
            dayAmtsalaryMapper.insert(record);
        }
     return 1;
    }

    /**
     * 计算班总产量
     * @param cigOutputInfos
     */
    private void calDayGroupAmt(String dayTime,List<CigOutputInfo> cigOutputInfos) {
        if(null == cigOutputInfos || cigOutputInfos.isEmpty())
        {
            logger.info("当前时间日产量数据未导入，请先导入！");
            throw new MyException("当前登陆用户员工岗位信息不存在，请联系管理员");
        }
        // 查询dayTime 下有没有班总产量数据，有 删除
        int res = dayGroupAmtMapper.deleteByTime(dayTime);
        logger.info("删除已有数据 calDayGroupAmt deleteByTime**"+"dayTime"+dayTime+ res);
        int[] count = new int[8];
        double[] amtSum = new double[8];
        // 遍历日产量计算班总产量
        for(CigOutputInfo cigOutputInfo :cigOutputInfos)
        {
            int gid = cigOutputInfo.getGid().intValue();
            double amount =cigOutputInfo.getPrdAmt().doubleValue();
            switch (gid)
                {
                    case 1:// 甲班
                        if(amount>0)
                        {
                            amtSum[0]+=amount; // 累加产量
                            count[0]++; // 开的机器台数累加计数
                        }
                        break;
                    case 2:// 乙班
                        if(amount>0)
                        {
                            amtSum[1]+=amount; // 累加产量
                            count[1]++; // 开的机器台数累加计数
                        }
                        break;
                    case 3:// 丙班
                        if(amount>0)
                        {
                            amtSum[2]+=amount; // 累加产量
                            count[2]++; // 开的机器台数累加计数
                        }
                        break;
                    case 4:// 丁班
                        if(amount>0)
                        {
                            amtSum[3]+=amount; // 累加产量
                            count[3]++; // 开的机器台数累加计数
                        }
                        break;
                    case 5:// 细甲班
                        if(amount>0)
                        {
                            amtSum[4]+=amount; // 累加产量
                            count[4]++; // 开的机器台数累加计数
                        }
                        break;
                    case 6:// 细乙班
                        if(amount>0)
                        {
                            amtSum[5]+=amount; // 累加产量
                            count[5]++; // 开的机器台数累加计数
                        }
                        break;
                    case 7:// 细丙班
                        if(amount>0)
                        {
                            amtSum[6]+=amount;// 累加产量
                            count[6]++; // 开的机器台数累加计数
                        }
                        break;
                    case 8:// 细丁班
                        if(amount>0)
                        {
                            amtSum[7]+=amount; // 累加产量
                            count[7]++; // 开的机器台数累加计数
                        }
                        break;
                    default:
                        break;
            }
        }
        // 构造班总数据
        for(int i=0;i<count.length;i++)
        {
        DayGroupAmt dayGroupAmt = new DayGroupAmt(groupMapping(i),count[i],new BigDecimal(Double.valueOf(amtSum[i])),dayTime);
        logger.info("calDayGroupAmt insert*** dayGroupAmt"+dayGroupAmt);
        dayGroupAmtMapper.insert(dayGroupAmt);
    }

    }

    /**
     *  下标映射为对应的班组
     * @param i
     * @return
     */
    private String groupMapping(int i) {
        switch (i)
        {
            case 0:
                return "甲班";
            case 1:
                return "乙班";
            case 2:
                return "丙班";
            case 3:
                return "丁班";
            case 4:
                return "细甲";
            case 5:
                return "细乙";
            case 6:
                return "细丙";
            case 7:
                return "细丁";
            default:
                break;
        }
        return null;
    }

    private List<EmpBasicInfo> getEmpBasicInfos(String dayTime) {

        // 1.查询是否有岗位变动
        BasicFilterVo filter = new BasicFilterVo();
        filter.setCreateTime(dayTime);
        List<PostChangeInfo> postChangeInfos = postChangeInfoMapper.findPostChangeByFilter(filter);
        // 2.查询原本所在岗位
        filter.setMonthTime(CommUtils.getMonthFirst(dayTime));
        logger.info("********getEmpBasicInfos filter*******"+filter);
        List<EmpBasicInfo> empBasicInfos = empBasicInfoMapper.selectByCondition(filter);
        // 3.更新
        empBasicInfos = this.updateEmpBasicInfos(postChangeInfos,empBasicInfos);
        logger.info("********getEmpBasicInfos*******"+empBasicInfos);
        return  empBasicInfos;
    }

    private List<EmpBasicInfo> updateEmpBasicInfos(List<PostChangeInfo> postChangeInfos, List<EmpBasicInfo> empBasicInfos) {
        // 入参检查
        if(null == empBasicInfos || empBasicInfos.isEmpty())
        {
            logger.info("当月排班数据未导入，请先导入！");
            throw new MyException("当月排班数据未导入，请联系管理员");
        }
        if(null == postChangeInfos || postChangeInfos.isEmpty())
        {
            logger.info("====当天无岗位变动======");
            return empBasicInfos;
        }
        for(EmpBasicInfo empBasicInfo :empBasicInfos)
        {
            for (PostChangeInfo postChangeInfo :postChangeInfos)
            {
                if(empBasicInfo.getName() != postChangeInfo.getName() )continue;
                else
                {
                    // 更新empBasicInfo
                    empBasicInfo.setGroup(postChangeInfo.getGroup());
                    empBasicInfo.setMid(postChangeInfo.getMachineno());
                    empBasicInfo.setWid(postChangeInfo.getWid());
                    empBasicInfo.setPid(postChangeInfo.getBpid());
                    logger.info("**updateEmpBasicInfos after**"+empBasicInfo);
                }
            }
        }
        return empBasicInfos;
    }

    /**
     * 构造filter ，计算日产量薪资
     * @param empDayAmtsalaries
     * @return
     */
    private List<EmpDayAmtsalary> calEmpDayAmtsalary(List<EmpDayAmtsalary> empDayAmtsalaries) {
        // 入参校验
        if(null == empDayAmtsalaries || empDayAmtsalaries.size() ==0)
        {
            logger.info("员工日产量薪资数据生成失败！");
            throw new MyException("员工日产量薪资数据生成失败！");
        }
        for(EmpDayAmtsalary empDayAmtsalary : empDayAmtsalaries)
        {
            logger.info("员工日产量数据**"+empDayAmtsalary);
            BasicFilterVo filter = new BasicFilterVo();
            // {"name":"admin","brand":"大红鹰（软蓝）","mid":"1","amount":"123"}
            filter.setName(empDayAmtsalary.getName());
            filter.setGroup(empDayAmtsalary.getGroup());
            filter.setBrand(empDayAmtsalary.getBrand());
            filter.setMid(empDayAmtsalary.getMid());
            filter.setAmount(empDayAmtsalary.getTotalAmt());
            logger.info("查询过滤器filter**"+filter);
            // 计算产量薪资
            empDayAmtsalary.setAmtSalary(salaryCounterService.getAmtSalary(filter));
            logger.info("员工日产量薪资数据**"+empDayAmtsalary);
        }
        return empDayAmtsalaries;
    }

    /**
     * 构造个人薪资结果model 个人和机台产量关联映射
     * @param empBasicInfos
     * @param cigOutputInfos
     * @return
     */
    private List<EmpDayAmtsalary> empAmtMapping(List<EmpBasicInfo> empBasicInfos, List<CigOutputInfo> cigOutputInfos) {
        // 入参校验
        if(null == empBasicInfos || empBasicInfos.isEmpty())
        {
            logger.info("当月排班数据未导入，请先导入！");
            throw new MyException("当月排班数据未导入，请联系管理员");
        }
        if(null == cigOutputInfos || cigOutputInfos.isEmpty())
        {
            logger.info("当前时间日产量数据未导入，请先导入！");
            throw new MyException("当前时间日产量数据未导入，请先导入");
        }
        List<EmpDayAmtsalary> resList = new ArrayList<>();

        for (EmpBasicInfo empBasicInfo:empBasicInfos) {
            logger.info("员工基本岗位信息"+empBasicInfo);
            if(null == empBasicInfo.getMid()|| "".equals(empBasicInfo.getMid()))
            {
                logger.info("当前时间日产量数据未导入，请先导入！");
                throw new MyException("当前登陆用户非机台操作人员，暂不支持计算产量薪资，请联系管理员");
            }
            String[] midArray =empBasicInfo.getMid().split(","); // 12,13,14
            for (int i = 0; i <midArray.length ; i++) {
                // 根据mid 映射对应得产量
                for(CigOutputInfo cigOutputInfo :cigOutputInfos)
                {
                    //机台号 + 班组
                    if(midArray[i].equals(cigOutputInfo.getMachineno())
                            && empBasicInfo.getGroup().equals(cigOutputInfo.getGroup()))
                    {
                        // 构造EmpDayAmtsalary model
                        EmpDayAmtsalary empDayAmtsalary = new EmpDayAmtsalary(empBasicInfo.getName(),empBasicInfo.getGroup(),
                                Long.valueOf(midArray[i]),cigOutputInfo.getBrand(),
                                cigOutputInfo.getTotal(),cigOutputInfo.getCreateTime());
                        resList.add(empDayAmtsalary);
                    }
                }
            }
        }

        return resList;
    }

    @Override
    public int save(EmpDayAmtsalary record) {
        return 0;
    }

    @Override
    public int delete(EmpDayAmtsalary record) {
        return 0;
    }

    @Override
    public int delete(List<EmpDayAmtsalary> records) {
        return 0;
    }

    @Override
    public EmpDayAmtsalary findById(Long id) {
        return null;
    }
}
